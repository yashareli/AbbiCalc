//
//  Utilities.m
//  AbbiCalc
//
//  Created by Eli Yashar on 06/10/2016.
//  Copyright © 2016 Eli Yashar. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities
+(NSNumber*)parseNumber:(NSString*)stringToParse
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    return [f numberFromString:stringToParse];
}
@end
