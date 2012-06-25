//
//  SampleValidation.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleValidation.h"

@implementation SampleValidation

- (void)start {
    
    XTFTStep *step = [XTFTStep step];
    XTFTFieldSection *section = [XTFTFieldSection section];
    XTFTInputField *f = nil;
    
    step.title = @"Validation test";
    
    f = [XTFTFieldFactory textFieldWithName:@"Not empty" andPlaceholder:@"type here"];
    f.validateTarget = [XTFTFieldValidator class];
    f.validateSelector = @selector(validateNotEmpty:);
    [section addField:f];
    
    f = [XTFTFieldFactory textFieldWithName:@"Can be empty" andPlaceholder:@"type here"];
    [section addField:f];
    
    f = [XTFTFieldFactory textFieldWithName:@"Not empty" andPlaceholder:@"type here"];
    f.validateTarget = [XTFTFieldValidator class];
    f.validateSelector = @selector(validateNotEmpty:);
    [section addField:f];
    
    f = [XTFTFieldFactory textFieldWithName:@"Not empty" andPlaceholder:@"type here"];
    f.validateTarget = [XTFTFieldValidator class];
    f.validateSelector = @selector(validateNotEmpty:);
    [section addField:f];
    
    [step addSection:section];
    
    _controller.steps = [NSArray arrayWithObject:step];
    
    [super start];
}

@end
