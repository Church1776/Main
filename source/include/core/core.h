#if defined(_WIN32)
#   ifndef UNICODE
#       define UNICODE
#   endif
#   define NOMINMAX
#   define WIN32_LEAN_AND_MEAN
#   include <windows.h>
#elif defined(__linux__)
#   ifndef UNICODE
#       define UNICODE
#   endif    
#   include <unistd.h>
#endif

#include <iostream>
#include <thread>
#include <vector>
#include <string>
#include <print>

LRESULT CALLBACK WindowProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam);
void create_window();
void proc_window_messages();
void window_thread();