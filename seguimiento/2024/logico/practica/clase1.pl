% Prolog
/*
Programamación basada en el paradigma
Lógico
*/

persona(martin). % Característica
adulto(martin).
joven(inia). % inia, es un átomo (y también un individuo)

% ? - joven(martin). -> false -> Por principio de Universo Cerrado

amigo(inia, martin).
amigo(martin, inia).

%%%% Rimacs
vende(inia, siempreViva742).
vende(martin, siempreViva742).
vende(inia, miCasita123).
vende(bauti, casaBlanca901).
vende(bauti, nuncaJamas1212).
vende(juani, bombonera).

comision(martin, 20).
comision(inia, 10).

% ?- vende(inia, siempreViva742). -> Consulta Individual
% ?- vende(inia, Casa). -> Consulta Existencial

% es cierto que inia vende siempreViva742?
% vende(inia, siempreViva742).

% qué casas vende inia?
% vende(inia, Casa).

% quiénes venden siempreViva742?
% vende(Persona, siempreViva742).

% es cierto que inia vende alguna casa?
% vende(inia, _ ).

% es cierto que siempreViva742 se vende?
% vende(_, siempreViva742).


% Cómo modelamos que una casa es luminosa?
luminosa(siempreViva742).
luminosa(casaBlanca901).

% Y si es grande? Cuando tiene más de 3 ambientes
ambientes(siempreViva742, 5).
ambientes(miCasita123, 1).
ambientes(casaBlanca901, 22).
ambientes(nuncaJamas1212, 4).

grande(Casa):- 
    ambientes(Casa, Ambientes),
    Ambientes > 3.

/*
    p ^ r => q
    p = tiene ambientes
    r = ambientes > 3
    q = es grande
*/

/*
  true ^ false => false 
  false ^ true => false
  false ^ false => false
  true ^ true => true 
*/

% tranquilo: Se cumple cuando un vendedor tiene una
% casa en venta y dicha casa también es luminosa
tranquilo(Vendedor):-
    vende(Vendedor, Casa),
    luminosa(Casa).

% copada: Una casa es copada cuando es luminosa o es grande
% la Bombonera siempre es copada

copada(Casa):-
    luminosa(Casa).

copada(Casa):-
    grande(Casa).

copada(bombonera).