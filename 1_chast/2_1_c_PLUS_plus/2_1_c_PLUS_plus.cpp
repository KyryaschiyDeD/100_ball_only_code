﻿
#include <iostream>
using namespace std;

int main()
{
    int N, a, flag = 0;
    cin >> N;
    a = N / 10;
    while (a != 0)
    {
        if (a % 10 > N % 10)
        {
            flag = 1;
        }
        else               // Необходимо добавить в программу строки кода с 16 по 22, 
        {                   // В программе не было учтено условие, что попадается не удовлетворяющие заданию числа, 
                        //т.е. если первая пара удовлетворяет, то программа не меняла результат в ином случае,
                        // что неверно(пример можно посмотреть в txt документе (readme.txt), в папке с этим файлом)
            flag = 0;  
            break; // break необходим, чтобы остановить выполнение, когда попадётся первое невыполнение условия задачи.
        }
        N = N / 10;
        a = a / 10;
    }
    cout << flag << endl;
    if (flag == 1)
    {
        cout << "YES";
    }
    else
    {
        cout << "NO";
    }
    return 0;
}