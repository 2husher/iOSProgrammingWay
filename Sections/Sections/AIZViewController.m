//
//  AIZViewController.m
//  Sections
//
//  Created by X on 26/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZViewController.h"

static NSString *TableViewCellIdentifier = @"SimpleTableIdentifier";

@interface AIZViewController () <UITableViewDataSource,
                                 UITableViewDelegate,
                                 UISearchControllerDelegate,
                                 UISearchResultsUpdating>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSDictionary *names;
@property (nonatomic, copy) NSArray *keys;

@end

@implementation AIZViewController
{
    NSMutableArray *filteredNames;
//    UISearchController *searchController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addMyTableView];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames"
                                                     ofType:@"plist"];
    self.names = [NSDictionary dictionaryWithContentsOfFile:path];
    self.keys  = [[self.names allKeys] sortedArrayUsingSelector:
                  @selector(compare:)];

    [self addSearchController];
}

- (void) addMyTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                  style:UITableViewStylePlain];

    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:TableViewCellIdentifier];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self.view addSubview:self.tableView];

    if (self.tableView.style == UITableViewStylePlain)
    {
        UIEdgeInsets contentInset = self.tableView.contentInset;
        contentInset.top = 20;
        [self.tableView setContentInset:contentInset];

        UIView *barBackground = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 20.0f)];
        barBackground.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.9f];
        [self.view addSubview:barBackground];
    }
}

- (void) addSearchController
{
    filteredNames = [NSMutableArray array];
//    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:
//                              CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 20.0f)];

    UISearchController *searchController =
        [[UISearchController alloc] initWithSearchResultsController:nil];

    searchController.searchResultsUpdater = self;

    searchController.searchBar.scopeButtonTitles = @[@"FFF"];

    searchController.searchBar.delegate = self;

    self.tableView.tableHeaderView = searchController.searchBar;

    self.definesPresentationContext = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return [self.keys count];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSString *key = self.keys[section];
    NSArray *nameSection = self.names[key];
    return [nameSection count];
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return self.keys[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;

    cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                                           forIndexPath:indexPath];

    NSString *key = self.keys[indexPath.section];
    NSArray *nameSection = self.names[key];

    cell.textLabel.text = nameSection[indexPath.row];
    return cell;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.keys;
}

@end



















