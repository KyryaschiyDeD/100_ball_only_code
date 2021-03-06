﻿
procedure swap(var x,y: integer); // Процедура для перестановки элементов массива местами
   var t: integer;
 begin
    t := x; // Сохраняем значние х
    x := y; // в х присваиваем значение y
    y := t // в у присваиваем значение t (где t имеет значение изначального х)
 end;

var 
  n, sum, max, i, j, t, s: integer;
  mass: array [1..1000] of integer;
  fil: text;
begin
    assign(fil,'1.txt'); // Назначаем файловой переменной непосредственно файл
    reset(fil); // Открываем файл для чтения
    readln(fil, s, n); // Считываем первую строку, в "s" заносим данные о свободном месте, в n - зн-ния объёмов файлов каждого пользователя
    for i := 1 to n do 
      readln(fil, mass[i]); //Считываем построчно размеры файлов пользователя в массив mass
    for i := 1 to n do // Сортируем массив по возрастанию методом "пузырька" 
    //P.S., метод пузырька по сути самый простой для понимая ребёнком, поэтому его и использую.
        for j := i + 1 to n do  
            if mass[i] > mass[j] then // Если первый эл-т больше второго (и т.д.), то
              begin
                swap(mass[i],mass[j]); // Меняем их местами с помощью процедуры swap
              end;
    sum := 0; // Обнуляем сумму
    max := 1; // Берём максимальное число пользователей за 1.
    for i := 1 to n do // Идём по всему массиву
        if sum + mass[i] <= s then // Если сумма + значение объёма памяти у пользователя меньше или равно кол-ву свободного места, то 
          begin
            sum := sum + mass[i]; // Заносим новую сумму, которая удовлетворяет нашим условиям
            max := i; // Сохраняем индекс пользователя с максимальной суммой, т.к. массив отсортирован по возрастанию, то это значение i
            // Этоже значение будет являться кол-вом пользователей, которых мы могём сохраняить
          end;
    t := mass[max]; // Сохраняем максимальный размер имеющегося файла в переменную t
    for i := max to n do // Бежим по массиву от последнего максимального эл-та
        if ((sum - t) + mass[i]) <= s then // Если (наша сумма - максимальный размер файла) + размер файла пользователя меньше или равно s, то
          begin
            sum := sum - t + mass[i]; // Сохраняем новую сумму, этот цикл необходим для того, чтобы вычислить максимальный размер файла, который мы способны сохранить
            t := mass[i]; //Сохраняем зн-ние максимального размера файла
          end;
    writeln(max, ' ', t); // Выводим соответственно значения, мах - максимальное кол-во пользователей, t - максиммальный размер файла.
end.