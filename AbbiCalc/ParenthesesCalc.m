//
//  ParenthesesCalc.m
//  AbbiCalc
//
//  Created by Eli Yashar on 06/10/2016.
//  Copyright © 2016 Eli Yashar. All rights reserved.
//

#import "ParenthesesCalc.h"
#import "CalcException.h"
#import "ExpressionCalculator.h"

@implementation ParenthesesCalc
-(void)execute:(NSMutableArray*)tokens
{
    int openParenthesesIndex = [self findParenthesesIndex:tokens symbol:@"("];
    int closeParenthesesIndex =  [self findParenthesesIndex:tokens symbol:@")"];
    if( openParenthesesIndex != closeParenthesesIndex) {
        if(openParenthesesIndex == -1 || closeParenthesesIndex == -1 ||
           openParenthesesIndex > closeParenthesesIndex) {
            @throw [[CalcException alloc] initWithName:@"CalcExcpetion" reason:@"No Matching Parentheses" userInfo:nil];
        }
        
        NSArray* subArray = [tokens subarrayWithRange:NSMakeRange(openParenthesesIndex+1, closeParenthesesIndex-openParenthesesIndex-1)];
        NSString* parentheseseExpression = [[subArray valueForKey:@"description"] componentsJoinedByString:@""];
        ExpressionCalculator* calc = [[ExpressionCalculator alloc]init];
    
        tokens[openParenthesesIndex-1] = [calc calc:parentheseseExpression];
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(openParenthesesIndex, closeParenthesesIndex-openParenthesesIndex+2)];
        [tokens removeObjectsAtIndexes:indexSet];
    }
    
}
-(int)findParenthesesIndex:(NSArray*)tokens symbol:(NSString*)symbol
{
    for(int i=0;i<[tokens count];i++){
        if([tokens[i] isEqualToString:symbol]) {
            return i;
        }
    }
    return -1;
}
@end
