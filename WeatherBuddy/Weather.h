//
//  Weather.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 17/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Temperature.h"

@interface Weather : NSObject
@property NSNumber *date;
@property Temperature *temp;
@property NSString *iconName;
@property NSString *weatherDescription;
@property NSNumber *clouds;
@property NSNumber *humidity;
@property NSNumber *pressure;

+(Weather *)weatherWithJSON:(NSDictionary *)json;
@end
