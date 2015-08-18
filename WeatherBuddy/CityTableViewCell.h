//
//  CityTableViewCell.h
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 17/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import <UIKit/UIKit.h>
@class City;

@interface CityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak, nonatomic) IBOutlet UILabel *tempRange;
@property (weak, nonatomic) IBOutlet UILabel *weatherDesc;

-(void) populateWithCity:(City *)city;

@end
