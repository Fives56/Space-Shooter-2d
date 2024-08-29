extends CanvasLayer

func _process(_delta):
	%Credits.text = "Vidas: " + str(GLOBAL.credits)
	%Score.text = "Score: " + str(GLOBAL.score)
	%Level.text = "Level: " + str(GLOBAL.get_level())
