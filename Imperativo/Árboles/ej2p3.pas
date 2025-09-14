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

program ArbolesVentas;
type
  venta = record            // registro punto i
    codProd: integer;
    fecha: integer;
    cant: integer;
  end;

  prodVendidos = record     // registro punto ii
    cod: integer;
    cantVendida: integer;
  end;

  lista = ^nodo;
  nodo = record
    dato: venta;
    sig: lista;
  end;

  VentasxProductos = record // registro punto iii
    cod: integer;
    ventas: lista;
  end;

  // Árbol de ventas (punto i)
  arbolV = ^nodoV;
  nodoV = record
    dato: venta;
    hi: arbolV;
    hd: arbolV;
  end;

  // Árbol de productos acumulados (punto ii)
  arbolP = ^nodoP;
  nodoP = record
    dato: prodVendidos;
    hi: arbolP;
    hd: arbolP;
  end;

  // Árbol de listas (punto iii)
  arbolL = ^nodoL;
  nodoL = record
    dato: VentasxProductos;
    hi: arbolL;
    hd: arbolL;
  end;

{--------------- Lectura de una venta aleatoria ----------------}
procedure LeerVenta(var v: venta);
begin
  v.codProd := Random(15);        // valores 0..14
  v.fecha := Random(365) + 1;
  v.cant := Random(50) + 1;
end;

{--------------- Árbol de ventas simples -----------------------}
procedure AgregarArbolVentas(var a: arbolV; v: venta);
var aux: arbolV;
begin
  if (a = nil) then begin
    new(aux);
    aux^.dato := v;
    aux^.hi := nil;
    aux^.hd := nil;
    a := aux;
  end
  else if (a^.dato.codProd > v.codProd) then
    AgregarArbolVentas(a^.hi, v)
  else
    AgregarArbolVentas(a^.hd, v);
end;

{--------------- Árbol de productos acumulados ----------------}
procedure AgregarArbolProductos(var a: arbolP; cod, cant: integer);
var aux: arbolP;
begin
  if (a = nil) then begin
    new(aux);
    aux^.dato.cod := cod;
    aux^.dato.cantVendida := cant;
    aux^.hi := nil;
    aux^.hd := nil;
    a := aux;
  end
  else if (a^.dato.cod = cod) then
    a^.dato.cantVendida := a^.dato.cantVendida + cant
  else if (a^.dato.cod > cod) then
    AgregarArbolProductos(a^.hi, cod, cant)
  else
    AgregarArbolProductos(a^.hd, cod, cant);
end;

{--------------- Árbol de listas (ventas por producto) ---------}
procedure AgregarALista(var l: lista; v: venta);
var aux: lista;
begin
  new(aux);
  aux^.dato := v;
  aux^.sig := l;
  l := aux;
end;

procedure AgregarArbolListas(var a: arbolL; v: venta);
begin
  if (a = nil) then begin
    new(a);
    a^.dato.cod := v.codProd;
    a^.dato.ventas := nil;
    AgregarALista(a^.dato.ventas, v);
    a^.hi := nil;
    a^.hd := nil;
  end
  else if (a^.dato.cod = v.codProd) then
    AgregarALista(a^.dato.ventas, v)
  else if (a^.dato.cod > v.codProd) then
    AgregarArbolListas(a^.hi, v)
  else
    AgregarArbolListas(a^.hd, v);
end;

{--------------- Cargar todos los árboles ----------------------}
procedure CargarArboles(var AP: arbolP; var AV: arbolV; var AL: arbolL);
var v: venta;
begin
  LeerVenta(v);
  while (v.codProd <> 0) do begin
    AgregarArbolVentas(AV, v);                // punto i
    AgregarArbolProductos(AP, v.codProd, v.cant); // punto ii
    AgregarArbolListas(AL, v);                // punto iii
    LeerVenta(v);
  end;
end;

{--------------- Recorridos -----------------------------------}
procedure recorrerInordenVentas(a: arbolV);
begin
  if (a <> nil) then begin
    recorrerInordenVentas(a^.hi);
    writeln('Venta -> Cod: ', a^.dato.codProd, ' Cant: ', a^.dato.cant, ' Fecha: ', a^.dato.fecha);
    recorrerInordenVentas(a^.hd);
  end;
end;

procedure recorrerInordenProductos(a: arbolP);
begin
  if (a <> nil) then begin
    recorrerInordenProductos(a^.hi);
    writeln('Producto -> Cod: ', a^.dato.cod, ' Total vendido: ', a^.dato.cantVendida);
    recorrerInordenProductos(a^.hd);
  end;
end;

procedure recorrerInordenListas(a: arbolL);
var l: lista;
begin
  if (a <> nil) then begin
    recorrerInordenListas(a^.hi);
    writeln('Producto ', a^.dato.cod, ':');
    l := a^.dato.ventas;
    while (l <> nil) do begin
      writeln('   Venta cant=', l^.dato.cant, ' fecha=', l^.dato.fecha);
      l := l^.sig;
    end;
    recorrerInordenListas(a^.hd);
  end;
end;

{--------------- Programa principal ---------------------------}
var
  arbolVentas: arbolV;
  arbolProductos: arbolP;
  arbolLista: arbolL;
begin
  arbolVentas := nil;
  arbolProductos := nil;
  arbolLista := nil;
  Randomize;

  CargarArboles(arbolProductos, arbolVentas, arbolLista);

  writeln('--- Ventas individuales ---');
  recorrerInordenVentas(arbolVentas);
  writeln;
  writeln('--- Productos acumulados ---');
  recorrerInordenProductos(arbolProductos);
  writeln;
  writeln('--- Ventas agrupadas por producto (listas) ---');
  recorrerInordenListas(arbolLista);
end.

