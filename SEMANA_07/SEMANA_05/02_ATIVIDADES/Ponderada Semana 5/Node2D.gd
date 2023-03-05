extends Node2D

#Retirei algumas variáveis que não estavam fazendo sentido
var numero = 0
var lista = []
var nome = ""


func _on_Button_pressed():
	#Coletando dados inseridos pelo usuário
	numero = int($LineEdit.text)
		#Inverti o comando para fazer sentido no script
	nome = $LineEdit2.text
	


func _on_Button2_pressed():
	#Incrementando o número inserido pelo usuário
	for i in range(10):
		numero+=i
		lista.append(numero)
	$Label.text = str (numero)

func _on_Button3_pressed():
	#Mudando o nome do usuário de acordo com os dados da lista
	#Se houver algum número ímpar o nome deve adicionar "baldo" ao final
		# Tirei o while porque atrapalha o código
		#Declarei a variável
	var cont = 0
		#Troquei a variável lista por numero para fazer sentido no script
	if(numero%2==1):
		cont+=1
	if(cont!=0):
		nome = nome + "baldo"
	$Label2.text = nome

