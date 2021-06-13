#include <iostream>
#include <thread>
#include<windows.h>

#pragma comment( linker, "/subsystem:windows /entry:mainCRTStartup" )

void openChrome() {
    Sleep(15000);
    system("C:\\ReadCardServer\\start_chrome.vbs");
}

void runJava() {
    system("C:\\ReadCardServer\\start_main.bat");
}

int main() {
    std::thread run_java(runJava);
    std::thread open_chrome(openChrome);
    run_java.join();
    open_chrome.join();
    system("pause");
}