//
//  SideMenuViewController.m
//  MapLocationApp
//
//  Created by venkatagovardhan on 1/23/18.
//  Copyright © 2018 venkatagovardhan. All rights reserved.
//

#import "SideMenuViewController.h"

@interface SideMenuViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileimage;

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
_profileimage.layer.cornerRadius=_profileimage.frame.size.height/2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
