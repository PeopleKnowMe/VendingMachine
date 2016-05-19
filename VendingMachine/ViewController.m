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
    self.curVal = [NSNumber numberWithDouble:0.00];
    self.changeVal = [NSNumber numberWithDouble:0.00];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)penny:(id)sender
{
    [self insertedCoin:[NSNumber numberWithDouble:0.01]];
}

- (IBAction)nickel:(id)sender
{
    [self insertedCoin:[NSNumber numberWithDouble:0.05]];
}


- (IBAction)dime:(id)sender
{
    [self insertedCoin:[NSNumber numberWithDouble:0.10]];
}


- (IBAction)quarter:(id)sender
{
    [self insertedCoin:[NSNumber numberWithDouble:0.25]];
}


- (IBAction)dollar:(id)sender
{
    [self insertedCoin:[NSNumber numberWithDouble:1.00]];
}

- (IBAction)coke:(id)sender
{
    [self makePurchase:@"Coke"];
}


-(void)insertedCoin:(NSNumber *)coinVal
{
    self.curVal = [NSNumber numberWithFloat:([self.curVal floatValue] + [coinVal floatValue])];
    NSLog(@"Val is: %@", self.curVal);
}

-(void)receiveChange
{
    //self.changeLabel.text = self.changeVal;
    self.changeVal = [NSNumber numberWithDouble:0.00];
}
- (IBAction)change:(id)sender
{
    [self calcChange:[NSNumber numberWithDouble:0.87]];
}

-(void)makePurchase:(NSString *)item
{
    if([item isEqualToString:@"Coke"])
    {
        NSLog(@"Val before purchase is: %@", self.curVal);
    //    NSLog(@"$1.85 is: %@", [NSNumber numberWithDouble:1.85]);
        if([self.curVal doubleValue] >= [[NSNumber numberWithDouble:1.85] doubleValue])
        {
                    //update quantities and dispense change
            self.curVal = [NSNumber numberWithFloat:([self.curVal floatValue] - 1.85)];
            NSLog(@"Purchased");
                NSLog(@"New val is: %@", self.curVal);

        }
        else
        {
            NSLog(@"Insufficient Funds");
             [vmAlertController showAlert:@"Insufficient Funds" withMessage:@"You don't have enough money to buy this."];
            //alert view saying insufficient funds
        }
    }
    else if([item isEqualToString:@"Pepsi"])
    {
        NSLog(@"Val before purchase is: %@", self.curVal);
     //   NSLog(@"$1.99 is: %@", [NSNumber numberWithDouble:1.99]);
        if([self.curVal doubleValue] >= [[NSNumber numberWithDouble:1.99] doubleValue])
        {
            //update quantities and dispense change
            self.curVal = [NSNumber numberWithFloat:([self.curVal floatValue] - 1.99)];
            NSLog(@"Purchased");
            NSLog(@"New val is: %@", self.curVal);
            
        }
        else
        {
            NSLog(@"Insufficient Funds");
                         [vmAlertController showAlert:@"Insufficient Funds" withMessage:@"You don't have enough money to buy this."];
            //alert view saying insufficient funds
        }

        
    }
    else if([item isEqualToString:@"Sprite"])
    {
        NSLog(@"Val before purchase is: %@", self.curVal);
      //  NSLog(@"$1.35 is: %@", [NSNumber numberWithDouble:1.35]);
        if([self.curVal doubleValue] >= [[NSNumber numberWithDouble:1.35] doubleValue])
        {
            //update quantities and dispense change
            self.curVal = [NSNumber numberWithFloat:([self.curVal floatValue] - 1.35)];
            NSLog(@"Purchased");
            NSLog(@"New val is: %@", self.curVal);
            
        }
        else
        {
            NSLog(@"Insufficient Funds");
                         [vmAlertController showAlert:@"Insufficient Funds" withMessage:@"You don't have enough money to buy this."];
            //alert view saying insufficient funds
        }

        
    }
    else if([item isEqualToString:@"Fireball"])
    {
        NSLog(@"Val before purchase is: %@", self.curVal);
      //  NSLog(@"$1.30 is: %@", [NSNumber numberWithDouble:14.20]);
        if([self.curVal doubleValue] >= [[NSNumber numberWithDouble:14.20] doubleValue])
        {
            //update quantities and dispense change
            self.curVal = [NSNumber numberWithFloat:([self.curVal floatValue] - 14.20)];
            NSLog(@"Purchased");
            NSLog(@"New val is: %@", self.curVal);
            
        }
        else
        {
            NSLog(@"Insufficient Funds");
                         [vmAlertController showAlert:@"Insufficient Funds" withMessage:@"You don't have enough money to buy this."];
            //alert view saying insufficient funds
        }

        
    }
    else if([item isEqualToString:@"Blue Guy"])
    {
        NSLog(@"Val before purchase is: %@", self.curVal);
        //NSLog(@"$1.30 is: %@", [NSNumber numberWithDouble:3.60]);
        if([self.curVal doubleValue] >= [[NSNumber numberWithDouble:3.60] doubleValue])
        {
            //update quantities and dispense change
            self.curVal = [NSNumber numberWithFloat:([self.curVal floatValue] - 3.60)];
            NSLog(@"Purchased");
            NSLog(@"New val is: %@", self.curVal);
            
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
    double dubAmt = 100*[amount doubleValue];
    NSLog(@"Amount is: %d", ((int)dubAmt));
    
    int numDollars = (int)dubAmt / 100;
    NSLog(@"Num Quarters: %d", numDollars);
    dubAmt = dubAmt - (100 * numDollars);
    
    
    int numQuarters = (int)dubAmt / 25;
    NSLog(@"Num Quarters: %d", numQuarters);
    dubAmt = dubAmt - (25 * numQuarters);
    
    int numDimes = (int)dubAmt / 10;
    NSLog(@"Num Dimes: %d", numDimes);
    dubAmt = dubAmt - (10 * numDimes);
    
    int numNickels = (int)dubAmt / 5;
    NSLog(@"Num Nickels: %d", numNickels);
    dubAmt = dubAmt - (5 * numNickels);
    
    int numPennies = (int)dubAmt;
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
