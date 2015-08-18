//
//  DetailViewController.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 14/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
@interface CityWeatherDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *weatherDayTableView;

@property (strong, nonatomic) City *city;

@end

