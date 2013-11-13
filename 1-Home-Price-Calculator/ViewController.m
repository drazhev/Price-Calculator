//
//  ViewController.m
//  1-Home-Price-Calculator
//
//  Created by Alexander Drazhev on 11/11/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    self.currency = @"EUR";
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



BOOL isValidInput(NSString *soupValue, NSString *mainDishValue, NSString *desertValue) {
    if (![[NSScanner scannerWithString: soupValue] scanFloat:NULL])
    {
        return NO;
    }
    
    if (![[NSScanner scannerWithString: mainDishValue] scanFloat:NULL])
    {
        return NO;
    }
    
    if (![[NSScanner scannerWithString: desertValue] scanFloat:NULL])
    {
        return NO;
    }
    
    int soupIntValue = [soupValue intValue];
    int mainDishIntValue = [mainDishValue intValue];
    int desertIntValue = [desertValue intValue];
    
    if (soupIntValue > 10 || soupIntValue < 0)
    {
        return NO;
    }
    
    if (mainDishIntValue > 10 || mainDishIntValue < 0)
    {
        return NO;
    }
    
    if (desertIntValue > 10 || desertIntValue < 0) {
        return NO;
    }
    
    return YES;
}

- (IBAction)soupButtonTapped:(id)sender {
    UIButton *soupButton = (UIButton *) sender;
    NSString *title = [soupButton titleForState:UIControlStateNormal];
    if ([self.soupTextField.text length] > 0)
    {
        if ([title isEqualToString: @"+"])
        {
            self.soupTextField.text = [NSString stringWithFormat:@"%d", [self.soupTextField.text intValue] + 1];
        }
        
        else
        {
            self.soupTextField.text = [NSString stringWithFormat:@"%d", [self.soupTextField.text intValue] - 1];
        }
    }
}



- (IBAction)mainDishButtonTapped:(id)sender {
    UIButton *mainDishButton = (UIButton *) sender;
    NSString *title = [mainDishButton titleForState:UIControlStateNormal];
    if ([self.mainDishTextField.text length] > 0)
    {
        if ([title isEqualToString: @"+"])
        {
            self.mainDishTextField.text = [NSString stringWithFormat:@"%d", [self.mainDishTextField.text intValue] + 1];
        }
        
        else
        {
            self.mainDishTextField.text = [NSString stringWithFormat:@"%d", [self.mainDishTextField.text intValue] - 1];
        }
    }
}

- (IBAction)desertButtonTapped:(id)sender {
    UIButton *desertButton = (UIButton *) sender;
    NSString *title = [desertButton titleForState:UIControlStateNormal];
    if ([self.desertTextField.text length] > 0)
    {
        if ([title isEqualToString: @"+"])
        {
            self.desertTextField.text = [NSString stringWithFormat:@"%d", [self.desertTextField.text intValue] + 1];
        }
        
        else
        {
            self.desertTextField.text = [NSString stringWithFormat:@"%d", [self.desertTextField.text intValue] - 1];
        }
    }
}

- (IBAction)calculateButtonTapped:(id)sender {
    self.totalAmount = 0;
    self.errorMessagesLabel.text = @"";
    if (!isValidInput(self.soupTextField.text, self.mainDishTextField.text, self.desertTextField.text))
    {
        self.errorMessagesLabel.text = @"Invalid input!";
        self.totalPriceLabel.text = @"";
    }
    else
    {
        self.totalAmount += [self.soupTextField.text doubleValue] * 2;
        self.totalAmount += [self.mainDishTextField.text doubleValue] * 4.5;
        self.totalAmount += [self.desertTextField.text doubleValue] * 1.5;
        self.totalAmount += self.cocaColaSlider.value * 2;
        
        if (self.homeDeliverySwitch.on)
        {
            self.totalAmount += 10;
        }
        
        if ([self.currency isEqualToString: @"$"])
        {
            self.totalAmount *= TODOLLARS;
        }
        
        if ([self.currency isEqualToString: @"BGN"])
        {
            self.totalAmount *= TOBGN;
        }
        
        self.totalPriceLabel.text = [NSString stringWithFormat:@"%.2f %@", self.totalAmount, self.currency];
    }
}
- (IBAction)currencyButtonTapped:(id)sender {
    [self.currencyButton setBackgroundColor: [UIColor whiteColor]];
    self.currencyButton = (UIButton *) sender;
    [self.currencyButton setBackgroundColor: [UIColor colorWithRed:187/255.0 green:1 blue:1 alpha:0.5]];
    
    self.currency = [sender titleForState: UIControlStateNormal];
    [self calculateButtonTapped: sender];
}

@end
