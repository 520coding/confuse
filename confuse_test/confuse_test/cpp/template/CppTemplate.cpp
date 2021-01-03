//
//  CppTemplate.cpp
//  confuse_test
//
//  Created by yjs on 2020/12/21.
//  Copyright © 2020 coding520. All rights reserved.
//

#include "CppTemplate.hpp"

template <class T1, class T2> void CFPoint<T1, T2>::display() const {
    cout << "x=" << m_x << ", y=" << m_y << endl;
}

template <> class CFPoint<char*, char*> {
public:
    CFPoint(char* x, char* y) : m_x(x), m_y(y) {}

public:
    char* getX() const {
        return m_x;
    }

    void setX(char* x) {
        m_x = x;
    }

    char* getY() const {
        return m_y;
    }

    void setY(char* y) {
        m_y = y;
    }

    void display() const;

private:
    char* m_x;
    char* m_y;
};

void CFPoint<char*, char*>::display() const {
    cout << "x=" << m_x << " | y=" << m_y << endl;
}
