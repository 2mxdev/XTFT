//
//  XTFTFieldValidator.h
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 10.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XTFTInputField;

@interface XTFTFieldValidator : NSObject

+ (void)validateNotEmpty:(XTFTInputField *)field;

@end
