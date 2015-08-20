//
//  ReceivingWeatherByLocation.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 20/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ReceivingWeatherByLocation <NSObject>
-(void)weatherForCurrentLocation:(City*)city;
@end
