//
//  XTFTSelectCell.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTSelectStringCell.h"
#import "XTFTSelectTextField.h"
#import "XTFTActionSheetWithValuePicker.h"
#import "UIView+XTFTAdditions.h"

@interface XTFTSelectStringCell() <XTFTActionSheetWithValuePickerDelegate>

- (void)viewClick:(id)sender;

@end

@implementation XTFTSelectStringCell

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
    XTFTSelectTextField *f = (XTFTSelectTextField *)self.field;
    
    if (f.values && f.values.count > 0) {
        [self.superview hideKeybordFromView];
        
        XTFTActionSheetWithStringValuePicker *sheet = [[[XTFTActionSheetWithStringValuePicker alloc] init] autorelease];
        sheet.items = f.values;
        sheet.delegate = self;
        if (f.selectedIndex >= 0)
            sheet.selectedIndex = f.selectedIndex;
        
        [sheet showInView:self.superview];
    }
}

#pragma mark - ActionSheet delegate

- (void)xtftActionSheetWithValuePicker:(id)sender didFinishWithSuccess:(BOOL)success {
    XTFTSelectTextField *f = (XTFTSelectTextField *)self.field;
    XTFTActionSheetWithStringValuePicker *sheet = sender;
    [sheet dismiss];
    
    if (success) {
        f.selectedIndex = sheet.selectedIndex;
    } else {
        f.selectedIndex = -1;
    }
    _nameLabel.text = f.valueAsString;
}

@end
