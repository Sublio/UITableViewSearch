//
//  ViewController.m
//  SearchTest
//
//  Created by sublio on 24/04/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Random.h"
#import "DMSection.h"

@interface ViewController ()


@property (strong, nonatomic) NSArray* namesArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i<100;i++){
        
        [array addObject:[[NSString randomAlphanumericString]capitalizedString]];
        
    }
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"self" ascending:YES];
    [array sortUsingDescriptors:@[sortDescriptor]];
    
    self.namesArray = array;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [self.namesArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [self.namesArray objectAtIndex:indexPath.row];
    
    return cell;
}

@end
