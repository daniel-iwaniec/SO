program so12;

uses dos;

var interruptAddressOld, interruptAddressNew : pointer;

procedure interruptProcedure; interrupt;
begin
end;

begin
 getIntVec($1C, interruptAddressOld);
 writeln(seg(interruptAddressOld^), ofs(interruptAddressOld^));
 readln;

 setIntVec($1C, addr(interruptProcedure));
 getIntVec($1C, interruptAddressNew);
 {}
 readln;

 setIntVec($01C, interruptAddressOld);
 getIntVec($1C, interruptAddressOld);
 {wyswietl interruptAddressOld}
 readln;
end.