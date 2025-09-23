const album = #{1, 2, 3, 4, 5, 6}

object coleccionista {
    const figuritas = [] // Mutable
    var plata = 1000 // Inmutable

    method abrirSobre(sobre) {
        figuritas.addAll(sobre)
    }

    method completoElAlbum() {
        return album == figuritas.asSet()
    }

    method poderFiguril() = figuritas.sum()

    method figuritas() = figuritas.copy()
    method plata() = plata
}










/*
Tenemos a Dora que, ademas de otra gente,
quiere sacar plata del cajero y guardarla en su monedero
Cuando el cajero no cuenta con el disponible,
Dora intenta sacar la mitad de la plata. Si no, no saca nada
*/

