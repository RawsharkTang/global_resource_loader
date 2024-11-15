@tool
class_name GlobalResourceLoader
extends EditorPlugin

static var resources: Dictionary = {}
static var path: Array[String] = []

static var setting := preload("res://addons/editor_resource_loader/setting/default_global.tres")


func _enter_tree() -> void:
	_load_data()
	notify_property_list_changed()
	add_tool_menu_item("Custom/UpdateGlobals", _load_data)
	EditorInterface.get_command_palette().add_command("UpdateGlobals", "Custom/UpdateGlobals", _load_data)
	# Initialization of the plugin goes here.
	pass


static func _load_data():
	if setting:
		path = setting.data_paths
		resources = {}
		for p in path:
			var res = ResourceLoader.load(p, "", ResourceLoader.CACHE_MODE_REUSE)
			if res.resource_name && res.resource_name != "":
				print("Load {0} {1} from {2}".format([res.get_class(), res.resource_name, p]))
				resources[res.resource_name] = res
	pass


func _get_property_list() -> Array[Dictionary]:
	var property = []
	for res in resources.keys():
		property.append({"name": res, "type": TYPE_OBJECT})
		print("Generate Property: " + res)
		pass
	return []


func _set(property: StringName, value: Variant) -> bool:
	return false


func _get(property: StringName) -> Variant:
	if resources && resources.has(property):
		return resources[property]
	return null


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	resources = {}
	path = []
	remove_tool_menu_item("Custom/UpdateGlobals")
	EditorInterface.get_command_palette().remove_command("Custom/UpdateGlobals")
	pass
