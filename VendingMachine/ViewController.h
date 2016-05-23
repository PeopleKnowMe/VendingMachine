//
//  ViewController.h
//  VendingMachine
//
//  Created by Sunny Pruthi on 5/17/16.
//  Copyright © 2016 SanilPruthi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//Labels for current cash inserted and change

@property (strong, nonatomic) IBOutlet UILabel *change;
@property (strong, nonatomic) IBOutlet UILabel *cash;

//Counts for current cash in machine, amount of change to dispense, and inventory for each item

@property NSNumber *curVal;
@property NSNumber *changeVal;

@property NSNumber *cokeCount;
@property NSNumber *pepsiCount;
@property NSNumber *spriteCount;
@property NSNumber *fireballCount;
@property NSNumber *blueGuyCount;


@end

