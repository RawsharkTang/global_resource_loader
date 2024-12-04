@tool
class_name GlobalResourceManager
extends Node

# Static variables for storing resources
static var resources: Dictionary = {}
static var path: Array[String] = []
static var setting: Resource = preload(
	"res://addons/editor_resource_loader/setting/default_global.tres"
)


# Function to load the resources from the global settings
static func load_data() -> void:
	if setting:
		path = setting.data_paths
		resources = {}
		for p in path:
			var res = ResourceLoader.load(p)
			if res.resource_name and res.resource_name != "":
				print("Load {0} {1} from {2}".format([res.get_class(), res.resource_name, p]))
				resources[res.resource_name] = res


# Function to get a resource by its name
static func get_resource(resource_name: String) -> Variant:
	if resources.has(resource_name):
		return resources[resource_name]
	return null
