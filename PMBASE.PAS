Unit PMBase;

Interface

uses crt;

 type chcl=record
	c:char;
	a:byte;
 end;

 type Level=array [1..25,1..80] of chcl;

 type Point=record
	 x,y:integer;
 end;

 type Napravlenie=(Left,Right,Up,Down,Stop);

 type Ghosts=array[1..50] of Point;
const
 pm:chcl=(c:#2;a:Yellow);
 gh:chcl=(c:#1;a:Cyan);
 b:chcl=(c:#219;a:Blue);
 z:chcl=(c:#220;a:Blue);
 tp:chcl=(c:#176;a:LightBlue);
 ln:chcl=(c:#205;a:Brown);
 s:chcl=(c:#32;a:LightGray);
 p:chcl=(c:#42;a:White+Blink);
 d:chcl=(c:#249;a:White);
 v1:chcl=(c:#3;a:Red);
 v2:chcl=(c:#4;a:Magenta);
 v3:chcl=(c:#5;a:LightCyan);
 v4:chcl=(c:#6;a:LightRed);
 zero:chcl=(c:#0;a:LightGray);

function CanGhostMoveToPosition(level1: Level; qy, qx: Integer): boolean;

Implementation

function CanGhostMoveToPosition(level1:Level;qy,qx:Integer):boolean;
begin
	CanGhostMoveToPosition:= not(
		 (level1[qy,qx].c = b.c) and (level1[qy,qx].a = b.a)
	or (level1[qy,qx].c = z.c) and (level1[qy,qx].a = z.a)
	or (level1[qy,qx].c = tp.c) and (level1[qy,qx].a = tp.a)
		 );
end;

begin
end.