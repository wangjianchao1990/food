//
//  ReviseViewController.m
//  food
//
//  Created by 王楠 on 16/5/22.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ReviseViewController.h"
#import "RubberController.h"
#import "PooRubberTouchViewController.h"

@interface ReviseViewController ()


@end

@implementation ReviseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.imageView setFrame:self.view.bounds];
    
    NSLog(@"%@",_str);
    
    NSLog(@"viewDidLoad  ____  %@",self.image);
    
    self.imageView.image = self.image;

    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.imageView.image=self.image;
//    self.imageView.hidden = NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushToRubber:(UIButton *)sender
{
    PooRubberTouchViewController * rubber = [[PooRubberTouchViewController alloc] init];
    
    rubber.image = self.image;
    
    [self.navigationController pushViewController:rubber animated:YES];
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
