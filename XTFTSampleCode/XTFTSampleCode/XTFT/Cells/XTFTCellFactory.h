//
//  XTFTCellFactory.h
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XTFTInputCell;
@class XTFTField;

@interface XTFTCellFactory : NSObject

+ (XTFTInputCell *)cellForField:(XTFTField *)field;
+ (Class)cellClassForField:(XTFTField *)field;

@end
