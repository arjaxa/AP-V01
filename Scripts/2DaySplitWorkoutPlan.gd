extends Control

#arrays for day1/day2 
var exercises_day_1 = {
	"1.": ["Barbell squats", "Leg press", "Smith squats", "Leg extensions"],
	"2.": ["Barbell chest press", "Dumbbell chest press", "Push ups", "Chest press machine"],
	"3.": ["Lat pull downs", "Barbell rows", "Machine rows", "Single arm dumbbell row"],
	"4.": ["Dumbbell lunge", "Dumbbell deadlift", "Lying hamstring curl", "Dumbbell romanian deadlift"],
	"5.": ["Dumbbell shoulder press (seated)", "Shoulder press machine", "Dumbbell lateral raise", "Dumbbell reverse fly"],
}

var exercises_day_2 = {
	"6.": ["Dumbbell tricep kickbacks", "Tricep dips", "Cable tricep pushdown", "Over head tricep extension"],
	"7.": ["Bicep curls", "Barbell curl", "Concentration curls", "Cable bicep curls"],
	"8.": ["Plank", "Leg raise", "Mountain climbers", "Russian twists"]
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
	workout_plan += "Day 1 Workout Plan:\n\n"
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
	workout_plan += "Day 2 Workout Plan:\n\n"
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
