unit PMGhAI;

Interface
uses PMBase;

type Difficulty = (Easy, Medium, Hard);

procedure GhostAI_Start(var lv: Level; d:Difficulty; pacman: Point; g: Ghosts);
procedure GhostAI_Stop;

function GetGhostNewCoordinate(var ghost: Point; pacman: Point): boolean;


Implementation
var l: Level;

procedure GhostAI_Start(var lv: Level; d:Difficulty; pacman: Point; g: Ghosts);
begin
	l := lv;
end;

procedure GhostAI_Stop;
begin
end;

function GetGhostNewCoordinate(var ghost: Point; pacman: Point): boolean;
var
 b: boolean;
 i, z: integer;
 d: Napravlenie;
begin
	pacman := ghost;
	b := false;
	i := 0;
	repeat
		ghost := pacman;
		z := random(4) + 1;
		i := i + 1;

		if      z = 1 then d := Left
		else if z = 2 then d := Right
		else if z = 3 then d := Up
		else if z = 4 then d := Down;

		if      d = Left  then ghost.x := ghost.x - 1
		else if d = Right then ghost.x := ghost.x + 1
		else if d = Up    then ghost.y := ghost.y - 1
		else if d = Down  then ghost.y := ghost.y + 1;

		if      ghost.x = 0  then ghost.x := 80
		else if ghost.x = 81 then ghost.x := 1
		else if ghost.y = 0  then ghost.y := 25
		else if ghost.y = 26 then ghost.y := 1;

		b := CanGhostMoveToPosition(l, ghost.y, ghost.x);
	until b or (i = 10);
	GetGhostNewCoordinate := i <> 10;
end;

begin
end.