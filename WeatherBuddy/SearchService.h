//
//  SearchService.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 14/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchService : NSObject
-(NSArray *)search:(NSString *)query;

@end
