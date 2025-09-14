program ejparcial1.pas;

type
cliente = record
cod: integer; 
dia: integer;
pesoPaq: real;
end;

envioLeido = record
cli: cliente;
cp: integer;
end;

lista = ^nodoL;
nodoL = record
dato: cliente;
sig: lista;
end;

datosEnvios = record
codPostal: integer; 
listaE: lista;
end;

arbolE = ^nodoA;
nodoA = record
dato: datosEnvios;
hi: arbolE;
hd: arbolE;
end;

procedure leerEnvio(var e: envioLeido);
begin
if (e.cp<>0) then begin
	e.cli.dia:=Random(30)+1;
	e.cli.pesoPaq:=Random(20000)/(Random(10)+1);
end;
end;

procedure AgregaraArbol(e: envioLeido ; var a: arbol);
var
aux: datosEnvios;
begin
if (a=nil) then begin
	new (aux);
	aux^.codPostal:=e.cp;
	aux^.listaE:=nil;
	agregarAdelante(aux^.dato.mensaje, 
	

end;

procedure CargarArbol(var a: arbolE);
var e: envioLeido; 
begin
LeerEnvio(e);
while (e.cp<>0) do begin
	AgregaraArbol(e, a);
	LeerEnvio(e);
	end;

end;

var
a: arbolE;
begin
a:=nil;
CargarArbol(a);

end.
