//
//  AIZViewController.m
//  Cells
//
//  Created by X on 26/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZViewController.h"
#import "AIZCustomTableViewCell.h"

static NSString *TableViewCellIdentifier = @"SimpleTableIdentifier";

@interface AIZViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *computers;

@end

@implementation AIZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addMyTableView];

    self.computers = @[@{@"Name" : @"MacBook Air", @"Color" : @"Silver"},
                       @{@"Name" : @"MacBook Pro", @"Color" : @"Silver"},
                       @{@"Name" : @"iMac", @"Color" : @"Silver"},
                       @{@"Name" : @"Mac Mini", @"Color" : @"Silver"},
                       @{@"Name" : @"Mac Pro", @"Color" : @"Black"}];
}

- (void) addMyTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                  style:UITableViewStylePlain];

    [self.tableView registerClass:[AIZCustomTableViewCell class]
           forCellReuseIdentifier:TableViewCellIdentifier];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self.view addSubview:self.tableView];

    UIEdgeInsets contentInset = self.tableView.contentInset;
    contentInset.top = 20;
    [self.tableView setContentInset:contentInset];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AIZCustomTableViewCell *cell = nil;

    cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                                           forIndexPath:indexPath];

    NSDictionary *rowData = self.computers[indexPath.row];

    cell.name  = rowData[@"Name"];
    cell.color = rowData[@"Color"];
    
    return cell;
}

@end
