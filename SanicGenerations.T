%Sanic Generations by Iram Rahman and Sohail Patil

%Tested- Bugs in LV2, adjust delay. Pic Merge is not 100% Successfull. 


import GUI
setscreen ("graphics:1000;500")

% constants to control the character
const GROUND_HEIGHT := 2
const RUN_SPEED := 10
const JUMP_SPEED := 30
var bg : int := Pic.FileNew ("springyard.jpg")
const GRAVITY := 2

%Variables for Sanic
var pic : int := Pic.FileNew ("latest.jpg")
var sanic : int
var picWidth, picHeight : int
var chars : array char of boolean
Pic.SetTransparentColour (pic, white)

%Death counter
var deathtoll : int
deathtoll := 0
var counter, counter1, counter2, counter3, counter4 : int
counter := 0
counter1 := 0
counter2 := 0
counter3 := 0
counter4 := 0

%Lv1 spikes
var spikesx : array 1 .. 3 of int := init (700, 720, 740)
var spikes2x : array 1 .. 3 of int := init (500, 520, 540)
var spikesy : array 1 .. 3 of int := init (50, 100, 50)

% player position and velocity
var posx, posy : int
var velx, vely : real

%SanicLV2
var sonicmouse : int := Pic.FileNew ("latest.jpg")
var sanicmouse,picWidth2,picHeight2:int
Pic.SetTransparentColour (sonicmouse, white)
 picWidth2 := Pic.Width (sonicmouse)
	picHeight2 := Pic.Height (sonicmouse)
	
 sanicmouse := Pic.Scale (sonicmouse, picWidth2 div 2, 
		    picHeight2 div 2)
		    
%Timer
var last, now, count : int := 10

last := Time.Elapsed 




% LV2 Sanic Positions
var xpositiona, y1, y2, dummy : int 
xpositiona := 400 
y1 := Rand.Int (200, 400) 
y2 := Rand.Int (200, 400) 

var icolor, icolor2, iXposition, iYposition, xdirection, ydirection, font, font1, font2, font3, xmouse, ymouse, button : int 
% Sanic LV2 Controls 
var yaltitude, mx, my, btn : int 

var ch : string (1) 

% Text Fonts 
font := Font.New ("serif:50") 
font1 := Font.New ("serif:25") 
font2 := Font.New ("serif:15") 
font3 := Font.New ("serif:9") 

% Colors 
icolor2 := 21 
icolor := 1 


% Positions 
iXposition := 0 
iYposition := 0 
xdirection := 1 
ydirection := 1 
yaltitude := 0 
View.Set ("graphics,offscreenonly,nocursor") 
posx := 20
velx := 0
posy := 400
vely := 0

%Level 2 Procedure
procedure LV2
loop 
yaltitude := 0 
% Menu 
loop 
setscreen ("graphics:1000;500")
Mouse.Where (xmouse, ymouse, button) 

Draw.Cls 

% Background 
drawfillbox (300, 240, 350, 260, 41) 


% Background 
drawfillbox (0, 0, maxx, maxy, 100) 


% Menu Selections 
Draw.Text ("Level 2", 300, 325, font, icolor - 1) 
Draw.Text ("Play", 300, 180, font1, icolor + 40) 
Draw.Text ("Use your mouse", 300, 120, font1, black) 
count:=10

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% If Played %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
if xmouse > 290 and xmouse < 370 and ymouse > 170 and ymouse < 220 and button = 1 then 
Draw.Cls 
View.Update 

%%% Background %%% 
loop 
put count put "Seconds remaining"

drawfillbox (0, 0, maxx, 350, 100) 
drawfillbox (0, 0, maxx, 50, white) 
drawfillbox (xpositiona, y1, xpositiona + 40, y2, white) 
xpositiona := xpositiona - 5 

if xpositiona < 0 then 
xpositiona := 640 
dummy := Rand.Int (150, 350) 
if dummy <= 250 then 
y1 := 0 
y2 := dummy 
else 
y1 := 350 
y2 := 200 
end if 
end if 

%Sanic 

drawfillbox (75, 192 + yaltitude, 125, 196 + yaltitude, yellow) %Dummy

Pic.Draw (sanicmouse, 0, 
		    120+yaltitude, picMerge) 
   now := Time.Elapsed 
    if (now - last >= 2000) then 
	count -= 1 
	last := now 
    end if 
    locate (1,1)
if count=0 then
cls
put"UrSlow"
LV2
end if
View.Update 

icolor2 := icolor2 + 1 

mousewhere (mx, my, btn) 
if btn = 1 then 
yaltitude += 2
else 
yaltitude -= 2 
end if 
if icolor2 = 31 then 
icolor2 := 21 
end if 

if whatdotcolor (125, 192 + yaltitude) = white then 
exit 
end if 

if whatdotcolor (12, 192 + yaltitude) = white then 
exit 
end if 

if whatdotcolor (150, 253 + yaltitude) = white then 
exit 
end if 

delay (3) 
end loop 
end if 

if whatdotcolor (125, 192 + yaltitude) = white then 
exit 
end if 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End Background %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


%drawfillbox (290,170,370,220,41) 
%drawfillbox (270,100,390,150,41) 




icolor := icolor + 1 
if icolor = 62 then 
icolor := 1 
end if 
icolor2 := icolor2 + 1 
if icolor2 = 31 then 
icolor2 := 21 
end if 
iXposition := iXposition + xdirection 
iYposition := iYposition + ydirection 

if iXposition > 455 or iXposition < 0 then 
xdirection := -xdirection 
end if 

if iYposition > 215 or iYposition < 0 then 
ydirection := -ydirection 
end if 


delay (5) 
View.Update 

end loop 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GAME OVER SCREEN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
cls 
drawfillbox (0, 0, maxx, maxy, 100) 


Draw.Text ("UR 2 Slow", 190, 200, font, black) 
View.Update 
delay (2000) 
end loop 
end LV2

%Level 1 proceduree
procedure LV1
loop
    loop
    setscreen ("graphics:1000;500,offscreenonly")
    
%Drawing Sanic and the background
	sanic := Pic.Scale (pic, 200,
	    150)
	Pic.Draw (bg, -posx, 0, picMerge)
	Pic.Draw (bg, -posx - 160, 0, picMerge)
	Pic.Draw (bg, -posx + 600, 0, picCopy)
	Pic.Draw (bg, -posx + 1100, 0, picMerge)
	Pic.Draw (bg, -posx + 1500, 0, picMerge)
	Draw.FillPolygon (spikesx, spikesy, 3, brightblue)
	Draw.FillPolygon (spikes2x, spikesy, 3, brightblue)
	drawfillbox (370, 0, 210, 50, 53)
	drawfillbox (0, 0, 210, 50, brown)
	drawfillbox (370, 0, maxx, 50, brown)
	Input.KeyDown (chars)
	if chars ('q') then
	    exit
	end if

	% to make the player move
	if chars (KEY_LEFT_ARROW) then
	    velx := -RUN_SPEED
	elsif chars (KEY_RIGHT_ARROW) then
	    velx := RUN_SPEED
	else
	    velx := 0
	end if

	% remember, in order to jump you MUST be on the ground when pressing UP
	if chars (KEY_UP_ARROW) and posy = GROUND_HEIGHT then
	    vely := JUMP_SPEED
	end if

	% subtract your "gravity" constant from the velocity EACH frame
	vely -= GRAVITY
	posx += round (velx)
	posy += round (vely)

	% simple "collision" check. just makes sure the player stays above ground
	if posy < GROUND_HEIGHT then
	    posy := GROUND_HEIGHT
	    vely := 0
	end if

	% different colours just to illustrate whether or not you may jump
	if posy = GROUND_HEIGHT then
	    Pic.Draw (sanic, posx, posy, picMerge)
	else
	    Pic.Draw (sanic, posx, posy, picMerge)

	end if
	if posx = 940 then
	    LV2
	end if
	if posx > 80 and posy = GROUND_HEIGHT and posx < 300 then
	    posx := -50
	    deathtoll := deathtoll + 1
	    delay (500)
	end if
	if posx > 370 and posx < 470 and posy = GROUND_HEIGHT then
	    posx := -50
	    deathtoll := deathtoll + 1
	end if
	if posx > 570 and posx < 670 and posy = GROUND_HEIGHT then
	    posx := -50
	    deathtoll := deathtoll + 1
	end if
	put deathtoll
	put "Death Toll                          Spikes and water will kill you"
	View.Update
	delay (20)
	cls
	Pic.Free (sanic)

    end loop
end loop
end LV1

%StartScreen
View.Update
	delay (20)
setscreen ("graphics:1000;500")
var draw : int := GUI.CreateButtonFull (maxx div 2, maxy div 2, 0, "Start",
	    LV1, 0, '^D', true)
		    Draw.Text ("Sanic Generations", 300, 400, font, black) 

	var quitBtn : int := GUI.CreateButton (200, 10, 0, "Quit", GUI.Quit)
	loop
	    exit when GUI.ProcessEvent
	end loop

