//
//  City.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 17/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Weather;

@interface City : NSObject
@property NSString *name;
@property NSMutableArray *weather;

-(Weather *)getLatestWeather;
+ (City *) cityWithJSON:(NSDictionary *)json;
@end
