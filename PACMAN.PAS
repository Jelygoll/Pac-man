Uses Crt,Dos,PMBase,PMEditor,PMGhAI;
const
 MaxTeleportCount=1500;

Procedure SetCursorVisible(b:Boolean);
var
 w:byte;
begin
 w:=32;
 If b then w:=6;
 asm
	mov ah,$01
	mov ch,w
	mov cl,7
	int $10
 end;
end;

var level1:Level;

Function CanMoveToPosition(level1:Level;qy,qx:integer): boolean;
 begin
	CanMoveToPosition:= not(
		 (level1[qy,qx].c = b.c) and (level1[qy,qx].a = b.a)
	or (level1[qy,qx].c = z.c) and (level1[qy,qx].a = z.a)
	or (level1[qy,qx].c =ln.c) and (level1[qy,qx].a = ln.a)
		 );
 end;

 Function IsTeleport(level1:Level;qy,qx:integer): boolean;
	begin
	 IsTeleport:=(level1[qy,qx].c = tp.c) and (level1[qy,qx].a = tp.a);
	end;

 Procedure AssignPoint(var o:Point;y,x:integer);
begin
	 o.x:=x;
	 o.y:=y;
end;

Procedure Motion(var o:Point;Run:Napravlenie);
begin
 If Run=Right then
	If o.x=80 then o.x:=1
	 else o.x:=o.x+1
	else
 If Run=Up then
	If o.y=1 then o.y:=25
	 else o.y:=o.y-1
	else
 If Run=Down then
	If o.y=25 then o.y:=1
	 else o.y:=o.y+1
	else
 If Run=Left then
	If o.x=1 then o.x:=80
	 else o.x:=o.x-1;
end;

Procedure DoteScore(var DoteCount:integer;y,x:integer);
begin
 If ((level1[y,x].c=d.c) and (level1[y,x].a=d.a))
 or ((level1[y,x].c=p.c) and (level1[y,x].a=p.a))
 or ((level1[y,x].c=v1.c) and (level1[y,x].a=v1.a))
 or ((level1[y,x].c=v2.c) and (level1[y,x].a=v2.a))
 or ((level1[y,x].c=v3.c) and (level1[y,x].a=v3.a))
 or ((level1[y,x].c=v4.c) and (level1[y,x].a=v4.a)) then
			DoteCount:=DoteCount+1;

end;



procedure DeleteGhost(g: Ghosts; k: integer; var r: integer);
var
	i: integer;
begin
	for i := i to r - 1 do
		g[i] := g[i+1];
	r := r - 1;
end;


procedure Game;
var
	GamePoint,SuperDoteEatTick,Time,Dif,Difficulty,Speed,DoteCount,
	DoteCount2,y,x,i,j,w,k,r: Integer;
	{ qx,qy:integer; {координаты следующего хода}
	a: array [1..MaxTeleportCount] of Point;
	File_name: string;
	c: char;
	Run: Napravlenie;
	h,o,e,n: Point;
	Score: Longint;
	GhostPunch, Lose: Boolean;
	Value:chcl;
	g: Ghosts;
begin
 Randomize;
 Score:=0;
 Lose:=False;
 DoteCount:=0;
 Speed:=450;
 Difficulty:=1;
 SuperDoteEatTick:=0;
 GamePoint:=1;
 While (Lose=False) do
BEGIN
 clrscr;
 File_name := 'level';
 load_level(File_name,level1);
 write_level(level1);
 Time:=15;
 k:=0;
 r:=1;
	For y:=1 to 25 do
	 For x:=1 to 80 do
		If (level1[y,x].c=pm.c) and (level1[y,x].a=pm.a) then
		 begin
			AssignPoint(e,y,x);
			level1[y,x]:=s;
		 end
		 else
		 If (level1[y,x].c=gh.c) then
			begin
			 AssignPoint(g[r],y,x);
			 level1[y,x]:=s;
			 r:=r+1;
			end
		 else
		 DoteScore(DoteCount,y,x);
		r:=r-1;

 GhostAI_Start(level1, Easy, e, g);

 textcolor(pm.a);
 GotoXY(e.x,e.y);
 write(pm.c);

 Run:=Stop;

 While (DoteCount<>0) and (Lose=False)  do
 begin
	While Keypressed=True do
	 begin
		c:=readkey;
		If c=#0 then
		 c:=readkey;

				if c='K' then Run:=Left
	 else if c='M' then Run:=Right
	 else if c='H' then Run:=Up
	 else if c='P' then Run:=Down
	 else if c=#27 then Lose:=True;
	end;

	 o:=e;
	 Motion(o,Run);
	 n:=o;

	w:=1;

	GhostPunch := false;
	for i:=1 to r do
		if (n.x=g[i].x) and (n.y=g[i].y) then
		begin
			GhostPunch := True;
			break;
		end;

	if GhostPunch and (SuperDoteEatTick>0) then
		DeleteGhost(g, i, r)
	else if GhostPunch then
		Lose:=True
	else
	If not CanMoveToPosition(level1,n.y,n.x) then
	 Run:=Stop
	else
	If IsTeleport(level1,n.y,n.x) then
	 begin
		For i:=1 to 25 do
		 For j:=1 to 80 do
			If IsTeleport(level1,i,j) then
			 begin
				AssignPoint(o,i,j);
				Motion(o,Run);
				If (Run<>Stop) and not (IsTeleport(level1,o.y,o.x))
				 and (CanMoveToPosition(level1,o.y,o.x))then
					 begin
						a[w]:=o;
						w:=w+1;
					 end;
			 end;

		k:=Random(w-1)+1;
		n:=a[k];

		If w=1 then Run:=Stop;
	 end;

	If Run<>Stop then
	 begin
		GotoXY(e.x,e.y);
		write(' ');
		GotoXY(n.x,n.y);
		TextColor(pm.a);
		write(pm.c);
		e:=n;
		If (level1[n.y,n.x].c=d.c) and (level1[n.y,n.x].a=d.a) then
		 begin
			Score:=Score+GamePoint*10; { make Score depending from Delay }
			DoteCount:=DoteCount-1;
			level1[n.y,n.x]:=s;
		 end
		else
		If (level1[n.y,n.x].c=p.c) and (level1[n.y,n.x].a=p.a) then
		 begin
			Score:=Score+GamePoint*50; { make Score depending from Delay }
			DoteCount:=DoteCount-1;
			level1[n.y,n.x]:=s;
			SuperDoteEatTick:=60;
		 end
		else
		If (level1[n.y,n.x].c=v1.c) and (level1[n.y,n.x].a=v1.a) then
		 begin
			Score:=Score+GamePoint*100;
			DoteCount:=DoteCount-1;
			level1[n.y,n.x]:=s;
		 end
		else
		If (level1[n.y,n.x].c=v2.	c) and (level1[n.y,n.x].a=v2.a) then
		 begin
			Score:=Score+GamePoint*200;
			DoteCount:=DoteCount-1;
			level1[n.y,n.x]:=s;
		 end
		else
		If (level1[n.y,n.x].c=v3.c) and (level1[n.y,n.x].a=v3.a) then
		 begin
			Score:=Score+GamePoint*300;
			DoteCount:=DoteCount-1;
			level1[n.y,n.x]:=s;
		 end
		else
		If (level1[n.y,n.x].c=v4.c) and (level1[n.y,n.x].a=v4.a) then
		 begin
			Score:=Score+GamePoint*400;
			DoteCount:=DoteCount-1;
			level1[n.y,n.x]:=s;
		 end;

	 end;

		If DoteCount=0 then
		 begin
			GhostAI_Stop;
			clrscr;
			Textcolor(LightGreen);
			GoToXY(35,15);
			Write('Win');
			Textcolor(White);
			GoToXY(35,16);
			Write('Score ',Score);
			GoToXY(35,17);
			Write('Level ',Difficulty,'---',#62,Difficulty + 1);
			GoToXY(35,18);
			Write('Next Level Start In ... ');
			Speed:=Speed-200;
			Difficulty:=Difficulty+1;
			GamePoint:=GamePoint+1;
			For i:=9 Downto 1 do
			 begin
				GoToXY(59,18);
				Write(i);
				Delay(600);
			 end;
		 While keypressed=True do
			c:=Readkey;
		 end;

 If SuperDoteEatTick>0 then
	SuperDoteEatTick:=SuperDoteEatTick-1;

 For x:=1 to r do
	begin
		 n:=g[x];
		 if GetGhostNewCoordinate(g[x],e) then
		 begin
			 if (g[x].x = e.x) and (g[x].y = e.y) then
				 GhostPunch := true;
			 if GhostPunch then
				 if SuperDoteEatTick > 0 then
				 begin
					 DeleteGhost(g, x, r);
					 x := x - 1;
				 end
				 else
					 Lose := True;
			 if (GhostPunch = false) or (Lose = true) then
			 begin
				GotoXY(g[x].x,g[x].y);
				TextColor(gh.a);
				Write(gh.c);
			 end;
			 GoToXY(n.x,n.y);
			 TextColor(level1[n.y,n.x].a);
			 Write(level1[n.y,n.x].c);
		 end;
	end;

 If Speed>0 then
	Delay(Speed);
 end;
END;

 If Lose=True then
	begin
	 GhostAI_Stop;
	 clrscr;
	 Textcolor(Red);
	 GoToXY(35,15);
	 Write('You Loser');
	 Textcolor(White);
	 GoToXY(35,16);
	 Write('Score ',Score);
	 GoToXY(35,17);
	 Write('Level ',Difficulty);
	end;

readkey;
end;



var
menu:array[1..4] of string;
	i,k: integer;
	c: char;
	bool: boolean;
	File_name: string;

begin
 SetCursorVisible(False);
 clrscr;
 File_name := 'zastavka';
 load_level(File_name,level1);
 write_level(level1);
 readkey;

 clrscr;
 menu[1] := 'Начать Игру';
 menu[2] := 'Редактор';
 menu[3] := 'Таблица Лидеров';
 menu[4] := 'Выход';

 bool:=true;
 k:=1;
 Repeat

		i:=1;
		If bool then
		 begin
			clrscr;
			repeat
				textcolor(7);
				If (k=i) then
				 textcolor(Green);
				writeln(i,'. ',menu[i]);
				i:=i+1;
			until i=5;
		 end;

		c:=readkey;
		if c=#0 then
		 c:=readkey;
		bool:=true;
		If c='H' then
			If k=1 then
				k:=4
			else
				k:=k-1
			else If c='P' then
			 If k=4 then
				k:=1
			 else
				k:=k+1
			 else
				bool:=false;


	If (k=1) and (c=#13) then
		begin
		 bool:=true;
		 clrscr;
		 Game;
		end
	else
 If (k=2) and (c=#13) then
		 begin
			 Redactor;
		 end;
 Until ((c=#13) and (k=4));
SetCursorVisible(True);
end.