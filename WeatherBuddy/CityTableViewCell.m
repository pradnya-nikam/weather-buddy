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

NSString * const IMAGE_URL=@"http://openweathermap.org/img/w/%@.png";
@implementation CityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)populateWithCity:(City *)city{
    
    Weather *latestWeather = city.weather[0];
    [self.weatherDesc setText:latestWeather.weatherDescription];
    [self.city setText:city.name];
    [self.tempRange setText:[NSString stringWithFormat:@"%@ - %@°C",latestWeather.temp.min,latestWeather.temp.max]];
    [self loadImageWithName:latestWeather.iconName];
    
}
-(void)loadImageWithName:(NSString *)name {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *imageUrl = [NSString stringWithFormat:IMAGE_URL,name];
                             
        NSData *imageFromNetwork = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        
        if(imageFromNetwork)
            self.weatherImage.image = [UIImage imageWithData:imageFromNetwork];
    });
}
                   
@end
