extends Node2D

# variavel da velocidade do personagem
export var speed : float = 400
# variavel do personagem
var motion = Vector2.ZERO
# variável da área após passar da espada
var saiu = 0


func _ready():
#Comando para deixar os itens do labirinto visíveis e as mensagens invisíveis
	$Ouro/Ouro.visible = true
	$Comida/Comida.visible = true
	$Livros/Livros.visible = true
	$Pergaminho.visible = false
	$comida.visible = false
	$ouro.visible = false
	$livros.visible = false
	$Perde_batalha.visible = false
	$Ganha_batalha.visible = false
	$Intrucao.visible = true
	
	
func _process(delta):

	#Movimentação da coroa
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	motion = motion.normalized()

	#Aceleração da coroa
	if Input.get_action_strength("ui_accept"):
		speed = 400
	if Input.is_action_just_released("ui_accept"):
		speed = 400
#Comando de velocidade da coroa
	$KinematicBody2D.move_and_slide(motion * speed)
#Comando para espada seguir o path
	$Path2D/PathFollow2D.set_offset($Path2D/PathFollow2D.get_offset() + 400 * delta)	
	
#Condição para deixar as mensagens e o papel invisível depois de ficarem visíveis e voltar com a velocidade da coroa
	if $comida.visible == true and Input.is_action_just_pressed("passar"):
		$Pergaminho.visible = false 
		$comida.visible = false
		speed = 400
	if $ouro.visible == true and Input.is_action_just_pressed("passar"):
		$Pergaminho.visible = false 
		$ouro.visible = false
		speed = 400
	if $livros.visible == true and Input.is_action_just_pressed("passar"):
		$Pergaminho.visible = false 
		$livros.visible = false
		speed = 400
	if $Ganha_batalha.visible == true and Input.is_action_just_pressed("passar"):
		$Pergaminho.visible = false 
		$Ganha_batalha.visible = false
		speed = 400
#Condição para voltar para o início da cena quando perder para a espada
	if $Perde_batalha.visible == true and Input.is_action_just_pressed("passar"):
		get_tree().change_scene("res://Labirinto.tscn")
		
func _on_Comida_body_entered(body):
#Condição para deixar o ícone da comida invisível, a mensagem visível e a velocidade igual a 0
	if $Comida/Comida.visible == true:
		$Comida/Comida.visible = false
		$Pergaminho.visible = true 
		$comida.visible = true
		speed = 0

func _on_Ouro_body_entered(body):
#Condição para deixar o ícone da ouro invisível, a mensagem visível e a velocidade igual a 0
	if $Ouro/Ouro.visible == true:
		$Ouro/Ouro.visible = false
		$Pergaminho.visible = true
		$ouro.visible = true
		speed = 0

func _on_Livros_body_entered(body):
#Condição para deixar o ícone da livros invisível, a mensagem visível e a velocidade igual a 0
	if $Livros/Livros.visible == true:
		$Livros/Livros.visible = false
		$Pergaminho.visible = true
		$livros.visible = true
		speed = 0
	


func _on_KinematicBody2D_body_entered(body):
#Comando para quando bater na coroa aparecer a mensagem de perda
	$KinematicBody2D/Coroa.visible = false
	speed = 0
	$Perde_batalha.visible = true
	$Pergaminho.visible = true


func _on_Passou_batalha_body_exited(body):
#Condição para quando passar pela área 2D a mensagem de vitória, deixar a velocidade 0 e mudar a variável saiu
	if saiu == 0:
		$Pergaminho.visible = true
		$Ganha_batalha.visible = true
		speed = 0
		saiu = 1 

func _on_Ganhou_body_entered(body):
#Comando para mudar para a cena final quando chegar na área final doi labirinto
	get_tree().change_scene("res://Finalização.tscn")


