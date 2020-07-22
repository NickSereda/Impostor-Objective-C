//
//  PlaceViewController.m
//  Impostor Objective C
//
//  Created by Mykola Sereda on 20.07.2020.
//  Copyright © 2020 Mykola Sereda. All rights reserved.
//

#import "PlaceViewController.h"
#import "SeeTheRoleViewController.h"
#import "TimerViewController.h"

@interface PlaceViewController ()

@end

@implementation PlaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
[super viewWillAppear:YES];

    self.placeOrSpyLabel.text = [_placesAndSpyArray lastObject];
     NSLog(@"FIRST OBECT: %@", [_placesAndSpyArray lastObject]);
    NSLog(@"IN PLACES VC: %@", _placesAndSpyArray);

    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)oKButtonClicked:(id)sender {
    
    if  (_placesAndSpyArray.count == 1) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                          @"Main" bundle:[NSBundle mainBundle]];
             TimerViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"Timer"];

           vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.selectedMinutes = _selectedMinutes;
        
           [self presentViewController:vc animated:YES completion:^{}];
        
    }
    
     else {
         [_placesAndSpyArray removeLastObject];
        // NSLog(@"NEW ARRAY: %@", _placesAndSpyArray);
         
           // performSegue(withIdentifier: "toRoleVC", sender: self)
         UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                           @"Main" bundle:[NSBundle mainBundle]];
              SeeTheRoleViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SeeTheRole"];

            vc.placesAndSpyArray = _placesAndSpyArray;
         vc.selectedMinutes = _selectedMinutes;
         vc.modalPresentationStyle = UIModalPresentationFullScreen;
         
            [self presentViewController:vc animated:YES completion:^{}];
        }
    
}


@end
