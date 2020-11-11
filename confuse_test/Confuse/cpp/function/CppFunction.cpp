//
//  CppFunction.cpp
//  confuse_test
//
//  Created by yjs on 2020/11/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#include "CppFunction.h"

void CppFunction::privateF1() {
    Function_Log
}
void CppFunction::static_privateF1() {
    Function_Log
}

void CppFunction::protectedF1() {
    Function_Log
}
void CppFunction::static_protectedF1() {
    Function_Log
}

void CppFunction::f1() {
    Function_Log
}
void CppFunction::static_f1() {
    Function_Log
}

void CppFunction::test() {
    CppFunction func;
    func.f1();
    func.f2();
    
    CppFunction funcs[10];
    funcs[0].f1();
    funcs[0].f2();
    
    CppFunction *p_func = &func;
    p_func->f1();
    p_func->f2();
    
    CppFunction *p_new_func = new CppFunction();
    p_new_func->f1();
    p_new_func->f2();
    delete p_new_func;
    
}
