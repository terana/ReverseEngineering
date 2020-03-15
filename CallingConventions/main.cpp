// This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <stdio.h>

extern "C" int __declspec(noinline) __fastcall asm_fastcall(int from, int a, int b, int c, int d);
extern "C" int __declspec(noinline) __fastcall ctest_fastcall(int from, int a, int b, int c, int d)
{
    return from - a - b - c - d;
}

extern "C" int __declspec(noinline) __stdcall asm_stdcall(int from, int a, int b, int c, int d);
extern "C" int __declspec(noinline) __stdcall ctest_stdcall(int from, int a, int b, int c, int d)
{
    return from - a - b - c - d;
}

extern "C" int __declspec(noinline) __cdecl asm_cdecl(int from, int a, int b, int c, int d);
extern "C" int __declspec(noinline) __cdecl ctest_cdecl(int from, int a, int b, int c, int d)
{
    return from - a - b - c - d;
}

int main(int argc, wchar_t* argv[])
{
    int a, b, c, d;
    std::cin >> a >> b >> c >> d;
    int res = ctest_fastcall(10, a, b, c, d);
    printf("result c fastcall = %d \n", res);
    res = ctest_stdcall(10, a, b, c, d);
    printf("result c stdcall = %d \n", res);
    res = ctest_cdecl(10, a, b, c, d);
    printf("result c cdecl = %d \n", res);

    res = asm_fastcall(10, a, b, c, d);
    printf("result asm fastcall = %d \n", res);
    res = asm_stdcall(10, a, b, c, d);
    printf("result asm stdcall = %d \n", res);
    res = asm_cdecl(10, a, b, c, d);
    printf("result asm cdecl = %d \n", res);
    return 0;
}


// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
