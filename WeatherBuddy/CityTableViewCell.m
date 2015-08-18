//
//  CityTableViewCell.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 17/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "CityTableViewCell.h"
#import "City.h"
#import "Weather.h"
#import "ImageUtil.h"

@implementation CityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+ (NSString *)getIdentifier{
    return @"city-cell";
}

-(void)populateWithCity:(City *)city{
    
    Weather *latestWeather = city.weather[0];
    [self.weatherDesc setText:latestWeather.weatherDescription];
    [self.city setText:city.name];
    [self.tempRange setText:[NSString stringWithFormat:@"%@ - %@°C",latestWeather.temp.min,latestWeather.temp.max]];
    [ImageUtil loadImageWithName:latestWeather.iconName inImageView:self.weatherImage];
    
}
                   
@end
