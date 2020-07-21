//
//  SeeTheRoleViewController.m
//  Impostor Objective C
//
//  Created by Mykola Sereda on 20.07.2020.
//  Copyright © 2020 Mykola Sereda. All rights reserved.
//

#import "SeeTheRoleViewController.h"
#import "StartViewController.h"

@interface SeeTheRoleViewController ()

//@property (nonatomic, strong) NSMutableArray *placesAndSpyArray;

@end

@implementation SeeTheRoleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
[super viewWillAppear:YES];

    NSLog(@"IN SEE THE ROLE VC: %@ ", _placesAndSpyArray);
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)nextButtonClicked:(id)sender {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                      @"Main" bundle:[NSBundle mainBundle]];
         SeeTheRoleViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"Places"];

    vc.placesAndSpyArray = _placesAndSpyArray;
    
       [self presentViewController:vc animated:YES completion:^{}];
    
}


@end
