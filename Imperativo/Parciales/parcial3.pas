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
  // Para simular la lectura aleatoria
  a.dniArtesano := Random(5) ;
  a.id := Random(100) + 1;          // ID de artesanía del 1 al 100
  a.codMat := Random(8) + 1;        // Código de material 1..8
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

// Muestra la cantidad de artesanías por material
procedure MostrarVector(v: vecCat);
var i: integer;
begin
  writeln('Cantidad de artesanias por material:');
  for i := 1 to 8 do
    writeln('Material ', i, ': ', v[i]);
end;

// Recorre el árbol en orden (in-order) mostrando DNI y cantidad de artesanías
procedure MostrarArbol(a: arbol);
begin
  if a <> nil then
  begin
    MostrarArbol(a^.hi);
    writeln('DNI: ', a^.dato.dni, ' - Cantidad de artesanias: ', a^.dato.cantArt);
    MostrarArbol(a^.hd);
  end;
end;



procedure InicializarVector(var v: vecCat);
var i: integer;
begin
for i:=1 to 8 do 
	v[i]:=0;
end;
var 
a: arbol; 
v: vecCat;
begin
  Randomize;
  a := nil;
  InicializarVector(v);
  cargarDatos(a, v);

  // Mostrar resultados
  MostrarVector(v);
  MostrarArbol(a);
end.
