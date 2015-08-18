//
//  WeatherDayTableCell.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 18/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Weather;

@interface WeatherDayTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak, nonatomic) IBOutlet UILabel *maxTemp;
@property (weak, nonatomic) IBOutlet UILabel *minTemp;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescription;
@property (weak, nonatomic) IBOutlet UILabel *wind;
@property (weak, nonatomic) IBOutlet UILabel *cloudAndPressure;

-(void)populateWithWeather:(Weather *)weather;
+ (NSString *)getIdentifier;
@end
