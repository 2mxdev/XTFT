//
//  XTFTActionSheetWithValuePicker.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTActionSheetWithValuePicker.h"

#define kBIErase 0
#define kBIOk 1

#define kBPaddingRight 5
#define kBWidth 160

#define kWidthP 320

@interface XTFTActionSheetWithValuePicker()

@property (nonatomic, assign) CGRect pickerFrame;

- (void)buttonsClick:(id)sender;

@end

@implementation XTFTActionSheetWithValuePicker

@synthesize delegate = _delegate;
@synthesize pickerFrame = _pickerFrame;

- (id)init {
    self = [super init];
    if (self) {
        _actionSheet = [[UIActionSheet alloc] initWithTitle:nil 
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                     destructiveButtonTitle:nil
                                          otherButtonTitles:nil];
        [_actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
        
        _pickerFrame = CGRectMake(0, 40, 320, 216);
        
        _buttons = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:
                                                              NSLocalizedString(@"Erase", nil),
                                                              NSLocalizedString(@"Done", nil),
                                                              nil]];
        _buttons.momentary = YES; 
        _buttons.frame = CGRectMake(kWidthP - kBWidth - kBPaddingRight, 7, kBWidth, 30);
        _buttons.segmentedControlStyle = UISegmentedControlStyleBar;
        _buttons.tintColor = [UIColor blackColor];
        [_buttons addTarget:self action:@selector(buttonsClick:) forControlEvents:UIControlEventValueChanged];
        
        [_actionSheet addSubview:_buttons];
    }
    return self;
}

- (void)dealloc {
    _delegate = nil;
    [_buttons release];
    [_actionSheet release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Methods

- (void)showInView:(UIView *)view {
    [_actionSheet showInView:view];
    [_actionSheet setBounds:CGRectMake(0, 0, kWidthP, 485)];
    
    [self retain];
}

- (void)dismiss {
    [_actionSheet dismissWithClickedButtonIndex:0
                                       animated:YES];
    
    [self release];
}

#pragma mark - Private
#pragma mark - User iteractions

- (void)buttonsClick:(id)sender {
    BOOL success = _buttons.selectedSegmentIndex == kBIOk;
    
    if (_delegate && [_delegate respondsToSelector:@selector(xtftActionSheetWithValuePicker:didFinishWithSuccess:)])
        [_delegate xtftActionSheetWithValuePicker:self
                             didFinishWithSuccess:success];
}

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface XTFTActionSheetWithStringValuePicker() <UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation XTFTActionSheetWithStringValuePicker

@synthesize items = _items;

- (id)init {
    self = [super init];
    if (self) {
        _items = [[NSArray alloc] init];
        
        _pickerView = [[UIPickerView alloc] initWithFrame:self.pickerFrame];
        _pickerView.showsSelectionIndicator = YES;
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        
        [_actionSheet addSubview:_pickerView];
    }
    return self;
}

- (void)dealloc {
    [_pickerView release];
    [_items release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Properties

- (NSString *)selectedValue {
    return [_items objectAtIndex:self.selectedIndex];
}

- (NSInteger)selectedIndex {
    return [_pickerView selectedRowInComponent:0];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    [_pickerView selectRow:selectedIndex inComponent:0 animated:NO];
}

- (void)setItems:(NSArray *)items {
    [items retain];
    [_items release];
    _items = items;
    
    [_pickerView reloadAllComponents];
}

#pragma mark - Private
#pragma mark - PickerView datasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _items.count;
}

#pragma mark - PickerView delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_items objectAtIndex:row];
}

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@implementation XTFTActionSheetWithDateValuePicker

@synthesize mode = _mode;
@synthesize interval = _interval;

- (id)init {
    self = [super init];
    if (self) {
        _mode = UIDatePickerModeDate;
        _interval = 1;
        
        _pickerView = [[UIDatePicker alloc] initWithFrame:self.pickerFrame];
        _pickerView.datePickerMode = _mode;
        _pickerView.minuteInterval = _interval;

        [_actionSheet addSubview:_pickerView];
    }
    return self;
}

- (void)dealloc {
    [_pickerView release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Properties

- (void)setMode:(UIDatePickerMode)mode {
    _mode = mode;
    _pickerView.datePickerMode = mode;
}

- (void)setInterval:(NSInteger)interval {
    _interval = interval;
    _pickerView.minuteInterval = interval;
}

- (void)setMinimumDate:(NSDate *)minimumDate {
    _pickerView.minimumDate = minimumDate;
}

- (NSDate *)minimumDate {
    return _pickerView.minimumDate;
}

- (void)setMaximumDate:(NSDate *)maximumDate {
    _pickerView.maximumDate = maximumDate;
}

- (NSDate *)maximumDate {
    return _pickerView.maximumDate;
}

- (NSDate *)selectedDate {
    return _pickerView.date;
}

- (void)setSelectedDate:(NSDate *)selectedDate {
    _pickerView.date = selectedDate;
}

@end

