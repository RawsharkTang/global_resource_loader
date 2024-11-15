class_name GlobalResourceSetting
extends Resource

## make sure all resources have resource_name and are unique to each other
@export_custom(PROPERTY_HINT_TYPE_STRING, "%4/%13:") var data_paths: Array[String] = []
