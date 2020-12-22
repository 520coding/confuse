//
//  CppClass.hpp
//  confuse_test
//
//  Created by yjs on 2020/12/18.
//  Copyright © 2020 coding520. All rights reserved.
//

#ifndef CppClass_hpp
#define CppClass_hpp

#include "CppBase.h"

class Line {
public:
    Line( float len );
    virtual float area()   = 0;
    virtual float volume() = 0;

protected:
    float m_len;
};

class Rec : public Line {
public:
    Rec( float len, float width );
    float area();

protected:
    float m_width;
};

class Cuboid : public Rec {
public:
    Cuboid( float len, float width, float height );
    float area();
    float volume();

protected:
    float m_height;
};

class Cube : public Cuboid {
public:
    Cube( float len );
    float area();
    float volume();
};

class CppClass {
public:
    static void test();
};

#endif /* CppClass_hpp */
