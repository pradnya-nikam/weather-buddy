//
//  WeatherAPI.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 19/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIResponse.h"

@interface WeatherAPI : NSObject
-(APIResponse *) searchForCity:(NSString *)city;
@end
