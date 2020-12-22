//
//  CppViewController.m
//  confuse_test
//
//  Created by yjs on 2020/11/5.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "CppViewController.h"
#include "CppStudent.h"
#include "CppFunction.h"
#include "CppNamespace.hpp"
#include "CppClass.hpp"

int CppStudent::m_total = 0;

@interface CppViewController ()

@end

@implementation CppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化静态成员变量
}

- (IBAction)test:(id)sender
{
    [self testNamespace];
    [self testFunction];
}

- (void)testNamespace
{
    // 如果不写using namespace std，就必须加前缀std::
    std::cout << "Hello World!" << std::endl;
    cout << endl; // 换行

    cout << "a = " << a << endl;
    cout << "A::a = " << A::a << endl;
    cout << "A::B::a = " << A::B::a << endl;
    cout << "C::a = " << C::a << endl;

    // 错误，提示变量b没有声明
    //    cout << "b = " << b << endl;

    cout << endl;

    // 命名空间取别名
    namespace AB = A::B;
    cout << "AB = A::B" << endl;
    cout << "AB::a = " << AB::a << endl;
    cout << "AB::b = " << AB::b << endl;

    cout << endl;

    // 后面的代码使用A::B命名空间下的变量
    using namespace A::B;
    cout << "使用A::B命名空间" << endl;
    cout << "b = " << b << endl;
    cout << "x = " << x << endl;
    cout << "y = " << y << endl;
}
- (void)testFunction
{
    CppFunction::test();
    CppFunction2::test();
    CppFunction3::test();
    CppFunction4::test();
    CppFunction5::test();
    custom::CppFunction5::test();

    (new CppStudent("小明", 15, 90))->show();
    (new CppStudent("李磊", 16, 80))->show();
    (new CppStudent("张华", 16, 99))->show();
    (new CppStudent("王康", 14, 60))->show();
}

- (void)testClass {
    CppClass::test();
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
