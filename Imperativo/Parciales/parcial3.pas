program parcial3.pas;
type
rangoCod = 1..8;


artesania = record
dniArtesano: integer;
id: integer;
codMat: rangoCod;
end;

datoArtesano = record
dni: integer;
cantArt: integer;
end;


arbol = ^nodoA; 
nodoA = record
dato: datoArtesano;
hi: arbol;
hd: arbol;
end;


vecCat = array [rangoCod] of integer;

procedure AgregarAArbol(art: artesania ; var a: arbol ; var v: vecCat);
var aux: arbol;
begin
if (a = nil) then begin
	new (aux);
	aux^.dato.dni:=art.dniArtesano;
	aux^.dato.cantArt:=1;
	aux^.hi:=nil;
	aux^.hd:=nil;
	a:=aux;
	end
	else
	if (art.dniArtesano = a^.dato.dni) then begin
		a^.dato.cantArt:=a^.dato.cantArt+1;
end	
	else
	if (a^.dato.dni > art.dniArtesano) then 
		AgregarAArbol(art, a^.hi, v)
		else
		AgregarAArbol(art, a^.hd, v);

	v[art.codMat]:=v[art.codMat]+1;


	end;

	
procedure LeerArtesania(var a: artesania);
begin
readln(a.dniArtesano);
readln(a.id);
readln(a.codMat);
end;


procedure cargarDatos(var a: arbol ; var v: vecCat);
var
art: artesania;
begin
LeerArtesania(art);
while (art.dniArtesano <> 0) do begin
	AgregarAArbol(art, a, v);
	LeerArtesania(art);
end;
end;


procedure InicializarVector(var v: vecCat);
var i: integer;
begin
for i:=1 to 7 do 
	v[i]:=0;
end;
var 
a: arbol; 
v: vecCat;
begin
a:=nil;
InicializarVector(v);
cargarDatos(a, v);

end.
