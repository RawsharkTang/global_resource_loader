# Godot4 Global Resource Loader
## Intro
When making my game, i had created quite a lot of data-based resources or csv files. These are data that i want them automatically loaded on ready and can be easily retrieved through static instances.  
For a quite while i was using globals or autoload, but their function are not always the same.  
And setting a singleton script to tool script sometimes cause the project to be unstable. So i decided to create a plugin for it.
Since i dont know how to create property dynamically like reflection in c# so i just created a dictionary for it.

## Install 
download zip and import

## usage
1. open setting profile under addons\editor_resource_loader\setting\default_global.tres
2. add resource paths to the array. Make sure all resources desired to use have a resource_name and they all have different naming.
3. enable the plugin or click Project/tools/Custom/UpdateGlobals to load your resources
4. it is possible to bind a shortcut through the godot command, but right now i didnt add any binding yet.
