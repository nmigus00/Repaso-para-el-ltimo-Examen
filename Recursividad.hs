"Parámetro Acumulador"
--Parámetro especial de una función recursiva que permite propagar un valor entre las diferentes llamadas recursivas

"Tipos de Recursión"
--Recursión simple o directa (Función recursiva que está definida en términos de ella misma)
--Recursión de cola o tail recursion (Función recursiva cuya definición es lo último que se evalua)
--Recursión múltiple (Función recursiva cuya definición se utiliza más de una vez dentro de la propia definición)
--Recursión mutua o indirecta (Dos o más funciones recursivas están definidas en términos de ellas mismas)

--Ejercicios de antes de los tipos

--Ejercicio 1
length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

--Ejercicio 2
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

--Ejercicio 3
isSorted :: Ord a => [a] -> Bool
isSorted [] = True
isSorted [x] = True
isSorted (x:(y:xs)) = x <= y && isSorted (y:xs)

--Ejercicio 4
factorial' :: Int -> Int
factorial' n = go n 1
             where go m acc | m == 0    = acc
                            | otherwise = go (m - 1) (acc * m)


--Ejercicios después de los tipos

--Ejercicio 1
sum' :: [Int] -> Int
sum' xs = go xs 0
       where go (y:ys) acc = if ys /= []
                             then go ys (acc + y)
                             else (acc + y)

--Ejercicio 2
ackermann :: Int -> Int -> Int
ackermann m n | m == 0 = n + 1
              | m > 0 && n == 0 = ackermann (m - 1) 1
              | otherwise = ackermann (m - 1) (ackermann m (n - 1))

--Ejercicio 3
evens :: [Int] -> [Int]
evens [] = []
evens (x:xs) = x : odds xs

odds :: [Int] -> [Int]
odds [] = []
odds (_:xs) = evens xs