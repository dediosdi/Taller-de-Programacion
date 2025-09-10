{3.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).
b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)
c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}
program e3p2.pas;
const
dimF=20;

type
vector = array [1..dimF] of integer;

procedure CargarVector(var v: vector ; dimL: integer);
begin
if (dimL <= dimF) then begin
	v[dimL]:=Random(1251)+300;
	CargarVector(v,dimL+1);
	end;
end;

procedure OrdenarVector(var v: vector);
var 
    i, j, pos: integer;
    aux: integer;
begin
    for i := 1 to dimF-1 do begin
        pos := i;
        for j := i+1 to dimF do
            if v[j] < v[pos] then
                pos := j;
        aux := v[pos];
        v[pos] := v[i];
        v[i] := aux;
    end;
end;

procedure MostrarVector(v: vector ; dimL: integer);
begin
if (dimL <= dimF) then begin
    writeln(v[dimL]);
    MostrarVector(v, dimL + 1);
	end;
end

procedure busquedaDicotomica(v: vector; ini, fin: integer; dato: integer; var pos: integer);
var
  medio: integer;
begin
  if (ini > fin) then
    pos := -1  { Caso base: no está }
  else begin
    medio := (ini + fin) div 2;
    if (v[medio] = dato) then
      pos := medio
    else if (dato < v[medio]) then
      busquedaDicotomica(v, ini, medio-1, dato, pos)  { Buscar izquierda }
    else
      busquedaDicotomica(v, medio+1, fin, dato, pos); { Buscar derecha }
  end;
end;



end;

var
v: vector;
dimL: integer;
begin
dimL:=1;
Randomize;
CargarVector(v, dimL); //PUNTO A

writeln('Vector generado:');
MostrarVector(v, dimL);

OrdenarVector(v); //PUNTO B
writeln ('Vector ordenado:');
MostrarVector(v, dimL);
busquedaDicotomica(v: vector, ini, fin, dato: integer;  pos: integer); //terminar

end.
