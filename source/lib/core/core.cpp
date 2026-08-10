#include "core/core.h"

namespace color {
    inline constexpr std::wstring_view reset = L"\x1b[0m",
    black = L"\x1b[30m",
    red = L"\x1b[31m",
    green = L"\x1b[32m",
    yellow = L"\x1b[33m",
    blue = L"\x1b[34m",
    magenta = L"\x1b[35m",
    cyan = L"\x1b[36m",
    white = L"\x1b[37m",
    br_black = L"\x1b[90m",
    br_red = L"\x1b[91m",
    br_green = L"\x1b[92m",
    br_yellow = L"\x1b[93m",
    br_blue = L"\x1b[94m",
    br_magenta = L"\x1b[95m",
    br_cyan = L"\x1b[96m",
    br_white = L"\x1b[97m",
    bkg_black = L"\x1b[40m",
    bkg_red = L"\x1b[41m",
    bkg_green = L"\x1b[42m",
    bkg_yellow = L"\x1b[43m",
    bkg_blue = L"\x1b[44m",
    bkg_magenta = L"\x1b[45m",
    bkg_cyan = L"\x1b[46m",
    bkg_white = L"\x1b[47m";
};

namespace style {
    inline constexpr std::wstring_view reset = L"\x1b[0m",
    bold = L"\x1b[1m",
    dim = L"\x1b[2m",
    underline = L"\x1b[4m",
    reverse = L"\x1b[7m",
    bold_off = L"\x1b[22m",
    underline_off = L"\x1b[24m",
    reverse_off = L"\x1b[27m";
};

namespace ctrl_code {
    inline constexpr std::wstring_view reset = L"\x1b[0m",
    clear_screen = L"\x1b[2J",
    clear_line = L"\x1b[2K",
    hide_cursor = L"\x1b[?25l",
    show_cursor = L"\x1b[?25h",
    move_cursor_home = L"\x1b[H",
    move_cursor_up = L"\x1b[A",
    move_cursor_down = L"\x1b[B",
    move_cursor_right = L"\x1b[C",
    move_cursor_left = L"\x1b[D";
};

LRESULT CALLBACK WindowProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam) {
    switch (uMsg) {
        case WM_DESTROY: {
            PostQuitMessage(0);
            return 0;
        }
        case WM_MOUSEMOVE: {
            int x = LOWORD(lParam);
            int y = HIWORD(lParam);
            std::wcout << L"Mouse moved to " << color::cyan << L"(" << x << L", " << y << L")" << color::reset << L"\n";
            return 0;
        }
        case WM_LBUTTONDOWN: {
            int x = LOWORD(lParam);
            int y = HIWORD(lParam);
            std::wcout << L"Left mouse button clicked at (" << x << L", " << y << L")" << color::reset << L"\n";
            return 0;
        }
        case WM_LBUTTONUP: {
            ReleaseCapture();
            std::wcout << L"Drag ended\n";
            return 0;
        }
        case WM_PAINT: {
            PAINTSTRUCT ps;
            HDC hdc = BeginPaint(hwnd, &ps);
            RECT rect;
            GetClientRect(hwnd, &rect);
            HBRUSH hBrush = GetSysColorBrush(COLOR_WINDOW);
            FillRect(hdc, &rect, hBrush);
            Rectangle(hdc, 10, 10, 200, 100);
            TextOutA(hdc, 20, 20, "Hello", 5);



            EndPaint(hwnd, &ps);
            return 0;
        }
        default: {
            return DefWindowProc(hwnd, uMsg, wParam, lParam);
        }
    }
}

void create_window() {
    
    HINSTANCE hInstance = GetModuleHandle(nullptr);
    const TCHAR* class_name = TEXT("test_terminal_emulator");

    WNDCLASSEX wcx{};
    wcx.cbSize = sizeof(WNDCLASSEX);
    wcx.lpfnWndProc = WindowProc;
    wcx.hInstance = hInstance;
    wcx.lpszClassName = class_name;

    if (!RegisterClassEx(&wcx)) {
        std::cerr << "Failed to register window class: " << GetLastError() << std::endl;
        return;
    }
    std::wcout << L"Registered window class: " << class_name << L"\n";

    const TCHAR* window_title = TEXT("Test Terminal Emulator");
    HWND hwnd = CreateWindowEx(
        0,
        class_name,
        window_title,
        WS_OVERLAPPEDWINDOW,
        CW_USEDEFAULT, CW_USEDEFAULT, 800, 600,
        nullptr, nullptr, hInstance, nullptr
    );
    if (!hwnd) {
        std::cerr << "Failed to create window: " << GetLastError() << std::endl;
        return;
    }
    std::wcout << L"Created window: " << window_title << L"\n";

    ShowWindow(hwnd, SW_SHOW);

}

void proc_window_messages() {
    MSG msg{};
    while (GetMessage(&msg, nullptr, 0, 0) > 0) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
}
void window_thread() {
    create_window();
    proc_window_messages();
}