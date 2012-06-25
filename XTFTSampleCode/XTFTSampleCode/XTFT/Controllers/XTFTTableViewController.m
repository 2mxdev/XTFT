//
//  XTFTTableViewController.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTTableViewController.h"
#import "XTFTStep.h"
#import "XTFTFields.h"
#import "XTFTCells.h"
#import "UIView+XTFTAdditions.h"

#define kRowAnimation UITableViewRowAnimationFade

@interface XTFTTableViewController()

@property (nonatomic, assign) XTFTTableViewController *son;
@property (nonatomic, readonly) BOOL isLastStep;

- (void)doneButtonClick:(id)sender;
- (void)cancelButtonClick:(id)sender;
- (void)nextButtonClick:(id)sender;

- (void)pushNextStep;
- (void)showErrors;
- (void)hideLastErrors;
- (void)commitValuesAndFields;

- (void)tellDoneToDelegate;
- (void)tellCancelToDelegate;

- (void)beginAsyncValidation;
- (void)asyncValidation;
- (void)endAsyncValidation:(id)haveError;

- (void)showLoadingHud;
- (void)hideLoadingHud;

@end

@implementation XTFTTableViewController

@synthesize son = _son;
@synthesize steps = _steps;
@synthesize delegate = _delegate;
@synthesize showCancelButton = _showCancelButton;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        _doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                    target:self
                                                                    action:@selector(doneButtonClick:)];
        _nextButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Next", nil)
                                                       style:UIBarButtonItemStyleBordered
                                                      target:self
                                                      action:@selector(nextButtonClick:)];
        _cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                      target:self
                                                                      action:@selector(cancelButtonClick:)];
        
        _lastErrorIndexes = [[NSMutableArray alloc] init];
        
        _showCancelButton = NO;
        
        _index = -1;
        
        _hudView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460 - 30)];
        _hudView.backgroundColor = [UIColor blackColor];
        _hudView.alpha = 0.6;
        _hudView.hidden = YES;
        
        UIActivityIndicatorView *ai = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] autorelease];
        [ai startAnimating];
        [ai setCenter:_hudView.center];
        [_hudView addSubview:ai];
        
        [self.view addSubview:_hudView];
    }
    return self;
}

- (void)dealloc {
    [_hudView release];
    
    [_steps release];
    [_step release];
    
    [_doneButton release];
    [_cancelButton release];
    [_nextButton release];
    
    [_lastErrorIndexes release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Properties

- (void)setSteps:(NSArray *)steps {
    [self setSteps:steps withIndex:0];
}

- (void)setShowCancelButton:(BOOL)showCancelButton {
    _showCancelButton = showCancelButton;
    if (_showCancelButton && _index == 0)
        self.navigationItem.leftBarButtonItem = _cancelButton;
}

#pragma mark - Methods

- (void)setSteps:(NSArray *)steps withIndex:(NSInteger)index {
    [steps retain];
    [_steps release];
    _steps = steps;
    
    _index = index;
    
    [_step release];
    _step = [[_steps objectAtIndex:_index] retain];
    
    self.navigationItem.title = _step.title;
    self.navigationItem.rightBarButtonItem = self.isLastStep ? _doneButton : _nextButton;
    
    if (_index == 0 && _showCancelButton)
        self.navigationItem.leftBarButtonItem = _cancelButton;
}

- (void)updateField:(XTFTInputField *)field {
    NSIndexPath *ip = [_step indexPathForField:field];
    if (!ip && _son) {
        [_son updateField:field];
    } else if (ip)
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:ip]
                              withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - ViewController

- (void)viewWillAppear:(BOOL)animated {
    self.son = nil;
    
    [super viewWillAppear:animated];
}

#pragma mark - TableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger count = [_step sectionCount] + (_step.desc == nil ? 0 : 1);
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section < [_step sectionCount])
        return [_step fieldsCountInSection:section];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XTFTInputField *f = [_step fieldAtIndexPath:indexPath];
    
    NSString *cellIdentifier = [[XTFTCellFactory cellClassForField:f] description];
    XTFTInputCell *c = (XTFTInputCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!c) {
        c = [XTFTCellFactory cellForField:f];
        c.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    c.field = f;
    
    return c;
}

#pragma mark - TableView delegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section < [_step sectionCount])
        return [_step fieldSectionAtIndex:section].title;
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section < [_step sectionCount])
        return [_step fieldSectionAtIndex:section].desc;
    return _step.desc;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [(XTFTInputCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath] height];
}

#pragma mark - Private
#pragma mark - User iteractions

- (void)doneButtonClick:(id)sender {
    [self beginAsyncValidation];
}

- (void)cancelButtonClick:(id)sender {
    [self tellCancelToDelegate];
}

- (void)nextButtonClick:(id)sender {
    [self beginAsyncValidation];
}

#pragma mark - Helpers

- (void)beginAsyncValidation {
    [self.view hideKeybordFromView];
    
    if (_step.showHudWhileValidating)
        [self showLoadingHud];
    
    [self performSelectorInBackground:@selector(asyncValidation) withObject:nil];
}

- (void)asyncValidation {
    
    BOOL haveError = NO;
    
    for (XTFTFieldSection *s in _step.fieldSections) {
        for (XTFTInputField *f in s.fields) {
            f.validationErrorMessage = nil;
            
            id target = f.validateTarget;
            SEL selector = f.validateSelector;
            
            if (target && selector && [target respondsToSelector:selector]) {
                
                [target performSelector:selector withObject:f];
                
                haveError = haveError | (f.validationErrorMessage != nil);
            }
        }
    }
    
    [self performSelectorOnMainThread:@selector(endAsyncValidation:)
                           withObject:[NSNumber numberWithBool:haveError]
                        waitUntilDone:NO];
}

- (void)endAsyncValidation:(id)haveError {
    BOOL error = [haveError boolValue];
    
    if (_step.showHudWhileValidating)
        [self hideLoadingHud];
    
    if (!error) {
        if (self.isLastStep) {
            // Done
            [self hideLastErrors];
            [self commitValuesAndFields];
            [self tellDoneToDelegate];
        } else {
            // Next
            [self hideLastErrors];
            [self pushNextStep];
        }
    } else
        [self showErrors];
}

- (BOOL)isLastStep {
    return _index == _steps.count - 1;
}

- (void)pushNextStep {
    XTFTTableViewController *c = [[[XTFTTableViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
    [c setSteps:_steps withIndex:_index + 1];
    [c setDelegate:_delegate];
    
    self.son = c;
    
    [self.navigationController pushViewController:c animated:YES];
}

- (void)showErrors {
    NSMutableArray *ips = [NSMutableArray array];
    
    for (int i = 0; i <_step.fieldSections.count; i++) {
        XTFTFieldSection *s = [_step.fieldSections objectAtIndex:i];
        for (int j = 0; j < s.fields.count; j++) {
            XTFTInputField *f = [s.fields objectAtIndex:j];
            if (f.validationErrorMessage != nil)
                [ips addObject:[NSIndexPath indexPathForRow:j inSection:i]];
        }
    }
    
    [self.tableView reloadRowsAtIndexPaths:ips withRowAnimation:kRowAnimation];
    
    
    [_lastErrorIndexes removeObjectsInArray:ips];
    [self hideLastErrors];
    [_lastErrorIndexes addObjectsFromArray:ips];
}

- (void)hideLastErrors {
    [self.tableView reloadRowsAtIndexPaths:_lastErrorIndexes withRowAnimation:kRowAnimation];
    [_lastErrorIndexes removeAllObjects];
}

- (void)commitValuesAndFields {
    for (XTFTStep *step in _steps) {
        for (XTFTFieldSection *fieldSection in step.fieldSections) {
            for (XTFTInputField *field in fieldSection.fields) {
                
                id target = nil;
                SEL selector = nil;
                
                // Commit values
                
                target = field.commitValueTarget;
                selector = field.commitValueSelector;
                
                if (target && selector && [target respondsToSelector:selector]) {
                    
                    [target performSelector:selector withObject:field.value];
                    
                }
                
                // Commit fields
                
                target = field.commitFieldTarget;
                selector = field.commitFieldSelector;
                
                if (target && selector && [target respondsToSelector:selector]) {
                    
                    [target performSelector:selector withObject:field];
                    
                }
                
            }
        }
    }
}

- (void)tellDoneToDelegate {
    if (_delegate && [_delegate respondsToSelector:@selector(xtftControllerDone)])
        [_delegate performSelector:@selector(xtftControllerDone)];
}

- (void)tellCancelToDelegate {
    if (_delegate && [_delegate respondsToSelector:@selector(xtftControllerCancel)])
        [_delegate performSelector:@selector(xtftControllerCancel)];

}

- (void)showLoadingHud {
    _hudView.hidden = NO;
    self.tableView.userInteractionEnabled = NO;
    self.navigationItem.rightBarButtonItem.enabled = NO;
    [self.navigationItem setHidesBackButton:YES animated:YES];
    self.navigationItem.leftBarButtonItem.enabled = NO;
}

- (void)hideLoadingHud {
    _hudView.hidden = YES;
    self.tableView.userInteractionEnabled = YES;
    self.navigationItem.rightBarButtonItem.enabled = YES;
    [self.navigationItem setHidesBackButton:NO animated:YES];
    self.navigationItem.leftBarButtonItem.enabled = YES;
}

@end
