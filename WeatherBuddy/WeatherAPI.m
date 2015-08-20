//
//  WeatherAPI.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 19/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "WeatherAPI.h"

NSString * const API_SEARCH_BY_CITY_URL = @"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=14&units=metric&APPID=f4e5d60cb525957507b32ef0f683889e";

NSString * const API_SEARCH_BY_LOCATION_URL = @"http://api.openweathermap.org/data/2.5/forecast/daily?lat=%f&lon=%f&cnt=14&units=metric&APPID=f4e5d60cb525957507b32ef0f683889e";


@implementation WeatherAPI
-(APIResponse *) searchForCity:(NSString *)city{
    NSString *url = [NSString stringWithFormat:API_SEARCH_BY_CITY_URL,city];
    return [self sendRequestToAPIWithURL:url];
}



-(APIResponse *)searchForLocation:(CLLocation *)location{
    NSString *url = [NSString stringWithFormat:API_SEARCH_BY_LOCATION_URL,location.coordinate.latitude,location.coordinate.longitude];
    return [self sendRequestToAPIWithURL:url];
}


-(APIResponse *)sendRequestToAPIWithURL:(NSString *)urlString{
    NSURL *url=[NSURL URLWithString:urlString];
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
