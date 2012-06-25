//
//  XTFTCellFactory.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTCellFactory.h"
#import "XTFTInputCell.h"
#import "XTFTTextFieldCell.h"
#import "XTFTSelectTextField.h"
#import "XTFTSelectStringCell.h"
#import "XTFTSelectDateCell.h"
#import "XTFTSwitchCell.h"

@implementation XTFTCellFactory

+ (XTFTInputCell *)cellForField:(XTFTField *)field {
    return [[self cellClassForField:field] cell];
}

+ (Class)cellClassForField:(XTFTField *)field {
    switch (field.fieldType) {
        case XTFTFieldTypeText:
        case XTFTFieldTypePassword:
        case XTFTFieldTypeEmail:
        case XTFTFieldTypeNumber:
        case XTFTFieldTypeURL:
        case XTFTFieldTypePhoneNumber:
            return [XTFTTextFieldCell class];
            break;
        case XTFTFieldTypeBoolean:
            return [XTFTSwitchCell class];
            break;
        case XTFTFieldTypeSelectString:
            return [XTFTSelectStringCell class];
            break;
        case XTFTFieldTypeSelectDate:
            return [XTFTSelectDateCell class];
            break;
        default:
            NSLog(@"XTFTCellFactory -> cellForField -> Unknown field type");
            return nil;
            break;
    }
}

@end
