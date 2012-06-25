//
//  XTFTTableViewController.h
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XTFTStep;
@class XTFTInputField;
@protocol XTFTTavleViewControllerDelegate;

@interface XTFTTableViewController : UITableViewController {
@protected
    NSArray *_steps;
    NSInteger _index;
    XTFTStep *_step;
    
    NSMutableArray *_lastErrorIndexes;
    
    UIBarButtonItem *_doneButton;
    UIBarButtonItem *_cancelButton;
    UIBarButtonItem *_nextButton;
    
    UIView *_hudView;
}

@property (nonatomic, assign) id<XTFTTavleViewControllerDelegate> delegate;
@property (nonatomic, retain) NSArray *steps;
@property (nonatomic, assign) BOOL showCancelButton; // NO

- (void)setSteps:(NSArray *)steps withIndex:(NSInteger)index;

- (void)updateField:(XTFTInputField *)field;

@end

@protocol XTFTTavleViewControllerDelegate <NSObject>
@optional
- (void)xtftControllerDone;
- (void)xtftControllerCancel;
@end