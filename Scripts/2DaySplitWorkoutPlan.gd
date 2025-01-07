extends Control

#arrays for day1/day2 
var exercises_day_1 = {
	"1.": ["Barbell bench press", "Incline bench press", "Dumbbell bench press", "Smith machine bench press"],
	"2.": ["Decline dumbbell fly", "Cable fly", "Dumbbell pullover", "Machine rows"],
	"3.": ["Lat pull downs", "Barbell rows", "Machine rows", "Lat pull-down"],
	"4.": ["Reverse dumbbell front raise", "Single arm dumbbell row", "DB Upright row", "DB Lateral raise"],
	"5.": ["Cable lateral raise", "Shoulder press machine", "DB reverse fly", "DB shoulder press (Paralell grip)"],
	"6.": ["DB Shrug", "Face Pulls", "BB Shrug", "Single arm cable reverse fly"],
	"7.": ["Standing cable crunch", "Mountain climbers"],
	"8.": ["Plank", "Side plank", "Leg raise"]
}

var exercises_day_2 = {
	"1.": ["Leg extensions", "Lying leg curl", "Leg extension machine", "Lying hamstring curl"],
	"2.": ["Leg press", "Smith squats", "BB Squats", "Hack squats"],
	"3.": ["BB deadlifts", "BB Romanian deadlift", "DB Romanian deadlif", "DB Sumo deadlift"],
	"4.": ["Standing cable hamstring curl", "DB Hamstring curl", "Lying cable hamstring curl"],
	"5.": ["DB Bicep curls", "Concentration curls", "BB Bicep curls", "Cable bicep curls"],
	"6.": ["Cable tricep extension", "DB tricep kickbacks", "Standing overhead tricep extension", "Cable rope tricep extension"],
	"7.": ["DB Hammer curls", "Tricep dips", "Single db curl", "Close grip bench press"],
	"8.": ["Standing calf raise machine", "Seated calf machine"]
}

#arrays for sets/reps
var sets_options = [3, 4]  
var reps_options = [8, 10, 12, 15]  

@onready var workout_label = $Label  

func _ready():
	generate_workout_plan()

func generate_workout_plan():
	var workout_plan = ""
	
	#Day 1 workout
	workout_plan += "Day 1:\n\n"
	for muscle_group in exercises_day_1.keys():
		workout_plan += muscle_group 
		
		#random exercises selection
		var selected_exercises = get_random_exercises(exercises_day_1[muscle_group], 1)
		
		for exercise in selected_exercises:
			# select random sets and reps
			var sets = select_random(sets_options)
			var reps = select_random(reps_options)
			workout_plan += str(exercise) + "      " + str(sets) + " x " + str(reps) + "\n"
		workout_plan += "\n"
	
	#Day 2 workout
	workout_plan += "Day 2:\n\n"
	for muscle_group in exercises_day_2.keys():
		workout_plan += muscle_group 
		
		#random exercises
		var selected_exercises = get_random_exercises(exercises_day_2[muscle_group], 1)
		
		for exercise in selected_exercises:
			#random sets and reps selection
			var sets = select_random(sets_options)
			var reps = select_random(reps_options)
			workout_plan += str(exercise) + "      " + str(sets) + " x " + str(reps) + "\n"
		workout_plan += "\n"
	
	workout_label.text = workout_plan  #shows workout plan in the label

#select random exercises from a list
func get_random_exercises(exercise_list: Array, count: int) -> Array:
	var shuffled_list = exercise_list.duplicate()  #duplicate the list to avoid modifying the original
	shuffled_list.shuffle()  #shuffle the duplicated list
	return shuffled_list.slice(0, count)  #return the first 'count' exercises

#selectrandom values from a list
func select_random(options: Array) -> int:
	return options[randi() % options.size()]
