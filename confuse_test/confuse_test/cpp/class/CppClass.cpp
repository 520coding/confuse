//
//  CppClass.cpp
//  confuse_test
//
//  Created by yjs on 2020/12/18.
//  Copyright © 2020 coding520. All rights reserved.
//

#include "CppClass.hpp"

Line::Line( float len ) : m_len( len ) {}

Rec::Rec( float len, float width ) : Line( len ), m_width( width ) {}

float Rec::area() {
    return m_len * m_width;
}

Cuboid::Cuboid( float len, float width, float height ) : Rec( len, width ), m_height( height ) {}

float Cuboid::area() {
    return 2 * ( m_len * m_width + m_len * m_height + m_width * m_height );
}

float Cuboid::volume() {
    return m_len * m_width * m_height;
}

Cube::Cube( float len ) : Cuboid( len, len, len ) {}

float Cube::area() {
    return 6 * m_len * m_len;
}

float Cube::volume() {
    return m_len * m_len * m_len;
}

void CppClass::test() {
    Line* p = new Cuboid( 10, 20, 30 );
    cout << "The area of Cuboid is " << p->area() << endl;
    cout << "The volume of Cuboid is " << p->volume() << endl;

    p = new Cube( 15 );
    cout << "The area of Cube is " << p->area() << endl;
    cout << "The volume of Cube is " << p->volume() << endl;
}
