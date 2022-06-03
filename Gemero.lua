
local NpcId = 200005 	--> Asigna el Entry del NPC que correrá el Script.

local q,ro,na,am,ve,az,mo,bl = 'Escribe la cantidad (Max 20)','|cffed0000','|cffff9900','|cffffe600','|cff00d100','|cff0048ff','|cff7500b5','|cffffffff'

local ids,ing,max = {
	[1]={40111,40114,40112,40116,40117,40118,40113,40115},
	[2]={40162,40144,40147,40150,40154,40158,40143,40146,40161,40148,40142,40149,40151,40152,40157,40155,40163,40145,40160,40159,40153,40156},
	[3]={40123,40127,40128,40125,40124,40126},
	[4]={40175,40167,40179,40169,40174,40165,40177,40171,40178,40180,40170,40182,40172,40168,40176,40181,40164,40173,40166},
	[5]={40121,40119,40120,40122},
	[6]={40136,40139,40132,40141,40137,40135,40140,40133,40138,40134,40130,40129,40131},
	[7]={41380,41389,41395,41285,41307,41377,41333,41335,41396,41378,41379,41401,41385,41381,41397,41398,41376,41339,41400,41375,41382}
},'Ingresa un numéro entero del 1 al 20.','El máximo son 20 gemas por transacción.'
local menu = {
	[0]={
		{0,ro.."Rojo",					1,0},
		{0,na.."Naranja",				2,0},
		{0,am.."Amarillo",				3,0},
		{0,ve.."Verde",					4,0},
		{0,az.."Azul",					5,0},
		{0,mo.."Morado",				6,0},
		{0,bl.."Meta",					7,0},
		{1,mo.."[Lágrima de pesadilla]",8,0},
	  --{1,az.."[Hebilla eterna]",9,0},
		{1,az.."[Ojo de dragón]",10,0}},
	[1]={
		{1, ro.."1-|r Fuerza", 								1, 1, true, q},
		{1, ro.."2-|r Poder de ataque", 					1, 2, true, q},
		{1, ro.."3-|r Agilidad", 							1, 3, true, q},
		{1, ro.."4-|r Índice de parada", 					1, 4, true, q},
		{1, ro.."5-|r Índice de penetración de armadura", 	1, 5, true, q},
		{1, ro.."6-|r Índice de pericia", 					1, 6, true, q},
		{1, ro.."7-|r Poder con hechizos",					1, 7, true, q},
		{1, ro.."8-|r Índice de esquivar", 					1, 8, true, q},
		{7, "...Atrás", 0, 0}},
	[2]={
		{1, na.."1-|r Pericia y golpe", 				2, 1, true, q},
		{1, na.."2-|r Fuerza y defensa", 				2, 2, true, q},
		{1, na.."3-|r Agilidad y crítico", 				2, 3, true, q},
		{1, na.."4-|r Agilidad y celeridad", 			2, 4, true, q},
		{1, na.."5-|r Poder con hechizos y temple",		2, 5, true, q},
		{1, na.."6-|r Poder de ataque y temple", 		2, 6, true, q},
		{1, na.."7-|r Fuerza y golpe", 					2, 7, true, q},
		{1, na.."8-|r Fuerza y celeridad", 				2, 8, true, q},
		{1, na.."9-|r Parada y defensa", 				2, 9, true, q},
		{1, na.."10-|r Agilidad y golpe", 				2, 10, true, q},
		{1, na.."11-|r Fuerza y crítico", 				2, 11, true, q},
		{1, na.."12-|r Agilidad y temple", 				2, 12, true, q},
		{1, na.."13-|r Poder con hechizos e intelecto", 2, 13, true, q},
		{1, na.."14-|r Poder con hechizos y crítico", 	2, 14, true, q},
		{1, na.."15-|r Poder de ataque y golpe", 		2, 15, true, q},
		{1, na.."16-|r Poder con hechizos y celeridad", 2, 16, true, q},
		{1, na.."17-|r Pericia y defensa", 				2, 17, true, q},
		{1, na.."18-|r Fuerza y temple", 				2, 18, true, q},
		{1, na.."19-|r Esquivar y defensa", 			2, 19, true, q},
		{1, na.."20-|r Poder de ataque y celeridad", 	2, 20, true, q},
		{1, na.."21-|r Poder con hechizos y golpe", 	2, 21, true, q},
		{1, na.."22-|r Poder de ataque y crítico",		2, 22, true, q},
		{7, "...Atrás", 0, 0}},
	[3]={
		{1, am.."1-|r Intelecto", 				3, 1, true, q},
		{1, am.."2-|r Índice de temple", 		3, 2, true, q},
		{1, am.."3-|r Índice de celeridad", 	3, 3, true, q},
		{1, am.."4-|r Índice de golpe", 		3, 4, true, q},
		{1, am.."5-|r Índice de golpe crítico", 3, 5, true, q},
		{1, am.."6-|r Índice de defensa", 		3, 6, true, q},
		{7, "...Atrás", 0, 0}},
	[4]={
		{1, ve.."1-|r Intelecto y mp5", 					4, 1, true, q},
		{1, ve.."2-|r Defensa y aguante", 					4, 2, true, q},
		{1, ve.."3-|r Celeridad y mp5", 					4, 3, true, q},
		{1, ve.."4-|r Celeridad y aguante", 				4, 4, true, q},
		{1, ve.."5-|r Celeridad y espíritu", 				4, 5, true, q},
		{1, ve.."6-|r Crítico y aguante", 					4, 6, true, q},
		{1, ve.."7-|r Golpe y mp5", 						4, 7, true, q},
		{1, ve.."8-|r Crítico y espíritu", 					4, 8, true, q},
		{1, ve.."9-|r Temple y mp5", 						4, 9, true, q},
		{1, ve.."10-|r Crítico y penetración de hechizo", 	4, 10, true, q},
		{1, ve.."11-|r Intelecto y espíritu", 				4, 11, true, q},
		{1, ve.."12-|r Celeridad y penetración de hechizo", 4, 12, true, q},
		{1, ve.."13-|r Golpe y espíritu", 					4, 13, true, q},
		{1, ve.."14-|r Temple y aguante",					4, 14, true, q},
		{1, ve.."15-|r Crítico y mp5", 						4, 15, true, q},
		{1, ve.."16-|r Golpe y penetración de hechizo", 	4, 16, true, q},
		{1, ve.."17-|r Intelecto y aguante", 				4, 17, true, q},
		{1, ve.."18-|r Temple y espíritu", 					4, 18, true, q},
		{1, ve.."19-|r Golpe y aguante", 					4, 19, true, q},
		{7, "...Atrás", 0, 0}},
	[5]={
		{1, az.."1-|r Mp5", 					5, 1, true, q},
		{1, az.."2-|r Aguante", 				5, 2, true, q},
		{1, az.."3-|r Espíritu", 				5, 3, true, q},
		{1, az.."4-|r Penetración de hechizo", 	5, 4, true, q},
		{7, "...Atrás", 0, 0}},
	[6]={
		{1, mo.."1-|r Poder de ataque y aguante", 			6, 1, true, q},
		{1, mo.."2-|r Parada y aguante", 					6, 2, true, q},
		{1, mo.."3-|r Hechizo y aguante", 					6, 3, true, q},
		{1, mo.."4-|r Pericia y aguante", 					6, 4, true, q},
		{1, mo.."5-|r Poder de ataque y mp5", 				6, 5, true, q},
		{1, mo.."6-|r Hechizo y penetración de hechizo", 	6, 6, true, q},
		{1, mo.."7-|r Penetración de armadura y aguante",	6, 7, true, q},
		{1, mo.."8-|r Hechizo y espíritu", 					6, 8, true, q},
		{1, mo.."9-|r Esquivar y aguante", 					6, 9, true, q},
		{1, mo.."10-|r Hechizo y mp5", 						6, 10, true, q},
		{1, mo.."11-|r Agilidad y aguante", 				6, 11, true, q},
		{1, mo.."12-|r Fuerza y aguante", 					6, 12, true, q},
		{1, mo.."13-|r Agilidad y mp5", 					6, 13, true, q},
		{7, "...Atrás", 0, 0}},
	[7]={
		{1, bl.."1-|r 32 aguante y 2% armadura", 				7, 1, true, q},
		{1, bl.."2-|r 21 crítico y 2% maná", 					7, 2, true, q},
		{1, bl.."3-|r 25 hechizo y -2% amenaza", 				7, 3, true, q},
		{1, bl.."4-|r 21 crítico y +3% daño cítico", 			7, 4, true, q},
		{1, bl.."5-|r 21 crítico y 1% reflejo de hechizos", 	7, 5, true, q},
		{1, bl.."6-|r 32 aguante -2% daño recib. hechizos", 	7, 6, true, q},
		{1, bl.."7-|r 25 hechizo y 2% intelecto", 				7, 7, true, q},
		{1, bl.."8-|r 21 crítico y -10% duración frenado", 		7, 8, true, q},
		{1, bl.."9-|r 21 defensa y +5% valor de bloqueo", 		7, 9, true, q},
		{1, bl.."10-|r 25 hechizo y -10% duración silencio", 	7, 10, true, q},
		{1, bl.."11-|r 21 crítico y -10% duración miedo", 		7, 11, true, q},
		{1, bl.."12-|r 21 intelecto y prob. restaurar maná", 	7, 12, true, q},
		{1, bl.."13-|r 42 ataque y a veces sana con críticos",	7, 13, true, q},
		{1, bl.."14-|r 42 ataque y -10% duración aturdir", 		7, 14, true, q},
		{1, bl.."15-|r 32 aguante y -10% duración aturdir", 	7, 15, true, q},
		{1, bl.."16-|r 21 agilidad y +3% daño crítico", 		7, 16, true, q},
		{1, bl.."17-|r 11 mp5 y +3% sanación crítica", 			7, 17, true, q},
		{1, bl.."18-|r 42 ataque y mín. aumento carrera", 		7, 18, true, q},
		{1, bl.."19-|r Prob. aum. veloc. melee y rango", 		7, 19, true, q},
		{1, bl.."20-|r 25 hechizo y mín. aumento carrera", 		7, 20, true, q},
		{1, bl.."21-|r 25 hechizo y -10% duración aturdir",		7, 21, true, q},
		{7, "...Atrás", 0, 0}}}

local function Saludo(E,P,U)
	P:GossipClearMenu()
	for m=1, #menu[0] do local a,b,c,d = table.unpack(menu[0][m]) P:GossipMenuAddItem(a,b,c,d) end
    P:GossipSendMenu(1,U)
end

local function MenuClick(E,P,U,S,I,code) P:GossipClearMenu()

	if S==0 and I==0 then Saludo(E,P,U) end
	if S==8 and I==0 then P:AddItem(49110,1) Saludo(E,P,U) return end
  --if S==9 and I==0 then P:AddItem(41611,1) Saludo(E,P,U) return end 
	if S==10 and I==0 then P:AddItem(42225,1) Saludo(E,P,U) return end

	if S >= 1 then 
		for a=1,#menu[S] do local a,b,c,d,e,f = table.unpack(menu[S][a]) P:GossipMenuAddItem(a,b,c,d,e,f) end 
		P:GossipSendMenu(1,U) 
	end

	if I >= 1 then 
		local nume = tonumber(code)
		if nume==nil then U:SendUnitSay(ing,0) P:GossipComplete() return end
		local num =  math.floor(nume)
		
		if num<=0 then U:SendUnitSay(ing,0) P:GossipComplete() return end

		if num >=1 and num <=20 then 
			P:AddItem(ids[S][I],num) 
		else 
			U:SendUnitSay(max,0) 
		end
	end	
end
RegisterCreatureGossipEvent(NpcId, 1, Saludo)
RegisterCreatureGossipEvent(NpcId, 2, MenuClick)
