//
//  CppNamespace.hpp
//  confuse_test
//
//  Created by yjs on 2020/11/12.
//  Copyright © 2020 coding520. All rights reserved.
//

#ifndef CppNamespace_hpp
#define CppNamespace_hpp

#include <stdio.h>
#include <iostream>
// 使用std命名空间下的变量
using namespace std;

int a = 5;

namespace A {
    int a = 10;
    class classA {};
    // 命名空间支持嵌套定义
    namespace B {
        class classB {
            void func();
        };
        int a = 15;
        int b = 20;
    }  // namespace B
    class classB : B::classB {
        void func();
    };
    // 命名空间可以重复定义，相当于扩充
    namespace B {
        int x = 30;
        int y = 35;
    }  // namespace B
}  // namespace A

namespace C {
    int a = 25;
    // 错误，命名空间不能嵌套声明
    //    namespace D;
}  // namespace C

#endif /* CppNamespace_hpp */
