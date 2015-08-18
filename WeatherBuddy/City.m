//
//  City.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 17/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "City.h"
#import "Weather.h"

@implementation City
+ (City *) cityWithJSON:(NSDictionary *)json{
    City *city = [City new];
    NSString *name = [json valueForKeyPath:@"city.name"];
    NSString *country = [json valueForKeyPath:@"city.country"];
    city.name = [NSString stringWithFormat:@"%@, %@",name,country];
    
    city.weather = [NSMutableArray new];
    NSArray *weatherJSONArray = json[@"list"];
    for (NSDictionary *weatherJSON in weatherJSONArray) {
        [city.weather addObject:[Weather weatherWithJSON:weatherJSON]];
    }
    return city;
}
@end
