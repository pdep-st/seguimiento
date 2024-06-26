type Vendedor = String
type Direccion = String
data Casa = Casa {
    direccion :: Direccion,
    vendedores :: [Vendedor]
}
inia = "Iña"
martin = "Martín"
siempreViva = Casa "Siempre Viva 742" [inia, martin]
miCasita = Casa "Micasita 123" [inia]

casasEnVenta = [siempreViva, miCasita]


vende :: Vendedor -> Direccion -> [Casa] -> Bool
vende vendedor unaDireccion = 
    any (tieneDireccionYVendedor vendedor unaDireccion)

tieneDireccionYVendedor :: Vendedor -> Direccion -> Casa -> Bool
tieneDireccionYVendedor vendedor unaDireccion casa =
    (direccion casa == unaDireccion) &&
    elem vendedor (vendedores casa)

queVende :: Vendedor -> [Casa] -> [Direccion]
queVende vendedor = map direccion.filter (elem vendedor.vendedores)

quienesVenden :: Direccion -> [Casa] -> [Vendedor]
quienesVenden unaDireccion = vendedores.head.filter ((== unaDireccion).direccion)

vendeAlgo :: Vendedor -> [Casa] -> Bool
vendeAlgo vendedor = any (elem vendedor.vendedores)

seVende :: Direccion -> [Casa] -> Bool
seVende unaDireccion = any ((== unaDireccion).direccion)
