//
//  DetailViewController.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 14/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "CityWeatherDetailViewController.h"
#import "WeatherDayTableCell.h"
#import "Weather.h"

@interface CityWeatherDetailViewController ()

@end

@implementation CityWeatherDetailViewController

#pragma mark - Managing the detail item

- (void)setCity:(id)city {
    if (_city != city) {
        _city = city;
        [self configureView];
    }
}

- (void)configureView {
    if (self.city) {
        [self.navigationItem setTitle:_city.name];
        [self.weatherDayTableView setDataSource:self];
        [self.weatherDayTableView setDelegate:self];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

#pragma UITableViewDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _city.weather.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeatherDayTableCell *weatherCell = [tableView dequeueReusableCellWithIdentifier:[WeatherDayTableCell getIdentifier] forIndexPath:indexPath];
    Weather *weather = _city.weather[indexPath.row];
    [weatherCell populateWithWeather:weather];
    return weatherCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
@end
