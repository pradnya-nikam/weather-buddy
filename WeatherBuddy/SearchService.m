//
//  SearchService.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 14/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "SearchService.h"
#import "City.h"

NSString * const JSON_URL = @"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=14&units=metric&APPID=f4e5d60cb525957507b32ef0f683889e";

@implementation SearchService
-(NSArray *)search:(NSString *)query{
    NSArray *cityArray = [self parseSearchQuery:query];
    return [self sendSearchRequestForCity:cityArray];
}

- (NSArray *)parseSearchQuery:(NSString *)query{
    
    NSMutableArray *searchQueries = [NSMutableArray new];
    
    if ([query containsString:@","] || [query containsString:@" "]){
        if ([query containsString:@","]) {
            NSArray *splitByComma = [query componentsSeparatedByString:@","];
            if (splitByComma.count>1) {
                for (NSString *component in splitByComma) {
                    if (![component isEqualToString:@""] && ![component isEqualToString:@" "]) {
                        NSString *trimmed = [component stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                        [searchQueries addObject:trimmed];
                    }
                }
            }
        }
        return [searchQueries copy];
    }
    return @[query];
}

- (NSArray *) sendSearchRequestForCity:(NSArray *)cities{
    NSMutableArray *cityWeathers = [NSMutableArray new];
    for (NSString *city in cities) {
        NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:JSON_URL,city]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30.0];
    
        NSURLResponse *response;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        if(data){
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            City *city = [City cityWithJSON:json];
            if (city) {
                [cityWeathers addObject:city];
            }
        }
    }
    return cityWeathers;
}
@end
