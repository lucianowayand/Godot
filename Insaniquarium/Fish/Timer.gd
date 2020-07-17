extends Timer

export (float) var min_time
export (float) var max_time

func _ready():
	set_wait_time(rand_range(min_time,max_time))

func _on_Timer_timeout():
	set_wait_time(rand_range(min_time,max_time))
	
