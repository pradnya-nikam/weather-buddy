//
//  Temparature.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 17/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "Temperature.h"

@implementation Temperature
+(Temperature *)temperatureWithJSON:(NSDictionary *)json{
    Temperature *temp = [Temperature new];
    temp.max = json[@"max"];
    temp.min = json[@"min"];
    return temp;
}
@end
