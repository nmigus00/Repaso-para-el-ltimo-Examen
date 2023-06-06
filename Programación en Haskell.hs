{-¿Qué es un compilador?
Es un programa que traduce código escrito en un lenguaje 
de programación en otro lenguaje objetivo-}

{-¿Qué es un Intérprete?
Programa que ejecuta instrucciones espécificas escritas 
en el código del lenguaje fuente junto a una entrada 
suministrada por el usuario de forma directa-}

--EJERCICIOS

--Ejercicio 1
--Haskell evaluaría la expresión como f(a) + b

{-Ejercicio 2
((2 ^ 3)* 4) ------- ((2 * 3) + (4 * 5)) ------- (2 + (3 * (4 ^ 5)))-}

{-Ejercicio 3
> 4 * (7 + 2) - 3 * 9
Prelude> 4 * (7 + 2) - 3 * 9
9
> 18 `div` 9 `mod` 2
Prelude> 18 `div` 9 `mod` 2
0
> 4 * 9 > 3 + 3
Prelude> 4 * 9 > 3 + 3
True-}

{-Ejercicio 4
> (2 - `sqrt` (4 + 32)) / 2 {-Notación infija o en línea-}
Prelude> (2 - sqrt (4 + 32)) / 2
-2.0

> (/) ((+) (- sqrt ((+) 4 32)) (2)) 2 {-Notación prefija o polaca-}
Prelude> (/) ((+) (- sqrt ((+) 4 32)) (2)) 2 
-2.0-}

{-Ejercicio 5
1º Las funciones no pueden empezar por letra mayúscula
2º Las comillas del div no son las correctas para que funcione la función
3º No hay una buena identación en la parte después del where xs tendría que estar a la altura de la variable a-}

--Ejercicio 6
last' [x] = x
last' (_:xs) = last' [xs]

--Ejercicio 7
init' [x] = []
init' (x:xs) = x : init' xs