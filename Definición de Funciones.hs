--"Función en Haskell"
--Mapeo de valores de entrada en valores de salida

{-
FORMAS DE CREAR FUNCIONES

-- Composición (Clausula where)
-- Condicional (If-Then-Else)
-- Ecuaciones con guardas
-- Pattern Matching (La barra baja (_) representa la variable anónima)
-}

{-
Otras Formas de Crear Funciones

- Expresiones Lambda
- Secciones
-}

--EJERCICIOS

--Ejercicio 1
halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
        where n = (div (length xs) 2)

--Ejercicio 2
safetail :: [a] -> [a]
safetail xs = if null xs == True
              then []
              else tail xs

safetail xs | null xs == True = []
            | otherwise tail xs

safetail [] = []
safetail xs = tail xs 

--Ejercicio 3
or' :: Bool -> Bool -> Bool
or' _ True = True
or' True _ = True
or' _ _ = False

--Ejercicio 4
and' :: Bool -> Bool -> Bool
and' b c = if b == True `and` if c == True
           then True
           else False

--Ejercicio 5
and2 :: Bool -> Bool -> Bool
and2 b c = if b == True
            then c
            else False

--Ejercicio 6
mult' :: Int -> Int -> Int -> Int
mult' x y z = (\x ->(\y -> (\z -> x * y * z)))

--Ejercicio 7
cylinderArea :: Float -> Float -> Float
cylinderArea r h = Abases r + Alateral r h
                where Abases = (\r -> 2 * π * r ^ 2)
                      Alateral = (\r h -> 2 * π * r * h)

