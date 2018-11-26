//
//  ViewController.m
//  CalculatorApp
//
//  Created by B M on 18/11/2018.
//  Copyright © 2018 B M. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
@interface ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    operatorPressed = FALSE;
    firstEntry = NULL;
    secondEntry = NULL;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clearPressed:(id)sender {
    operatorPressed = FALSE;
    _labelOutput.text = NULL;
    firstEntry = NULL;
    secondEntry = NULL;
}

- (IBAction)addPressed:(id)sender {
    op = '+';
    operatorPressed = TRUE;
}

- (IBAction)minusPressed:(id)sender {
    op = '-';
    operatorPressed = TRUE;
}

- (IBAction)dividePressed:(id)sender {
    op = '/';
    operatorPressed = TRUE;
}

- (IBAction)multiplyPressed:(id)sender {
    op = '*';
    operatorPressed = TRUE;
}

- (IBAction)equalsPressed:(id)sender {
    if (op == '+') {
        double outputNum = [firstEntry doubleValue] + [secondEntry intValue];
        _labelOutput.text = [NSString stringWithFormat:@"%g", outputNum];
    }
    else if (op == '-') {
        double outputNum = [firstEntry doubleValue] - [secondEntry intValue];
        _labelOutput.text = [NSString stringWithFormat:@"%g", outputNum];
    }
    else if (op == '*') {
        double outputNum = [firstEntry doubleValue] * [secondEntry intValue];
        _labelOutput.text = [NSString stringWithFormat:@"%g", outputNum];
    }
    else if (op == '/') {
        if ([secondEntry intValue] !=  0) {
            double outputNum = [firstEntry doubleValue] / [secondEntry intValue];
            _labelOutput.text = [NSString stringWithFormat:@"%g", outputNum];
        }
        else {
            _labelOutput.text = @"Error";
        }
    }
    firstEntry = NULL;
    secondEntry = NULL;
    operatorPressed = NULL;
}

- (IBAction)numberPressed:(UIButton*)sender {
    double tag = sender.tag;
    if (operatorPressed == FALSE) {
        if (firstEntry == NULL) {
            if (tag != 99) {
                firstEntry = [NSString stringWithFormat:@"%0.0f",tag];
                _labelOutput.text = firstEntry;
            }
        }
        else {
            if (tag == 99) {
                firstEntry = [NSString stringWithFormat:@"%@.",firstEntry];
            }
            else {
                firstEntry = [NSString stringWithFormat:@"%@%0.0f",firstEntry, tag];
            }
            _labelOutput.text = firstEntry;
        }
    }
    else {
        if (secondEntry == NULL) {
            if (tag != 99) {
                secondEntry = [NSString stringWithFormat:@"%0.0f",tag];
                _labelOutput.text = secondEntry;
            }
        }
        else {
            if (tag == 99) {
                secondEntry = [NSString stringWithFormat:@"%@.",secondEntry];
            }
            else {
                secondEntry = [NSString stringWithFormat:@"%@%0.0f",secondEntry, tag];
            }
            _labelOutput.text = secondEntry;
        }
    }
}
@end
