{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.'
}

program pOrdenacionE1.pas;

const
dimF = 5;
type
oficina = record
id: integer;
dni: integer;
expensa: real;
end;

vectorOficinas = array [1..dimF] of oficina;

{----------------------------------------
----------LECTOR DE OFICINA--------------
----------------------------------------}

procedure LeerOficinas (var o: oficina);
begin

    o.id := random(300)+1; //Aleatorio entre 1 y 300 (excluye 0)
    o.dni := random(90000000) + 10000000; //GenerarAleatorio(90000000) devuelve números entre 0 y 89.999.999. Si le sumamos +10000000, el rango final es 10.000.000..99.999.999.
    o.expensa := random(9000) + 1000; //entre 1000 y 10000
end;
      
      
{----------------------------------------
----------VECTOR DE OFICINAS-------------
----------------------------------------}
      
procedure GenerarVector(var v: vectorOficinas ; var dimL: integer);
var o: oficina;
begin
    LeerOficinas(o);	
    while (dimL<dimF) and (o.id<>-1) do begin
        dimL:=dimL+1;
        v[dimL]:= o;
        LeerOficinas(o);
		end;
end;

{----------------------------------------
----------IMPRIMIR RECURSIVO-------------
----------------------------------------}

procedure ImprimirVectorRecursivo (V: vectorOficinas ; dimL: integer);
begin
	if (dimL > 0) then begin
		ImprimirVectorRecursivo(V, dimL-1);
		writeln ('----------------------------------------------');
		writeln ('--------CODIGO ID DE LA OFICINA: ',V[dimL].id, '---------');
		writeln ('--------DNI DEL PROPIETARIO: ',V[dimL].dni, '---------'); writeln;
	end;
end;

procedure OrdenarVector (var v: vectorOficinas ; dimL: integer);
	
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
		
	begin
	seleccion(v, dimL);
	writeln ('Ordenado por seleccion:');
	ImprimirVectorRecursivo(V, dimL); 
	
	
	insercion(v, dimL);
	writeln ('Ordenado por insercion:');
	ImprimirVectorRecursivo(V, dimL); 
	end;




var dimL: integer;
v: vectorOficinas;
begin
Randomize;
dimL:=0;
GenerarVector(v, dimL); //Punto A: le paso una oficina y un vector
ImprimirVectorRecursivo(V, dimL); //Opcional, lo hice para probar
OrdenarVector(v, dimL); //Punto B
readln;

end.
