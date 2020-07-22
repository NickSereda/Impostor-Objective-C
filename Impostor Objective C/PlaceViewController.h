//
//  PlaceViewController.h
//  Impostor Objective C
//
//  Created by Mykola Sereda on 20.07.2020.
//  Copyright © 2020 Mykola Sereda. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlaceViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *placeOrSpyLabel;

@property (assign) int *selectedMinutes;
@property (nonatomic, strong) NSMutableArray *placesAndSpyArray;

- (IBAction)oKButtonClicked:(id)sender;


@end

NS_ASSUME_NONNULL_END
