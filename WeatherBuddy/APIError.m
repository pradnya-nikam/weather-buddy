//
//  APIError.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 18/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "APIError.h"

@implementation APIError
+(APIError *)errorFromJSON:(NSDictionary *)json{
    if (json[@"cod"]) {
        APIError *apiError = [APIError new];
        apiError.code = json[@"cod"];
        apiError.message = json[@"message"];
        return apiError;
    }
    return nil;
}
@end
