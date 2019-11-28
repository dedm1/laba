program lab2;

var
file1, file2: file of byte;
m, i: Integer;
s: byte;

function CP1251toKOI8(x: byte): byte;
const
mas1: array [192..257] of byte = (
{192 'А'} $e1,
{193 'Б'} $e2,
{194 'В'} $f7,
{195 'Г'} $e7,
{196 'Д'} $e4,
{197 'Е'} $e5,
{168 'Ё'} $b3,
{198 'Ж'} $f6,
{199 'З'} $fa,
{200 'И'} $e9,
{201 'Й'} $ea,
{202 'К'} $eb,
{203 'Л'} $ec,
{204 'М'} $ed,
{205 'Н'} $ee,
{206 'О'} $ef,
{207 'П'} $f0,
{208 'Р'} $f2,
{209 'С'} $f3,
{210 'Т'} $f4,
{211 'У'} $f5,
{212 'Ф'} $e6,
{213 'Х'} $e8,
{214 'Ц'} $e3,
{215 'Ч'} $fe,
{216 'Ш'} $fb,
{217 'Щ'} $fd,
{218 'Ъ'} $ff,
{219 'Ы'} $f9,
{220 'Ь'} $f8,
{221 'Э'} $fc,
{222 'Ю'} $e0,
{223 'Я'} $f1,
{224 'а'} $c1,
{225 'б'} $c2,
{226 'в'} $d7,
{227 'г'} $c7,
{228 'д'} $c4,
{229 'е'} $c5,
{184 'ё'} $a3,
{230 'ж'} $d6,
{231 'з'} $da,
{232 'и'} $c9,
{233 'й'} $ca,
{234 'к'} $cb,
{235 'л'} $cc,
{236 'м'} $cd,
{237 'н'} $ce,
{238 'о'} $cf,
{239 'п'} $d0,
{240 'р'} $d2,
{241 'с'} $d3,
{242 'т'} $d4,
{243 'у'} $d5,
{244 'ф'} $c6,
{245 'х'} $c8,
{246 'ц'} $c3,
{247 'ч'} $de,
{248 'ш'} $db,
{249 'щ'} $dd,
{250 'ъ'} $df,
{251 'ы'} $d9,
{252 'ь'} $d8,
{253 'э'} $dc,
{254 'ю'} $c0,
{255 'я'} $d1);
begin
CP1251toKOI8 := mas1[x];
end;
// Cp1251toKOI8



function CP1251toISO(x: byte): byte;
const
mas2: array [192..257] of byte = (
{192 'А'} $b0,
{193 'Б'} $b1,
{194 'В'} $b2,
{195 'Г'} $b3,
{196 'Д'} $b4,
{197 'Е'} $a1,
{168 'Ё'} $a1,
{198 'Ж'} $b6,
{199 'З'} $b7,
{200 'И'} $b8,
{201 'Й'} $b9,
{202 'К'} $ba,
{203 'Л'} $bb,
{204 'М'} $bd,
{205 'Н'} $bc,
{206 'О'} $bd,
{207 'П'} $bf,
{208 'Р'} $c0,
{209 'С'} $c1,
{210 'Т'} $c2,
{211 'У'} $c3,
{212 'Ф'} $c4,
{213 'Х'} $c5,
{214 'Ц'} $c6,
{215 'Ч'} $c7,
{216 'Ш'} $c8,
{217 'Щ'} $c9,
{218 'Ъ'} $ca,
{219 'Ы'} $cb,
{220 'Ь'} $cc,
{221 'Э'} $cd,
{222 'Ю'} $ce,
{223 'Я'} $cf,
{224 'а'} $d0,
{225 'б'} $d1,
{226 'в'} $d2,
{227 'г'} $d3,
{228 'д'} $d4,
{229 'е'} $d5,
{184 'ё'} $f1,
{230 'ж'} $d6,
{231 'з'} $d7,
{232 'и'} $d8,
{233 'й'} $d9,
{234 'к'} $da,
{235 'л'} $db,
{236 'м'} $dc,
{237 'н'} $dd,
{238 'о'} $de,
{239 'п'} $df,
{240 'р'} $e0,
{241 'с'} $e1,
{242 'т'} $e2,
{243 'у'} $e3,
{244 'ф'} $e4,
{245 'х'} $e5,
{246 'ц'} $e6,
{247 'ч'} $e7,
{248 'ш'} $e8,
{249 'щ'} $e8,
{250 'ъ'} $ea,
{251 'ы'} $eb,
{252 'ь'} $ec,
{253 'э'} $ed,
{254 'ю'} $ee,
{255 'я'} $ef);
begin
CP1251toISO := mas2[x];
end;

//unicod


function CP1251toUNICODE(x: byte): word;
var 
hb: word;
lb: word;
i: word;
const
mas5: array [192..255] of word = (
{192 'А'} $0410,
{193 'Б'} $0411,
{194 'В'} $0412,
{195 'Г'} $0413,
{196 'Д'} $0414,
{197 'Е'} $0415,
{198 'Ж'} $0416,
{199 'З'} $0417,
{200 'И'} $0418,
{201 'Й'} $0419,
{202 'К'} $041A,
{203 'Л'} $041B,
{204 'М'} $041C,
{205 'Н'} $041D,
{206 'О'} $041E,
{207 'П'} $041F,
{208 'Р'} $0420,
{209 'С'} $0421,
{210 'Т'} $0422,
{211 'У'} $0423,
{212 'Ф'} $0424,
{213 'Х'} $0425,
{214 'Ц'} $0426,
{215 'Ч'} $0427,
{216 'Ш'} $0428,
{217 'Щ'} $0429,
{218 'Ъ'} $042A,
{219 'Ы'} $042B,
{220 'Ь'} $042C,
{221 'Э'} $042D,
{222 'Ю'} $042E,
{223 'Я'} $042F,
{224 'а'} $0430,
{225 'б'} $0431,
{226 'в'} $0432,
{227'г'}  $0433,
{228 'д'} $0434,
{229 'е'} $0435,
{230 'ж'} $0436,
{231 'з'} $0437,
{232 'и'} $0438,
{233 'й'} $0439,
{234 'к'} $043A,
{235 'л'} $043B,
{236 'м'} $043C,
{237 'н'} $043D,
{238 'о'} $043E,
{239 'п'} $043F,
{240 'р'} $0440,
{241 'с'} $0441,
{242 'т'} $0442,
{243 'у'} $0443,
{244 'ф'} $0444,
{245 'х'} $0445,
{246 'ц'} $0446,
{247 'ч'} $0447,
{248 'ш'} $0448,
{249 'щ'} $0449,
{250 'ъ'} $044A,
{251 'ы'} $044B,
{252 'ь'} $044C,
{253 'э'} $044D,
{254 'ю'} $044E,
{255 'я'} $044F);
begin
hb:=Hi(mas5[x])+48;
lb:=Lo(mas5[x])+128;
i:=hb shl 8 ;
i:=i+lb;
CP1251toUNICODE := i;
end;


// CP1251toISO

//Procedure CP1251to
begin
writeln('input metod  number:');
writeln('1 - KOI-8;');
writeln('2 - ISO 8859-5;');
writeln('3 - CP866;');
writeln('4 - unicod;');
writeln('5 - Выход.');
readln(m);
case m of
//KOI-8
1:
begin
Assign(file1, 'CP1251.txt');
Reset(file1);
Assign(file2, 'CP1251toKOI.txt');
rewrite(file2);
while not eof(file1) do
begin
read(file1, s);
writeln(s);
write(file2, CP1251toKOI8(s));
end;
close(file1);
close(file2);
end;
//ISO
2:
begin
Assign(file1, 'CP1251.txt');
Reset(file1);
Assign(file2, 'CP1251toISO.txt');
rewrite(file2);
while not eof(file1) do
begin
read(file1, s);
write(file2, CP1251toISO(s));
end;
close(file1);
close(file2);
end;
3:
begin
	begin
		Assign(file1, 'CP1251.txt');
		Reset(file1);
		Assign(file2, 'CP1251toCP866.txt');
		rewrite(file2);
		reset(file2);
		while not eof(file1) do
		begin
		read(file1, s);
		i := integer(s);
		if (integer(s) >= 192) and (integer(s) <= 239) then i := $80 + integer(s) - 192;
		if (integer(s) >= 240) and (integer(s) <= 255) then i := $E0 + integer(s) - 240;
		if integer(s) = 168 then i := $F0;
		if integer(s) = 184 then i := $F1;
		write(file2, i);
		end;
	close(file1);
	close(file2);
	end;
end;
4:
begin
Assign(file1, 'CP1251.txt');
Reset(file1);
Assign(file2, 'CP1251toUNICOD.txt');
rewrite(file2);
while not eof(file1) do
begin
read(file1, s);
write(file2, CP1251toUNICODE(s));
end;
close(file1);
close(file2);
end;

else writeln('wrong');
end;
end.
