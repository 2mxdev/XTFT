//
//  SampleReference.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleReference.h"

#define kBMWIdx 0
#define kAudiIdx 1

@implementation SampleReference

- (id)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super initWithNavigationController:navigationController];
    if (self) {
        _brands = [[NSArray alloc] initWithObjects:@"BMW", @"Audi", nil];
        _bmwCars = [[NSArray alloc] initWithObjects:@"X1", @"X3", @"X4", nil];
        _audiCars = [[NSArray alloc] initWithObjects:@"A1", @"A2", @"A3", nil];
        
        _brandSelectField = [[XTFTFieldFactory selectTextFieldWithName:@"Select car brand" values:_brands] retain];
        [_brandSelectField addObserver:self
                            forKeyPath:@"selectedIndex"
                               options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                               context:nil];
        
        _carSelectField = [[XTFTFieldFactory selectTextFieldWithName:@"Car model" values:[NSArray array]] retain];
    }
    return self;
}

- (void)dealloc {
    [_brandSelectField removeObserver:self
                           forKeyPath:@"selectedIndex"];
    [_brandSelectField release];
    [_carSelectField release];
    [_brands release];
    [_bmwCars release];
    [_audiCars release];
    
    [super dealloc];
}

- (void)start {
    XTFTStep *step = [XTFTStep step];
    XTFTFieldSection *section = [XTFTFieldSection section];
    
    step.title = @"Brand reference";
    
    [section addField:_brandSelectField];
    [section addField:_carSelectField];
    
    [step addSection:section];
    
    _controller.steps = [NSArray arrayWithObject:step];
    
    [super start];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSInteger newIdx = [[change objectForKey:@"new"] integerValue];
    NSInteger oldIdx = [[change objectForKey:@"old"] integerValue];
    
    if (newIdx != oldIdx) {
        _carSelectField.selectedIndex = -1;
        [_controller updateField:_carSelectField];
    }
    
    switch (newIdx) {
        case kBMWIdx:
            _carSelectField.values = _bmwCars;
            break;
        case kAudiIdx:
            _carSelectField.values = _audiCars;
            break;
        default:
            _carSelectField.values = [NSArray array];
            break;
    }
}

@end
