
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

procedure AgregarAdelante(var num: integer; var L: lista);
var aux: lista;
begin
new(aux);
aux^.dato:=num;
aux^.sig:=L;
end;

procedure GenerarListaRecursivo(l: lista);
var
num: integer;
begin
num:=0;

while (num <> 100) do begin
	num:=Random(200-100)+1;
	AgregarAdelante(num, l);
	GenerarListaRecursivo(l);
end;
end;


var
l: lista;
begin
l:=nil;
Randomize;
GenerarListaRecursivo(l);
Imprimir(l);
ImprimirInverso(l);}

end.
