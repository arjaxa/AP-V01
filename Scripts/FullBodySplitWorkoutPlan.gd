extends Control

# Push exercises
var push_exercises = {
	"1. ": ["Front squat", "Leg press", "Smith Squats"],
	"2. ": ["Barbell press", "Bench press machine"],
	"3. ": ["Leg press", "DB Goblet squat"],
	"4. ": ["Tricep dip", "Tricep rope pushdown"],
	"5. ": ["Diamond push-up"],
	"6. ": ["Standing calf raise", "Seated calf raise"],
	"7. ": ["Standing cable crunch", "Mountain climbers"],
	"8. ": ["Plank", "Leg raise"]
}

# Pull exercises
var pull_exercises = {
	"1. ": ["Leg extensions", "Lying leg curl", "Leg extension machine", "Lying hamstring curl"],
	"2. ": ["DB Romanian deadlift", "BB Romanian deadlift"],
	"3. ": ["Lat pull down", "Pull-up", "BB Row", "Seated row machine"],
	"4. ": ["DB Bicep curl", "BB Bicep curl"],
	"5. ": ["Concentration curls", "DB Hammer curls", "Cable bicep curls"],
	"6. ": ["BB Forearm", "DB Forearm"],
	"7. ": ["Kneeling cable crunch", "Crunch machine"],
	"8. ": ["Reverse plank", "Side plank"]
}

# Leg exercises
var leg_exercises = {
	"1. ": ["Deadlift", "Leg press", "Leg extension"],
	"2. ": ["Squats", "Lunges", "Leg press"],
	"3. ": ["Leg press", "DB Goblet squat", "Squats"],
	"4. ": ["Seated leg curl", "Leg press", "Deadlift"],
	"5. ": ["Calf raise", "Standing calf raise", "Seated calf raise"],
	"6. ": ["Glute bridges", "Hip thrust", "Leg press"],
	"7. ": ["Leg press", "Romanian deadlift", "Leg extensions"],
	"8. ": ["Glute bridges", "Deadlift", "Seated leg curl"]
}

# Sets/reps
var sets_options = [3, 4]
var reps_options = [8, 10, 12, 15]

@onready var workout_label = $Label

func _ready():
	randomize()  
	generate_workout_plan()

func generate_workout_plan() -> void:
	var workout_plan = ""

	workout_plan += add_day_workout("Day 1:", push_exercises)
	workout_plan += add_day_workout("Day 2:", pull_exercises)
	workout_plan += add_day_workout("Day 3:", leg_exercises)

	workout_label.text = workout_plan

func add_day_workout(day_name: String, exercises: Dictionary) -> String:
	var workout_day_plan = day_name + "\n\n"

	for muscle_group in exercises.keys():
		workout_day_plan += muscle_group
		
		var selected_exercises = get_random_exercises(exercises[muscle_group], 1)

		for exercise in selected_exercises:
			var sets = select_random(sets_options)
			var reps = select_random(reps_options)
			workout_day_plan += str(exercise) + "      " + str(sets) + " x " + str(reps) + "\n"
		workout_day_plan += "\n"

	return workout_day_plan

func get_random_exercises(exercise_list: Array, count: int) -> Array:
	var shuffled_list = exercise_list.duplicate()
	shuffled_list.shuffle()
	return shuffled_list.slice(0, count)

func select_random(options: Array) -> int:
	return options[randi() % options.size()]
