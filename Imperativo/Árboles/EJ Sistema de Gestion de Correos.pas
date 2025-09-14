program ejEJemplo.pas;

type
rangoCod = 1..1000;

correo = record
direccionEmisor: string;
fechaEnvio: string; 
asunto: string;
texto: string;
leido: boolean;
end;

cliente= record
cod: rangoCod;
direccion: string;
mensajes: correo;
end;


arbol = ^nodo;
nodo = record
dato: correo;
hi: arbol;
hd: arbol; 
end;


procedure CargarCorreos(var a);
var unCorreo: correo;
begin
LeerCorreo(unCorreo);
while (cunCorreo.c


end;s





var
a: arbol;
begin
CargarCorreos(a);

end.
