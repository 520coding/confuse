//
//  CppFunction.hpp
//  confuse_test
//
//  Created by yjs on 2020/11/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#ifndef CppFunction_hpp
#define CppFunction_hpp

#include "CppBase.h"

class CppFunction : CppBase {
private:
    int m_name;
    void privateF1();
    void privateF2() {
        Function_Log
    }
    static void static_privateF1();
    static void static_privateF2() {
        Function_Log
    }
protected:
    void protectedF1();
    void static_protectedF1();
    
public:
    void f1();
    void f2() {
        privateF1();
        privateF2();
    }
    static void static_f1();
    static void static_f2() {
        static_privateF1();
        static_privateF2();
    }
    
    static void test();
};

#endif /* CppFunction_hpp */
