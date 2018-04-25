//
//  BaseViewController.m
//  PruebaMELI
//
//  Created by Robert Bevilacqua on 20/4/18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    
    NSUInteger count = [[self.navigationController viewControllers] count];
    if (count > 1 && self.navigationItem.leftBarButtonItem == nil) {
        if (!(self.navigationController.viewControllers.firstObject == self)) {
            UIBarButtonItem * leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backImage"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
            [self.navigationItem setLeftBarButtonItem:leftBarButtonItem];
            [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
            
        } else {
        }
    }
    
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configureTitleWithName:(NSString *)name {
    [self setTitle:name];
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
