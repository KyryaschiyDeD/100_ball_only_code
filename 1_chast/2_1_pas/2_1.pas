var n, a, flag : integer;
begin
  readln(n);
  a := n div 10;
  flag := 0;
  while (a<>0) do
  begin
    if (a mod 10 > n mod 10) then
    begin
      flag := 1;
    end
    else    // В программе не было учтено условие, что попадается не удовлетворяющие заданию числа, 
    begin  //т.е. если первая пара удовлетворяет, то программа не меняла результат в ином случае,
      flag := 0; // что неверно(пример можно посмотреть в txt документе (readme.txt), в папке с этим файлом)
      break;  // break необходим, чтобы остановить выполнение, когда попадётся первое невыполнение условия задачи.
    end;
    n:= n div 10;
    a:= a div 10;
  end;
  writeln(flag);
  if (flag) = 1 then
    writeln('YES')
  else
    writeln('NO');
end.