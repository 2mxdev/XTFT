//
//  SampleCancelButton.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleCancelButton.h"

@implementation SampleCancelButton

- (void)start {
    
    XTFTStep *step = [XTFTStep step];
    step.title = @"<- cancel button";
    
    _controller.steps = [NSArray arrayWithObject:step];
    _controller.showCancelButton = YES;
    
    [super start];
}

@end
