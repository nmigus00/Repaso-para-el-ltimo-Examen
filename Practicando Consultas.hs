import Text.CSV
import Data.List

main :: IO ()
main = do
    let fileName = "movie_data.csv" -- title,year
    input <- readFile fileName
    let csv = parseCSV fileName input
    either handleError doWork csv
    
handleError csv = putStrLn "error parsing"

title :: Record -> String
title [r,t,g,d,di,a,y,ru,ra,v,re,m] = t

year :: Record -> String
year [r,t,g,d,di,a,y,ru,ra,v,re,m]  = y

toInt :: String -> Int
toInt = read

genre :: Record -> String
genre [r,t,g,d,di,a,y,ru,ra,v,re,m] = g

rating :: Record -> String
rating [r,t,g,d,di,a,y,ru,ra,v,re,m] = ra

--Esta está hecha de la última práctica

--doWork = print . map funcion . titulosQueEmpiezan "The" . buscadorDeFechas "2014" . filtradorDeGeneros "Action"

funcion a = [title a, genre a, year a]

titulosQueEmpiezan t = foldr(\csv acc -> if t `isPrefixOf` title csv then csv : acc else acc) []

buscadorDeFechas n = foldr(\csv acc -> if n == year csv then csv : acc else acc) []

filtradorDeGeneros s = foldr(\csv acc -> if s `isPrefixOf` genre csv then csv : acc else acc) []

-- Otro caso

doWork = print . añosIguales "2020"


