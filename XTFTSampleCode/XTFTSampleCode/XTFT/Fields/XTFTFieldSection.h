//
//  XTFTFieldSection.h
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XTFTField;

@interface XTFTFieldSection : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *desc;

@property (nonatomic, readonly) NSMutableArray *fields;

- (void)addField:(XTFTField *)field;

+ (id)section;

@end
