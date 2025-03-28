#/bin/bash
oldIFS=$IFS
IFS=$'\n'
#Cogemos los tipos de genero y los metemos en una variable
#GENEROS=cat ./data.txt | cut -d"," -f3 |sort -u
mkdir ./Generos

sed 's/,/|/g' data.txt > data_temp.txt

for i in $(cat ./data_temp.txt | cut -d"|" -f3 |sort -u)
do
     grep -w "$i" data_temp.txt > "Generos/$i.txt"
done

rm ./data_temp.txt

IFS=$oldIFS
