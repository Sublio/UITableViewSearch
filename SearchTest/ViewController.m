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
@property (strong, nonatomic) NSMutableArray* sectionsArray;

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
    
    self.sectionsArray = [NSMutableArray array];
    
    
    NSString* currentLetter = nil;
    
    for (NSString* string in self.namesArray){
        
        NSString* firstLetter = [string substringToIndex:1];
        
        DMSection* section = nil;
        
        if (![currentLetter isEqualToString:firstLetter]){
            
            section = [[DMSection alloc] init];
            
            
            section.sectionName = firstLetter;
            
            section.itemsArray = [NSMutableArray array];
            currentLetter = firstLetter;
            [self.sectionsArray addObject:section];
            
        }else{
            
            section = [self.sectionsArray lastObject];
            
        }
        
        [section.itemsArray addObject:string];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource







- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (DMSection* section in self.sectionsArray){
        
        [array addObject:section.sectionName];
    }
    
    return array;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return [self.sectionsArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    
    return [[self.sectionsArray objectAtIndex:section] sectionName];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    DMSection* sec = [self.sectionsArray objectAtIndex:section];
    
    return [sec.itemsArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    DMSection* section = [self.sectionsArray objectAtIndex:indexPath.section];
    
    NSString* name = [section.itemsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = name;
    
    return cell;
}

@end
