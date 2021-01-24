
//
//  CppFunction.h
//  confuse_test
//
//  Created by yjs on 2020/11/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#ifndef CppFunction_h
#define CppFunction_h

#include "CppBase.h"

class CppFunction {
private:
    char* m_name;
    void  private_f1();
    void  private_f2() {
        Function_Log
    }

    static void static_private_f1();
    static void static_private_f2() {
        Function_Log
    }

protected:
    void        protectedF1();
    static void static_protected_f1();

public:
    typedef int         INT;
    typedef char const* PCHAR;
    void                functionChar(PCHAR str);
    void                swap1(int a, int b);
    void                swap2(int* p1, int* p2);
    void                swap3(int& r1, int& r2);
    void                f1();
    void                f2() {
        private_f1();
        private_f2();
    }

    int&         f3(int& a);
    virtual void f4();

    static void static_f1();
    static void static_f2() {
        static_private_f1();
        static_private_f2();
    }

    char* getname() const;

    static void test();
};

class CppFunction2 {
public:
    void        f1();
    static void static_f1();

    static void test();
};

class CppFunction3 : CppBase {
public:
    void f1();
    void sf1();

    static void test();
};

class CppFunction4 : CppBase {
public:
    void sf1();
    void sf1(int);

    static void test();
};

class CppFunction5 : CppBase {
public:
    void        sf1(double);
    int         sf1(int, double);
    static void test();
};

namespace custom {
    class CppFunction5 : CppBase {
    public:
        void        sf1(double);
        int         sf1(int, double);
        static void test();
    };
}  // namespace custom

class CppFunction6 : string {
public:
    void        f1(double);
    int         f1(int, double);
    static void test();
};

#endif /* CppFunction_h */
