import Data.Char
-----------------------------------------------------------------------------------
-- Ejercicio 1                                                                   --
--   Haciendo uso de la función toUpper :: Char -> Char, que devuelve la versión --
--   en mayúsculas del caracter recibido, definir una función que recibe una     --
--   cadena de caracteres y devuelve la misma cadena en letras mayúsculas.       --
--   Ejemplo:                                                                    --
--     ghci> toUpper' "Hola mundo"                                               --
--     "HOLA MUNDO"                                                              --
-----------------------------------------------------------------------------------

toUpper' :: String -> String
toUpper' = map toUpper

-----------------------------------------------------------------------------------
-- Ejercicio 2                                                                   --
--   Haciendo uso de una función anónima, definir la función threeTimes :: [Int] --
--   -> [Int] que eleva al cubo todos los elementos de la lista.                 --
--   Ejemplo:                                                                    --
--     ghci> threeTimes [1,2,3,4,5,6]                                            --
--     [1,8,27,64,125,216]                                                       --
-----------------------------------------------------------------------------------

threeTimes :: [Int] -> [Int]
threeTimes = map (^ 3)


-----------------------------------------------------------------------------------
-- Ejercicio 3                                                                   --
--   Definir una función que a partir de una lista de cadenas de caracteres      --
--   devuelve la lista invertida de las cadenas de caracteres también invertidas --
--   Ejemplo:                                                                    --
--     ghci> XXX ["erase","una","vez"]                                           --
--     ["zev","anu","esare"]                                                     --
-----------------------------------------------------------------------------------

invertirStrings :: [String] -> [String]
invertirStrings = foldr(\s acc -> acc ++ [reverse s]) []

-----------------------------------------------------------------------------------
-- Ejercicio 4                                                                   --
--   Definir una función tal que a partir de una lista de listas, añada un nuevo --
--   elemento como primer elemento de cada una de dichas listas.                 --
--   Ejemplo:                                                                    --
--     ghci> xxx 0 [[1,3,5],[2,4],[],[6,6,6]]                                    --
--     [[0,1,3,5],[0,2,4],[0],[0,6,6,6]]                                         --
-----------------------------------------------------------------------------------

añadirNumeros :: a -> [[a]] -> [[a]]
añadirNumeros n = map (n:)

-----------------------------------------------------------------------------------
-- Ejercicio 5                                                                   --
--   Haciendo uso de una función anónima, definir una función que, a partir de   --
--   una lista de cadenas de caracteres, genere otra lista que contenga tantos   --
--   unos y ceros como cadenas contiene la lista inicial. Aparecerá un 0 en la   --
--   posición de las cadenas cuya longitud sea par y un 1 en la de las cadenas   --
--   de longitud impar.                                                          --
--   Ejemplo:                                                                    --
--     ghci> xxx ["norte","sur","este","oeste"]                                  --
--     [1,1,0,1]                                                                 --
-----------------------------------------------------------------------------------

cadenas :: [String] -> [Int]
cadenas = foldr(\s acc -> if length s `mod` 2 == 0 then [0] ++ acc else [1] ++ acc) []

-----------------------------------------------------------------------------------
-- Ejercicio 6                                                                   --
--   Definir una función que reciba una cadena de caracteres y devuelva otra     --
--   cadena que contenga solamente las letras minúsculas de la primera.          --
--   Ejemplo:                                                                    --
--     ghci> xxx "Ciencia"                                                       --
--     "iencia"                                                                  --
-----------------------------------------------------------------------------------

minusculas :: String -> String
minusculas = filter isLower

-----------------------------------------------------------------------------------
-- Ejercicio 7                                                                   --
--   Definir una función que reciba una lista de enteros y devuelva una lista    --
--   que contenga solamente los número que no sean primos.                       --
--   Ejemplo:                                                                    --
--     ghci> xxx [1,2,3,4,5,6,7,8,9]                                             --
--     [4,6,8,9]                                                                 --
-----------------------------------------------------------------------------------
divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], n `mod` x == 0]

noPrimos :: [Int] -> [Int]
noPrimos = filter(\x -> divisors x /= [1, x])

-----------------------------------------------------------------------------------
-- Ejercicio 8                                                                   --
--   Definir una función que recibe una lista de listas de números enteros y     --
--   devuelve otra lista de la que se han eliminado aquellas listas que no       --
--   contienen un número par.                                                    --
--   Ejemplo:                                                                    --
--     ghci> xxx [[1],[1,2],[2],[1,3],[3],[2,4]]                                 --
--     [[1,2],[2],[2,4]]                                                         --
-----------------------------------------------------------------------------------

listasPares :: [[Int]] ->   [[Int]]
listasPares xs = filter (any even) xs

-----------------------------------------------------------------------------------
-- Ejercicio 9                                                                   --
--   Definir una función que recibe un número entero y una lista de listas de    --
--   números enteros. Como resultado devuelve una lista de listas que contiene   --
--   solamente listas con números pares precedidas del número entero recibido    --
--   como parámetro.
--   Ejemplo:                                                                    --
--     ghci> xxx 0 [[1],[1,2],[2],[1,3],[3],[2,4]]                                 --
--     [[0,2],[0,2,4]]                                                           --
-----------------------------------------------------------------------------------

escribirEnListas :: Int -> [[Int]] -> [[Int]]
escribirEnListas n xs = añadirNumeros n (listasPares xs)

-----------------------------------------------------------------------------------
-- Ejercicio 10                                                                  --
--   Definir una función que recibe una lista de cadenas de caracteres y         --
--   devuelve otra lista de cadenas en las que se han eliminado las vocales.     --
--   Ejemplo:                                                                    --
--     ghci> xxx ["en","un","lugar","de","la","mancha"]                          --
--     ["n","n","lgr","d","l","mnch"]                                           --
-----------------------------------------------------------------------------------

withoutVowels :: String -> String
withoutVowels ss = filter (\c -> not (elem c "aeiou")) ss

cadenasDeStrings :: [String] -> [String]
cadenasDeStrings = foldr(\s acc -> [withoutVowels s] ++ acc) []
