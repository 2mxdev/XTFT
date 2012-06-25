//
//  XTFTActionSheetWithValuePicker.h
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XTFTActionSheetWithValuePickerDelegate;

@interface XTFTActionSheetWithValuePicker : NSObject {
@protected
    UISegmentedControl *_buttons;
    UIActionSheet *_actionSheet;
}

@property (nonatomic, assign) id<XTFTActionSheetWithValuePickerDelegate> delegate;

- (void)showInView:(UIView *)view;
- (void)dismiss;

@end

@protocol XTFTActionSheetWithValuePickerDelegate <NSObject>
@optional
- (void)xtftActionSheetWithValuePicker:(id)sender didFinishWithSuccess:(BOOL)success;
@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface XTFTActionSheetWithStringValuePicker : XTFTActionSheetWithValuePicker {
@protected
    UIPickerView *_pickerView;
}

@property (nonatomic, retain) NSArray *items;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, readonly) NSString *selectedValue;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface XTFTActionSheetWithDateValuePicker : XTFTActionSheetWithValuePicker {
@protected
    UIDatePicker *_pickerView;
}

@property (nonatomic, assign) UIDatePickerMode mode; // UIDatePickerModeDate
@property (nonatomic, assign) NSInteger interval; // in minutes, 1..30, default 1

@property (nonatomic, retain) NSDate *minimumDate; // nil
@property (nonatomic, retain) NSDate *maximumDate; // nil

@property (nonatomic, retain) NSDate *selectedDate;

@end