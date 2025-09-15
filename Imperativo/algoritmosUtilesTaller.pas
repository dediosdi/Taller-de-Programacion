program algoritmosUtiles.pas

procedure AgregaraArboldeListas(var a: arbol; v: venta);
var aux: arbol;
begin
  if (a = nil) then begin
    aux^.dato.cod := v.codProd;
    aux^.dato.ventas := nil;
    AgregarALista(a^.dato.ventas, v);
    aux^.hi := nil;
    aux^.hd := nil;
    a:=aux;
  end
  else if (a^.dato.cod = v.codProd) then
    AgregarALista(a^.dato.ventas, v)
  else if (a^.dato.cod > v.codProd) then
    AgregaraArboldeListas(a^.hi, v)
  else
    AgregaraArboldeListas(a^.hd, v);
end;



procedure AgregarArboldeRegistros(var a: arbolP; cod, cant: integer);
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
    AgregarArboldeRegistros(a^.hi, cod, cant)
  else
    AgregarArboldeRegistros(a^.hd, cod, cant);
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
{p principal:
nodoEncontrado := buscarNodo(codPostal, a);
  if nodoEncontrado <> nil then
    listaEncontrada := nodoEncontrado^.dato.listaE;}

function buscarValorenArbol(valor: integer ; a: arbolE): integer; //ESTO ES SI EL ARBOL ESTA ORDENADO POR ESE MISMO VALOR
begin
	if (a = nil) then 
	buscarValorenArbol:=-1
	else 
	if (a^.dato.codPostal = valor) then
		buscarValorenArbol:= DATODELARBOLARETORNAR
		
	else if (valor>a^.dato.codPostal) then
		buscarValorenArbol:=buscarValorenArbol(valor, a^.hd)
		else 
		buscarValorenArbol:=buscarValorenArbol(valor,a^.hi);
		end;
{p principal:
nodoEncontrado := buscarNodo(codPostal, a);
  if nodoEncontrado <> nil then
    listaEncontrada := nodoEncontrado^.dato.listaE;}
    
function buscarValorenArbolNoOrdenado(a: arbol; d: integer): integer; //ESTO ES SI EL ARBOL NO ESTA ORDENADO POR ESE MISMO VALOR QUE SE BUSCA
begin
  if (a = nil) then
    buscarValorenArbolNoOrdenado := 0
  else begin
    buscarValorenArbolNoOrdenado := buscarValorenArbolNoOrdenado(a^.hi, d) + buscarValorenArbolNoOrdenado(a^.hd, d);
    if (a^.dato.dni = d) then
      buscarValorenArbolNoOrdenado := buscarValorenArbolNoOrdenado + 1;
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

function BuscarEnListaRecursivo(l: lista; v: integer): boolean;
begin
	if l = nil then
		EstaEnLaLista := false
	else if l^.dato = v then
		EstaEnLaLista := true
	else
		EstaEnLaLista := EstaEnLaLista(l^.sig, v);
end;


