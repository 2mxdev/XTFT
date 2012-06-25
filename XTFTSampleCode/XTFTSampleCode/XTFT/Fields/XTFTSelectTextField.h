//
//  XTFTSelectTextField.h
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTInputField.h"

@interface XTFTSelectTextField : XTFTInputField

@property (nonatomic, retain) NSArray *values;
@property (nonatomic, assign) NSInteger selectedIndex;

@end
