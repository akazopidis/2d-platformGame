extends CanvasLayer

var coins =0

func _ready():
	$Coins.text = String(coins)
	
func _physics_process(delta):
	if coins == 10:
		get_tree().change_scene_to_file("res://Level1.tscn")	
	
	


func _on_coin_collected():
	coins = coins + 1
	_ready()
