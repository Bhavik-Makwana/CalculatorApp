//
//  ViewController.h
//  CalculatorApp
//
//  Created by B M on 18/11/2018.
//  Copyright © 2018 B M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    BOOL operatorPressed;
    char op;
    NSString *firstEntry;
    NSString *secondEntry;
}
@property (weak, nonatomic) IBOutlet UILabel *labelOutput;
- (IBAction)clearPressed:(id)sender;
- (IBAction)addPressed:(id)sender;
- (IBAction)minusPressed:(id)sender;
- (IBAction)dividePressed:(id)sender;
- (IBAction)multiplyPressed:(id)sender;
- (IBAction)equalsPressed:(id)sender;

- (IBAction)numberPressed:(UIButton*)sender;
@end

