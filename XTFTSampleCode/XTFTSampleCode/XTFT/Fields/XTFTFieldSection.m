//
//  XTFTFieldSection.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTFieldSection.h"

@implementation XTFTFieldSection

@synthesize title = _title;
@synthesize desc = _desc;

@synthesize fields = _fields;

- (id)init {
    self = [super init];
    if (self) {
        _fields = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    [_fields release];
    [_title release];
    [_desc release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Methods

- (void)addField:(XTFTField *)field {
    [self.fields addObject:field];
}

#pragma mark - Factory

+ (id)section {
    return [[[[self class] alloc] init] autorelease];
}

@end
