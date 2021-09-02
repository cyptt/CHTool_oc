//
//  TestViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/27.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "TestViewController.h"
#import "CHSearchViewController.h"
@interface TestViewController ()<UISearchResultsUpdating>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.view.backgroundColor  = [UIColor whiteColor];
    
    
    CHSearchViewController * chsearchVC = [[CHSearchViewController alloc]init];

    UISearchController * search = [[UISearchController alloc]initWithSearchResultsController:nil];
    
    search.searchResultsUpdater = self;
    
    search.searchBar.prompt = @"Please input the country name";
    search.searchBar.placeholder = @"Search for country ...";

    
    search.searchBar.backgroundColor = [UIColor redColor];
    [search.searchBar sizeToFit];
    
    
   
    [self.view addSubview:search.searchBar];
    
  
    
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
}


@end
