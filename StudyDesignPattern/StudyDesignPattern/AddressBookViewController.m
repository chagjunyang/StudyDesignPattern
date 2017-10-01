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


@interface AddressBookViewController () <UITableViewDelegate, UITableViewDataSource>

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
    NSMutableArray *mutableAddressBookItems = [NSMutableArray new];
    
    [mutableAddressBookItems addObject:[self addressBookItem1]];
    [mutableAddressBookItems addObject:[self addressBookItem2]];
    
    _addressBookItems = [NSArray arrayWithArray:mutableAddressBookItems];
}


- (AddressBookItem *)addressBookItem1
{
    AddressBookItem *item = [AddressBookItem new];
    
    [item initWithJSONObject:@{@"name" : @"홍길동",
                               @"address" : @"경기도 성남시",
                               @"phoneNumber" : @"01012341111"
                               }];
    return item;
}


- (AddressBookItem *)addressBookItem2
{
    AddressBookItem *item = [AddressBookItem new];
    
    [item initWithJSONObject:@{@"name" : @"김하늘",
                               @"address" : @"경기도 성남시"
                               }];
    return item;
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
    
    NSString *sNameLabelText = item.name;
    
    if([item.phoneNumber length])
    {
        sNameLabelText = [sNameLabelText stringByAppendingString:[NSString stringWithFormat:@" (%@)", item.phoneNumber]];
    }
    
    [cell.nameLabel setText:sNameLabelText];
    [cell.addressLabel setText:item.address];
    [cell.callButton addTarget:self action:@selector(tappedCallButton:) forControlEvents:UIControlEventTouchUpInside];
    [cell.callButton setTag:indexPath.row];
    [cell.callButton setHidden:![item.phoneNumber length]];
}


- (void)tappedCallButton:(UIButton *)aSender
{
    AddressBookItem *item = [self.addressBookItems objectAtIndex:aSender.tag];

    NSURL *phoneUrl = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@", item.phoneNumber]];
    
    [[UIApplication sharedApplication] openURL:phoneUrl options:@{} completionHandler:^(BOOL success) {
        if(!success)
        {
            //showAlert
        }
    }];
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


@end
