/*
cómo modelar?
martin e inia venden siempreViva742
inia vende micasita123
*/

vende(inia, micasita123).
vende(inia, siempreViva742).
vende(martin, siempreViva742).
vende(pedro, nuncaJamas1212).
vende(hector, otraCasa111).

% es cierto que inia vende siempreViva742?
% ?- vende(inia, siempreViva742).

% qué casas vende inia?
% ?- vende(inia, Casa).

% quiénes venden siempreViva742?
% ?- vende(Vendedor, siempreViva742).

% es cierto que inia vende alguna casa (no importa cual)?
% ?- vende(inia, _).

% es cierto que siempreViva742 se vende?
% ?- vende(_, siempreViva742).

% Cómo modelamos que una casa es luminosa?
% Característica / Propiedad
luminosa(siempreViva742).
luminosa(nuncaJamas1212).
luminosa(casaDePan).

% tranquilo: Se cumple cuando un vendedor tiene una
% casa en venta y dicha casa también es luminosa
% REGLA
tranquilo(Vendedor):-
    vende(Vendedor, Casa),
    luminosa(Casa).

% Y como sé si una casa es grande?
% Es grande cuando tiene más de 3 ambientes
ambientes(siempreViva742, 5).
ambientes(micasita123, 2).
ambientes(nuncaJamas1212, 6).

grande(Casa):-
    ambientes(Casa, Ambientes),
    Ambientes > 3.

% copada: Una casa es copada cuando es luminosa o es grande
copada(Casa):- vende(_, Casa), grandeOLuminosa(Casa).

grandeOLuminosa(Casa):- luminosa(Casa).
grandeOLuminosa(Casa):- grande(Casa).
