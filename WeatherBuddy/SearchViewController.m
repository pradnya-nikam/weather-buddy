//
//  MasterViewController.m
//  WeatherBuddy
//
//  Created by Pradnya Nikam on 14/08/15.
//  Copyright (c) 2015 prad. All rights reserved.
//

#import "SearchViewController.h"
#import "CityWeatherDetailViewController.h"
#import "SearchService.h"
#import "City.h"
#import "Weather.h"
#import "CityTableViewCell.h"

NSString * const DEFAULT_ERROR_MESSAGE = @"Sorry! Unknown error occured. Please try again.";

@interface SearchViewController () <UISearchResultsUpdating, UISearchBarDelegate>
@property (nonatomic, strong) UISearchController *searchController;
@property (strong,nonatomic) NSMutableArray *searchResults;
@property SearchService *searchService;
@end

@implementation SearchViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _searchService = [SearchService new];
    [self setUpSearchController];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleAPIError:) name:API_ERROR_NOTIFICATION object:nil];

}
-(void)setUpSearchController{
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    self.tableView.tableHeaderView = _searchController.searchBar;
    self.tableView.tableHeaderView = _searchController.searchBar;
    self.definesPresentationContext = YES;
    [_searchController.searchBar sizeToFit];
    [_searchController.searchBar setPlaceholder:@"search for cities to view weather"];
    _searchController.searchBar.delegate = self;
}


#pragma mark - Search Controller
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    //Not doing anything on search update
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSArray *search = [self.searchService search:searchBar.text];
    _searchResults = [NSMutableArray arrayWithArray:search];
    [self.tableView reloadData];
    
    [searchBar setShowsCancelButton:NO animated:YES];
    [_searchController setActive:NO];
    [searchBar resignFirstResponder];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityTableViewCell *cityCell = [tableView dequeueReusableCellWithIdentifier:[CityTableViewCell getIdentifier] forIndexPath:indexPath];
    City *city = self.searchResults[indexPath.row];
    [cityCell populateWithCity:city];
    return cityCell;
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        City *city = self.searchResults[indexPath.row];
        [[segue destinationViewController] setCity:city];
    }
}

#pragma API Error Handling 

-(void) handleAPIError:(NSNotification *)notification{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                message:[self getMessageFromUserInfo:notification.userInfo]
                delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

-(NSString *) getMessageFromUserInfo:(NSDictionary *)userInfo{
    NSString *apiError;
    if(userInfo){
        apiError = userInfo[@"errorMessage"];
        if(apiError)
            return apiError;
    }
    return DEFAULT_ERROR_MESSAGE;
}

@end
