% Hecho - propiedad
clima(llueve).
clima(soleado).
clima(nublado).
clima(3).

% Hecho - relación
clima(hoy, llueve).
clima(ayer, nublado).

% Rimacs

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

luminosa(siempreViva742).
luminosa(casaBlanca1).
luminosa(rayoDeSol2).

% Y si es grande? Cuando tiene más de 3 ambientes
% la Bombonera siempre es grande
ambientes(siempreViva742, 5).
ambientes(casaBlanca1, 115).
ambientes(miCasita123, 1).
ambientes(laBombonera, 0).
ambientes(rayoDeSol2, 2).

% p = tiene más de 3 ambientes
% q = es grande
% p => q
% en Prolog: q <= p

% Regla - propiedad
grande(Casa):- ambientes(Casa, Ambientes), Ambientes > 3.
% Hecho - propiedad
grande(laBombonera).

% p = la casa tiene ambientes Y esos ambientes son más de 3

% tranquilo: Se cumple cuando un vendedor tiene una
% casa en venta y dicha casa también es luminosa
tranquilo(Vendedor):-
     vende(Vendedor, Casa),
     luminosa(Casa).

% Back tracking

% copada: Una casa es copada cuando es luminosa o es grande

copada(Casa):- luminosa(Casa).
copada(Casa):- grande(Casa).