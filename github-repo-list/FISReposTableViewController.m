//
//  FISReposTableViewController.m
//  
//
//  Created by Joe Burgess on 5/5/14.
//
//

#import "FISReposTableViewController.h"
#import "FISReposDataStore.h"
#import "FISGithubRepository.h"

@interface FISReposTableViewController ()

@property (strong, nonatomic) NSArray *repositories;

@end

@implementation FISReposTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.accessibilityIdentifier = @"Repo Table View";
    self.tableView.accessibilityLabel=@"Repo Table View";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [[FISReposDataStore sharedDataStore] fetchRepositoriesWithCompletion:^(BOOL success) {
        FISReposDataStore *dataStore = [FISReposDataStore sharedDataStore];
        NSLog(@"Number of repos: %lu", [FISReposDataStore sharedDataStore].repositories.count);
        
        self.repositories = dataStore.repositories;
        
        // add to the main thread
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.repositories.count;
    // Return the number of rows in the section.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    FISGithubRepository *repository = self.repositories[indexPath.row];
    cell.textLabel.text = repository.fullName;
    
    return cell;
}

@end
