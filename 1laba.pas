
var // переменные
        f: file of char;
        bukva, per: char;
        v, perreal: real;
        size, i, j, k, tik, z,q: integer; 
        Mass1: array [0..255] of char; // Kod .Bukva  
        Mass2: array [0..255] of integer; //Povtor
        Mass3: array [0..255] of real; //Chastota
begin
	// ищем повторы
       assign(f, 'file.txt'); //открываем файл
       reset(f);
        while not eof(f) do
        begin
                read(f, bukva);// читаем по буквенно 
                size:=size+1;
                Mass1[ord(bukva)]:=bukva; // в код аски 
        end;
        close(f); // закрываем
        for i:=0 to 255 do // массив до 255 в таблице аски 255 символов 
        begin
                reset(f); // открываем файл 
                while not eof(f) do
                begin
                        read(f,bukva);
                        if Mass1[i] = bukva then tik:=tik+1;
                end;
                Mass2[i]:=tik; // tik - повторы 
                close(f);//закрываем
                Mass3[i]:=tik/size;  // частоты 
                writeln(i, ' ' ,Mass3[i]);
                tik:=0;
        end;   
        
        // выставлям по очереди метод пузырька 
        for j:=1 to 254 do
        begin
                for k:=1 to 254 do
                begin
                if Mass3[k]<Mass3[k+1] then
                begin
                        perreal:=Mass3[k];
                        Mass3[k]:=Mass3[k+1];
                        Mass3[k+1]:=perreal;
                        per:=Mass1[k];
                        Mass1[k]:=Mass1[k+1];
                        Mass1[k+1]:=per;
                        z:=Mass2[k];
                        Mass2[k]:=Mass2[k+1];
                        Mass2[k+1]:=z;
                end;
                end;
        end;
        writeln('Kod   Bukva   Povtor   Chastota');
        for  q:=0 to 255 do
        begin
                writeln(ord(Mass1[q]),'    ', Mass1[q],'        ', Mass2[q],'        ',Mass3[q]:3:2,'   %');
                readln;
        end;
        writeln('Razmer file ',size,' elementa(ov)');
end.
