//
//  ViewController.h
//  1-Home-Price-Calculator
//
//  Created by Alexander Drazhev on 11/11/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TODOLLARS 1.34
#define TOBGN 1.96

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *soupTextField;
@property (weak, nonatomic) IBOutlet UITextField *mainDishTextField;
@property (weak, nonatomic) IBOutlet UITextField *desertTextField;
@property (weak, nonatomic) IBOutlet UISlider *cocaColaSlider;
@property (weak, nonatomic) IBOutlet UISwitch *homeDeliverySwitch;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *errorMessagesLabel;
@property (nonatomic) double totalAmount;
@property (weak, nonatomic) NSString *currency;
@end
