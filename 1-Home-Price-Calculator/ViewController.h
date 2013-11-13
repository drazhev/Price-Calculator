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
#define SOUP_PRICE_EURO 2
#define MAIN_DISH_PRICE_EURO 4.5
#define DESERT_PRICE_EURO 1.5
#define COCA_COLA_LITER_PRICE_EURO 2
#define HOME_DELIVERY_PRICE_EURO 10

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
@property (weak, nonatomic) IBOutlet UIButton *currencyButton;
@property (weak, nonatomic) IBOutlet UILabel *soupPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainDishPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *desertPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *cocaColaPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeDeliveryPriceLabel;
@end
