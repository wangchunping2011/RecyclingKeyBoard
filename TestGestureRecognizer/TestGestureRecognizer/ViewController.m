//
//  ViewController.m
//  TestGestureRecognizer
//
//  Created by 王春平 on 16/3/3.
//  Copyright © 2016年 wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *firstTf;
@property (weak, nonatomic) IBOutlet UITextField *secondTf;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgViewHeightConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.bgViewHeightConstraint.constant = CGRectGetHeight(self.view.frame) + 100;
}

- (IBAction)btnAction:(UIButton *)sender {
    NSLog(@"登录");
}

- (IBAction)handleTapGestureRecognizer:(UITapGestureRecognizer *)sender {
    /**
     *  方法一：
     //取消第一相应，回收键盘
     [self.firstTf resignFirstResponder];
     [self.secondTf resignFirstResponder];
     */
    
    /**
        方法二：
     *  若当前视图及其子视图上有多个textField，可直接调用方法endEditing：来取消第一响应
     */
    [self.view endEditing:YES];
    self.scrollView.scrollEnabled = NO;
    self.scrollView.contentOffset = CGPointZero;
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.scrollView.scrollEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if ([self isViewLoaded] && self.view.window) {
        self.view = nil;
    }
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
