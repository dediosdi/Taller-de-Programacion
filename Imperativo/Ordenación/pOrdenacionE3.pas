{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
septiembre de 2025. De cada película se conoce: código de película, código de género (1:
acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y
puntaje promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c). }
program ej2p1.pas;
const
totalGeneros = 8;
type
rangoGenero = 1..totalGeneros;

pelicula = record
codigoPelicula: integer;
puntaje: real;
end; 

lista = ^nodo;
nodo = record
dato: pelicula;
sig: lista;
end;

vector = array [rangoGenero] of lista; //vector de listas
vPuntajes = array rangoGenero 

Procedure InicializarVectorDeListas(var pri: vector ; var ult: vector);
var
i: integer;
begin
    for i := 1 to totalGeneros do begin
        pri[i] := nil;
        ult[i] := nil;
    end;
end;

procedure AgregarAlVector(codGenero: rangoGenero ; var pri: vector ; var ult: vector ; p:pelicula);
var
aux: lista;
begin
	new (aux);
	aux^.dato:=p;
	aux^.sig:=nil;

    if (pri[codGenero] = nil) then //Si es el primer nodo de la lista
    begin
        pri[codGenero] := aux;   //el primer nodo queda con P
        ult[codGenero] := aux;   //el ultimo nodo queda con P
	end
	else begin //si no es el primer nodo
		ult[codGenero]^.sig := aux; //en el campo siguiente del ultimo le pongo el valor del que agregue recien
		ult[codGenero]:= aux;      // Actualizo puntero al último
    end;
end;

procedure LeerPelicula(var p: pelicula ; var codigo: rangoGenero);
begin
	readln (codigo);
	readln (p.codigoPelicula);
	readln (p.puntaje);
end;

procedure CargarLista(var pri,ult: vector);
var p: pelicula;
codCat: rangoGenero;
begin
	LeerPelicula(p, codCat);
	while (p.codigoPelicula <> -1) do begin
		AgregarAlVector(codCat, pri, ult, p);
		LeerPelicula(p, codCat);
	end;
end;





var
pri: vector;
ult: vector;
begin
InicializarVectorDeListas(pri, ult);
CargarLista(pri, ult);
end.

