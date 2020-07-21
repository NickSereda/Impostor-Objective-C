//
//  ViewController.m
//  Impostor Objective C
//
//  Created by Mykola Sereda on 20.07.2020.
//  Copyright © 2020 Mykola Sereda. All rights reserved.
//

#import "StartViewController.h"
#import "SeeTheRoleViewController.h"

@interface StartViewController ()

@property (nonatomic, strong) NSArray *minutesArray;
@property (nonatomic, strong) NSArray *playersArray;

@property (nonatomic, strong) NSMutableArray *places;
//@property (nonatomic, strong) NSMutableArray *placesAndSpyArray;

@property (assign) int *selectedMinutesInSeconds;
@property (assign) int *selectedPlayers;

@end

@implementation StartViewController

NSString *chosenPlace;
NSMutableArray *placesAndSpyArray;
int count;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.minutesArray = [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5], nil];
    self.playersArray = [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5],[NSNumber numberWithInt:6],[NSNumber numberWithInt:7], nil];
    


}

-(void)viewWillAppear:(BOOL)animated {
     [super viewWillAppear:YES];
    
    self.selectedMinutesInSeconds = 1 * 60;
    self.selectedPlayers = 3;
    
   // [placesAndSpyArray removeAllObjects];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Placestxt" withExtension:@"txt"];
    
   NSString* content = [
    NSString stringWithContentsOfFile:url
    encoding:NSUTF8StringEncoding
    error:NULL
    ];
    
    _places = [content componentsSeparatedByString:@"\n"];
    
   // NSLog(@"%@",_places);
    
}


-(void)startGame {
    
    uint32_t rnd = arc4random_uniform([_places count]);
    
  //  [placesAndSpyArray removeAllObjects];
    
    chosenPlace = [_places objectAtIndex:rnd];
    
//    [placesAndSpyArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        <#code#>
//    }];

    
    if (_selectedPlayers == 3) {
       placesAndSpyArray = [NSMutableArray arrayWithObjects:
       chosenPlace, chosenPlace, @"You Are The Spy!", nil];
    }
    else if (_selectedPlayers == 4) {
        placesAndSpyArray = [NSMutableArray arrayWithObjects: chosenPlace, chosenPlace, chosenPlace,@"You Are The Spy!", nil];
    }
    else if (_selectedPlayers == 5) {
        placesAndSpyArray = [NSMutableArray arrayWithObjects:
        chosenPlace, chosenPlace,chosenPlace, chosenPlace, @"You Are The Spy!", nil];
    }
    else if (_selectedPlayers == 6) {
        placesAndSpyArray = [NSMutableArray arrayWithObjects:
        chosenPlace, chosenPlace,chosenPlace, chosenPlace, chosenPlace, @"You Are The Spy!", nil];
    }
    else if (_selectedPlayers == 7) {
        placesAndSpyArray = [NSMutableArray arrayWithObjects:
        chosenPlace, chosenPlace,chosenPlace, chosenPlace,chosenPlace,chosenPlace, @"You Are The Spy!", nil];
    }
    
    NSLog (@"Number of elements in array = %lu", [placesAndSpyArray count]);

    //shuffling array
    NSUInteger count = [placesAndSpyArray count];
    for (NSUInteger i = 0; i < count; ++i) {
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [placesAndSpyArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    NSLog(@"%@", placesAndSpyArray);
    
}

-(IBAction)startButtonTapped:(id)sender {
    
    [self startGame];
    
    
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                   @"Main" bundle:[NSBundle mainBundle]];
      SeeTheRoleViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SeeTheRole"];

    vc.placesAndSpyArray = placesAndSpyArray;
 
    [self presentViewController:vc animated:YES completion:^{}];
   
}



- (IBAction)playersStepperClicked:(id)sender {
    
    int valueInt = (int) _playersStepper.value;
    
    _selectedPlayers = (int) _playersStepper.value;
    
    self.playersValue.text = [ NSString stringWithFormat:@"%d", valueInt];
    
}
- (IBAction)minutesStepperClicked:(id)sender {
   
    int valueInt = (int) _minutesStepper.value;
    
    _selectedMinutesInSeconds = (int) _minutesStepper.value * 60;
    
    self.minutesValue.text = [ NSString stringWithFormat:@"0%d : 00", valueInt];
      
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Make sure your segue name in storyboard is the same as this line
//    if ([[segue identifier] isEqualToString:@"toSeeTheRoleVC"])
//    {
//        // Get reference to the destination view controller
//        SeeTheRoleViewController *vc = [segue destinationViewController];
//
//        // Pass any objects to the view controller here, like...
//        [vc placesAndSpyArray : placesAndSpyArray];
//    }
//}

@end
