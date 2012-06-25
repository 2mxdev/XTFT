//
//  SampleAsyncValidation.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleAsyncValidation.h"

@interface SampleAsyncValidation()

- (void)validate:(XTFTInputField *)field;

@end

@implementation SampleAsyncValidation

- (void)validate:(XTFTInputField *)field {
    [NSThread sleepForTimeInterval:5];
    
    [XTFTFieldValidator validateNotEmpty:field];
}

- (void)start {
    XTFTStep *step = [XTFTStep step];
    XTFTFieldSection *section = [XTFTFieldSection section];
    XTFTInputField *field = [XTFTFieldFactory textFieldWithName:@"5 sec validation" andPlaceholder:@"not empty"];
    
    step.title = @"Async Validation";
    step.showHudWhileValidating = YES;
    
    field.validateTarget = self;
    field.validateSelector = @selector(validate:);
    
    [section addField:field];
    
    [step addSection:section];
    
    _controller.steps = [NSArray arrayWithObject:step];
    
    [super start];
}

@end
