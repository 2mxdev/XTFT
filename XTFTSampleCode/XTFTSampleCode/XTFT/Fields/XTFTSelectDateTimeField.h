//
//  XTFTSelectDateTimeField.h
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTInputField.h"

typedef enum {
    XTFTSelectDateTimeFieldModeDate,
    XTFTSelectDateTimeFieldModeTime,
    XTFTSelectDateTimeFieldModeDateTime
} XTFTSelectDateTimeFieldMode;

@interface XTFTSelectDateTimeField : XTFTInputField

@property (nonatomic, retain) NSDate *minimumDate;
@property (nonatomic, retain) NSDate *maximumDate;
@property (nonatomic, assign) NSInteger interval; // 1..30, defaulf 1, in minutes
@property (nonatomic, assign) XTFTSelectDateTimeFieldMode mode; // XTFTSelectDateTimeFieldModeDate
@property (nonatomic, retain) NSString *format; // dd.MM.yy hh:mm

@end
