//
//  SampleRegForm.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleRegForm.h"

@implementation SampleRegForm

- (void)start {
    
    NSMutableArray *steps = [NSMutableArray array];
    
    XTFTStep *step = nil;
    XTFTFieldSection *section = nil;
    
    // STEP 1
    
    step = [XTFTStep step];
    step.title = @"Step 1 of 2";
    
    section = [XTFTFieldSection section];
    section.title = @"Login information";
    
    [section addField:[XTFTFieldFactory textFieldWithName:@"Login" andPlaceholder:@"yr login"]];
    [section addField:[XTFTFieldFactory emailFieldWithName:@"Email" andPlaceholder:@"yr email"]];
    [section addField:[XTFTFieldFactory passwordFieldWithName:@"Password" andPlaceholder:@"super secret"]];
    [section addField:[XTFTFieldFactory passwordFieldWithName:@"Confirm password" andPlaceholder:@"confirm"]];
    
    [step addSection:section];
    [steps addObject:step];
    
    // STEP 2
    
    step = [XTFTStep step];
    step.title = @"Step 2 of 2";
    step.desc = @"This is a final step";
    
    section = [XTFTFieldSection section];
    section.title = @"Personal information";
    section.desc = @"Your private personal information";
    
    [section addField:[XTFTFieldFactory textFieldWithName:@"Full name" andPlaceholder:@"First and Last name"]];
    [section addField:[XTFTFieldFactory selectTextFieldWithName:@"Sex" values:[NSArray arrayWithObjects:@"Male", @"Female", nil]]];
    XTFTSelectDateTimeField *birthdayField = [XTFTFieldFactory dateTimeFieldWithName:@"Birthday" mode:XTFTSelectDateTimeFieldModeDate];
    birthdayField.format = @"dd.MM.yyyy";
    birthdayField.maximumDate = [NSDate date];
    [section addField:birthdayField];
    
    [step addSection:section];
    [steps addObject:step];
    
    _controller.steps = steps;
    
    [super start];
}

@end
