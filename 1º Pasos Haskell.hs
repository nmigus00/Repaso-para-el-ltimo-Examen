{-¿Qué es un paradigma de prgramación?
Modelo conceptual que abarca un conjunto de técnicas y principios 
de diseño para definir un determinado estilo de programación.-}

{-¿Qué es un Lenguaje de Programación?
Es la forma de expresar un programa mediante carácterísticas 
que reflejen los conceptos esenciales de uno o varios paradigmas.-}

{-Principales paradigmas de programación:
    1º Programación imperativa
    2º Programación declarativa
    
Dentro de la Programación Declarativa se encuentra la Programación Funcional-}

{-Características de la Programación Funcional:
    1º El programados describe cuál debe ser el resultado del proceso
    2º Los Programas se basan en dos apesctos:
        - Datos representados como valores
        - Computación representada como la evaluación de funciones-}

{-Haskell es puro.
Las expresiones son siempre referencialmente transparentes:
    1º Todo es inmutable
    2º No existen los efectos colaterales
    3º Su evaluación es determinista (Los datos de entrada darán la misma salida)-}

{-Haskell es perezoso.
Las expresiones no se evalúan hasta que sus resultados no sean necesarios-}

{-Haskell es estáticamente tipado.
Toda expresión tiene un tipo de datos concreto
    - Posee un sistema de inferencia de tipos
Todos los tipos son comprobados en tiempo de compilación
    - Evita errores de tipo antes de la ejecución del programa-}


--EJERCICIOS

--Ejercicio 1
sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

--Ejercicio 2
product' :: [Int] -> Int
product' [] = 1
product' (x:xs) = x * product' xs

--Ejercicio 3
qsort' [] = []
qsort' (x:xs) = qsort' larger ++ [x] ++ qsort' smaller
              where smaller = [a | a <- xs, a <= x]
                    larger = [b | b <- xs, b > x]