extends Node2D


#Comando para de mudar de cena quando pressionar o botão
func _on_Button_pressed():
	get_tree().change_scene("res://Node2D.tscn")
	
