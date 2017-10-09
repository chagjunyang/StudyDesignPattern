//
//  AddressBookViewController.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 9. 30..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "AddressBookViewController.h"
#import "AddressBookItem.h"
#import "AddressBookTableViewCell.h"


@interface AddressBookViewController () <UITableViewDelegate, UITableViewDataSource, AddressBookTableViewCellDelegate>


@property (strong, nonatomic, readonly) UITableView *tableView;
@property (strong, nonatomic, readonly) NSArray <AddressBookItem *> *addressBookItems;


@end


@implementation AddressBookViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self fetchAddressItemsWithCompletionBlock:^{
        [self.tableView reloadData];
    }];
}


#pragma mark - API


- (void)fetchAddressItemsWithCompletionBlock:(dispatch_block_t)aCompletion
{
    NSMutableArray<AddressBookItem *> *addressBookItems = [NSMutableArray new];
    NSArray<NSDictionary *> *addressBookJSONArray = [self objectForJSONFileName:@"addressBook"];
    
    for(NSDictionary *addressBookJSONDict in addressBookJSONArray)
    {
        [addressBookItems addObject:[[AddressBookItem alloc] initWithJSONObject:addressBookJSONDict]];
    }
    
    _addressBookItems = [NSArray arrayWithArray:addressBookItems];
}


- (id)objectForJSONFileName:(NSString *)aFileName
{
    NSString *sPath = [[NSBundle mainBundle] pathForResource:aFileName ofType:@"json"];
    NSData   *sData = [NSData dataWithContentsOfFile:sPath];
    
    return [NSJSONSerialization JSONObjectWithData:sData options:kNilOptions error:nil];
}


#pragma mark - Setup


- (void)setupTableView
{
    Class cellClass = [AddressBookTableViewCell class];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
    
    [self.view addSubview:self.tableView];
}


#pragma markr - UILogic


- (void)bindAddressBookItemToCell:(AddressBookTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    AddressBookItem *item = [self.addressBookItems objectAtIndex:indexPath.row];

    [cell updateCellWithAddressBookItem:item];
    [cell.callButton setTag:indexPath.row];
    [cell setDelegate:self];
}


#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.addressBookItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AddressBookTableViewCell class])];
}


#pragma mark - UITableViewDelegate 


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([cell isKindOfClass:[AddressBookTableViewCell class]])
    {
        [self bindAddressBookItemToCell:(AddressBookTableViewCell *)cell atIndexPath:indexPath];
        [cell sizeToFit];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddressBookTableViewCell *sCell = [AddressBookTableViewCell new];
    
    [self bindAddressBookItemToCell:sCell atIndexPath:indexPath];
    
    return [sCell sizeThatFits:tableView.bounds.size].height;
}


#pragma mark - AddressBookTableViewCellDelegate


- (void)tappedCallButtonAtAddressBookItemCell:(AddressBookTableViewCell *)aCell
{
    AddressBookItem *item = [self.addressBookItems objectAtIndex:aCell.tag];
    
    NSURL *phoneUrl = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@", item.phoneNumber]];
    
    [[UIApplication sharedApplication] openURL:phoneUrl options:@{} completionHandler:^(BOOL success) {
        if(!success)
        {
            //showAlert
        }
    }];
}


@end
