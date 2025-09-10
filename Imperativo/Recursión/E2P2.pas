
{2.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}


program ej2p2.pas;

type
lista = ^nodo;
nodo = record
dato: integer;
sig: lista;
end;

procedure AgregarAdelante(num: integer; var L: lista);
var aux: lista;
begin
new(aux);
aux^.dato:=num;
aux^.sig:=L;
L:=aux;
end;

procedure GenerarListaRecursivo(var l: lista);
var num: integer;
begin
	num:=Random(101)+100;
	if (num <> 100) then begin
		AgregarAdelante(num, l);
		GenerarListaRecursivo(l);
		end;
end;

procedure ImprimirRecursivo(l: lista);
begin
if (l<>nil) then begin
	writeln (l^.dato);
	ImprimirRecursivo (l^.sig);
	end;
end;

procedure ImprimirRecursivoInverso(l: lista);
begin
if (l<>nil) then begin
	ImprimirRecursivoInverso (l^.sig);
	writeln (l^.dato);

	end;
end;

function Minimo(L: lista): integer;
var
    minResto: integer;
begin
    if L^.sig = nil then
        Minimo := L^.dato
    else begin
        minResto := Minimo(L^.sig);
        if L^.dato < minResto then
            Minimo := L^.dato
        else
            Minimo := minResto;
    end;
end;

function EstaEnLaLista(l: lista; v: integer): boolean;
begin
	if l = nil then
		EstaEnLaLista := false
	else if l^.dato = v then
		EstaEnLaLista := true
	else
		EstaEnLaLista := EstaEnLaLista(l^.sig, v);
end;



var
l: lista;
valor: integer;
begin
l:=nil;
Randomize;
GenerarListaRecursivo(l); //PUNTO A
writeln ('Impresion recursiva:');
ImprimirRecursivo(l); //PUNTO B
writeln ('Impresion recursiva en orden inverso:');
ImprimirRecursivoInverso(l); //PUNTO C
writeln('El minimo es: ', Minimo(l)); //PUNTO D
writeln('Ingrese un valor para comprobar si esta en la lista');
readln(valor);
if EstaEnLaLista(l, valor) then //PUNTO E
	writeln(true) 
	else
	writeln(false);
end.
