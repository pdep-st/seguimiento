par = even
enumerateDesde n = n : (enumerateDesde (n + 1))

tomarN 0 _ = []
tomarN _ []  = []

tomarN n (x:xs)  =  x : tomarN (n - 1) xs
-- tomarN 2 (1: enumerateDesde 1) => 1 : tomarN 1 (enumerateDesde 1)
-- 1 : tomarN 1 (enumerateDesde 1)
-- 1: (1 : tomarN 0 (enumerateDesde 1))
-- 1 : 1 : []
-- [1,1]

-- fst (x, _) = x 