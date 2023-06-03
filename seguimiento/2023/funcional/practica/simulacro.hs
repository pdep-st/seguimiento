import Text.Show.Functions

g x y = fst (x, fst y)

tuplaRota = (head [], head [])

enumerarDesde x = x : enumerarDesde (x + 1)

f xs = any (>2) . map (*10)

($) f x = f x
aplicaleEl2 f = f 2

miPatron [x : y : ys] = True

-- tomar/2