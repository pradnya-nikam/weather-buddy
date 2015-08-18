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
    // Do any additional setup after loading the view, typically from a nib.

    _searchService = [SearchService new];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.tableView.tableHeaderView = _searchController.searchBar;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    [self.searchController.searchBar sizeToFit];
    [self.searchController.searchBar setPlaceholder:@"search for cities to view weather"];
    self.searchController.searchBar.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.searchResults) {
        self.searchResults = [[NSMutableArray alloc] init];
    }
    [self.searchResults insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Search Controller
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    //Not doing anything when search updates
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

@end
