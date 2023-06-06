-------------------------------------------------------------------------------
-- Ejercicio 1                                                               --
--  Define una función recursiva sumdown que devuelva la suma de los números --
--  enteros positivos desde un valor dado hasta 0. Por ejemplo:              --
--    ghci> sumdown 3                                                        --
--    6                                                                      --
-------------------------------------------------------------------------------

sumdown     :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown (n - 1)

*Main> sumdown 3
6
*Main> sumdown 10
55
*Main> sumdown 5
15

-------------------------------------------------------------------------------
-- Ejercicio 2                                                               --
--  Define una función recursiva power análoga al operador de potencia (^)   --
--  pero para números enteros positivos. Por ejemplo:                        --
--    ghci> power 2 3                                                        --
--    8                                                                      --
--  Pista:                                                                   --
--    Sigue el mismo patrón de recursión que el visto en el Apartado         --
--    “Recursión en Haskell” de esta Lección 6 para definir el operador      --
--    de multiplicación (*)                                                  --
-------------------------------------------------------------------------------

power       :: Int -> Int -> Int
power _ 0 = 1
power n m = n * power n (m - 1)

*Main> power 2 3
8
*Main> power 3 2
9
*Main> power 2 8
256

-------------------------------------------------------------------------------
-- Ejercicio 3                                                               --
--  Define una función recursiva euclid que implemente el algoritmo de       --
--  Euclides para calcular el máximo común divisor de dos números enteros    --
--  positivos i :                                                            --
--    Si los dos números son iguales el resultado es el propio número        --
--    Si no, restar el número pequeño al grande y repetir el proceso         --
--  Por ejemplo:                                                             --
--    ghci> euclid 6 27                                                      --
--    3                                                                      --
-------------------------------------------------------------------------------

euclid      :: Int -> Int -> Int
euclid 0 _ = 1
euclid _ 0 = 1
euclid n m = if n == m
             then n
             else if n < m 
                  then euclid n (m - n)
                  else euclid (n - m) m

*Main> euclid 5 13
1

-------------------------------------------------------------------------------
-- Ejercicio 4                                                               --
--  Define las siguientes funciones de forma recursiva:                      --
--    sum (calcula la suma de una lista de números)                          --
--    take (elimina un número de elementos del principio de una lista)       --
--    last (selecciona el último elemento de una lista no vacía)             --
-------------------------------------------------------------------------------

{-1º La función sum de forma recursiva: -}
sum'     :: Num a => [a] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

{-2º La función take de forma recursiva: -}
take'      :: Int -> [a] -> [a]
take' 0 [x] = []
take' n (x:xs) = x : take' (n - 1) xs

{-3º La función last de forma recursiva: -}
last'      :: [a] -> a
last' [n] = n
last'(x:xs) = last xs

-------------------------------------------------------------------------------
-- Ejercicio 5                                                               --
--  Define las siguientes funciones sobre listas utilizando recursividad:    --
-- (1) Determina si todos los valores lógicos de una lista son True          --
-- and :: [Bool] -> Bool                                                     --
-- (2) Concatena una lista de listas                                         --
-- concat :: [[a]] -> [a]                                                    --
-- (3) Devuelve una lista con n elementos idénticos                          --
-- replicate :: Int -> a -> [a]
-- (4) Devuelve el enésimo elemento de una lista
-- (!!) :: [a] -> Int -> a
-- (5) Determina si un valor es un elemento de la lista
-- elem :: Eq a => a -> [a] -> Bool
-------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- Ejercicio 6                                                                --
--  Utilizando las definiciones recursivas dadas en esta Lección 6, demuestra -- 
--  cómo evaluar las siguientes expresiones utilizando tanto el método de     --
--  sustitución como el del árbol de recursión                                --
--    length [1, 2, 3]                                                        --
--    drop 3 [1, 2, 3, 4, 5]                                                  --
--    init [1, 2, 3]                                                          --
--------------------------------------------------------------------------------

{-1º Método de Sustitución 2º Método del Árbol-}

{-La función length evaluada por los dos métodos.-}
length         :: [a]-> Int
lenght [] = 0
lenght (_:xs) = 1 + lenght xs
-- Demostración --
length [1, 2, 3]
-- Aplicar la definición de length --
1 + length [2, 3]
-- Aplicar la definición de length --
1 + (1 + length [3])
-- Aplicar la definición de length --
1 + (1 + (1 + length []))
-- Aplicar la definición de length --
1 + (1 + (1 + 0))
-- Aplicar la definición de + -- 
3

-- Demostración --
length [1, 2, 3]
       |
     1 + length [2, 3]
                |
              1 + length [3]
                         |
                       1 + length []
                                  |
                                 0
-- Al final sumamos todos los resultados de los diferentes niveles del Árbol --
3

{-La función drop evaluada por los dos métodos-}
drop      :: Integral b => b -> [a] -> [a]
drop 0 xs = xs
drop n [] = []
drop n (_:xs) = drop (n - 1) xs
-- Demostración --
drop 3 [1, 2, 3, 4, 5]
-- Aplicar la definición de drop --
drop 2 [2, 3, 4, 5]
-- Aplicar la definición de drop --
drop 1 [3, 4, 5]
-- Aplicar la definición de drop --
drop 0 [4, 5]
-- Aplicar la definición de drop --
[4, 5]

-- Demostración --
drop 3 [1, 2, 3, 4, 5]
                    \
               drop 2 [2, 3, 4, 5]
                                \
                            drop 1 [3, 4, 5]
                                          \
                                      drop 0 [4, 5]
                                                 \
                                             [4, 5]
-- Al final devolvemos el último xs porque el número que se pasa como parámetro se queda en 0 --
[4, 5]

{-La función init evaluada por los métodos-}
init      :: [a] -> [a]
init [_] = []
init (x:xs) = x : init xs
-- Demostración --
init [1, 2, 3]
-- Aplicar la definición de init --
1 : init [2, 3]
-- Aplicar la definición de init --
1 : (2 : init [3])
-- Aplicar la definición de init --
1 : (2 : [])
-- Aplicar la definición de : --
[1, 2]

-- Demostración -- 
init [1, 2, 3]
     /     \
    1     init [2, 3]
               /   \
              2   init [3]
                       \
                        []
-- Al final se termina aplicando el operador : como en el otro método --
[1, 2]

-------------------------------------------------------------------------------
-- Ejercicio 7                                                               --
--  Define una función recursiva merge que fusione dos listas ordenadas en   --
--  una única lista ordenada. Por ejemplo:                                   --
--    ghci> merge [2, 5, 6] [1, 3, 4]                                        --
--    [1, 2, 3, 4, 5, 6]                                                     --
-------------------------------------------------------------------------------

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x <= y    = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys


-------------------------------------------------------------------------------
-- Ejercicio 8                                                               --
--  Define una función recursiva msort que implemente el algoritmo de        --
--  ordenación merge sort i . Para ello, debes saber que:                    --
--    Una lista está ordenada cuando es vacía o de tipo singleton            --
--    En el resto de los casos, la lista se ordena fusionando dos sublistas  --
--      ya ordenadas que resultan de partir a la mitad la lista inicial      --
--  Pistas:                                                                  --
--    Para dividir una lista en dos sublistas debes utilizar la función      --
--      halve definida en el Ejercicio 1 propuesto durante la Lección 4      --
--      (Definición de Funciones)                                            --
--    Para fusionar dos sublistas debes utilizar la función merge definida   --
--      en el ejercicio anterior                                             --
-------------------------------------------------------------------------------

halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
        where n = (div (length xs) 2)

msort :: Ord a => [a] -> [a]
msort []  = []
msort [x] = [x]
msort xs  = merge (msort primeraParte) (msort segundaParte)
            where (primeraParte, segundaParte) = halve xs