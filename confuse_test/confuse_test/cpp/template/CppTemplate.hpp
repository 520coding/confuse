//
//  CppTemplate.hpp
//  confuse_test
//
//  Created by yjs on 2020/12/21.
//  Copyright © 2020 coding520. All rights reserved.
//

#ifndef CppTemplate_hpp
#define CppTemplate_hpp

#include <stdio.h>

#include <iostream>
using namespace std;

template <class T1, class T2> class CFPoint {
public:
    CFPoint(T1 x, T2 y) : m_x(x), m_y(y) {}

public:
    T1 getX() const {
        return m_x;
    }
    void setX(T1 x) {
        m_x = x;
    }
    T2 getY() const {
        return m_y;
    }
    void setY(T2 y) {
        m_y = y;
    }
    void display() const;

private:
    T1 m_x;
    T2 m_y;
};

#endif /* CppTemplate_hpp */
