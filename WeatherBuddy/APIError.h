//
//  APIError.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 18/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIError : NSObject
@property NSString *code;
@property NSString *message;

+(APIError *)errorFromJSON:(NSDictionary *)json;

@end
