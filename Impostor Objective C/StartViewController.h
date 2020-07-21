//
//  ViewController.h
//  Impostor Objective C
//
//  Created by Mykola Sereda on 20.07.2020.
//  Copyright © 2020 Mykola Sereda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *playersValue;
@property (weak, nonatomic) IBOutlet UILabel *minutesValue;


@property (weak, nonatomic) IBOutlet UIStepper *playersStepper;
- (IBAction)playersStepperClicked:(id)sender;


@property (weak, nonatomic) IBOutlet UIStepper *minutesStepper;
- (IBAction)minutesStepperClicked:(id)sender;

-(void)startGame;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startButtonTapped:(id)sender;


@end

