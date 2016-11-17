//
//  FirstViewController.m
//  AbbiCalc
//
//  Created by Eli Yashar on 05/10/2016.
//  Copyright © 2016 Eli Yashar. All rights reserved.
//

#import "FirstViewController.h"
#import "ExpressionCalculator.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIButton *calcButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)onCalcClick:(id)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onCalcClick:(id)sender {
        ExpressionCalculator* calc = [[ExpressionCalculator alloc]init];
        self.textField.text = [calc calc:self.textField.text];
}
@end
