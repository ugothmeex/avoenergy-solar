extends CanvasLayer

@onready var ebox_5: Ebox = $ebox5
@onready var ebox_16: Ebox = $ebox16
@onready var rove: Ebox = $rove
@onready var cube_225: Ebox = $cube225
@onready var bg_color: ColorRect = %BgColor

@onready var avo_logo: TextureRect = %"avo-logo"
@onready var avo_logo_2: TextureRect = %"avo-logo2"
@onready var avo_solar: TextureRect = %"avo-solar"
@onready var avo_solar_2: TextureRect = %"avo-solar2"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# setup initials
	avo_logo_2.show()
	avo_solar_2.show()
	avo_logo_2.modulate.a = 0
	avo_solar_2.modulate.a = 0
	avo_logo.modulate.a = 0
	avo_solar.modulate.a = 0
	await get_tree().process_frame
	var tw := create_tween()
	# un-dim
	tw.tween_property(bg_color, "modulate:a", 0.7, 0.2).from(1.0)
	# show mini logos
	tw.tween_property(avo_logo, "modulate:a", 1.0, 0.2)
	tw.parallel().tween_property(avo_solar, "modulate:a", 1.0, 0.2)
	await tw.finished
	
	# animate
	for e:Ebox in [ebox_5, ebox_16, rove, cube_225]:
		e.hide()
	for e:Ebox in [ebox_5, ebox_16, rove, cube_225]:
		await e.run()
		await get_tree().create_timer(2).timeout
		e.hide()
	
	tw = create_tween()
	# hide mini logos
	tw.tween_property(avo_logo, "modulate:a", 0.0, 0.1)
	tw.parallel().tween_property(avo_solar, "modulate:a", 0.0, 0.1)
	# show large logos
	tw.tween_property(bg_color, "self_modulate:a", 1.0, 0.2)
	tw.tween_property(avo_logo_2, "modulate:a", 1.0, 0.2)
	tw.parallel().tween_property(avo_logo_2, "offset_transform_position:y", 0, 0.2).from(100)
	tw.tween_property(avo_solar_2, "modulate:a", 1.0, 0.2)
	tw.parallel().tween_property(avo_solar_2, "offset_transform_position:y", 0, 0.2).from(100)
	
	tw.tween_interval(5.0)
	# hide large logos
	tw.tween_property(avo_logo_2, "modulate:a", 0.0, 0.2)
	tw.parallel().tween_property(avo_logo_2, "offset_transform_position:y", 100, 0.2)
	tw.tween_property(avo_solar_2, "modulate:a", 0.0, 0.2)
	tw.parallel().tween_property(avo_solar_2, "offset_transform_position:y", 100, 0.2)
	# dim
	tw.tween_property(bg_color, "modulate:a", 1.0, 0.2)
	await tw.finished
	#await get_tree().create_timer(1).timeout
	get_tree().quit()
