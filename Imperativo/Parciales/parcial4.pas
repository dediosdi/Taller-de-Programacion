{Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente registra: dni, cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y costo abonado por sesión.

Implemente un programa que:

a) Genere un ABB ordenado por dni. Para ello, genere información hasta el paciente con dni 0. A partir del ABB, realice módulos (uno por inciso) para:

b) Generar una estructura con dni y cód de paciente de los pacientes de ioma, ordenados por dni descendente.

c) Dado un dni, modificar la obra social de dicho paciente a una recibida. Considere que el paciente puede no existir.

NOTA: Realice el programa principal que invoque a los módulos desarrollados.

}


type
rangoObras: 1..5;

paciente = record
dni: integer;
codPac: integer;
obraSocial: rangoObras;
abonado: real;


arbol = ^nodoA;
nodoA = record
dato: paciente;
hi: arbol;
hd: arbol;
end;

