//
//  QueryParser.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 19/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "QueryParser.h"

@implementation QueryParser

- (NSArray *)parseSearchQuery:(NSString *)query{
    NSMutableArray *searchQueries = [NSMutableArray new];
    if ([query containsString:@","] || [query containsString:@" "]){
        if ([query containsString:@","]) {
            NSArray *splitByComma = [query componentsSeparatedByString:@","];
            if (splitByComma.count>1) {
                for (NSString *component in splitByComma) {
                    if (![component isEqualToString:@""] && ![component isEqualToString:@" "]) {
                        NSString *trimmed = [component stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                        [searchQueries addObject:trimmed];
                    }
                }
            }
        }
        return [searchQueries copy];
    }
    return @[query];
}

@end
