extends TileMap

onready var cursor = $Icon

func _ready():
	pass

func _process(delta):
	#evil position hack
	cursor.position=map_to_world(world_to_map(get_local_mouse_position()))
	
	if Input.is_action_pressed("mouse_down"):
		#print("ye")
		
		if get_cellv(world_to_map(get_local_mouse_position()))!=0:
			set_cellv(world_to_map(get_local_mouse_position()),0)
			Globals.change_money(-10)