extends Control

# Declare arrays for exercises
var exercises = {
	"Chest": ["Bench Press", "Push Ups", "Dumbbell Flyes", "Chest Dips"],
	"Back": ["Pull Ups", "Bent Over Rows", "Deadlifts", "Lat Pulldowns"],
	"Legs": ["Squats", "Leg Press", "Lunges", "Leg Curls"],
	"Shoulders": ["Shoulder Press", "Lateral Raises", "Front Raises", "Shrugs"],
	"Triceps": ["Tricep Dips", "Skull Crushers", "Tricep Extensions", "Close Grip Bench Press"],
	"Biceps": ["Bicep Curls", "Hammer Curls", "Chin Ups", "Concentration Curls"],
	"Abs": ["Planks", "Crunches", "Leg Raises", "Russian Twists"]
}

# Declare arrays for sets and reps
var sets_options = [3, 4, 5]  # Example set options
var reps_options = [8, 10, 12, 15]  # Example rep options

# Reference to the Label node
@onready var workout_label = $Label  # Adjust path based on your node hierarchy

func _ready():
	generate_workout_plan()

# Function to generate the workout plan
func generate_workout_plan():
	var workout_plan = ""
	
	for muscle_group in exercises.keys():
		workout_plan += muscle_group + ":\n"
		
		# Select 2 random exercises
		var selected_exercises = get_random_exercises(exercises[muscle_group], 2)
		
		for exercise in selected_exercises:
			# Select random sets and reps
			var sets = select_random(sets_options)
			var reps = select_random(reps_options)
			workout_plan += str(exercise) + ": " + str(sets) + " sets of " + str(reps) + " reps\n"
		workout_plan += "\n"
	
	workout_label.text = workout_plan  # Display workout plan in the label

# Function to select random exercises from a list
func get_random_exercises(exercise_list: Array, count: int) -> Array:
	var shuffled_list = exercise_list.duplicate()  # Duplicate the list to avoid modifying the original
	shuffled_list.shuffle()  # Shuffle the duplicated list
	return shuffled_list.slice(0, count)  # Return the first 'count' exercises

# Function to select random values from a list
func select_random(options: Array) -> int:
	return options[randi() % options.size()]
