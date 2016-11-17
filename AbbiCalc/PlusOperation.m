//
//  PlusOperation.m
//  AbbiCalc
//
//  Created by Eli Yashar on 05/10/2016.
//  Copyright © 2016 Eli Yashar. All rights reserved.
//

#import "PlusOperation.h"

@implementation PlusOperation 

-(NSString*)getOperationSign
{
    return @"+";
}
-(NSString*)performOperation:(NSInteger)leftValue rightValue:(NSInteger)rightValue
{
    return [NSString stringWithFormat:@"%d",(int)(leftValue + rightValue)];
}
@end
