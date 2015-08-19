//
//  WeatherAPI.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 19/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "WeatherAPI.h"

NSString * const API_SEARCH_URL = @"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=14&units=metric&APPID=f4e5d60cb525957507b32ef0f683889e";

@implementation WeatherAPI
-(APIResponse *) searchForCity:(NSString *)city{
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:API_SEARCH_URL,city]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30.0];
    
    NSURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    if(data){
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        return [APIResponse withJSON:json];
    }
    return nil;
}
@end
