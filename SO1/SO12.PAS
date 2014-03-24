program so12;

uses dos;

type hexadecimal = array[1..30] of integer;

var interruptAddressOld, interruptAddressNew : pointer;
 hexa: hexadecimal; 
 addressInt : integer;
 i: integer; 

procedure interruptProcedure; interrupt;
begin
end;

procedure convert(decimal: longint; var i: integer; var hexa: hexadecimal);
BEGIN
   i := 1;
   WHILE decimal <> 0 DO BEGIN
      hexa[i] := decimal MOD 16;
      decimal := decimal DIV 16;
      i := i + 1;
   END;
END;



PROCEDURE writetothescreen(i: integer; hexa: hexadecimal);
VAR j: integer;
BEGIN
      FOR j := (i - 1) DOWNTO 1 DO BEGIN
         IF hexa[j] < 10 THEN
            write(output, hexa[j])
         ELSE BEGIN
            CASE hexa[j] OF
               10: write(output, 'A');
               11: write(output, 'B');
               12: write(output, 'C');
               13: write(output, 'D');
               14: write(output, 'E');
               15: write(output, 'F');
            END; {End of Case}
         END; {End of ELSE}
   END; {End of FOR loop}
END; {End of Procedure}

begin
 getIntVec($1C, interruptAddressOld);
 addressInt := (seg(interruptAddressOld^) * 10) + ofs(interruptAddressOld^);
 convert(addressInt, i, hexa);
 writetothescreen(i, hexa);
 readln;

 setIntVec($1C, addr(interruptProcedure));
 getIntVec($1C, interruptAddressNew);
 addressInt := (seg(interruptAddressNew^) * 10) + ofs(interruptAddressNew^);
 convert(addressInt, i, hexa);
 writetothescreen(i, hexa);
 readln;

 setIntVec($01C, interruptAddressOld);
 getIntVec($1C, interruptAddressOld);
 addressInt := (seg(interruptAddressOld^) * 10) + ofs(interruptAddressOld^);
 convert(addressInt, i, hexa);
 writetothescreen(i, hexa);
 readln;
end.