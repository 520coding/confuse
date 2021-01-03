//
//  TestFont.h
//  confuse_test
//
//  Created by ymac on 27/09/2020.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <UIKit/UIKit.h>

// For text, messages, etc
#define DEFAULT_FONTSIZE    15
#define DEFAULT_FONT(s)     [UIFont fontWithName:@"ArialMT" size:s]
#define DEFAULT_BOLDFONT(s) [UIFont fontWithName:@"Arial-BoldMT" size:s]
 
// For table cells
#define CELL_FONTSIZE    16
#define CELL_FONT(s)     [UIFont fontWithName:@"Helvetica-Oblique" size:s]
#define CELL_BOLDFONT(s) [UIFont fontWithName:@"Helvetica-BoldOblique" size:s]

NS_ASSUME_NONNULL_BEGIN

@interface TestFont : NSObject

@end

NS_ASSUME_NONNULL_END
