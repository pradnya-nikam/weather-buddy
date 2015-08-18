//
//  SearchService.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 14/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "SearchService.h"
#import "City.h"

NSString * const JSON_URL = @"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=14&APPID=f4e5d60cb525957507b32ef0f683889e";

@implementation SearchService
-(NSArray *)search:(NSString *)query{
    return [self sendSearchRequestForCity:query];
}


- (NSArray *) sendSearchRequestForCity:(NSString *)city{
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:JSON_URL,city]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30.0];
    
    NSURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    if(data){
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        City *city = [City cityWithJSON:json];
        return @[city];
    }
    return nil;
}
@end
