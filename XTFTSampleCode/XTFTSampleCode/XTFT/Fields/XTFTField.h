//
//  XTETField.h
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    XTFTFieldTypeText,
    XTFTFieldTypePassword,
    XTFTFieldTypeEmail,
    XTFTFieldTypeURL,
    XTFTFieldTypeNumber,
    XTFTFieldTypePhoneNumber,
    XTFTFieldTypeBoolean,
    XTFTFieldTypeSelectString,
    XTFTFieldTypeSelectDate
} XTFTFieldType;

@interface XTFTField : NSObject

@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) XTFTFieldType fieldType;

+ (id)field;

@end
