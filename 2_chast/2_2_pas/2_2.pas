﻿// В задаче не учитываем единицу, как делитель, т.к. делитель должен быть больше d, а т.к. d - натуральное число,
// то d больше нуля (т.е. минимум = 1, а 0 не является натуральным числом).

function kol (N, d : integer) : integer; // Функция, которая выполняет задание
var count, i : integer;
begin
  if (d < N) then // Если d < N, то
  begin
    count := 1;   // Количество делителей = 1, т.к. любое число делится само на себя.
    for i:=2 to N div 2 do// Стартуем цикл, от двух, до середины числа N,
                        // где i принимает значения от 2 до N/2, больше нам не надо,
                        // т.к. там нет делителей. Включая само N/2 ( <= ), 
                        // т.е. допустим число 100, 100/2 = 50, 50 ведь тоже делитель
    begin
      if ((N mod i = 0)and(i > d)) then // Если число делится без остатка на i, а также больше нашего d
        count := count + 1; // Увеличиваем количество делителей на 1
    end;
    kol := count; // По завершению цикла зн-е функции присваиваем кол-во делителей
  end 
  else // Если не выполняется уловие d < N, то
    kol := 0;// Возвращаем 0, т.к. если d будет больше\равно N, 
            //то любые делители числа N будут меньше\равны d,
            // что неудовлетвореят условию задачи
end;

var N, d, count : integer; // Объявляем две целочисленные переменные.
begin
  write('Введите число N: ');
  readln(N); // ввод N
  write('Введите число d: ');
  readln(d);  // ввод d
  write('Ответ = ' + kol(N,d)); // Выводим результат, который высчитывает фукнция.
end.