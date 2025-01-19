extends Control

#push day 
var exercises_day_1 = {
	"1. ": ["Front squat", "Leg press", "Smith Squats"],
	"2. ": ["Barbell press", "Bench press machine"],
	"3. ": ["Leg press", "DB Goblet squat"],
	"4. ": ["Tricep dip", "Tricep rope pushdown"],
	"5. ": ["Diomond push-up"],
	"6. ": ["Standing calf raise", "Seated calf raise"],
	"7. ": ["Standing cable crunch", "Mountain climbers"],
	"8. ": ["Plank", "Leg raise"]
}
#pull day
var exercises_day_2 = {
	"1. ": ["Leg extensions", "Lying leg curl", "Leg extension machine", "Lying hamstring curl"],
	"2. ": ["DB Romanian deadlift", "BB Romanian deadlift"],
	"3. ": ["Lat pull down", "Pull-up", "BB Row", "Seated row machine"],
	"4. ": ["DB Bicep curl", "BB Bicep curl"],
	"5. ": ["Concentration curls", "DB Hammer curls", "Cable bicep curls"],
	"6. ": ["BB Forearm", "DB Forearm"],
	"7. ": ["Kneeling cable crunch", "Crunch machine"],
	"8. ": ["Reverse plank", "Side plank"]
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
