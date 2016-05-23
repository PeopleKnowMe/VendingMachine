//
//  vmAlertController.m
//  VendingMachine
//
//  Created by Sunny Pruthi on 5/19/16.
//  Copyright © 2016 SanilPruthi. All rights reserved.
//

#import "vmAlertController.h"

@interface vmAlertController()

@end

@implementation vmAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+(void)showAlert:(NSString *)name withMessage:(NSString *)alertMessage
{
    //reusable alert method for any class
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:name message:alertMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}


@end
