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
#import <CoreLocation/CoreLocation.h>
#import "ReceivingWeatherByLocation.h"

NSString * const API_ERROR_NOTIFICATION = @"API_ERROR_NOTIFICATION";

@interface SearchService() <CLLocationManagerDelegate>
@property QueryParser *queryParser;
@property WeatherAPI *weatherAPI;
@property CLLocationManager *locationManager;
@property(weak) id<ReceivingWeatherByLocation> weatherRecieverDelegate;
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
#pragma Search by city

-(NSArray *)search:(NSString *)query{
    NSArray *cityArray = [_queryParser parseSearchQuery:query];
    if (cityArray.count) {
        return [self searchForCities:cityArray];
    }else
        return @[];
}

- (NSArray *) searchForCities:(NSArray *)cities{
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
    NSDictionary *errorInfo=nil;
    if(response){
        NSString *errorMessage = [NSString stringWithFormat:@"%@ for search : %@", response.errorMessage, query];
        errorInfo = @{@"errorMessage":errorMessage};
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:API_ERROR_NOTIFICATION object:self userInfo:errorInfo];
}

#pragma Search by location

-(void)getWeatherForCurrentCityWithDelegate:(id)delegate{
    self.weatherRecieverDelegate = delegate;
    if (!_locationManager)
        _locationManager = [[CLLocationManager alloc] init];

    _locationManager.delegate = self;
    _locationManager.distanceFilter = 1000.0;
    // check for iOS 8
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }
    [_locationManager startUpdatingLocation];
}

-(void) searchByLocation:(CLLocation *)location{
    APIResponse *response = [_weatherAPI searchForLocation:location];
    if ([response isSuccess]) {
        City *city = [City cityWithJSON:response.json];
        if (city)
            [_weatherRecieverDelegate weatherForCurrentLocation:city];
    }else{
        [self handleErrorForResponse:response andQuery:nil];
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {

    CLLocation* location = [locations lastObject];
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              location.coordinate.latitude,
              location.coordinate.longitude);
    [self searchByLocation:location];
    [_locationManager stopUpdatingLocation];
}
@end
