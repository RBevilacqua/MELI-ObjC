//
//  BaseNavigationController.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 24/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configNavigation];
}

- (void)configNavigation {
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self.navigationBar setTitleTextAttributes:[
                                                NSDictionary dictionaryWithObjectsAndKeys:
                                                [UIColor whiteColor], NSForegroundColorAttributeName, nil]
     ];
    
    UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleLightContent;
    [self.navigationBar setTranslucent:YES];
    
    [Appearance setNavigationBarWithColor:[UIColor colorWithRed:33/255.f green:191/255.f blue:233/255.f alpha:1.0] navigationBar:self.navigationBar];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
