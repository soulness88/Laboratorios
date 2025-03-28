#/bin/bash
oldIFS=$IFS
IFS=$'\n'
#Cogemos los tipos de genero y los metemos en una variable
#GENEROS=cat ./data.txt | cut -d"," -f3 |sort -u
mkdir ./Generos

sed 's/,/|/g' ./data.txt > ./data_temp.txt

for i in $(cat ./data_temp.txt | cut -d"|" -f3 |sort -u)
do
     grep -w "$i" data_temp.txt > "Generos/${i}_temp.txt"
done

rm Name*

ls -1 Generos |while read i
do
	fichero="$(echo $i |cut -d"_" -f1)"
	echo $fichero
	#$(cat $linea) | while read cancion
	for j in $(cat ./Generos/$i)
        do
		if [ $(echo $j | grep -w "$fichero" | cut -d"|" -f3 | wc -l) -gt 0 ]
		then
		    echo $j >> ./Generos/$fichero.txt
		fi
	done
done

rm ./data_temp.txt
rm ./Generos/*_temp.txt

IFS=$oldIFS
