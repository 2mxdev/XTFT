//
//  XTFTStep.h
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XTFTField;
@class XTFTInputField;
@class XTFTFieldSection;

@interface XTFTStep : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *desc;

@property (nonatomic, readonly) NSMutableArray *fieldSections;

@property (nonatomic, assign) BOOL showHudWhileValidating; // NO

- (void)addSection:(XTFTFieldSection *)section;

- (NSInteger)sectionCount;
- (NSInteger)fieldsCountInSection:(NSInteger)section;

- (XTFTFieldSection *)fieldSectionAtIndex:(NSInteger)index;
- (XTFTInputField *)fieldAtIndexPath:(NSIndexPath *)indexPath;

- (XTFTField *)fieldWithTag:(NSInteger)tag;

- (NSIndexPath *)indexPathForField:(XTFTInputField *)field;

+ (id)step;

@end
