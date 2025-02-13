extends Control

var exercises_full_body = {
	"1. ": ["Barbell bench press", "Incline bench press", "Dumbbell bench press", "Smith machine bench press"],# lat
	"2. ": ["Decline dumbbell fly", "Cable fly", "Dumbbell pullover", "Machine rows"],# lat
	"3. ": ["Lat pull downs", "Barbell rows", "Machine rows", "Lat pull-down"],# lat/back
	"4. ": ["Reverse dumbbell front raise", "Single arm dumbbell row", "DB Upright row", "DB Lateral raise"],# back
	"5. ": ["Cable lateral raise", "Shoulder press machine", "DB reverse fly", "DB shoulder press (Parallel grip)"],# rear delt?
	"6. ": ["DB Shrug", "Face Pulls", "BB Shrug", "Single arm cable reverse fly"],# tricep/bi
	"7. ": ["Standing cable crunch", "Mountain climbers"],# tricep/bi
	"8. ": ["Plank", "Side plank", "Leg raise"],# bi/forearm?
	"9. ": ["Leg extensions", "Lying leg curl", "Leg extension machine", "Lying hamstring curl"],
	"10. ": ["Leg press", "Smith squats", "BB Squats", "Hack squats"] # test/ cl
}# 8-10 w / 2-3 ss/ m 4 s

# sets/reps
var sets_options = [3, 4]  
var reps_options = [8, 10, 12, 15]  

@onready var workout_label = $Label  

func _ready():
	generate_workout_plan()

func generate_workout_plan():
	var workout_plan = "Full Body Workout Plan:\n\n"

	for muscle_group in exercises_full_body.keys():
		workout_plan += muscle_group 
		
		# Random exercises selection
		var selected_exercises = get_random_exercises(exercises_full_body[muscle_group], 1)

		for exercise in selected_exercises:
			# random sets and reps
			var sets = select_random(sets_options)
			var reps = select_random(reps_options)
			workout_plan += str(exercise) + "      " + str(sets) + " x " + str(reps) + "\n"
		
		workout_plan += "\n"
	
	workout_label.text = workout_plan 

#random exercises
func get_random_exercises(exercise_list: Array, count: int) -> Array:
	var shuffled_list = exercise_list.duplicate()  #Duplicate the list to avoid modifying the original
	shuffled_list.shuffle()  #Shuffle the duplicated list
	return shuffled_list.slice(0, count)  

#random values from a list
func select_random(options: Array) -> int:
	return options[randi() % options.size()]
