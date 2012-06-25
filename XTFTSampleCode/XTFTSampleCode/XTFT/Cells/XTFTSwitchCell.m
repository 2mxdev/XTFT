//
//  XTFTSwitchCell.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTSwitchCell.h"
#import "XTFTInputField.h"

@interface XTFTSwitchCell()

- (void)valueChanged:(UISwitch *)switchView;

@end

@implementation XTFTSwitchCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _switch = [[UISwitch alloc] initWithFrame:CGRectZero];
        [_switch addTarget:self
                    action:@selector(valueChanged:)
          forControlEvents:UIControlEventValueChanged];
        
        self.accessoryView = _switch;
    }
    return self;
}

- (void)dealloc {
    [_switch release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Properties

- (void)setField:(XTFTInputField *)field {
    [super setField:field];
    
    _switch.on = field.valueAsBool;
}

#pragma mark - Private
#pragma mark - User iteractions

- (void)valueChanged:(UISwitch *)switchView {
    self.field.valueAsBool = switchView.on;
}

@end
