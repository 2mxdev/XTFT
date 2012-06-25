//
//  XTFTFieldFactory.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTFieldFactory.h"
#import "XTFTTextField.h"
#import "XTFTSelectTextField.h"

@interface XTFTFieldFactory()

+ (XTFTTextField *)textFieldWithName:(NSString *)name placeholder:(NSString *)placeholder andType:(XTFTFieldType)type;
+ (XTFTTextField *)textFieldWithName:(NSString *)name placeholder:(NSString *)placeholder andType:(XTFTFieldType)type withValue:(NSString *)value;

@end

@implementation XTFTFieldFactory

#pragma mark - Public

+ (XTFTTextField *)textFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder withValue:(NSString *)value {
    return [self textFieldWithName:name placeholder:placeholder andType:XTFTFieldTypeText withValue:value];
}

+ (XTFTTextField *)textFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder {
    return [self textFieldWithName:name andPlaceholder:placeholder withValue:nil];
}

+ (XTFTTextField *)passwordFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder {
    return [self textFieldWithName:name placeholder:placeholder andType:XTFTFieldTypePassword];
}

+ (XTFTTextField *)emailFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder withValue:(NSString *)value {
    return [self textFieldWithName:name placeholder:placeholder andType:XTFTFieldTypeEmail withValue:value];
}

+ (XTFTTextField *)emailFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder {
    return [self emailFieldWithName:name andPlaceholder:placeholder withValue:nil];
}

+ (XTFTTextField *)phoneFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder withValue:(NSString *)value {
    return [self textFieldWithName:name placeholder:placeholder andType:XTFTFieldTypePhoneNumber withValue:value];
}

+ (XTFTTextField *)phoneFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder {
    return [self phoneFieldWithName:name andPlaceholder:placeholder withValue:nil];
}

+ (XTFTTextField *)urlFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder withValue:(NSString *)value {
    return [self textFieldWithName:name placeholder:placeholder andType:XTFTFieldTypeURL withValue:value];
}

+ (XTFTTextField *)urlFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder {
    return [self urlFieldWithName:name andPlaceholder:placeholder withValue:nil];
}

+ (XTFTSelectDateTimeField *)dateTimeFieldWithName:(NSString *)name mode:(XTFTSelectDateTimeFieldMode)mode andDate:(NSDate *)date {
    XTFTSelectDateTimeField *f = [XTFTSelectDateTimeField field];
    
    f.name = name;
    f.fieldType = XTFTFieldTypeSelectDate;
    f.value = date;
    f.mode = mode;
    
    return f;
}

+ (XTFTSelectDateTimeField *)dateTimeFieldWithName:(NSString *)name mode:(XTFTSelectDateTimeFieldMode)mode {
    return [self dateTimeFieldWithName:name mode:mode andDate:nil];
}


+ (XTFTInputField *)boolFieldWithName:(NSString *)name defaultStatus:(BOOL)state {
    XTFTInputField *f = [XTFTInputField field];
    
    f.name = name;
    f.fieldType = XTFTFieldTypeBoolean;
    f.valueAsBool = state;
    
    return f;
}

+ (XTFTSelectTextField *)selectTextFieldWithName:(NSString *)name values:(NSArray *)values andSelectedIndex:(NSInteger)index {
    XTFTSelectTextField *f = [XTFTSelectTextField field];
    
    f.name = name;
    f.fieldType = XTFTFieldTypeSelectString;
    f.values = values;
    f.selectedIndex = index;
    
    return f;
}

+ (XTFTSelectTextField *)selectTextFieldWithName:(NSString *)name values:(NSArray *)values {
    return [self selectTextFieldWithName:name values:values andSelectedIndex:-1];
}

#pragma mark - Private

+ (XTFTTextField *)textFieldWithName:(NSString *)name placeholder:(NSString *)placeholder andType:(XTFTFieldType)type {
    return [self textFieldWithName:name placeholder:placeholder andType:type withValue:nil];
}

+ (XTFTTextField *)textFieldWithName:(NSString *)name placeholder:(NSString *)placeholder andType:(XTFTFieldType)type withValue:(NSString *)value {
    
    XTFTTextField *f = [XTFTTextField field];
    
    f.name = name;
    f.fieldType = type;
    f.placeholder = placeholder;
    f.value = value;
    
    return f;
}

@end
