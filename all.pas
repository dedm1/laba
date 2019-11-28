const
  alfavit: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
var 
key : string;
s:string;
n:byte;

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

function CaesarEncipher(toCode: string ; n: byte): string;
var i, T: integer;
begin
  for i := 1 to length(toCode) do begin
    T := (Ord(toCode[ i ]) + n);
    if T >= 256 then dec(T, 256);
    toCode[ i ] := Chr(T);
  end;
  CaesarEncipher := toCode;
end;
 
function CaesarDecipher(toDecode: string ; n:byte): string;
var i, T: integer;
begin
  for i := 1 to length(toDecode) do begin
    T := (Ord(toDecode[ i ]) - n);
    if T < 0 then Inc(T, 256);
    toDecode[ i ] := Chr(T);
  end;
  CaesarDecipher := toDecode;
end;

function ViginerEncipher(toCode, Key: string): string;
var
  i: integer;
  currK: byte;
  s: string;
begin
  s := '';
  for i := 1 to length(toCode) do begin
    currK := pred(pos(Key[ (pred(i) mod length(Key)) + 1 ], alfavit)); // предыдущей (подстрока в строке (ключ [ целое от деления пред на длину ключа]+1) , алфавит )
    s := s +
      alfavit[ ((pred(pos(toCode[ i ], alfavit)) + currK) mod length(alfavit)) + 1 ];
  end;
  ViginerEncipher := s;
end;
 
function ViginerDecipher(toDecode, Key: string): string;
var
  i, T: integer;
  currK: byte;
  s: string;
begin
  s := '';
  for i := 1 to length(toDecode) do begin
    currK := pred(pos(Key[ (pred(i) mod length(Key)) + 1 ], alfavit));
    T := pred(pos(toDecode[ i ], alfavit)) - currK;
    if T < 0 then inc(T, length(alfavit)); // увелечение T НА ..
    s := s + alfavit[T + 1];
  end;
  ViginerDecipher := s;
end;

begin

write('input 1 to 4 :  ');
readln(n);

if n= 1 then
	begin
	write('input name file : ');
	readln(s);
	write('input name key : ');
	readln(key);
	s:=open(s);
	key:='sssssdasadsffgdsgdsfgdsf';
	s:=crypt(s,key);
	writeln(s);
	writeln(uncrypt(s,key));
	end;

if n= 2 then
begin
	write('input name file : ');
	readln(s);
	write('input name key : ');
	readln(n);
	s:=open(s);
    s := CaesarEncipher(s,n);
    writeln(s);
    writeln('s = ', CaesarDecipher(s,n));
end;

if n= 3 then
begin
  write('INPUT WORD IN  LETTER ');
  readln(s);
  write('INPUT WORD IN CAY ');
  readln(key);
  s := ViginerEncipher(s, key);
  writeln(s);
  writeln('s = ', ViginerDecipher(s, key));

end;

end.
