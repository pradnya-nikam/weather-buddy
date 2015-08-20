//
//  SearchService.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 14/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchService : NSObject
extern NSString * const API_ERROR_NOTIFICATION;
-(NSArray *)search:(NSString *)query;
-(void)getWeatherForCurrentCityWithDelegate:(id)delegate;

@end
