const
  n = 3;
 
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
 
function CaesarEncipher(toCode: string): string;
var i, T: integer;
begin
  for i := 1 to length(toCode) do begin
    T := (Ord(toCode[ i ]) + n);
    if T >= 256 then dec(T, 256);
    toCode[ i ] := Chr(T);
  end;
  CaesarEncipher := toCode;
end;
 
function CaesarDecipher(toDecode: string): string;
var i, T: integer;
begin
  for i := 1 to length(toDecode) do begin
    T := (Ord(toDecode[ i ]) - n);
    if T < 0 then Inc(T, 256);
    toDecode[ i ] := Chr(T);
  end;
  CaesarDecipher := toDecode;
end;
 
var
  s: string;
 
begin
	s:='file.txt';
	s:=open(s);
  s := CaesarEncipher(s);
  writeln(s);
  writeln('s = ', CaesarDecipher(s));
end.
