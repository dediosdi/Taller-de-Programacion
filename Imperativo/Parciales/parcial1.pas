{El Correo Argentino necesita procesar los envíos entregados durante el mes de Julio de 2024. De cada envío se conoce el código del cliente, día, código postal y peso del paquete.

a) Implementar un módulo que lea envíos, genere y retorne un árbol binario de búsqueda ordenado por código postal, donde para cada código postal se almacenen en una lista todos los envíos (código de cliente, día y peso del paquete) correspondientes. La lectura finaliza con código de cliente 0. Se sugiere utilizar el módulo leerEnvio().

b) Implementar un módulo que reciba la estructura generada en a) y un código postal, y retorne todos los envíos de dicho código postal.

c) Realizar un módulo recursivo que reciba la estructura que retorna el Inciso b) y retorne los dos códigos de cliente correspondientes al envío con mayor y menor peso.}



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
	e.cli.cod:=Random(10);
	e.cli.dia:=Random(30)+1;
	e.cli.pesoPaq:=Random(20000)/(Random(10)+1);
	e.cp:=random(20);
end;
procedure agregarAdelante(c: cliente ; var l: lista);
var
aux: lista;
begin
new(aux);
aux^.dato:=c;
aux^.sig:=l;
l:=aux;
end;


procedure AgregaraArbol(e: envioLeido ; var a: arbolE);
var
aux: arbolE;
begin
if (a=nil) then begin
	new (aux);
	aux^.dato.codPostal:=e.cp;
	aux^.dato.listaE:=nil;
	agregarAdelante(e.cli, aux^.dato.listaE);
	aux^.hi:=nil; 
	aux^.hd:=nil; 
	a:=aux;
	end
 else begin
 if (a^.dato.codPostal = e.cp) then
	AgregarAdelante(e.cli, a^.dato.listaE)
	else
 if (a^.dato.codPostal > e.cp) then
 AgregaraArbol(e, a^.hi)
 else
  AgregaraArbol(e, a^.hd);
end;
 

end;


procedure CargarArbol(var a: arbolE);
var e: envioLeido; 
begin
LeerEnvio(e);
while (e.cli.cod<>0) do begin
	AgregaraArbol(e, a);
	LeerEnvio(e);
	end;

end;

function buscarNodo(cod: integer ; a: arbolE): arbolE;
begin
	if (a = nil) then 
	buscarNodo:=nil
	else 
	if (a^.dato.codPostal = cod) then
		buscarNodo:= a
	else if (cod>a^.dato.codPostal) then
		buscarNodo:=buscarNodo(cod, a^.hd)
		else 
		buscarNodo:=BuscarNodo(cod,a^.hi);
		end;

var
a: arbolE;
codPostal: integer;
nodoEncontrado: arbolE;
listaEncontrada: lista;
begin
a:=nil;
Randomize;
CargarArbol(a);
codPostal:=2;
nodoEncontrado := buscarNodo(codPostal, a);
  if nodoEncontrado <> nil then
    listaEncontrada := nodoEncontrado^.dato.listaE;
  
end.
