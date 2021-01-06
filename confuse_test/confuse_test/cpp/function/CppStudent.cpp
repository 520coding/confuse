
//
//  CppStudent.cpp
//  ipa
//
//  Created by yjs on 2020/2/6.
//  Copyright © 2020 yjs. All rights reserved.
//

#include "CppStudent.h"

CppStudent::CppStudent() {
    name    = "测试_test_cpp_name";
    m_age   = 0;
    m_score = 0.0;
    Function_Log
}

CppStudent::CppStudent(string name, int age, float score) {
    this->name = name;
    m_age      = age;
    m_score    = score;
    m_total++;
    Function_Log
}
void CppStudent::setname(string name) {
    name = name;
    Function_Log
}
void CppStudent::setage(int age) {
    m_age = age;
    Function_Log
}
void CppStudent::setscore(float score) {
    m_score = score;
    Function_Log
}
string CppStudent::show() {
    string s1(5, '1');
    string s2   = "second ";
    const char*  s3   = "third ";
    char   s4[] = "fourth ";
    char s5[7] = {'R', 'U', 'N', 'O', 'O', 'B', '\0'};
    static string s6 = "static";
    cout << s1 + s2 + s3 + s4 + s5 << endl;
    Function_Log return __FUNCTION__;
}
