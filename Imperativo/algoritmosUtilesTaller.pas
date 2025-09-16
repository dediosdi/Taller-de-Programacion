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
    
    
function Minimo(a: arbol): arbol;
begin
  if (a = nil) then
    Minimo := nil
  else if (a^.HI = nil) then
    Minimo := a
  else
    Minimo := Minimo(a^.HI);
end;

function Maximo(a: arbol): arbol;
begin
  if (a = nil) then
    Maximo := nil
  else if (a^.HD = nil) then
    Maximo := a
  else
    Maximo := Maximo(a^.HD);
end;    
    
    

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
    
procedure eliminarNodo(var a: arbol; valor: integer);
var aux: arbol;
begin
  if a <> nil then
    if valor < a^.dato.cod then
      eliminarNodo(a^.hi, valor)
    else if valor > a^.dato.cod then
      eliminarNodo(a^.hd, valor)
    else begin
      if (a^.hi = nil) and (a^.hd = nil) then
        a := nil
      else if a^.hi = nil then
        a := a^.hd
      else if a^.hd = nil then
        a := a^.hi
      else begin
        aux := a^.hd;
        while aux^.hi <> nil do
          aux := aux^.hi;
        a^.dato := aux^.dato;
        eliminarNodo(a^.hd, aux^.dato.cod);
      end;
    end;
end;


function ContarNodos(a: arbol): integer;
begin
  if (a = nil) then
    Contar := 0
  else
    Contar := 1 + Contar(a^.HI) + Contar(a^.HD);
end;

procedure ImprimirArbolDeListas(var a: arbol);
begin
if (a<>nil) do begin
	ImprimirArbolDeListas(a^.hi);
	writeln('DATO QUE ACOMPANIA LA LISTA:',  a^.dato.cod);
	ImprimirLista(a^.dato.lista);
	ImprimirArbolDeListas(a^.hd);

end;
end;

{--------------- Recorridos -----------------------------------}
procedure recorrerEnordenArbolDeRegistros(a: arbolV);
begin
  if (a <> nil) then begin
    recorrerEnordenArbolDeRegistros(a^.hi);
    writeln('Venta -> Cod: ', a^.dato);
    recorrerEnordenArbolDeRegistros(a^.hd);
  end;
end;


procedure recorrerEnordenArbolDeListas(a: arbolL);
var l: lista;
begin
  if (a <> nil) then begin
    recorrerEnordenArbolDeListas(a^.hi);
    writeln('DATO QUE ACOMPANIA LA LISTA EN EL ARBOL:: ', a^.dato.cod, ':');
    l := a^.dato.lista;
    while (l <> nil) do begin
      writeln('   Venta cant=', l^.dato.cant, ' fecha=', l^.dato.fecha);
      l := l^.sig;
    end;
    recorrerEnordenArbolDeListas(a^.hd);
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



procedure ImprimirVectorRecursivo (V: vectorOficinas ; dimL: integer);
begin
	if (dimL > 0) then begin
		ImprimirVectorRecursivo(V, dimL-1);
		writeln ('----------------------------------------------');
		writeln ('--------CODIGO ID DE LA OFICINA: ',V[dimL].id, '---------');
		writeln ('--------DNI DEL PROPIETARIO: ',V[dimL].dni, '---------'); writeln;
	end;
end;


	{----------------------------------------
	-------ORDENACION POR SELECCION---------
	----------------------------------------}
procedure seleccion (var v: vectorOficinas; dimL: integer);
var i, j, pos: integer; item: integer;	
			begin
			 for i:=1 to dimL-1 do begin {busca el mínimo y guarda en pos la posición}
				pos := i;
				for j := i+1 to dimL do
					 if v[j].id < v[pos].id then 
					 pos:=j; {intercambia v[i] y v[p]}
					 item := v[j].id;
					 v[ pos ].id := v[i].id;   
					 v[i].id := item;
				  end;
		end;
				
	{----------------------------------------
	-------ORDENACION POR INSERCION---------
	----------------------------------------}

procedure insercion (var v: vectorOficinas; dimL: integer );
var
i, j: integer; actual: integer;	
				
begin
for i:= 2 to dimL do begin 
actual:= v[i].id;
 j:= i-1; 
 while (j > 0) and (v[j].id > actual) do begin
v[j+1].id:= v[j].id;
 j:= j - 1;                  
  end;  
 v[j+1].id:= actual; 
end;
end;

procedure PreOrden(a: arbol);
begin
  if (a <> nil) then begin
    writeln(a^.dato);
    PreOrden(a^.HI);
    PreOrden(a^.HD);
  end;
end;

procedure PostOrden(a: arbol);
begin
  if (a <> nil) then begin
    PostOrden(a^.HI);
    PostOrden(a^.HD);
    writeln(a^.dato);
  end;
end;

procedure BuscarNodo(a: arbol; x: integer; var ok: boolean);
begin
  if (a = nil) then
    ok := false
  else if (a^.dato = x) then
    ok := true
  else begin
    BuscarNodo(a^.HI, x, ok);
    if (not ok) then
      BuscarNodo(a^.HD, x, ok);
  end;
end;

procedure AgregarAListaRecursivo(var L: lista; v: venta);
var
  nuevo: lista;
begin
  if L = nil then begin
    new(nuevo);
    nuevo^.dato := v;
    nuevo^.sig := nil;
    L := nuevo;
  end
  else
    AgregarAListaRecursivo(L^.sig, v);
end;


{ Cuenta la cantidad de nodos en un árbol. }
function ContarNodos(a: arbol): integer;
begin
  if (a = nil) then
    ContarNodos := 0
  else
    ContarNodos := 1 + ContarNodos(a^.hi) + ContarNodos(a^.hd);
end;
