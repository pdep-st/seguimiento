liquido(agua).
liquido(aceite).

liquido(agua, pocoDenso).

% Rimacs

% vende/2
vende(inia, siempreViva742).
vende(bauti, casaBlanca1).
vende(martin, siempreViva742).
vende(inia, miCasita123).
vende(bauti, nuncaJamas1212).
vende(inia, casaBlanca1).
vende(inia, rayoDeSol2).

% es cierto que alguien vende una casa
% ? - vende(inia, siempreViva742).

% qué casas vende cierto vendedor
% ? - vende(inia, Casa).

% quiénes venden cierta casa
% ?- vende(Vendedor, siempreViva742).

% es cierto que una persona vende alguna casa
% ?- vende(inia, _).

% es cierto que una casa existe (está en venta)
% ?- vende(_, siempreViva742).

% Cómo modelamos que una casa es luminosa?
luminosa(casaBlanca1).
luminosa(siempreViva742).
luminosa(rayoDeSol2).
% Nos dicen que miCasita123 no es luminosa: Entonces como alumno completo...
% No se define nada para miCasita123 por principio de universo cerrado
% (todo lo que no está definido, es falso)


% Y si es grande? Cuando tiene más de 3 ambientes
% la Bombonera siempre es grande

% grande/1 -> grande(Casa).
% ambientes/2 -> ambientes(Casa, CantidadAmbientes).
ambientes(siempreViva742, 7).
ambientes(casaBlanca1, 24).
ambientes(miCasita123, 1).
ambientes(nuncaJamas1212, 2).


% p = tiene más de 3 ambientes
% q = es grande
% p => q
% En Prolog q <= p
grande(Casa):-
    ambientes(Casa, Ambientes),
    Ambientes > 3.
grande(laBombonera).
% p = la casa tiene ambientes Y esos ambientes son más de 3
% Ambientes se liga/unifica con un valor específico

% tranquilo: Se cumple cuando un vendedor tiene una
% casa en venta y dicha casa también es luminosa
% tranquilo/1 -> tranquilo(Vendedor).
tranquilo(Vendedor):-
    vende(Vendedor, Casa),
    luminosa(Casa).

% copada: Una casa es copada cuando es luminosa o es grande
% copada/1 -> copada(Casa).

% p => q
% r v g => q
% r -> Es luminosa
% g -> Es grande
% q -> Es copada

copada(Casa):- luminosa(Casa).
copada(Casa):- grande(Casa).