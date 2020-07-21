//
//  SeeTheRoleViewController.h
//  Impostor Objective C
//
//  Created by Mykola Sereda on 20.07.2020.
//  Copyright © 2020 Mykola Sereda. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SeeTheRoleViewController : UIViewController
@property (nonatomic, strong) NSMutableArray *placesAndSpyArray;

- (IBAction)nextButtonClicked:(id)sender;



@end

NS_ASSUME_NONNULL_END
