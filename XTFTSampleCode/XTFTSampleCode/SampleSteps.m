//
//  SampleSteps.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleSteps.h"

@implementation SampleSteps

- (void)start {
    
    NSMutableArray *steps = [NSMutableArray array];
    
    XTFTStep *step = nil;
    XTFTFieldSection *section = nil;
    
    // STEP 1
    
    step = [XTFTStep step];
    step.title = @"Step 1 of 3";
    step.desc = @"Some step description here";
    
    section = [XTFTFieldSection section];
    section.title = @"Section title here";
    section.desc = @"Section description here";
    
    [section addField:[XTFTFieldFactory textFieldWithName:@"Some text" andPlaceholder:@"text"]];
    [section addField:[XTFTFieldFactory textFieldWithName:@"Hide keyboard(tap)" andPlaceholder:@"text"]];
    
    [step addSection:section];
    [steps addObject:step];
    
    // STEP 2
    
    step = [XTFTStep step];
    step.title = @"Step 2 of 3";
    
    section = [XTFTFieldSection section];
    
    [section addField:[XTFTFieldFactory textFieldWithName:@"Some text" andPlaceholder:@"text"]];
    [section addField:[XTFTFieldFactory textFieldWithName:@"Some text" andPlaceholder:@"text"]];
    
    [step addSection:section];
    [steps addObject:step];
    
    // STEP 3
    
    step = [XTFTStep step];
    step.title = @"Step 3 of 3";
    
    section = [XTFTFieldSection section];
    
    [section addField:[XTFTFieldFactory textFieldWithName:@"Some text" andPlaceholder:@"text"]];
    [section addField:[XTFTFieldFactory textFieldWithName:@"Some text" andPlaceholder:@"text"]];
    
    [step addSection:section];
    [steps addObject:step];
    
    _controller.steps = steps;
    
    [super start];
}

@end
