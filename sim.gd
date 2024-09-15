extends Node2D

var rng = RandomNumberGenerator.new()
var sost = 0
var speed = 0
var check = 0
var checky=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in $"RigidBody2D/Pixil-frame-0".get_children():
		i.freeze = true
	$spirtovka.texture= preload("res://assets/pixil-frame-0 (1).png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if sost <=0:
		for i in $"RigidBody2D/Pixil-frame-0".get_children():
			i.position.x-=rng.randf_range(0,speed)
			i.position.x+=rng.randf_range(0,speed)
			i.position.y-=rng.randf_range(0,speed)
			i.position.y+=rng.randf_range(0,speed)
			if i.position.x<-22:
				i.position.x=-20
			if i.position.x>8:
				i.position.x=7
			if i.position.y>18:
				i.position.y=17
			if i.position.y<-3:
				i.position.y=-2
	pass

func _on_v_slider_value_changed(value: float) -> void:
	speed = (value+100)/100
	sost = value
	$VSlider/TextEdit.text = str(value)
	if value>65:
		for i in $"RigidBody2D/Pixil-frame-0".get_children():
			i.gravity_scale=-0.01
			
	if value>0 and value<66:
		$spirtovka/AnimationPlayer.play('new_animation')
		for i in $"RigidBody2D/Pixil-frame-0".get_children():
			i.freeze = false
			i.gravity_scale=1
			
	if value <= 0 and value >=-5:
		$spirtovka/AnimationPlayer.stop()
		$spirtovka.texture= preload("res://assets/pixil-frame-0 (1).png")
		$"Pixil-frame-0(8)".texture = preload("res://pixil-frame-0 (8).png")
		for i in $"RigidBody2D/Pixil-frame-0".get_children():
			i.freeze = true
			
	if value <= -6 and value>=-25:
		$"Pixil-frame-0(8)".texture = preload("res://pixil-frame-0 (9).png")
	if value <= -26 and value>=-50:
		$"Pixil-frame-0(8)".texture = preload("res://pixil-frame-0 (11).png")
	if value <= -51:
		$"Pixil-frame-0(8)".texture = preload("res://pixil-frame-0 (10).png")
	
	
