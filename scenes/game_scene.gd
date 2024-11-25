extends Node2D

var text = "提阿非罗大人啊，我已经作了前书，论到耶稣开头一切所行所教训的，直到他藉着圣灵吩咐所拣选的使徒之后，被接上升的日子为止。他受害之后，用许多的凭据将自己活活地显给使徒看，四十天之久向他们显现，讲说神国的事。耶稣和他们聚集的时候，嘱咐他们说：「不要离开耶路撒冷，要等候父所应许的，就是你们听见我说过的。约翰是用水施洗，但不多几日，你们要受圣灵的洗。」。"  # 要显示的文字
var pen_start_pos = Vector2()  # 笔的起始位置

func _ready():
	
	pen_start_pos = $Pen.position
	$TextLabel.text = text
	$TextLabel.visible_characters = 0

	start_writing()

func start_writing():
	# 显示文字的 Tween 动画
	var tween1 = create_tween()
	tween1.tween_property(
		$TextLabel, "visible_characters", text.length(), 10.0  # 时间长度为 3 秒
	)

	# 移动笔的 Tween 动画
	var tween2 = create_tween()
	tween2.tween_property(
		$Pen, "position", pen_start_pos + Vector2(text.length() * 20, 0), 3.0
	)
