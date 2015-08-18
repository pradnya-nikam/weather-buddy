//
//  WeatherDayTableCell.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 18/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "WeatherDayTableCell.h"
#import "Weather.h"
#import "ImageUtil.h"

NSString * const DATE_FORMAT=@"dd MMM";

@implementation WeatherDayTableCell

- (void)awakeFromNib {
    // Initialization code
}
+ (NSString *)getIdentifier{
    return @"weather-detail-cell";
}

-(void)populateWithWeather:(Weather *)weather{
    _maxTemp.text = [NSString stringWithFormat:@"%g°C" ,weather.temp.max.floatValue];
    _minTemp.text = [NSString stringWithFormat:@"%g°C" ,weather.temp.min.floatValue];
    _cloudAndPressure.text = [NSString stringWithFormat:@"clouds: %@\%%, %g hpa" ,weather.clouds,weather.pressure.floatValue];
    _weatherDescription.text = weather.weatherDescription;
    _wind.text = [NSString stringWithFormat:@"%@ m/s" ,weather.windSpeed];
    
    NSDate *weatherDate = [[NSDate alloc] initWithTimeIntervalSince1970:weather.date.doubleValue];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:DATE_FORMAT];
    _date.text = [dateFormatter stringFromDate:weatherDate];
    [ImageUtil loadImageWithName:weather.iconName inImageView:self.weatherImage];
}

@end
