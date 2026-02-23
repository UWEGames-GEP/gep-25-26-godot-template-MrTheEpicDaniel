extends Node3D

enum	 GameState {GAMEPLAY,PAUSE}
var state = GameState.GAMEPLAY
var hasChangedState = false

func changeState():
	if hasChangedState:
		if state == GameState.GAMEPLAY:
			get_tree().paused = false
		elif  state == GameState.PAUSE:
			get_tree().paused = true

func _process(_delta) -> void:
	#change the state enum
	if state == GameState.GAMEPLAY:
		if Input.is_action_just_pressed("ui_cancel"):
			state = GameState.PAUSE
			hasChangedState = true
	elif  state == GameState.PAUSE:
		if Input.is_action_just_pressed("ui_cancel"):
			state = GameState.GAMEPLAY
			hasChangedState = true

	#defer change state so processes finish before being paused
	call_deferred("changeState")
