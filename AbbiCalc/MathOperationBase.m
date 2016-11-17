//
//  MathOperationBase.m
//  AbbiCalc
//
//  Created by Eli Yashar on 05/10/2016.
//  Copyright © 2016 Eli Yashar. All rights reserved.
//

#import "MathOperationBase.h"
#import "CalcException.h"
#import "Utilities.h"
@implementation MathOperationBase

-(void)execute:(NSMutableArray*)tokens
{
    for(int i=0;i<[tokens count];i++) {
        if([tokens[i] isEqualToString:[self getOperationSign]]) {
            if(i == 0 || i == ([tokens count] - 1)) {
                @throw [[CalcException alloc] initWithName:@"CalcExcpetion" reason:tokens[i] userInfo:nil];
            }
            int leftValue = [self getValue:tokens index:i-1];
            int rightValue =  [self getValue:tokens index:i+1];
            tokens[i-1] = [self performOperation:leftValue rightValue:rightValue];
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(i, 2)];
            [tokens removeObjectsAtIndexes:indexSet];
            i--;
        }
    }
}

-(int)getValue:(NSArray*)tokens index:(int)index{
    NSNumber* value = [Utilities parseNumber:tokens[index]];
    if(!value) {
        @throw [[CalcException alloc] initWithName:@"CalcExcpetion" reason:tokens[index] userInfo:nil];
    }
    return [value intValue];
}

-(NSString*)getOperationSign
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"-getOperationSign should be implemented in the dervice class"
                                 userInfo:nil];
    return nil;
}
-(NSString*)performOperation:(NSInteger)leftValue rightValue:(NSInteger)rightValue
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"-performOperation should be implemented in the dervice class"
                                 userInfo:nil];
    return nil;
}
@end
