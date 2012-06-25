//
//  XTFTSelectDateCell.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTSelectDateCell.h"
#import "XTFTSelectDateTimeField.h"
#import "XTFTActionSheetWithValuePicker.h"
#import "UIView+XTFTAdditions.h"

@interface XTFTSelectDateCell() <XTFTActionSheetWithValuePickerDelegate>

- (void)viewClick:(id)sender;

@end

@implementation XTFTSelectDateCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UITapGestureRecognizer *g = [[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                             action:@selector(viewClick:)] autorelease];
        [self addGestureRecognizer:g];
    }
    return self;
}

#pragma mark - Private
#pragma mark - User iteractions

- (void)viewClick:(id)sender {
    [self.superview hideKeybordFromView];
    
    XTFTSelectDateTimeField *f = (XTFTSelectDateTimeField *)self.field;
    XTFTActionSheetWithDateValuePicker *sheet = [[[XTFTActionSheetWithDateValuePicker alloc] init] autorelease];
    sheet.delegate = self;
    sheet.minimumDate = f.minimumDate;
    sheet.maximumDate = f.maximumDate;
    sheet.interval = f.interval;
    
    switch (f.mode) {
        case XTFTSelectDateTimeFieldModeDate:
            sheet.mode = UIDatePickerModeDate;
            break;
        case XTFTSelectDateTimeFieldModeTime:
            sheet.mode = UIDatePickerModeTime;
            break;
        case XTFTSelectDateTimeFieldModeDateTime:
            sheet.mode = UIDatePickerModeDateAndTime;
            break;
        default:
            NSLog(@"XTFTSelectDateCell -> viewClick -> Unknown mode");
            break;
    }
    
    if (f.value)
        sheet.selectedDate = f.valueAsDate;
    
    [sheet showInView:self.superview];
}

#pragma mark - ActionSheet delegate

- (void)xtftActionSheetWithValuePicker:(id)sender didFinishWithSuccess:(BOOL)success {
    XTFTSelectDateTimeField *f = (XTFTSelectDateTimeField *)self.field;
    XTFTActionSheetWithDateValuePicker *sheet = sender;
    
    [sheet dismiss];
    
    if (success) {
        f.valueAsDate = sheet.selectedDate;
    } else {
        f.valueAsDate = nil;
    }
    
    _nameLabel.text = f.valueAsString;
}

@end
