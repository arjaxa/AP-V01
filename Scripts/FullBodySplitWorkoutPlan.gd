extends Control

#arrays for exercises
var exercises = {
	"1.": ["Bench Press", "Push Ups", "Dumbbell Flyes", "Chest Dips"],
	"2.": ["Pull Ups", "Bent Over Rows", "Deadlifts", "Lat Pulldowns"],
	"3.": ["Squats", "Leg Press", "Lunges", "Leg Curls"],
	"4.": ["Shoulder Press", "Lateral Raises", "Front Raises", "Shrugs"],
	"5.": ["Tricep Dips", "Skull Crushers", "Tricep Extensions", "Close Grip Bench Press"],
	"6.": ["Bicep Curls", "Hammer Curls", "Chin Ups", "Concentration Curls"],
	"7.": ["Planks", "Crunches", "Leg Raises", "Russian Twists"]
}

#arrays for sets and reps
var sets_options = [3, 4, 5]  
var reps_options = [8, 10, 12, 15]  

#reference to the Label node
@onready var workout_label = $Label  

func _ready():
	generate_workout_plan()

func generate_workout_plan():
	var workout_plan = ""
	
	for muscle_group in exercises.keys():
		workout_plan += muscle_group 
		
		#Select 2 random exercises
		var selected_exercises = get_random_exercises(exercises[muscle_group], 2)
		
		for exercise in selected_exercises:
			#select random sets and reps
			var sets = select_random(sets_options)
			var reps = select_random(reps_options)
			workout_plan += str(exercise) + "      " + str(sets) + " x " + str(reps) + "\n"
		workout_plan += "\n"
	
	workout_label.text = workout_plan  #display workout plan in the label

#select random exercises from a list
func get_random_exercises(exercise_list: Array, count: int) -> Array:
	var shuffled_list = exercise_list.duplicate()  #duplicate the list to avoid modifying the original
	shuffled_list.shuffle()  #Shuffle the duplicated list
	return shuffled_list.slice(0, count)  #return the first 'count' exercises

#select random values from a list
func select_random(options: Array) -> int:
	return options[randi() % options.size()]
