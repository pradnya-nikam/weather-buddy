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
    APIResponse *response = [APIResponse new];
    response.json = json;
    response.code = json[@"cod"];
    if (![response isSuccess]) {
        response.errorMessage = json[@"message"];
    }
    return response;
}
@end
