{4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 6) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio -1.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 20 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 20 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 20, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).
}

const
totalRubros = 6;
type
rangoRubros = 1..totalRubros;

producto = record
cod: integer;
rubro: rangoRubros;
precio: real;
end;

lista = ^nodo;
nodo = record
dato: producto;
sig: lista;
end;

vecProductos = array [rangoRubros] of lista; //6 lugares donde va a haber un puntero en cada campo
vecProdRubro3 = array [1..20] of 

procedure LeerProductos (var p: producto);
begin
	p.cod:=random(800)+1; //Aleatorio entre 1 y 800 (excluye 0)
	p.rubro:=random(totalRubros)+1; //Aleatorio entre 1 y totalRubros 
	  // Simulamos que a veces se termina la carga
  if random(20) = 0 then  // 1 de cada 20 productos será -1
    p.precio := -1
  else
    p.precio := random(800) + 1;

end;


procedure InsertarOrdenado(var V: vecProductos; p: producto);
var
  aux, act, ant: lista;
begin
	new(aux);
	aux^.dato := p;
	aux^.sig := nil;

	act := V[p.rubro];
	ant := nil;

  // Busca la posición correcta en la lista del rubro
	while (act <> nil) and (act^.dato.cod < p.cod) do begin
		ant := act;
		act := act^.sig;
	end;

	if ant = nil then // Inserta al inicio
		V[p.rubro] := aux
	else
		ant^.sig := aux;
		aux^.sig := act;
end;

procedure CargarDatos (var v: vecProductos);
var
p: producto;
begin
LeerProductos(p);
while (p.precio <> -1) do begin
	InsertarOrdenado(v, p);
	LeerProductos(p);
end;
end;

procedure InicializarVector(var v: vecProductos);
var i: integer;
begin
	for i:=1 to totalRubros do begin
	v[i]:=nil;
	end;
end;

procedure MostrarProductosPorRubro(V: vecProductos);
var
  i: integer;
  aux: lista;
begin
  for i := 1 to totalRubros do
  begin
    writeln('Rubro ', i, ':');
    aux := V[i];
    while aux <> nil do
    begin
      writeln('  Codigo: ', aux^.dato.cod);
      aux := aux^.sig;
    end;
  end;
end;

var
V: vecProductos;
begin
Randomize;
InicializarVector(v);
CargarDatos (v); //PUNTO A
MostrarProductosPorRubro(v); //PUNTO B





end.
