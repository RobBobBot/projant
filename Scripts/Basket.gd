extends Node2D
class_name Basket

export var held_item:=0
var map_coords:Vector2
var sprites=[
	preload("res://Sprites/empty_basket.png"),
	preload("res://Sprites/apple_basket.png"),
	preload("res://Sprites/apple_basket.png"),
	preload("res://Sprites/apple_basket.png")
]

func _ready():
	$Sprite/EmptyBasket.texture=sprites[held_item]
	Values.display[held_item]+=1
	pass # Replace with function body.

func empty():
	#held_item=1
	Globals.change_money(-Values.sell_cost[held_item]," apples bought")
	Values.display[held_item]-=1
	held_item=0
	$Sprite/EmptyBasket.texture=sprites[held_item]
