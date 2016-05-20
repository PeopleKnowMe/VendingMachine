//
//  ViewController.m
//  VendingMachine
//
//  Created by Sunny Pruthi on 5/17/16.
//  Copyright © 2016 SanilPruthi. All rights reserved.
//

#import "ViewController.h"
#import "vmAlertController.h"
#import <math.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.curVal = [NSNumber numberWithDouble:0.00];
//    self.curVal = [NSDecimalNumber decimalNumberWithMantissa:000 exponent:-2 isNegative:NO];
//    self.changeVal = [NSDecimalNumber decimalNumberWithMantissa:000 exponent:-2 isNegative:NO];
    
    self.curVal = [NSNumber numberWithInt:0];
    self.changeVal = [NSNumber numberWithInt:0];
 
    self.cokeCount = [NSNumber numberWithInt:10];
    self.pepsiCount = [NSNumber numberWithInt:7];
    self.spriteCount = [NSNumber numberWithInt:0];
    self.fireballCount = [NSNumber numberWithInt:1];
    self.blueGuyCount = [NSNumber numberWithInt:3];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)penny:(id)sender
{
    //[self insertedCoin:([NSDecimalNumber decimalNumberWithMantissa:.01 exponent:0 isNegative:NO])];
    [self insertedCoin:[NSNumber numberWithInt:1]];
}

- (IBAction)nickel:(id)sender
{
 //   [self insertedCoin:([NSDecimalNumber decimalNumberWithMantissa:.05 exponent:0 isNegative:NO])];
    [self insertedCoin:[NSNumber numberWithInt:5]];
}


- (IBAction)dime:(id)sender
{
    //[self insertedCoin:([NSDecimalNumber decimalNumberWithMantissa:.10 exponent:0 isNegative:NO])];
    [self insertedCoin:[NSNumber numberWithInt:10]];
}


- (IBAction)quarter:(id)sender
{
   // [self insertedCoin:([NSDecimalNumber decimalNumberWithMantissa:.25 exponent:0 isNegative:NO])];
    [self insertedCoin:[NSNumber numberWithInt:25]];
}


- (IBAction)dollar:(id)sender
{
    //[self insertedCoin:([NSDecimalNumber decimalNumberWithMantissa:1 exponent:0 isNegative:NO])];
    [self insertedCoin:[NSNumber numberWithInt:100]];
}

- (IBAction)coke:(id)sender
{
    [self makePurchase:@"Coke"];
}

- (IBAction)sprite:(id)sender
{
    [self makePurchase:@"Sprite"];
}

- (IBAction)pepsi:(id)sender
{
    [self makePurchase:@"Pepsi"];
}

- (IBAction)fireball:(id)sender
{
    [self makePurchase:@"Fireball"];
}
- (IBAction)blueguy:(id)sender
{
    [self makePurchase:@"Blue Guy"];
}

-(void)insertedCoin:(NSNumber *)coinVal
{
 //   self.curVal = [self.curVal decimalNumberByAdding:coinVal];
    self.curVal = [NSNumber numberWithInt:[self.curVal intValue] + [coinVal intValue]];
    
    [self updateCash];
    
//    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
//    
//    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
//    
//    int cents = [self.curVal intValue] % 100;
//    int dollars = ([self.curVal intValue] - cents) / 100;
//    
//    NSString *camount;
//    if (cents <=9)
//    {
//        camount = [NSString stringWithFormat:@"0%d",cents];
//    }
//    else
//    {
//        camount = [NSString stringWithFormat:@"%d",cents];
//    }
//    NSString *t = [NSString stringWithFormat:@"$%d.%@",dollars,camount];
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.cash.text = t;
//    });
//    
//    
//    
//    NSLog(@"Val is: %@", self.curVal);
}

-(void)updateCash
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    int cents = [self.curVal intValue] % 100;
    int dollars = ([self.curVal intValue] - cents) / 100;
    
    NSString *camount;
    if (cents <=9)
    {
        camount = [NSString stringWithFormat:@"0%d",cents];
    }
    else
    {
        camount = [NSString stringWithFormat:@"%d",cents];
    }
    NSString *t = [NSString stringWithFormat:@"$%d.%@",dollars,camount];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.cash.text = t;
    });
}

-(void)receiveChange
{
    //self.changeLabel.text = self.changeVal;
   // self.changeVal = [NSNumber numberWithDouble:0.00];
}
- (IBAction)change:(id)sender
{
   [self calcChange:self.curVal];
}

-(void)makePurchase:(NSString *)item
{
    
    if([item isEqualToString:@"Coke"])
    {
        NSLog(@"Val before purchase is: %@", self.curVal);
    //    NSLog(@"$1.85 is: %@", [NSNumber numberWithDouble:1.85]);
        if([self.curVal doubleValue] >= [[NSNumber numberWithDouble:185] doubleValue])
        {
            if([self.cokeCount intValue] > 0)
            {
                    //update quantities and dispense change
            self.curVal = [NSNumber numberWithDouble:([self.curVal doubleValue] - 185)];
            NSLog(@"Purchased");
                //dispense change using curVal
                int val = [self.cokeCount intValue];
                self.cokeCount = [NSNumber numberWithInt:val - 1];
                NSLog(@"New val is: %@", self.curVal);
                NSLog(@"Updated quantity is: %d", [self.cokeCount intValue]);
                //[self calcChange:self.curVal];
                [self updateCash];
            }
            else
            {
                [vmAlertController showAlert:@"Out Of Stock!" withMessage:@"We've run out of this beverage, sorry!"];
            }

        }
        else
        {
            NSLog(@"Insufficient Funds");
             [vmAlertController showAlert:@"Insufficient Funds" withMessage:@"You don't have enough money to buy this."];
            //alert view saying insufficient funds
        }
    }
    
    
    if([item isEqualToString:@"Pepsi"])
    {
        if([self.curVal doubleValue] >= [[NSNumber numberWithDouble:199] doubleValue])
        {
        NSLog(@"Val before purchase is: %@", self.curVal);
     //   NSLog(@"$1.99 is: %@", [NSNumber numberWithDouble:1.99]);
        if([self.pepsiCount intValue] > 0)
        {
            //update quantities and dispense change
            self.curVal = [NSNumber numberWithDouble:([self.curVal doubleValue] - 199)];
            NSLog(@"Purchased");
            //dispense change using curVal
            int val = [self.pepsiCount intValue];
            self.pepsiCount = [NSNumber numberWithInt:val - 1];
            NSLog(@"New val is: %@", self.curVal);
            NSLog(@"Updated quantity is: %d", [self.pepsiCount intValue]);
           // [self calcChange:self.curVal];
            [self updateCash];
        }
        else
        {
            [vmAlertController showAlert:@"Out Of Stock!" withMessage:@"We've run out of this beverage, sorry!"];
        }
        }
    else
        {
            NSLog(@"Insufficient Funds");
                         [vmAlertController showAlert:@"Insufficient Funds" withMessage:@"You don't have enough money to buy this."];
            //alert view saying insufficient funds
        }
    }
    
    
    if([item isEqualToString:@"Sprite"])
    {
        NSLog(@"Val before purchase is: %@", self.curVal);
        if([self.curVal doubleValue] >= [[NSNumber numberWithDouble:135] doubleValue])
        {
      //  NSLog(@"$1.35 is: %@", [NSNumber numberWithDouble:1.35]);
        if([self.spriteCount intValue] > 0)
        {
            //update quantities and dispense change
            self.curVal = [NSNumber numberWithDouble:([self.curVal doubleValue] - 135)];
            NSLog(@"Purchased");
            //dispense change using curVal
            int val = [self.spriteCount intValue];
            self.spriteCount = [NSNumber numberWithInt:val - 1];
            NSLog(@"New val is: %@", self.curVal);
            NSLog(@"Updated quantity is: %d", [self.spriteCount intValue]);
           // [self calcChange:self.curVal];
            [self updateCash];
        }
        else
        {
            [vmAlertController showAlert:@"Out Of Stock!" withMessage:@"We've run out of this beverage, sorry!"];
        }
        }
    else
        {
            NSLog(@"Insufficient Funds");
                         [vmAlertController showAlert:@"Insufficient Funds" withMessage:@"You don't have enough money to buy this."];
            //alert view saying insufficient funds
        }
    }
    
    if([item isEqualToString:@"Fireball"])
    {
        NSLog(@"Val before purchase is: %@", self.curVal);
      //  NSLog(@"$1.30 is: %@", [NSNumber numberWithDouble:14.20]);
        if([self.curVal doubleValue] >= [[NSNumber numberWithDouble:1420] doubleValue])
        {
        if([self.fireballCount intValue] > 0)
        {
            //update quantities and dispense change
            self.curVal = [NSNumber numberWithDouble:([self.curVal doubleValue] - 1420)];
            NSLog(@"Purchased");
            //dispense change using curVal
            int val = [self.fireballCount intValue];
            self.fireballCount = [NSNumber numberWithInt:val - 1];
            NSLog(@"New val is: %@", self.curVal);
            NSLog(@"Updated quantity is: %d", [self.fireballCount intValue]);
           // [self calcChange:self.curVal];
            [self updateCash];
        }
        else
        {
            [vmAlertController showAlert:@"Out Of Stock!" withMessage:@"We've run out of this beverage, sorry!"];
        }
            
        }
        else
        {
            NSLog(@"Insufficient Funds");
                         [vmAlertController showAlert:@"Insufficient Funds" withMessage:@"You don't have enough money to buy this."];
            //alert view saying insufficient funds
        }
    }
    
    if([item isEqualToString:@"Blue Guy"])
    {
        if([self.curVal doubleValue] >= [[NSNumber numberWithDouble:360] doubleValue])
        {
        if([self.blueGuyCount intValue] > 0)
        {
            //update quantities and dispense change
            self.curVal = [NSNumber numberWithDouble:([self.curVal doubleValue] - 360)];
            NSLog(@"Purchased");
            //dispense change using curVal
            int val = [self.blueGuyCount intValue];
            self.blueGuyCount = [NSNumber numberWithInt:val - 1];
            NSLog(@"New val is: %@", self.curVal);
            NSLog(@"Updated quantity is: %d", [self.blueGuyCount intValue]);
          //  [self calcChange:self.curVal];
            [self updateCash];
            
        }
        
        else
        {
            [vmAlertController showAlert:@"Out Of Stock!" withMessage:@"We've run out of this beverage, sorry!"];
        }
        }
        else
        {
            NSLog(@"Insufficient Funds");
                         [vmAlertController showAlert:@"Insufficient Funds" withMessage:@"You don't have enough money to buy this."];
            //alert view saying insufficient funds
        }
    }
}

-(void)calcChange:(NSNumber*)amount
{
    int dubAmt = [amount intValue];
    NSLog(@"Amount is: %d", (dubAmt));
    
    int numDollars = dubAmt / 100;
    NSLog(@"Num Quarters: %d", numDollars);
    dubAmt = dubAmt - (100 * numDollars);
    
    
    int numQuarters = dubAmt / 25;
    NSLog(@"Num Quarters: %d", numQuarters);
    dubAmt = dubAmt - (25 * numQuarters);
    
    int numDimes = dubAmt / 10;
    NSLog(@"Num Dimes: %d", numDimes);
    dubAmt = dubAmt - (10 * numDimes);
    
    int numNickels = dubAmt / 5;
    NSLog(@"Num Nickels: %d", numNickels);
    dubAmt = dubAmt - (5 * numNickels);
    
    int numPennies = dubAmt;
    NSLog(@"Num Pennies: %d", numPennies);

    //int numDollars = fmod([amount doubleValue],1.0);
    //double newAmount = [amount doubleValue] - numDollars;
    //NSLog(@"%d dollars and remainder is %f", numDollars,newAmount);
    //NSLog(@"Val is %f", (int)10.0*fmod([amount doubleValue], 0.15));
    //double numQuarters = fmod([amount doubleValue], 0.25);
    //newAmount = newAmount - (0.25*numQuarters);
 //   NSLog(@"%f quarters and remainder is %f", numQuarters,[amount doubleValue]);
//    
//    int numDimes = fmodf((float)newAmount, 0.1);
//    //newAmount = newAmount - (0.1*numDimes);
//    NSLog(@"%d dimes and remainder is %f", numDimes,newAmount);
//    
//    int numNickels = fmodf(float)newAmount, 0.05);
//    //newAmount = newAmount - (0.05*numNickels);
//    NSLog(@"%d nickels and remainder is %f", numNickels,newAmount);
//    
//    int numPennies = fmod(newAmount, 0.01);
//    //newAmount = newAmount - (0.01*numPennies);
//    
    NSLog(@"Change is: %d Dollars, %d Quarters, %d Dimes, %d Nickels %d Pennies", numDollars, numQuarters, numDimes, numNickels, numPennies);
    
    
    NSString *changeString = [NSString stringWithFormat:@"%d Dollars, %d Quarters, %d Dimes, %d Nickels %d Pennies", numDollars, numQuarters, numDimes, numNickels, numPennies];
    
    dispatch_async(dispatch_get_main_queue(), ^{
            self.change.text = changeString;
    });
    
    self.curVal = [NSNumber numberWithInt:0];
    
    [self updateCash];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
