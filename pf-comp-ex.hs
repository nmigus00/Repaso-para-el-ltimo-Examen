------------------------------------------------------------------------------
-- Ejercicio 1                                                              --
--   Define, utilizando una lista de comprensión, una expresión que calcule --
--   la suma de los cuadrados de los n primeros números enteros.            --
------------------------------------------------------------------------------

sumadenumeros       :: (Num a, Enum a) => a -> a
sumadenumeros n = sum [ x ^ 2 | x <- [1..n] ]

Prelude> sumadenumeros 5
55
Prelude> sumadenumeros 10
385
Prelude> 100 + 81 + 64 + 49 + 36 + 25 + 16 + 9 + 4 + 1
385

--------------------------------------------------------------------------------
-- Ejercicio 2                                                                --
--   En el Apartado “Generadores” de esta Lección 5 hemos definido la función --
--   length’ utilizando un generador con variable anónima. Basándote en esa   --
--   misma definición, define una función replicate :: Int -> a -> [a] que    --
--   produce una lista de elementos idénticos. Por ejemplo:                   --
--     ghci> replicate 3 True                                                 --
--     [True, True, True]                                                     --
--------------------------------------------------------------------------------

replicate :: (Num n, Enum n) => n -> a -> [a]
replicate n b = [ b | _ <- [1..n] ]

Prelude> replicate 4 True
[True,True,True,True]
Prelude> replicate 3 "Hola"
["Hola","Hola","Hola"]

-----------------------------------------------------------------------------------
-- Ejercicio 3                                                                   --
--   Se dice que una tripla (x, y, z) de enteros positivos es pitagórica, cuando --
--   cumple con la ecuación x2 + y2 = z2 . Utilizando una lista de comprensión,  --
--   define una función pyths :: Int -> [(Int, Int, Int)] que mapee un entero    --
--   positivo n a todas las triplas pitagóricas cuyos componentes estén dentro   --
--   del rango de la lista [1..n]. Por ejemplo:                                  --
--     ghci> pyths 5                                                             --
--     [(3, 4, 5), (4, 3, 5)]                                                    --
-----------------------------------------------------------------------------------


pyths      :: Int -> [(Int, Int, Int)]
pyths n = [ (x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], triplaPitagorica x y z]
          where triplaPitagorica x y z = x ^ 2 + y ^ 2 == z ^ 2

Prelude> pyths 7
[(3,4,5),(4,3,5)]
Prelude> pyths 10
[(3,4,5),(4,3,5),(6,8,10),(8,6,10)]

------------------------------------------------------------------------------------
-- Ejercicio 4                                                                    --
--   Se dice que un número entero positivo es perfecto cuando es igual a la suma  --
--   de todos sus factores (excluyendo el propio número). Utilizando una lista de --
--   comprensión, define una función perfects :: Int -> [Int] que devuelva una    --
--   lista con todos los números perfectos hasta un número n dado.                --
--   Por ejemplo:                                                                 --
--     ghci> perfects 500                                                         --
--     [6, 28, 496]                                                               --
--   Pista:                                                                       --
--     * Utiliza la función divisors definida en el Apartado “Guardas” de esta    --
--     Lección 5                                                                  --
------------------------------------------------------------------------------------

perfects     :: Int -> [Int]
perfects n = [ x | x <- [1..n], sum (divisors x) == x]
             where divisors y = [x | x <- [1..(y - 1)], isDivisor x]
                                where isDivisor z = y `mod` z == 0

*Main> perfects 500
[6,28,496]
*Main> perfects 1000
[6,28,496]
*Main> perfects 10000
[6,28,496,8128]

-------------------------------------------------------------------------------
-- Ejercicio 5                                                               --
--   El producto escalar entre dos listas de números enteros (xs e ys) de    --
--   longitud n, viene dado por la suma de los productos de sus enteros.     --
--   Utilizando una lista de comprensión, define una función dot :: [Int] -> --
--   [Int] -> Int que devuelva el producto escalar entre las dos listas. Por --
--   ejemplo:                                                                --
--     ghci> dot [1,3,-5] [4,-2,-1]                                          --
--     3                                                                     --
-------------------------------------------------------------------------------

dot     :: [Int] -> [Int] -> Int
dot xs ys = sum [ x * y | (x, y) <- zip xs ys]

Prelude> dot [1, 2, 3] [-1, -2, -3]
-14
Prelude> dot [1, 2, 3] [4, 5, 6]
32

-----------------------------------------------------------------------------
-- Ejercicio 6                                                             --
--   Demuestra cómo la siguiente lista de comprensión con dos generadores  --
--     [(x, y) | x <- [1, 2, 3], y <- [4, 5, 6]]                           --
--   puede redefinirse utilizando dos listas de comprensión donde cada una --
--   de ellas tiene un único generador. Pistas:                            --
--     * Debes utilizar la función concat del módulo Prelude               --
--     * Puedes anidar una lista de comprensión dentro de otra             --
-----------------------------------------------------------------------------

{-Sin utilizar una lista de comprensión anidada a otra se puede hacer que cada Tupla
que se genere este dentro de una Lista-}

Prelude> concat [[(x, y)] | x <- [1, 2, 3], y <- [4, 5, 6]]
[(1,4),(1,5),(1,6),(2,4),(2,5),(2,6),(3,4),(3,5),(3,6)]

{-Utilizando una Lista por comprensión anidada a otra sería así: -}

 Prelude> concat [[(x, y) | x <- [1, 2, 3]] | y <- [4, 5, 6]] 
[(1,4),(2,4),(3,4),(1,5),(2,5),(3,5),(1,6),(2,6),(3,6)]

---------------------------------------------------------------------------------
-- Ejercicio 7                                                                 --
--   Define una función find :: Eq a => a -> [(a, b)] -> b que toma una clave  --
--   una clave y una lista de pares clave-valor y devuelve una lista con todos --
--   los valores asociadas a dicha clave. Por ejemplo:                         --
--     ghci> find 'b' [('a', 1), ('b', 2), ('c', 3), ('b', 4)]                 --
--     [2, 4]                                                                  --
---------------------------------------------------------------------------------

find        :: (Eq a) => a -> [(a, b)] -> [b]
find c ps = [ y | (x, y) <- ps, x == c ]

Prelude> find 'a' [('a', 1), ('b', 2), ('c', 3), ('b', 4)] 
[1]
Prelude> find 'a' [('a', 1), ('b', 2), ('c', 3), ('b', 4), ('a', 5), ('a', 6)] 
[1,5,6]

--------------------------------------------------------------------------------
-- Ejercicio 8                                                                --
--   Redefine la función positions del Apartado “Función zip” de esta Lección --
--   5 utilizando la función find definida en el ejercicio anterior           --
--------------------------------------------------------------------------------

positions       :: (Eq a) => a -> [a] -> [Int]
positions x xs = find x (zip xs [0..n])
                 where n = length xs - 1
                 
{-Para poder trabajar con el módulo Prelude he ido igualando las pequeñas expresiones 
como por ejemplo, justo la que está debajo de xs-}

Prelude> xs = [True, False, True, True, False, True]
Prelude> positions False xs
[1,4]
Prelude> positions True xs
[0,2,3,5]