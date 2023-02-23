extends Node2D


var lista_pronta = ["Coca cola", "Guaraná", "Fanta"]
var monte_sua_lista = []
	
func _ready():
	pass
	



func _on_Button_pressed():
	$Label.text = str(lista_pronta)



func _on_Button2_pressed():
	monte_sua_lista = $LineEdit.text
	$Label2.text += str(monte_sua_lista)
