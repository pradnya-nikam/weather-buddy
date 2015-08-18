//
//  Weather.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 17/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "Weather.h"

@implementation Weather
+(Weather *)weatherWithJSON:(NSDictionary *)json{
    Weather *weather = [Weather new];
    
    weather.pressure = json[@"pressure"];
    weather.windSpeed = json[@"speed"];
    weather.clouds = json[@"clouds"];
    weather.date = json[@"dt"];

    weather.weatherDescription = [json valueForKeyPath:@"weather.description"][0];
    weather.iconName = [json valueForKeyPath:@"weather.icon"][0];
    weather.temp = [Temperature temperatureWithJSON:json[@"temp"]];
    
    return weather;
}
@end
