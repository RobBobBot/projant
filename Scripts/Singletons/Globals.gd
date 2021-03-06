extends Node

const daytime_scene:PackedScene=preload("res://Scenes/Enviorments/DaytimeScene.tscn")
const editor_scene:PackedScene=preload("res://Scenes/Enviorments/EditorScene.tscn")
const market_scene:PackedScene=preload("res://Scenes/Market/Market.tscn")

const window_size=Vector2(1024,600)

var money:int=100000
var seconds:float=0
var minutes:int=0
var hours:int=0

var rng:RandomNumberGenerator=RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	current_item = -1
	
func _process(delta):
	pass

signal transaction

func change_money(amount:int,item) -> bool:
	if amount == 0:
		return false
	if money+amount < 0 :
		return false
	money+=amount
	emit_signal("transaction",amount,item)
	return true
	
func _input(event):
	if event is InputEventKey && event.scancode == KEY_ESCAPE:
		change_current_item(-1)
	
	if event is InputEventKey && event.scancode == KEY_P:
		minutes+=5

var current_item = -1

func change_current_item(itemid):
	current_item = itemid

var active # 0-none, 1-floors, 2-walls, 3-objects 4-employees, 5-marketing,

func spawn_customer() -> bool:
	return rng.randf_range(0.0,1000.0)<Values.popularity
	pass

enum messages{
	happy,
	sad,
	leaving_bad,
	no,
	yes,
	thanks,
	apples_where,
	directions,
	alert,
	
}

enum envs{
	title,
	editor,
	daytime
}

var env_scenes={
	envs.title:preload("res://Scenes/Enviorments/TitleScreen.tscn"),
	envs.editor:preload("res://Scenes/Enviorments/EditorScene.tscn"),
	envs.daytime:preload("res://Scenes/Enviorments/DaytimeScene.tscn")
	
}

var message_boxes={
	messages.happy:preload("res://Sprites/Messages/happy.png"),
	messages.sad:preload("res://Sprites/Messages/sad.png"),
	messages.leaving_bad:preload("res://Sprites/Messages/leaving_bad.png"),
	messages.no:preload("res://Sprites/Messages/no.png"),
	messages.yes:preload("res://Sprites/Messages/yes.png"),
	messages.thanks:preload("res://Sprites/Messages/thanks.png"),
	messages.apples_where:preload("res://Sprites/Messages/apples_where.png"),
	messages.directions:preload("res://Sprites/Messages/directions.png"),
	messages.alert:preload("res://Sprites/Messages/alert.png")
}
