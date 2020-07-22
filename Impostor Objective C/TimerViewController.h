//
//  TimerViewController.h
//  Impostor Objective C
//
//  Created by Mykola Sereda on 20.07.2020.
//  Copyright © 2020 Mykola Sereda. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerViewController : UIViewController

- (IBAction)playAgainButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
-(void)onTick:(NSTimer *)timer;
@property (assign) int *selectedMinutes;


@end

NS_ASSUME_NONNULL_END
