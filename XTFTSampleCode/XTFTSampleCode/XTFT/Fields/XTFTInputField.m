//
//  XTFTInputField.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTInputField.h"

@implementation XTFTInputField

@synthesize value = _value;
@synthesize name = _name;

@synthesize validationErrorMessage = _validationErrorMessage;

@synthesize validateSelector = _validateSelector;
@synthesize validateTarget = _validateTarget;

@synthesize commitValueSelector = _commitValueSelector;
@synthesize commitValueTarget = _commitValueTarget;

@synthesize commitFieldSelector = _commitFieldSelector;
@synthesize commitFieldTarget = _commitFieldTarget;

- (void)dealloc {
    [_name release];
    [_value release];
    [_validationErrorMessage release];
    
    _validateSelector = nil;
    _validateTarget = nil;
    _commitValueSelector = nil;
    _commitValueTarget = nil;
    _commitFieldSelector = nil;
    _commitFieldTarget = nil;
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Properties

// Value As String

- (void)setValueAsString:(NSString *)valueAsString {
    self.value = valueAsString;
}

- (NSString *)valueAsString {
    return (NSString *)self.value;
}

// Value As Integer

- (void)setValueAsInteger:(NSInteger)valueAsInteger {
    self.value = [NSNumber numberWithInteger:valueAsInteger];
}

- (NSInteger)valueAsInteger {
    return [(NSNumber *)self.value integerValue];
}

// Value As Float

- (void)setValueAsFloat:(float)valueAsFloat {
    self.value = [NSNumber numberWithFloat:valueAsFloat];
}

- (float)valueAsFloat {
    return [(NSNumber *)self.value floatValue];
}

// Value As Boolean

- (void)setValueAsBool:(BOOL)valueAsBool {
    self.value = [NSNumber numberWithBool:valueAsBool];
}

- (BOOL)valueAsBool {
    return [(NSNumber *)self.value boolValue];
}

// Value As Date

- (void)setValueAsDate:(NSDate *)valueAsDate {
    self.value = valueAsDate;
}

- (NSDate *)valueAsDate {
    return (NSDate *)self.value;
}

#pragma mark - Methods

- (void)setValidationTarget:(id)target andSelector:(SEL)selector {
    self.validateTarget = target;
    self.validateSelector = selector;
}

@end
