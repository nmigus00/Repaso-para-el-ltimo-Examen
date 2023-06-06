--Ejercicios Resueltos dentro del pdf

--Ejercicios de Listas

--Ejercicio 1
concat' :: [[a]] -> [a]
concat' xxs = [x | xs <- xxs, x <- xs]

--Ejercicio 2
divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], n `mod` x == 0]

{-divisors n = [x | x <- [1..n], isDivisor x]
           where isDivisor y = n `mod` y == 0-}

--Ejercicio 3
primes :: Int -> [Int]
--primes n = [x | x <- [1..n], divisors x == [1,x]]

primes n = [x | x <- [1..n], isPrime x]
         where isPrime y = divisors y == [1, y]

--Ejercicios de Cadenas

--Ejercicio 1
count :: Char -> String -> Int
count c ss = sum [1 | x <- ss, x == c]

--Ejercicio de Zip

--Ejercicio 1
positions :: Eq a => a -> [a] -> [Int]
positions s xs = [b | (a, b) <- zip xs [0..n], a == s]
               where n = length xs - 1


--EJERCICIOS

--Ejercicio 1
sumaDeCuadrados :: Int -> Int
sumaDeCuadrados n = sum [(x ^ 2) | x <- [1..n]]

--Ejercicio 2
replicate :: Int -> a -> [a]
replicate n b = [b | _ <- [1..n]]

--Ejercicio 3
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], (x ^ 2) + (y ^ 2) == z ^ 2]

--Ejercicio 4
perfects     :: Int -> [Int]
perfects n = [ x | x <- [1..n], sum (divisors x) == x]
             where divisors y = [x | x <- [1..(y - 1)], isDivisor x]
                                where isDivisor z = y `mod` z == 0

--Ejercicio 5
dot :: [Int] -> [Int] -> Int
dot xs ys = sum [(x * y) | (x, y) <- zip xs ys]