--"Funciones de Orden Superior"
{-
1º Definir diferentes patrones de programación dentro del propio lenguaje de programación
2º Definir lenguajes de dominio específico como una colección de funciones superior
3º Uso de propiedades algebráicas de funciones de orden superior para razonar sobre programas
-}

--Ejercicios de map y filter

divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], n `mod` x == 0]

--Ejercicio 1
lengths :: [String] -> [Int]
lengths ss = map length ss

--Ejercicio 2
squareall :: [Int] -> [Int]
squareall xs = map (^ 2) xs

--Ejercicio 3
withoutVowels :: String -> String
withoutVowels ss = filter (\c -> not (elem c "aeiou")) ss

--Ejercicio 4
withoutPrimes :: [Int] -> [Int]
withoutPrimes xs = filter (\n -> divisors n /= [1, n]) xs

--"Funciones de Plegado"
{-Familia de funciones de orden superior que procesan, siguiendo un determinado orden,
una estructura de datos para deconstruirla o reducirla a un único valor-}

--Ejercicios Funciones de Plegado

--Ejercicio 1
length' :: [a] -> Int
length' xs = foldr (\_ acc -> acc + 1) 0 xs

--Ejercicio 2
reverse' :: [a] -> [a]
reverse' xs = foldr (\x acc -> acc ++ [x]) [] xs