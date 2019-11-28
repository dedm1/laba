const
  alfavit: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
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
 
var
  s: string;
  k:string;
begin
  write('INPUT WORD IN  LETTER ');
  readln(s);
  write('INPUT WORD IN CAY ');
  readln(k);
  s := ViginerEncipher(s, k);
  writeln(s);
  writeln('s = ', ViginerDecipher(s, k));
end.
