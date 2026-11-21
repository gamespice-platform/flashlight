@tool
extends EditorPlugin

## Editor entry point for GameSpice Flashlight. No autoloads: a flashlight belongs to a player, and a process that runs a server and a client needs two of everything.


func _enter_tree() -> void:
	add_custom_type("GSFlashlight", "Node", load("res://addons/gs_flashlight/runtime/gs_flashlight.gd"), null)


func _exit_tree() -> void:
	remove_custom_type("GSFlashlight")
