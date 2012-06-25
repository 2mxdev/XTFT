//
//  SampleFieldTypes.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleFieldTypes.h"

@implementation SampleFieldTypes

- (void)start {
    
    NSArray *tmpValues = [NSArray arrayWithObjects:
                          @"1",
                          @"2",
                          @"3",
                          nil];
    
    XTFTStep *step = [XTFTStep step];
    step.title = @"FieldTypes";
    
    XTFTFieldSection *section = [XTFTFieldSection section];
    
    [section addField:[XTFTFieldFactory textFieldWithName:@"Text" andPlaceholder:@"type here"]];
    [section addField:[XTFTFieldFactory emailFieldWithName:@"Email" andPlaceholder:@"type here"]];
    [section addField:[XTFTFieldFactory phoneFieldWithName:@"Phone" andPlaceholder:@"type here"]];
    [section addField:[XTFTFieldFactory urlFieldWithName:@"URL" andPlaceholder:@"type here"]];
    [section addField:[XTFTFieldFactory passwordFieldWithName:@"Password" andPlaceholder:@"type here"]];
    [section addField:[XTFTFieldFactory boolFieldWithName:@"Bool" defaultStatus:NO]];
    [section addField:[XTFTFieldFactory selectTextFieldWithName:@"Select string" values:tmpValues]];
    [section addField:[XTFTFieldFactory dateTimeFieldWithName:@"Date time" mode:XTFTSelectDateTimeFieldModeDate]];
    
    [step addSection:section];
    
    _controller.steps = [NSArray arrayWithObject:step];
    
    [super start];
}

@end
