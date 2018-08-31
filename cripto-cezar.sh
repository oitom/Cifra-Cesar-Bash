#!/bin/bash
###################################
###    CRIPTOGRAFIA - CEZAR    	###
### Autor: Wellington Alexandre ###
### Data criação: 15/06/2012    ###
###################################

#declaração do alfabeto
alfabeto=('a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'x' 'w' 'y' 'z')


echo "Entre a mensagem"
read mensagem

#coloca um espaço entre os caracteres ex.( casa --> c a s a)
string=$(echo $mensagem | sed 's/\(.\)/\1 /g')

#cria um vetor "msg" com a string
msg=($string)

#obtem o tamanho total do vetor "mensagem"
msg_length=${#msg[@]}

#percorre a mensagem e o alfabeto
for (( i = 0; i < $msg_length; i++ )) ; do 
   
    for (( j = 0; j < 26; j++ )) ; do
    	#verifica se o caracter da mensagem é igual ao do alfabeto
	#Se for, aplica o algoritmo, deslocando 3 posições do caracter atual
        if [[ ${msg[$i]} = ${alfabeto[$j]} ]]; then
            deslocamento=$(($j+3))
	    posicao=$(($deslocamento%26))
	    #adiciona no vetor "cripto" o caracter criptografado
	    cripto[$i]=${alfabeto[$posicao]}	
       fi
    done
done

#mostra todos os valores do vetor "cripto"
#inicio = ":0" fim ":$msg_length"
echo "mensagem Criptografada"
echo ${cripto[@]:0:$msg_length}







