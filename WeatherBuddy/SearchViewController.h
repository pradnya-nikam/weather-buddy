//
//  MasterViewController.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 14/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIView *footerView;
- (IBAction)updateWeatherForCurrentLocation:(id)sender;
@end

