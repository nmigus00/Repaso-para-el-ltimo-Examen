----------------------------------------------------------------------
-- Ejercicio 1                                                      --
--   Definir la función circulo :: Int -> Int tal que devuelve la   --
--   cantidad de pares de números naturales (x,y) que se encuentran --
--   dentro del círculo de radio n. Por ejemplo:                    --
--     ghci> circulo 2                                              --
--     4                                                            --
----------------------------------------------------------------------

circulo :: Int -> Int
circulo n = length [(x,y) | x <- [1..n], y <- [1..n], x^2 + y^2 <= n^2]

Prelude> circulo 2
1
Prelude> circulo 3
4
Prelude> circulo 4
8

-----------------------------------------------------------------------
-- Ejercicio 2                                                       --
--   Definir la función calculaPi :: Double -> Double que calcula el --
--   valor del número pi mediante n aproximaciones utilizando la     --
--   fórmula: 4*(1 - 1/3 + 1/5 - 1/7 + ...+ (-1)**n/(2*n+1))         --
--   Por ejemplo:                                                    --
--     ghci> calculaPi 2                                             --
--     3.466666666666667                                             --
--     ghci> calculaPi 100000                                        --
--     3.1416026534897203                                            --
-----------------------------------------------------------------------

calculaPi    :: Double -> Double
calculaPi n = sum [ calcular x | x <- [0..n]]
              where calcular y = 4 * ((-1) ** y / (2 * y + 1))

Prelude> calculaPi 1000
3.1425916543395442
Prelude> calculaPi 1000000
3.1415936535887745
Prelude> calculaPi 10000000
3.1415927535897814

-----------------------------------------------------------------------
-- Ejercicio 3                                                       --
--   Definir la función errorPi :: Double -> Double que calcula el   --
--   menor número de términos de la serie utilizada en el ejercicio  --
--   anterior para calcular pi necesarios para obtener el valor de   --
--   pi con un error menor que el parámetro recibido como entrada.   --
--   Por ejemplo:                                                    --
--     ghci> errorPi 0.1                                             --
--     9.0                                                           --
--     ghci> errorPi 0.0001                                          --
--     9999.0                                                        --
-----------------------------------------------------------------------

errorPi :: Double -> Double
errorPi e = go 1
            where go n = if abs (calculaPi n - pi) < e then n / 1 else go (n+1)

*Main> errorPi 0.1
9.0
*Main> errorPi 0.0001
9999.0


-----------------------------------------------------------------------
-- Ejercicio 4                                                       --
--   Definir la función numeroDePares :: (Int, Int, Int) -> Int que  --
--   devuelve el número de elementos pares de la terna recibida.     --
--   Por ejemplo:                                                    --
--     ghci> numeroDePares (1,2,3)                                   --
--     1                                                             --
-----------------------------------------------------------------------

numeroDePares :: (Int, Int, Int) -> Int
numeroDePares (x,y,z) = length [1 | n <- [x,y,z], even n]

Prelude> numeroDePares (1, 2, 3)
1
Prelude> numeroDePares (2, 4, 6)
3

-----------------------------------------------------------------------
-- Ejercicio 5                                                       --
--   Dada la base de datos de informáticos ilustres se pide definir  --
--   la función nombres :: [(String,String,String,Int)] -> [String]  --
--   que devuelve el apellido de los autores contenidos en la lista  --
-----------------------------------------------------------------------
informaticos :: [(String,String,String,Int)]
informaticos =  [("Lovelace","Ada","UK",1815),
                ("Hopper","Grace","USA",1906),
                ("Backus","John","USA",1924),
                ("Minsky","Marvin","USA",1927),
                ("McCarthy","John","USA",1927),
                ("Dijkstra","Edsger W.","Netherlands",1930),
                ("Knuth","Donald","USA",1938),
                ("Leslie","Lamport","USA",1941),
                ("Ritchie","Dennis M.","USA",1941),
                ("Kernighan","Brian W.","Canada",1942),
                ("Cerf","Vinton","USA",1943),
                ("Thompson","Ken","USA",1943),
                ("Tanenbaum","Andrew S.","USA",1944),
                ("Stallman","Richard","USA",1953),
                ("Berners-Lee","Tim","UK",1955),
                ("van Rossum","Guido","Netherlands",1956),
                ("Fowler","Martin","UK",1963),
                ("Torvalds","Linus","Finland",1969)
                ]


nombres     :: [(String, String, String, Int)] -> [String]
nombres ps = [apellido | (apellido, _, _, _) <- ps]

["Lovelace","Hopper","Backus","Minsky","McCarthy","Dijkstra",
"Knuth","Leslie","Ritchie","Kernighan","Cerf","Thompson",
"Tanenbaum","Stallman","Berners-Lee","van Rossum","Fowler","Torvalds"]

-----------------------------------------------------------------------
-- Ejercicio 6                                                       --
--   Definir nuevas funciones de búsqueda sobre la base de datos de  --
--   informáticos indicando en un comentario su funcionalidad        --
-----------------------------------------------------------------------

{-Esta siguiente es una Lista por Comprensión que devuelve los nombres y los apellidos, pero,
Primero el nombre y después el apellido (En Tuplas)-}

nombresColocados     :: [(String, String, String, Int)] -> [(String, String)]
nombresColocados ps = [(nombre, apellido) | (apellido, nombre, _, _) <- ps]

[("Ada","Lovelace"),("Grace","Hopper"),("John","Backus"),("Marvin","Minsky"),("John","McCarthy"),
("Edsger W.","Dijkstra"),("Donald","Knuth"),("Lamport","Leslie"),("Dennis M.","Ritchie"),("Brian W.","Kernighan"),
("Vinton","Cerf"),("Ken","Thompson"),("Andrew S.","Tanenbaum"),("Richard","Stallman"),("Tim","Berners-Lee"),
("Guido","van Rossum"),("Martin","Fowler"),("Linus","Torvalds")]

{-La siguiente va a ser igual que la de arriba pero devuelve el año en el que nacieron-}
nombresColocadosAño     :: [(String, String, String, Int)] -> [(String, String, Int)]
nombresColocadosAño ps = [(nombre, apellido, año) | (apellido, nombre, _, año) <- ps]

[("Ada","Lovelace",1815),("Grace","Hopper",1906),("John","Backus",1924),("Marvin","Minsky",1927),("John","McCarthy",1927),
("Edsger W.","Dijkstra",1930),("Donald","Knuth",1938),("Lamport","Leslie",1941),("Dennis M.","Ritchie",1941),("Brian W.","Kernighan",1942),
("Vinton","Cerf",1943),("Ken","Thompson",1943),("Andrew S.","Tanenbaum",1944),("Richard","Stallman",1953),
("Tim","Berners-Lee",1955),("Guido","van Rossum",1956),("Martin","Fowler",1963),("Linus","Torvalds",1969)]

{-La siguiente es igual que la de los años pero en vez de los años devuelve el país de nacimiento-}
nombresColocadosPais     :: [(String, String, String, Int)] -> [(String, String, String)]
nombresColocadosPais ps = [(nombre, apellido, pais) | (apellido, nombre, pais, _) <- ps]

[("Ada","Lovelace","UK"),("Grace","Hopper","USA"),("John","Backus","USA"),("Marvin","Minsky","USA"),("John","McCarthy","USA"),
("Edsger W.","Dijkstra","Netherlands"),("Donald","Knuth","USA"),("Lamport","Leslie","USA"),("Dennis M.","Ritchie","USA"),
("Brian W.","Kernighan","Canada"),("Vinton","Cerf","USA"),("Ken","Thompson","USA"),("Andrew S.","Tanenbaum","USA"),("Richard","Stallman","USA"),
("Tim","Berners-Lee","UK"),("Guido","van Rossum","Netherlands"),("Martin","Fowler","UK"),("Linus","Torvalds","Finland")]

{-La siguiente va a devolver el nombre, el país y el año-}
nombresPaisAño     :: [(String, String, String, Int)] -> [(String, String, Int)]
nombresPaisAño ps = [(nombre, pais, año) | (_, nombre, pais, año) <- ps]

[("Ada","UK",1815),("Grace","USA",1906),("John","USA",1924),("Marvin","USA",1927),("John","USA",1927),("Edsger W.","Netherlands",1930),
("Donald","USA",1938),("Lamport","USA",1941),("Dennis M.","USA",1941),("Brian W.","Canada",1942),("Vinton","USA",1943),("Ken","USA",1943),
("Andrew S.","USA",1944),("Richard","USA",1953),("Tim","UK",1955),("Guido","Netherlands",1956),("Martin","UK",1963),("Linus","Finland",1969)]
