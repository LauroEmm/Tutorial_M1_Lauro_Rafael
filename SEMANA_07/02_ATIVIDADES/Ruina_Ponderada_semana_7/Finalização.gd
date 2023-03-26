extends Node2D
#variável para controlar a mensagem
var contador = 0 

func _ready():
#Comando para deixar o papel e a mensagem invisível
	$Papel.visible = false
	$Label.visible = false
	$Label2.visible = true

		
func _process(delta):
#Condição para aumentar em um no contador quando pressionar enter
	if Input.is_action_just_pressed("passar"):
		contador += 1
#Condição para aparecer o papel e a mensagem quando o contador for 1
	if contador == 1:
		$Papel.visible = true
		$Label.visible = true
		$Label2.visible = false
