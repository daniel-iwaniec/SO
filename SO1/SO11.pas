{Zadanie 7 - usuwanie pliku}
program so11;

uses dos;

var
reg : registers;
filename : array[0..100] of char;

begin
 writeln('Podaj nazwe pliku do usuniecia (do 100 znakow)');
 readln(filename);

 reg.ah := $41;
 reg.ds := seg(filename);
 reg.dx := ofs(filename);
 reg.flags := reg.flags and $fffe;

 MsDos(reg);

 if ((reg.flags and 1) = 1) then begin
  if (reg.ax = 2) then writeln('Nie znaleziono pliku');
  if (reg.ax = 3) then writeln('Nie znaleziono sciezki do pliku');
  if (reg.ax = 5) then writeln('Brak dostepu do pliku');
 end else begin
  writeln('Usunieto plik');
 end;

 readln;
end.