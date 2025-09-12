{2. Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
c. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.}

type
venta = record  //reg punto i.
codProd: integer;
fecha: integer;
cant: integer;
end;

prodVendidos = record  //reg punto ii.
cod: integer;
cantVendida: integer;
end;

lista = ^nodo;
nodo = record
dato: venta;
sig: lista;
end;

VentasxProductos = record //reg punto iii;
cod: integer;
venta: lista;
end;
 

arbolV = ^nodoV; //punto i.
nodoV = record
dato: venta;
hd: arbolV;
hi: arbolV;
end;

arbolP = ^nodoP; //punto ii.
nodoP = record
dato: prodVendidos;
hd: arbolP;
hi: arbolP;
end;
 
arbolL = ^nodoL; //punto iii.
nodoL = record
dato: VentasxProductos;
hd: arbolL;
hi: arbolL;
end; 





procedure LeerVenta(var v: venta);
begin
v.codProd := Random(15);  // valores 0..14
v.fecha := random(365) + 1;
v.cant:=random(50)+1;
end;


procedure AgregaraArbolListas(var a: arbolL ; v: venta);
var aux: arbolV;
l: lista;
begin
if (a = nil) then begin //primer nodo
	new (aux);
	aux^.dato:=v;
	aux^.hi:=nil;
	aux^.hd:=nil;
	a := aux; 
	end
	else 
	if (a^.dato.codProd > v.codProd) then
		AgregaraArbolVentas(a^.hi, v)
		else 
		AgregaraArbolVentas(a^.hd, v);
		end;
	


procedure AgregaraArbolVentas(var a: arbolV ; v: venta);
var aux: arbolV;
begin
if (a = nil) then begin //primer nodo
	new (aux);
	aux^.dato:=v;
	aux^.hi:=nil;
	aux^.hd:=nil;
	a := aux; 
	end
	else 
	if (a^.dato.codProd > v.codProd) then
		AgregaraArbolVentas(a^.hi, v)
		else 
		AgregaraArbolVentas(a^.hd, v);
		end;
	

procedure AgregarArbolProductos(var a: arbolP ; cod, cant: integer);
var aux: arbolP;
begin
if (a = nil) then begin //primer nodo
	new (aux);
	aux^.dato.cod:=cod;
	aux^.dato.cantVendida:=cant;
	aux^.hi:=nil;
	aux^.hd:=nil;
	a:= aux; 
	end
	else begin
		if (a^.dato.cod = cod) then 
		a^.dato.cantVendida:=a^.dato.cantVendida+cant
		else
		if (a^.dato.cod>cod) then
		AgregarArbolProductos(a^.hi, cod, cant)
		else 
		AgregarArbolProductos(a^.hd, cod, cant);
		end;
	end;
	
	

	
{procedure CargarArbolVentas(var a: arbolV);
	var	v: venta;
	begin
		LeerVenta(v);
			while (v.codProd <> 0) do begin
			AgregaraArbolVentas(a, v);
			LeerVenta(v);
	end;
	
end;}

procedure CargarArboles (var AP: arbolP ; var AV: arbolV ; var AL: arbolL);
	var v: venta; 
	l: lista;
	begin
		LeerVenta(v);
		while (v.codProd <> 0) do begin
			AgregaraArbolVentas(av,v); //punto i.
			AgregarArbolProductos(ap, v.codProd, v.cant); //punto ii.
			AgregarArbolListas(al, v.codProd, l); //punto iii.
			LeerVenta(v);
		end;
	end;
	
procedure recorrerInordenVentas(a: arbolV);
begin
    if (a <> nil) then begin
        recorrerInordenVentas(a^.HI);          { 1. Recorro subárbol izquierdo }
        writeln(a^.dato.codProd, ' - Cant: ', a^.dato.cant)1;            { 2. Proceso el nodo actual }
        recorrerInordenVentas(a^.HD);          { 3. Recorro subárbol derecho }
    end;
 
end;

	
procedure recorrerInordenProductos(a: arbolP);
begin
    if (a <> nil) then begin
        recorrerInordenProductos(a^.HI);          { 1. Recorro subárbol izquierdo }
        writeln(' - Codigo: ', a^.dato.cod, ' - Cant: ', a^.dato.cantVendida);           { 2. Proceso el nodo actual }
        recorrerInordenProductos(a^.HD);          { 3. Recorro subárbol derecho }
    end;
end;
var
arbolVentas: arbolV;
arbolProductos: arbolP;
arbolLista: arbolL;
begin
arbolVentas:=nil;
arbolProductos:=nil;
arbolLista:=nil;
Randomize;
CargarArboles(arbolProductos, arbolVentas, arbolListas); 



recorrerInordenVentas(arbolVentas);
recorrerInordenProductos(arbolProductos);



end.
