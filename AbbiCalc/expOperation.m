//
//  expOperator.m
//  AbbiCalc
//
//  Created by Eli Yashar on 06/10/2016.
//  Copyright © 2016 Eli Yashar. All rights reserved.
//

#import "expOperation.h"

@implementation expOperation
-(NSString*)getOperationSign
{
    return @"^";
}
-(NSString*)performOperation:(NSInteger)leftValue rightValue:(NSInteger)rightValue
{
    return [NSString stringWithFormat:@"%d",(int)pow(leftValue,rightValue)];
}
@end
