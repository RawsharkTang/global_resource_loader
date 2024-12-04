# GlobalResourceManager.gd (the editor plugin script)
@tool
class_name GlobalResourceLoader
extends EditorPlugin

var setting := preload("res://addons/editor_resource_loader/setting/default_global.tres")


func _enter_tree() -> void:
	# This runs when the plugin is loaded in the editor
	GlobalResourceManager.setting = setting
	GlobalResourceManager.load_data()

	# Add custom menu items and commands to the editor interface
	notify_property_list_changed()
	add_tool_menu_item("Custom/UpdateGlobals", GlobalResourceManager.load_data)
	EditorInterface.get_command_palette().add_command("UpdateGlobals", "Custom/UpdateGlobals", GlobalResourceManager.load_data)


func _exit_tree() -> void:
	# Cleanup when the plugin is unloaded
	remove_tool_menu_item("Custom/UpdateGlobals")
	EditorInterface.get_command_palette().remove_command("Custom/UpdateGlobals")
