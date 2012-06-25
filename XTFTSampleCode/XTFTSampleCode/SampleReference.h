//
//  SampleReference.h
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleController.h"

@interface SampleReference : SampleController {
@private
    NSArray *_brands;
    NSArray *_bmwCars;
    NSArray *_audiCars;
    
    XTFTSelectTextField *_carSelectField;
    XTFTSelectTextField *_brandSelectField;
}

@end
