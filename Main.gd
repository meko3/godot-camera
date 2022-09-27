extends Control

onready var view = $TextureRect
#@onready var view = $Sprite2d
var texture: CameraTexture

func _ready():
	if permission():
	
		var cameraFeed = CameraServer.get_feed(0)
		
		if cameraFeed:
			texture = CameraTexture.new()
			texture.set_camera_feed_id(cameraFeed.get_id())
			texture.set_camera_active(true)
			view.texture = texture
			
		else:
			print("cannot find camera")
	
func _process(_delta):
	if texture:
		print(view.texture.get_data())
		#print(texture.get_data())
	
func permission():
	if OS.request_permission("CAMERA"):
		print("camera OK")
		return true
	print("cannot access camera")
	return false
