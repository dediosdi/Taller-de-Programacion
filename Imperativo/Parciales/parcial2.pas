program parcial2.pas;
type
totalDias = 1..7;


datosCli = record
dni: integer;
nroChasis: integer;
end;

arbol = ^nodo;
nodo = record
dato: datosCli;
hi: arbol;
hd: arbol;
end;

vecDias = array [totalDias] of arbol;

alquiler = record //Estructura para facilitar el ingreso de datos
cli: datosCli;
dias: totalDias;
end;



procedure AgregarArbol(var a: arbol ; cli: datosCli);
var aux: arbol;
begin
	if (a=nil) then begin
		new (aux);
		aux^.dato:=cli;
		aux^.hi:=nil;
		aux^.hd:=nil;
		a:=aux;
		end
	else if (cli.nroChasis < a^.dato.nroChasis) then
   AgregarArbol(a^.hi, cli)
else
   AgregarArbol(a^.hd, cli);

end;

procedure LeerDatos(var r: alquiler);
begin
  readln(r.cli.dni);
  readln(r.cli.nroChasis);
  readln(r.dias);
end;

procedure CargarVector(var v: vecDias); 
var
r: alquiler;
begin
LeerDatos(r);
while (r.cli.nroChasis <> 0) do begin
	AgregarArbol(v[r.dias], r.cli); //Le paso un arbol y un cliente
	LeerDatos(r);
	end;
end;

procedure InicializarVector(var v: vecDias);
var
i: integer;
begin
for i:=1 to 7 do 
	V[i]:=nil;
	end;
function ContarPorDni(a: arbol; d: integer): integer;
begin
  if (a = nil) then
    ContarPorDni := 0
  else begin
    ContarPorDni := ContarPorDni(a^.hi, d) + ContarPorDni(a^.hd, d);
    if (a^.dato.dni = d) then
      ContarPorDni := ContarPorDni + 1;
  end;
end;

function TotalPorDni(v: vecDias; d: integer): integer;
var i: integer;
begin
  TotalPorDni := 0;
  for i:=1 to 7 do
    TotalPorDni := TotalPorDni + ContarPorDni(v[i], d);
end;

{--- Inciso c: cantidad por dia y rango de chasis ---}

function ContarPorRango(a: arbol; n1, n2: integer): integer;
begin
  if (a = nil) then
    ContarPorRango := 0
  else begin
    if (a^.dato.nroChasis < n1) then
      ContarPorRango := ContarPorRango(a^.hd, n1, n2)
    else if (a^.dato.nroChasis > n2) then
      ContarPorRango := ContarPorRango(a^.hi, n1, n2)
    else { n1 <= nroChasis <= n2 }
      ContarPorRango := 1 + ContarPorRango(a^.hi, n1, n2) + ContarPorRango(a^.hd, n1, n2);
  end;
end;

{--- Programa principal ---}
var
  v: vecDias;
  dni, cantDni: integer;
  dia, n1, n2, cantRango: integer;
begin
  InicializarVector(v);
  CargarVector(v);

  writeln('Ingrese un DNI para consultar: ');
  readln(dni);
  cantDni := TotalPorDni(v, dni);
  writeln('Cantidad de alquileres del DNI ', dni, ': ', cantDni);

  writeln('Ingrese un dia (1..7): '); readln(dia);
  writeln('Ingrese nro de chasis minimo: '); readln(n1);
  writeln('Ingrese nro de chasis maximo: '); readln(n2);
  cantRango := ContarPorRango(v[dia], n1, n2);
  writeln('Cantidad de alquileres en el dia ', dia, ' entre chasis ', n1, ' y ', n2, ': ', cantRango);
end.
