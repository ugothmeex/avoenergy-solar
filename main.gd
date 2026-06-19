extends CanvasLayer

@onready var ebox_5: Ebox = $ebox5
@onready var ebox_16: Ebox = $ebox16

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await ebox_5.run()
	await get_tree().create_timer(5).timeout
	ebox_5.hide()
	
	await ebox_16.run()
	await get_tree().create_timer(5).timeout
	ebox_16.hide()
