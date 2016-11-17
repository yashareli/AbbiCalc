//
//  ExpressionCalculator.m
//  AbbiCalc
//
//  Created by Eli Yashar on 05/10/2016.
//  Copyright © 2016 Eli Yashar. All rights reserved.
//

#import "ExpressionCalculator.h"
#import "PlusOperation.h"
#import "MultOperation.h"
#import "DivOperation.h"
#import "expOperation.h"
#import "CalcException.h"
#import "Utilities.h"
#import "ParenthesesCalc.h"

@interface ExpressionCalculator()
@property (strong, nonatomic)NSMutableArray* operationsArray;
@end
@implementation ExpressionCalculator

-(instancetype)init{
    if(self = [super init]) {
        [self initializeOperationsArray];
    }
    return self;
}
-(void)initializeOperationsArray
{
    self.operationsArray = [[NSMutableArray alloc]init];
    [self.operationsArray addObject:[[expOperation alloc]init]];
    [self.operationsArray addObject:[[MultOperation alloc]init]];
    [self.operationsArray addObject:[[DivOperation alloc]init]];
    [self.operationsArray addObject:[[PlusOperation alloc]init]];
}
-(NSString*)calc:(NSString*)expression
{
    NSString* result = nil;
    @try {
        expression = [self formatExpression:expression];
        
        NSMutableArray *tokens = [[expression componentsSeparatedByString:@" "]mutableCopy];
        ParenthesesCalc* parenthesesCalc = [[ParenthesesCalc alloc]init];
        [parenthesesCalc execute:tokens];
        for(MathOperationBase* operator in self.operationsArray) {
            [operator execute:tokens];
        }
    
        NSNumber *myNumber = [Utilities parseNumber:tokens[0]];
        if(!myNumber) {
            @throw [[CalcException alloc] initWithName:@"CalcExcpetion" reason:tokens[0] userInfo:nil];
        }
        result = tokens[0];
    } @catch (CalcException *exception) {
        result = [NSString stringWithFormat:@"Input Error near:%@",exception.reason];
    }
    return result;
}
-(NSString*)formatExpression:(NSString*)expression
{
    expression = [expression stringByReplacingOccurrencesOfString: @" " withString:@""];
    expression = [expression stringByReplacingOccurrencesOfString: @"(" withString:@" ( "];
    expression = [expression stringByReplacingOccurrencesOfString: @")" withString:@" ) "];
    for(MathOperationBase* operator in self.operationsArray) {
        NSString* operatorSign = [operator getOperationSign];
        NSString* spacedSign = [NSString stringWithFormat:@" %@ ", operatorSign];
        expression = [expression stringByReplacingOccurrencesOfString:operatorSign withString:spacedSign];
    }
    NSLog(@"%@",expression);
    return expression;
}
@end
