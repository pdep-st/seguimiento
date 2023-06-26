% cómo modelar?
% martin e inia venden siempre viva742
% inia vende micasita123
vende(inia, siempreViva742).
vende(inia, micasita123).
vende(martin, siempreViva742).
vende(inia, casaBlanca901).
vende(pedro, nuncaJamas1212).


vendedor(martin).
joven(inia).

tieneRabia(inia).

edad(martin, 29).
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
ambientes(micasita123, 1).
ambientes(casaBlanca901, 22).
ambientes(nuncaJamas1212, 4).

grande(Casa):-
    ambientes(Casa, Ambientes),
    Ambientes > 3.

/*
    p ^ r => q
    p = ambientes(Casa, Ambientes).
    r = Ambientes > 3.
    q = grande(Casa).
*/

% tranquilo: Se cumple cuando un vendedor tiene una
% casa en venta y dicha casa también es luminosa

tranquilo(Vendedor):-
    vende(Vendedor, Casa),
    luminosa(Casa).

% copada: Una casa es copada cuando es luminosa o es grande

copada(Casa):- luminosa(Casa).
copada(Casa):- grande(Casa).
copada(mansion).

