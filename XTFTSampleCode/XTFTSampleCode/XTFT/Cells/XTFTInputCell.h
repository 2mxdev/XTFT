//
//  XTFTInputCell.h
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XTFTInputField;

@interface XTFTInputCell : UITableViewCell {
@protected
    UILabel *_nameLabel;
    UILabel *_errorLabel;
    CGFloat _height;
}

@property (nonatomic, retain) XTFTInputField *field;
@property (nonatomic, readonly) CGFloat height;

+ (id)cellWithIdentifier:(NSString *)cellIdentifier;
+ (id)cell;

@end
