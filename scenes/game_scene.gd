extends Node2D

var text = "提阿非罗大人啊，我已经作了前书，论到耶稣开头一切所行所教训的，直到他藉着圣灵吩咐所拣选的使徒之后，被接上升的日子为止。他受害之后，用许多的凭据将自己活活地显给使徒看，四十天之久向他们显现，讲说神国的事。耶稣和他们聚集的时候，嘱咐他们说：「不要离开耶路撒冷，要等候父所应许的，就是你们听见我说过的。约翰是用水施洗，但不多几日，你们要受圣灵的洗。」。"  # 要显示的文字

func _ready():
	var continue_button = $ContinueButton
	$TextLabel.text = text
	$TextLabel.visible_characters = 0

	start_writing()

	# 将按钮设置为不可见直到文本显示完成
	continue_button.visible = false

	

func start_writing():
	# 显示文字的 Tween 动画
	var tween1 = create_tween()
	tween1.tween_property(
		$TextLabel, "visible_characters", text.length(), 10.0  # 时间长度为 10 秒
	)
	
	# 显示继续按钮
	var timer = Timer.new()
	timer.wait_time = 10.0  # 等待文本显示完毕
	timer.connect("timeout", Callable(self, "_on_text_displayed"))
	add_child(timer)
	timer.start()

func _on_text_displayed():
	# 当文本显示完成时，显示按钮
	$ContinueButton.visible = true

# 当点击按钮时，加载下一个场景
func _on_continue_pressed():
	# 确保场景路径正确
	get_tree().change_scene_to_file("res://scenes/map.tscn")
	


func _on_continue_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/map.tscn")# Replace with function body.
