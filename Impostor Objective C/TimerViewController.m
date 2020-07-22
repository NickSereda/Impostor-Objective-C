//
//  TimerViewController.m
//  Impostor Objective C
//
//  Created by Mykola Sereda on 20.07.2020.
//  Copyright © 2020 Mykola Sereda. All rights reserved.
//

#import "TimerViewController.h"
#import "StartViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

NSTimer *timer;

int timeSec = 0;
int timeMin = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
[super viewWillAppear:YES];

    timer = [NSTimer scheduledTimerWithTimeInterval: 1.0
    target: self
    selector:@selector(onTick:)
    userInfo: nil repeats:YES];
    
    [self performSelector:@selector(onTick:) withObject:nil afterDelay:1.0];
    
}

-(void)onTick:(NSTimer *)timer {
    timeSec++;
       if (timeSec == 60)
       {
          timeSec = 0;
          timeMin++;
       }
     //Format the string 00:00
        NSString* timeNow = [NSString stringWithFormat:@"%02d:%02d", timeMin, timeSec];
           
        self.timerLabel.text = timeNow;
    
    if (timeMin == _selectedMinutes) {
        [timer invalidate];
        timeSec = 0;
        timeMin = 0;
        
        self.timerLabel.text = @"Time's up!";
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

- (IBAction)playAgainButtonClicked:(id)sender {
    
    
    [timer invalidate];
       timeSec = 0;
       timeMin = 0;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:
                                         @"Main" bundle:[NSBundle mainBundle]];
            StartViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"Start"];

       vc.modalPresentationStyle = UIModalPresentationFullScreen;
          [self presentViewController:vc animated:YES completion:^{}];
    
    
    
}
@end
