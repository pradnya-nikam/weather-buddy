//
//  SearchService.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 14/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "SearchService.h"
#import "City.h"
#import "APIResponse.h"
#import "QueryParser.h"
#import "WeatherAPI.h"

NSString * const API_ERROR_NOTIFICATION = @"API_ERROR_NOTIFICATION";

@interface SearchService()
@property QueryParser *queryParser;
@property WeatherAPI *weatherAPI;
@end


@implementation SearchService


- (instancetype)init
{
    self = [super init];
    if (self) {
        _queryParser = [QueryParser new];
        _weatherAPI = [WeatherAPI new];
    }
    return self;
}

-(NSArray *)search:(NSString *)query{
    NSArray *cityArray = [_queryParser parseSearchQuery:query];
    if (cityArray.count) {
        return [self sendSearchRequestForCity:cityArray];
    }else
        return @[];
}

- (NSArray *) sendSearchRequestForCity:(NSArray *)cities{
    NSMutableArray *cityWeathers = [NSMutableArray new];
    for (NSString *city in cities) {
        
        APIResponse *response = [_weatherAPI searchForCity:city];
        if ([response isSuccess]) {
                City *city = [City cityWithJSON:response.json];
                if (city)
                    [cityWeathers addObject:city];
        }else{
                [self handleErrorForResponse:response andQuery:city];
        }
    }
    return cityWeathers;
}

-(void)handleErrorForResponse:(APIResponse *)response andQuery:(NSString *)query{
    NSString *errorMessage = [NSString stringWithFormat:@"%@ for search : %@", response.errorMessage, query];
    [[NSNotificationCenter defaultCenter] postNotificationName:API_ERROR_NOTIFICATION object:self userInfo:@{@"errorMessage":errorMessage}];
}

@end
