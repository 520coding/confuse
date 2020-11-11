//
//  CppFunctionViewController.m
//  confuse_test
//
//  Created by yjs on 2020/11/5.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "CppFunctionViewController.h"
#include "CppStudent.h"
#include "CppFunction.h"

int CppStudent::m_total = 0;

@interface CppFunctionViewController ()

@end

@implementation CppFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化静态成员变量
}

- (IBAction)test:(id)sender {
    CppFunction::test();
    
    (new CppStudent("小明", 15, 90)) -> show();
    (new CppStudent("李磊", 16, 80)) -> show();
    (new CppStudent("张华", 16, 99)) -> show();
    (new CppStudent("王康", 14, 60)) -> show();
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

