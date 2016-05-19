//
//  ViewController.h
//  VendingMachine
//
//  Created by Sunny Pruthi on 5/17/16.
//  Copyright © 2016 SanilPruthi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *change;
@property (strong, nonatomic) IBOutlet UILabel *cash;

@property NSNumber *curVal;
@property NSNumber *changeVal;

@end

