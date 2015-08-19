//
//  QueryParser.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 19/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueryParser : NSObject
- (NSArray *)parseSearchQuery:(NSString *)query;
@end
