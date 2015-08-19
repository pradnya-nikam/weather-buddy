//
//  APIError.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 18/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "APIResponse.h"

@implementation APIResponse

-(BOOL)isSuccess{
    return [self.code isEqualToString:@"200"];
}

+(APIResponse *)withJSON:(NSDictionary *)json{
    APIResponse *apiError = [APIResponse new];
    apiError.code = json[@"cod"];
    if (![apiError isSuccess]) {
        apiError.errorMessage = json[@"message"];
    }
    return apiError;
}
@end
