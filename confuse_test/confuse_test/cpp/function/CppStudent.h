//
//  CppStudent.h
//  ipa
//
//  Created by yjs on 2020/2/6.
//  Copyright © 2020 yjs. All rights reserved.
//

#ifndef CppStudent_h
#define CppStudent_h

#include "CppHeader.h"

class CppStudent {
private:
    string name;
    int m_age;
    float m_score;
public:
    CppStudent();
    CppStudent(string name, int age, float score);
    void setname(string name);
    void setage(int age);
    void setscore(float score);
    string show();
    void say() {
        cout << "" << endl;
    }
public:
    static int m_total;
};

#endif /* CppStudent_h */
