//
//  XTFTFieldValidator.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 10.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTFieldValidator.h"
#import "XTFTInputField.h"

@implementation XTFTFieldValidator

+ (void)validateNotEmpty:(XTFTInputField *)field {
    if (field.value == nil || [field.valueAsString isEqualToString:@""]) {
        field.validationErrorMessage = NSLocalizedString(@"field is empty!", nil);
    }
}

@end
