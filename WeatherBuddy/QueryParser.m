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
    NSMutableArray *resultQueryArray= [NSMutableArray new];
    
    NSArray *queriesSplitByComma = [self splitByComma:query];
    for (NSString *component in queriesSplitByComma) {
        [resultQueryArray addObjectsFromArray:[self splitByWhiteSpaces:component]];
    }
    return [resultQueryArray copy];
}

-(NSArray *)splitByComma:(NSString *)query{
    return [self splitQuery:query by:@","];
}

-(NSArray *)splitByWhiteSpaces:(NSString *)query{
   return [self splitQuery:query by:@" "];
}

-(NSArray *)splitQuery:(NSString *)query by:(NSString *)seperator{
    NSMutableArray *splitResult = [NSMutableArray new];
    NSArray *split = [query componentsSeparatedByString:seperator];
    if (split.count>1) {
            for (NSString *component in split) {
                if (![component isEqualToString:@""] && ![component isEqualToString:@" "]) {
                    NSString *trimmed = [component stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    
                    [splitResult addObject:trimmed];
                }
            }
        
    }
    if (splitResult.count>0) {
        return splitResult;
    }else
        return @[query];
}
@end
