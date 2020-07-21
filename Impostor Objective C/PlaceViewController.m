//
//  PlaceViewController.m
//  Impostor Objective C
//
//  Created by Mykola Sereda on 20.07.2020.
//  Copyright © 2020 Mykola Sereda. All rights reserved.
//

#import "PlaceViewController.h"

@interface PlaceViewController ()

@end

@implementation PlaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
[super viewWillAppear:YES];

    NSLog(@"IN PLACES VC: %@", _placesAndSpyArray);
    
    
    if  (_placesAndSpyArray.count == 1) {
        
        // performSegue(withIdentifier: "toTimerVC", sender: self)
        
    }
    
     else {
         [_placesAndSpyArray removeLastObject];
         
         NSLog(@"NEW ARRAY: %@", _placesAndSpyArray);
         
           // performSegue(withIdentifier: "toRoleVC", sender: self)
        }
    
    
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
}


@end
