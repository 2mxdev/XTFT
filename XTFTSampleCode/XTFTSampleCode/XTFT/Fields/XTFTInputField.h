//
//  XTFTInputField.h
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTField.h"

@interface XTFTInputField : XTFTField

@property (nonatomic, retain) NSObject *value;

@property (nonatomic, retain) NSString *valueAsString;
@property (nonatomic, assign) NSInteger valueAsInteger;
@property (nonatomic, assign) float valueAsFloat;
@property (nonatomic, assign) BOOL valueAsBool;
@property (nonatomic, retain) NSDate *valueAsDate;

@property (nonatomic, retain) NSString *name;

@property (nonatomic, assign) SEL validateSelector;
@property (nonatomic, assign) id validateTarget;

@property (nonatomic, retain) NSString *validationErrorMessage;

@property (nonatomic, assign) SEL commitValueSelector;
@property (nonatomic, assign) id commitValueTarget;

@property (nonatomic, assign) SEL commitFieldSelector;
@property (nonatomic, assign) id commitFieldTarget;

- (void)setValidationTarget:(id)target andSelector:(SEL)selector;

@end
