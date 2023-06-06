"Currificación"
--Es una forma de simular que una función reciba múltiples argumentos y que su resultado sea otra función

"Variable Tipo"
--Contenedor para varios tipos de datos sin necesidad de definir el tipo específico

"Variable Tipo Restringida o Typeclass"
--Expresión que limita a una o varias categorías los tipos de una variable tipo

--EJERCICIOS

--Ejercicio 1
{-
1º [Char]
2º (Char, Char, Char)
3º [(Bool, Char)]
4º ([Bool], [Char])
5º [Funciones]
6º [String]
7º ([Bool], Bool)
8º (String, String)
9º [(Int, Bool)]
-}

--Ejercicio 2
{-
1º Es válida porque se añade un elemento a una lista del mismo tipo de los que ya están dentro de la lista
2º No es válido porque es una lista pero no son todos los tipos iguales
3º Es válido, es una lista de funciones
4º Es válido porque dentro de una lista vacía se introduce otra lista vacía
5º No es válido porque las listas tienen que tener el mismo tipo
6º Es válido porque es una Tupla de dos Int
7º Es una tupla de funciones
8º Es válido porque aunque sean dos tipos diferentes, es una tupla y lo permite
9º Es válido. Es una tupla vacía
-}

--Ejercicio 3
{-
1º second :: [a] -> a -- Con las funciones tail y head lo que hace es coger la primera lista eliminarle el primero y entonces que da 
como primero el segundo y head lo que hace es recogerlo por lo tanto second devuelve el segundo elemento de una lista
2º swap :: (a, b) -> (b, a) -- Recibe una tupla y la da la vuelta
3º pair :: a -> b -> (a, b) -- Recibe dos elementos y los transforma en una tupla
4º double :: Int -> Int
5º palindrome :: xs -> Bool -- Recibe una lista y haciendole el reverse compara y devuelve un Bool dependiendo 
porque compara la lista después del reverse con la original
6º Esta función recibe una función y un argumento. Lo que hace es aplicar una vez la función y luego al resultado le vuelve a aplicar la funcion
7º f :: [a] -> [a] -- Recibe una lista de cualquier tipo y después de hacer el reverse y con take coge los primeros n elementos
-}

--Ejercicio 4

{-La función sum' es del tipo:
sum' ::  [Int] -> Int

Las funciones last' e init':
last' :: [a] -> a
init' :: [a] -> [a] -}

--Ejercicio 5
--Recibe tres argumentos y el último es el resultado.