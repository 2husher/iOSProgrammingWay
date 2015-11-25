//
//  AIZViewController.m
//  Simple Table
//
//  Created by X on 25/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZViewController.h"
#import "AIZCustomTableViewCell.h"

static NSString *TableViewCellIdentifier = @"SimpleTableIdentifier";

@interface AIZViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (copy, nonatomic) NSArray *dwarves;

@end

@implementation AIZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addMyTableView];

    self.dwarves = @[@"Sleepy", @"Sneezy", @"Bashful", @"Happy",
                     @"Doc", @"Grumpy", @"Dopey",
                     @"Thorin", @"Dorin", @"Nori", @"Ori",
                     @"Balin", @"Dwalin", @"Fili", @"Kili",
                     @"Oin", @"Gloin", @"Bifur", @"Bofur",
                     @"Bombur"];


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
    return [self.dwarves count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;

    cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                                           forIndexPath:indexPath];


    UILabel * textLabel = cell.textLabel;
    textLabel.text = self.dwarves[indexPath.row];
    textLabel.font = [UIFont boldSystemFontOfSize:50.0f];

    UIImage *image = [UIImage imageNamed:@"star"];
    cell.imageView.image = image;

    if (indexPath.row < 7)
    {
        cell.detailTextLabel.text = @"Mr. Disney";
    }
    else
    {
        cell.detailTextLabel.text = @"Mr. Tolkien";
    }

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return nil;
    }
    else
    {
        return indexPath;
    }
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rowValue = self.dwarves[indexPath.row];
    NSString *message = [NSString stringWithFormat:@"You selected %@", rowValue];
    UIAlertController *alert =
        [UIAlertController alertControllerWithTitle:@"Row Selected!"
                                            message:message
                                     preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *action =
        [UIAlertAction actionWithTitle:@"Yes, I did."
                                 style:UIAlertActionStyleDefault
                               handler:nil];

    [alert addAction:action];

    [self presentViewController:alert animated:YES completion:nil];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

@end



















