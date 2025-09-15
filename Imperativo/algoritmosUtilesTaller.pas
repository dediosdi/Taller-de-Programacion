program algoritmosUtiles.pas

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
