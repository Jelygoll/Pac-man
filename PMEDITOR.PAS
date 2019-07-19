unit PMEditor;

Interface

Uses PMBase;

Function save(Lv:Level;var s:string):boolean;
Function load_level(File_name:string;var Lv:Level):integer;
procedure write_level(l: Level);

procedure Redactor;

Implementation
uses Crt;

 var e,r,c: char;
	t,x,y,i,o: integer;
	f: text;
	l,q: boolean;
	m: Level;

 { Консоль помощи }
 Procedure consol;
 var e,r,c: char;
	i,q,o: integer;
	f: text;
	l: boolean;
	x:chcl;
 begin
	x:=b;
	x.c:=#219;
	x.a:=1;
	textcolor(LightGray);
	GotoXY(15,2);
	writeln('Добро пожаловать в редактор Пакмена');
	GotoXY(46,21);
	write('Нажмите любую клавишу');
	l:=true;
	GotoXY(15,4);
	write(b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+
	b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c);
	GotoXY(15,5);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,6);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,7);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,8);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,9);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,10);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,11);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,12);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,13);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,14);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,15);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,16);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,17);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,18);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,19);
	write(b.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+
	s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+s.c+b.c);
	GotoXY(15,20);
	write(b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+
	b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c+b.c);

	GotoXY(16,6);
	writeln('b-стенка ');
	GotoXY(26,6);
	textcolor(blue);
	write(#219);
	textcolor(LightGray);

	GotoXY(16,7);
	writeln('g-привидение ');
	GotoXY(30,7);
	textcolor(Cyan);
	write(#1);
	textcolor(LightGray);

	GotoXY(16,8);
	writeln('t-телепорт');
	GotoXY(27,8);
	textcolor(LightBlue);
	write(#176);
	textcolor(LightGray);

	GotoXY(16,9);
	writeln('z-полублок ');
	GotoXY(27,9);
	textcolor(Blue);
	write(#220);
	textcolor(LightGray);

	GotoXY(16,10);
	writeln('l-двери');
	GotoXY(24,10);
	textcolor(Brown);
	write(#205);
	textcolor(LightGray);

	GotoXY(16,11);
	writeln('s-пробел',' ',#32);

	GotoXY(16,12);
	writeln('p-Ульта');
	GotoXY(24,12);
	textcolor(White+Blink);
	write(#42);
	textcolor(LightGray);

	GotoXY(16,13);
	writeln('d-точка');
	GotoXY(24,13);
	textcolor(White);
	write(#249);
	textcolor(LightGray);

	GotoXY(16,14);
	writeln('1-вишенка тип 1');
	GotoXY(32,14);
	textcolor(Red);
	write(#3);
	textcolor(LightGray);

	GotoXY(16,15);
	writeln('2-вишенка тип 2');
	GotoXY(32,15);
	textcolor(Magenta);
	write(#4);
	textcolor(LightGray);

	GotoXY(16,16);
	writeln('3-вишенка тип 3');
	GotoXY(32,16);
	textcolor(LightCyan);
	write(#5);
	textcolor(LightGray);

	GotoXY(16,17);
	writeln('4-вишенка тип 4');
	GotoXY(32,17);
	textcolor(LightRed);
	write(#6);
	textcolor(LightGray);

	GotoXY(16,18);
	writeln('o-Пакман');
	GotoXY(25,18);
	textcolor(Yellow);
	write(#2);
	textcolor(LightGray);

	If readkey=#0 then
	 readkey;
 end;


{ Загрузка из файла в переменную }
Function load_level(File_name:string;var Lv:Level):integer;
 var f: file of chcl;
		 k,i,a,r: integer;
		 c: chcl;
		{ p: boolean;   }
begin
 assign(f,'levels/'+File_name+'.pm');
 {$I-}
 reset(f);
 {$I+}
 q:=true;
 r:=IOResult;
 If r<>0 then
	q:=false;
 If q=true then
	begin
	 i:=1;
	 repeat
		a:=1;
		repeat
		 {$I-}
		 read(f,c);
		 {$I+}
		 Lv[i,a]:=c;
		 a:=a+1;
		Until a=81;
		i:=i+1;
	 Until i=26;
	 close(f);
	end;
end;

{ Отрисовка уровня }
procedure write_level(l: Level);
var a,i: integer;
begin
 clrscr;
	i:=1;
	repeat
		a:=1;
		repeat
			textcolor(l[i,a].a);
			write(l[i,a].c);
			a:=a+1;
		Until (a = 81) or ((i = 25) and (a = 79));
	i:=i+1;
 Until i=26;
end;

{ Сохранение в файл }
Function save(Lv:Level;var s:string):boolean;
	var x,y,z: integer;
			f: file of chcl;
Begin
 If s[0]>#5 then
	s[0]:=#5;
 s:=s+'.pm';
 save:=false;
 assign(f,'levels/'+s);
 {$I-}
 Rewrite(f);
 {$I+}
 If IOResult=0 then
	begin
	 y:=1;
	 repeat
		x:=1;
		repeat
		 write(f,Lv[y,x]);
		 x:=x+1;
		until (x=81);
		y:=y+1;
	 until y=26;
	 save:=true;
	 close(f);
	end;
End;


 Function otvet2: boolean;
const otvet1: array[1..2] of string = ('Да', 'Нет');
var
 i,k: integer;
 c: char;
 b,w: boolean;
 s: string;
begin
 clrscr;
 writeln('Вы хотите выйти без сохранения?');
 b:=true;

	k:=2;
	Repeat
	 i:=1;
	 If b then
		begin
		 clrscr;
		 textcolor(white);
		 writeln('Вы хотите выйти без сохранения?');
		 repeat
			textcolor(white);
			If (k=i) then
			 textcolor(green+blink);
			writeln(i,'. ',otvet1[i]);
			i:=i+1;
		 until i=3;
		end;

 c:=readkey;
 if c=#0 then
	c:=readkey;
 b:=true;
 If c='H' then
	If k=1 then
		k:=2
 else
	k:=k-1
 else If c='P' then
	If k=2 then
	 k:=1
	else
	 k:=k+1
 Until (c=#13) or (c=#27);

 if k = 2 then
	b:=false;
 otvet2:=b;
end;


 { Меню с ответом Да/Нет }
 Function otvet: boolean;
 const
	otvet1: array[1..2] of string = ('Да', 'Нет');
 var
	i,k: integer;
	c,w: char;
	b,q: boolean;
	s: string;
Begin
 clrscr;
 writeln('Вы хотите сохранить?');
 b:=true;
	k:=1;
	Repeat
	 i:=1;
	 If b then
		begin
		 clrscr;
		 textcolor(white);
		 writeln('Вы хотите сохранить?');
		 repeat
			textcolor(white);
			If (k=i) then
			 textcolor(green+blink);
			writeln(i,'. ',otvet1[i]);
			i:=i+1;
		 Until i=3;
		end;

 c:=readkey;
 if c=#0 then
	c:=readkey;
 b:=true;
 If c='H' then
	If k=1 then
	 k:=2
	else
	 k:=k-1
	else If c='P' then
	 If k=2 then
		k:=1
	else
	 k:=k+1
 Until (c=#13) or (c=#27);

 If (k = 2) or (c=#27) then
	b:=false;

 If b=true then
	begin
	 repeat
		clrscr;
		If q = false then
		 Writeln('Некоректное имя файла');
		Writeln('Введите имя файла',' ');
		{w:=readkey;
		If w=#27 then
		 write_level(m); }
		readln(s);
		If s = '' then
		 begin
			b:=false;
			break;
		 end;
		q := save(m,s);
	 Until q = true;
	end;
 otvet:=b;
End;


{ Редактор }
 Procedure menu2 (clear: boolean); { clear - надо ли очищать m или нет }
	var c: char;
	t,x,y,i,q,o,x2,y2: integer;
	f: text;
	e,n: boolean;
	l:chcl;
Begin
 clrscr;
 if (clear) then
	begin
	 {обнуление уровня}
	 t:=1;
	 repeat
		q:=1;
		repeat
		 m[t,q]:=zero;
		 q:=q+1;
		until q=81;
		t:=t+1;
	 Until t=26;
	end
 else
 begin
	write_level(m);
	GotoXY(1,1);
 end;

 x:=1;
 y:=1;
 repeat
	l:=zero;
	e:=false;
	n:=true;
	x2:=x;
	y2:=y;

	c:=readkey;
	If c=#0 then
	 c:=readkey;
	If c=('H') then
	 y:=y-1
	else If c=('P') then
	 y:=y+1
	else If c=('K') then
	 x:=x-1
	else If c=('M') then
	 x:=x+1;
	GotoXY(x,y);


 If c='K' then
	begin
	 if x=0 then
	 begin
		GotoXY(80,WhereY);
		x:=80;
	 end;
	end
 else
	If c='M' then
	 begin
		If x=81 then
		begin
		 GotoXY(1,whereY);
		 x:=1;
		end;
	 end
 else
	If c='H' then
	 begin
		If y=0 then
		 begin
			GotoXY(whereX,25);
			y:=25;
		 end
		end
 else
	If c='P' then
	 begin
		If y=26 then
		 begin
			GotoXY(whereX,1);
			y:=1;
		 end
	 end
 else If c=#59 then
	consol
 else If c=#60 then
	e:=otvet
 else If c=#27 then
	e:=otvet2
 else
	begin
	 case c of
		'b': l := b;
		'd': l := d;
		'g': l := gh;
		'l': l := ln;
		'o': l := pm;
		'p': l := p;
		's': l := s;
		't': l := tp;
		'z': l := z;
		'1': l := v1;
		'2': l := v2;
		'3': l := v3;
		'4': l := v4;
	 end;

	if (l.c <> zero.c) then
	 begin
		textcolor(l.a);
		write(l.c);
		GotoXY(whereX-1,WhereY);         {++++++++++++++++++++++}
		m[y,x]:=l;
	 end;

	n:=false;
 end;

 If (n=true) then
	begin
	 l:=m[y2,x2];
	 If (l.c=b.c) or (l.c=z.c) then
	 begin
		GotoXY(x2,y2);
		textcolor(l.a);
		write(l.c);
		GotoXY(x,y);
	 end;

	l:=m[y,x];
	 If ((l.c=b.c) or (l.c=z.c)) then
	 begin
		textcolor(l.a+16);
		write(l.c);
		GotoXY(x,y);
	 end;
 end;


 If (e=false) and ((c=#60)or(c=#27)or(c=#59))  then
	begin
	 write_level(m);
	 GoToXY(x,y);
	end;
	textcolor(7);
 Until e=true;
End;

{Основное меню}
 Procedure menu1;
 var
	menu:array[1..3] of string;
	i,k: integer;
	c: char;
	s: string;
	b: boolean;

begin
	clrscr;
	menu[1] := 'Новый уровень';
	menu[2] := 'Открыть существующий уровень';
	menu[3] := 'Выход';

	b:=true;
	k:=1;
	Repeat

		i:=1;
		If b then
		 begin
			clrscr;
			repeat
				textcolor(7);
				If (k=i) then
				 textcolor(yellow);
				writeln(i,'. ',menu[i]);
				i:=i+1;
			until i=4;
		 end;

		c:=readkey;
		if c=#0 then
		 c:=readkey;
		b:=true;
		If c='H' then
			If k=1 then
				k:=3
			else
				k:=k-1
			else If c='P' then
			 If k=3 then
				k:=1
			 else
				k:=k+1
			 else
				b:=false;

		If (k=1) and (c=#13) then
		begin
		 b:=true;
		 clrscr;
		 consol;
		 menu2(true);
		end
		else If (k=2) and (c=#13) then
		 begin
			clrscr;
			b:=true;
			write('Введите имя файла( или оставьте строку пустой для выхода ): ');
			repeat
			 readln(s);
			 If s = '' then
				break;
			 load_level(s,m);
			 If q=false then
				begin
				 clrscr;
				 writeln('Уровень с таким названием не найден');
				 write('Введите другое имя файла: ');
				end;
			Until q=true;
			If s <> '' then
			 menu2(false);
		 end
			else If c=#59 then
			 consol
	Until ((c=#13) and (k=3));
end;

procedure Redactor;
Begin
 clrscr;
 textcolor(7);
 menu1;
End;

begin
end.