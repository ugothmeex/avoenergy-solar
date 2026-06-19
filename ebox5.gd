class_name Ebox
extends CanvasLayer

@onready var bg: TextureRect = %Bg
@onready var color: ColorRect = %Color
@onready var image: TextureRect = %Image
@onready var label_top: Label = %LabelTop
@onready var label_top_resisdential: Label = %LabelTopResisdential
@onready var label_desc: Label = %LabelDesc
@onready var panel_1: Panel = %Panel1
@onready var panel_2: Panel = %Panel2
@onready var panel_3: Panel = %Panel3
@onready var panel_4: Panel = %Panel4


func run() -> void:
	image.modulate.a = 0
	label_top.modulate.a = 0
	label_top_resisdential.modulate.a = 0
	label_desc.modulate.a = 0
	panel_1.modulate.a = 0
	panel_2.modulate.a = 0
	panel_3.modulate.a = 0
	panel_4.modulate.a = 0
	show()
	var init_pos := 100
	var t := 0.15
	var tw := create_tween()
	tw.tween_property(image,"offset_transform_position:y",0,t).from(init_pos)
	tw.parallel().tween_property(image,"modulate:a",1.0,t).from(0.0)
	tw.tween_property(label_top,"offset_transform_position:y",0,t).from(init_pos)
	tw.parallel().tween_property(label_top,"modulate:a",1.0,t).from(0.0)
	tw.tween_property(label_top_resisdential,"offset_transform_position:y",0,t).from(init_pos)
	tw.parallel().tween_property(label_top_resisdential,"modulate:a",1.0,t).from(0.0)
	tw.tween_property(label_desc,"offset_transform_position:y",0,t).from(init_pos)
	tw.parallel().tween_property(label_desc,"modulate:a",1.0,t).from(0.0)
	tw.tween_property(panel_1,"offset_transform_position:y",0,t).from(init_pos)
	tw.parallel().tween_property(panel_1,"modulate:a",1.0,t).from(0.0)
	tw.tween_property(panel_2,"offset_transform_position:y",0,t).from(init_pos)
	tw.parallel().tween_property(panel_2,"modulate:a",1.0,t).from(0.0)
	tw.tween_property(panel_3,"offset_transform_position:y",0,t).from(init_pos)
	tw.parallel().tween_property(panel_3,"modulate:a",1.0,t).from(0.0)
	tw.tween_property(panel_4,"offset_transform_position:y",0,t).from(init_pos)
	tw.parallel().tween_property(panel_4,"modulate:a",1.0,t).from(0.0)
	await tw.finished
