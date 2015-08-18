//
//  ImageUtil.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 18/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "ImageUtil.h"
NSString * const IMAGE_URL=@"http://openweathermap.org/img/w/%@.png";

@implementation ImageUtil
+(void)loadImageWithName:(NSString *)name inImageView:(UIImageView*)imageView {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *imageUrl = [NSString stringWithFormat:IMAGE_URL,name];
        
        NSData *imageFromNetwork = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        
        if(imageFromNetwork)
            imageView.image = [UIImage imageWithData:imageFromNetwork];
    });
}
@end
