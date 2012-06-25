//
//  XTFTStep.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTStep.h"
#import "XTFTFieldSection.h"
#import "XTFTInputField.h"

@implementation XTFTStep

@synthesize title = _title;
@synthesize desc = _desc;

@synthesize fieldSections = _fieldSections;

@synthesize showHudWhileValidating = _showHudWhileValidating;

- (id)init {
    self = [super init];
    if (self) {
        _fieldSections = [[NSMutableArray alloc] init];
        _showHudWhileValidating = NO;
    }
    return self;
}

- (void)dealloc {
    [_fieldSections release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Methods

- (void)addSection:(XTFTFieldSection *)section {
    [self.fieldSections addObject:section];
}

- (NSInteger)sectionCount {
    return _fieldSections.count;
}

- (NSInteger)fieldsCountInSection:(NSInteger)section {
    XTFTFieldSection *s = [_fieldSections objectAtIndex:section];
    return s.fields.count;
}

- (XTFTFieldSection *)fieldSectionAtIndex:(NSInteger)index {
    return [_fieldSections objectAtIndex:index];
}

- (XTFTInputField *)fieldAtIndexPath:(NSIndexPath *)indexPath {
    XTFTFieldSection *s = [_fieldSections objectAtIndex:indexPath.section];
    return [s.fields objectAtIndex:indexPath.row];
}

- (NSIndexPath *)indexPathForField:(XTFTInputField *)field {
    for (int i = 0; i < self.sectionCount; i++) {
        XTFTFieldSection *section = [self fieldSectionAtIndex:i];
        for (int j = 0; j < section.fields.count; j++) {
            XTFTField *f = [section.fields objectAtIndex:j];
            if (f == field)
                return [NSIndexPath indexPathForRow:j inSection:i];
        }
    }
    return nil;
}

- (XTFTField *)fieldWithTag:(NSInteger)tag {
    for (XTFTFieldSection *section in self.fieldSections) {
        for (XTFTField *field in section.fields) {
            if (field.tag == tag)
                return field;
        }
    }
    return nil;
}

#pragma mark - Factory

+ (id)step {
    return [[[[self class] alloc] init] autorelease];
}

@end
