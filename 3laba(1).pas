var 
wor : string;
key : string;
s:string;

function open(f:string):string;
var
l:string;
bukva:char;
fil: file of char;
begin
l:='';
assign(fil, f); //открываем файл
reset(fil);
        while not eof(fil) do
        begin
                read(fil, bukva);// читаем по буквенно 
                l:=l+bukva; // в код аски 
        end;
        close(fil); // закрываем
 open:=l;
end;

function crypt (wod , key : string): string;
var 
i: integer;
a: integer;
ii: integer;
letter : char;
f:string;
begin
f:='';
for ii :=1 to length(wod) do begin
i:=ord(wod[ii]);
a:=ord(key[ii]);
i:=i+a;
writeln(chr(i-a));
letter:=chr(i);
f:=f+letter;
end;
crypt:=f;
end;

function uncrypt (wod , key : string): string;
var 
i:integer;
a: integer;
ii: integer;
letter : char;
f:string;
begin
f:='';
for ii :=1 to length(wod) do begin
i:=ord(wod[ii]);
a:=ord(key[ii]);
i:=i-a;
letter:=chr(i);
f:=f+letter;
end;
uncrypt:=f;

end;



begin
key:='sssssdasadsffgdsgdsfgdsf';
wor:=open('file.txt');
s:=crypt(wor,key);
writeln(s);
writeln(uncrypt(s,key));
end.
