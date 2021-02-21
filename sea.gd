extends StaticBody2D

var t:float = 0
var dt:float = 4.0

var noise:OpenSimplexNoise = OpenSimplexNoise.new()

func _ready():
	noise.seed = randi()
	noise.octaves = 4
	noise.period = 20.0
	noise.persistence = 0.8

func _process(delta):
	var vertices:Array = []
	# the first two are bottom right and bottom left vertices:
	vertices.append(Vector2(1000, 100))
	vertices.append(Vector2(-1000, 100))
	for i in range(-100, 101):
		# make a sum of sin to generate some sort of wave
		var y:float = 3 * sin(i - t)
		y += 0.5 * sin(1.8 * i - 4.1 * t)
		y += 4 * sin(0.1 * i - 0.5 * t)
		# add some noise to make it look a bit random
		y += 10 * noise.get_noise_1d(10 * i - t);
		# the position have to match the width of the polygon
		# here 100 * 10 = 1000, see first two vertices above
		vertices.append(Vector2(i * 10, y))
	
	# update the polygons
	$dynamicWaves.polygon = PoolVector2Array(vertices)
	$dynamicShape.polygon = PoolVector2Array(vertices)

	t += dt * delta # make the waves move over time
