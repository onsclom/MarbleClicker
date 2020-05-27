extends Label

var time = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	set("custom_colors/font_color", Color(rand_range(0,1),rand_range(0,1),rand_range(0,1)))
	set_position(Vector2(0 + rand_range(-100, 100), -165 + rand_range(-20,20)))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time -= delta
	
	time = max(0, time)
	
	var curColor = get("custom_colors/font_color")
	curColor.a =  time
	
	set("custom_colors/font_color", curColor)
	
	
	if time == 0:
		queue_free()
