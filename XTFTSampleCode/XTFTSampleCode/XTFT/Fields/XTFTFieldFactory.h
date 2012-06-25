//
//  XTFTFieldFactory.h
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTFTSelectDateTimeField.h"

@class XTFTTextField;
@class XTFTInputField;
@class XTFTSelectTextField;

@interface XTFTFieldFactory : NSObject

+ (XTFTTextField *)textFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder withValue:(NSString *)value;
+ (XTFTTextField *)textFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder;

+ (XTFTTextField *)emailFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder withValue:(NSString *)value;
+ (XTFTTextField *)emailFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder;

+ (XTFTTextField *)phoneFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder withValue:(NSString *)value;
+ (XTFTTextField *)phoneFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder;

+ (XTFTTextField *)urlFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder withValue:(NSString *)value;
+ (XTFTTextField *)urlFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder;

+ (XTFTTextField *)passwordFieldWithName:(NSString *)name andPlaceholder:(NSString *)placeholder;

+ (XTFTSelectDateTimeField *)dateTimeFieldWithName:(NSString *)name mode:(XTFTSelectDateTimeFieldMode)mode andDate:(NSDate *)date;
+ (XTFTSelectDateTimeField *)dateTimeFieldWithName:(NSString *)name mode:(XTFTSelectDateTimeFieldMode)mode;

+ (XTFTInputField *)boolFieldWithName:(NSString *)name defaultStatus:(BOOL)state;

+ (XTFTSelectTextField *)selectTextFieldWithName:(NSString *)name values:(NSArray *)values andSelectedIndex:(NSInteger)index;
+ (XTFTSelectTextField *)selectTextFieldWithName:(NSString *)name values:(NSArray *)values;

@end
