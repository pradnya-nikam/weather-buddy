//
//  APIError.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 18/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIResponse : NSObject
@property NSString *code;
@property NSString *errorMessage;

+(APIResponse *)withJSON:(NSDictionary *)json;
-(BOOL)isSuccess;
@end
