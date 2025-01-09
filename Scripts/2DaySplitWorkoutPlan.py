from py4godot import BaseClass
from py4godot.methods import onready, signal
from py4godot.classes import Array, Control
from py4godot.globals import randi


class 2DaySplitWorkoutPlan(Control):

	@signal
	def generate_signal(self):
		pass

	exercises_day_1 = {
		"1.": ["Barbell bench press", "Incline bench press", "Dumbbell bench press", "Smith machine bench press"],
		"2.": ["Decline dumbbell fly", "Cable fly", "Dumbbell pullover", "Machine rows"],
		"3.": ["Lat pull downs", "Barbell rows", "Machine rows", "Lat pull-down"],
		"4.": ["Reverse dumbbell front raise", "Single arm dumbbell row", "DB Upright row", "DB Lateral raise"],
		"5.": ["Cable lateral raise", "Shoulder press machine", "DB reverse fly", "DB shoulder press (Parallel grip)"],
		"6.": ["DB Shrug", "Face Pulls", "BB Shrug", "Single arm cable reverse fly"],
		"7.": ["Standing cable crunch", "Mountain climbers"],
		"8.": ["Plank", "Side plank", "Leg raise"],
	}

	exercises_day_2 = {
		"1.": ["Leg extensions", "Lying leg curl", "Leg extension machine", "Lying hamstring curl"],
		"2.": ["Leg press", "Smith squats", "BB Squats", "Hack squats"],
		"3.": ["BB deadlifts", "BB Romanian deadlift", "DB Romanian deadlif", "DB Sumo deadlift"],
		"4.": ["Standing cable hamstring curl", "DB Hamstring curl", "Lying cable hamstring curl"],
		"5.": ["DB Bicep curls", "Concentration curls", "BB Bicep curls", "Cable bicep curls"],
		"6.": ["Cable tricep extension", "DB tricep kickbacks", "Standing overhead tricep extension", "Cable rope tricep extension"],
		"7.": ["DB Hammer curls", "Tricep dips", "Single db curl", "Close grip bench press"],
		"8.": ["Standing calf raise machine", "Seated calf machine"],
	}

	sets_options = Array([3, 4])
	reps_options = Array([8, 10, 12, 15])

	@onready var workout_label = $"Label"
	@onready var generate_button = $"GenerateButton"

	def _ready(self):
		self.generate_button.connect("pressed", self.generate_workout_plan)

	def generate_workout_plan(self):
		workout_plan = ""

		# Generate Day 1 workout
		workout_plan += "Day 1:\n\n"
		for muscle_group, exercises in self.exercises_day_1.items():
			workout_plan += muscle_group + "\n"
			selected_exercises = self.get_random_exercises(exercises, 1)

			for exercise in selected_exercises:
				sets = self.select_random(self.sets_options)
				reps = self.select_random(self.reps_options)
				workout_plan += f"{exercise}      {sets} x {reps}\n"
			workout_plan += "\n"

		# Generate Day 2 workout
		workout_plan += "Day 2:\n\n"
		for muscle_group, exercises in self.exercises_day_2.items():
			workout_plan += muscle_group + "\n"
			selected_exercises = self.get_random_exercises(exercises, 1)

			for exercise in selected_exercises:
				sets = self.select_random(self.sets_options)
				reps = self.select_random(self.reps_options)
				workout_plan += f"{exercise}      {sets} x {reps}\n"
			workout_plan += "\n"

		self.workout_label.text = workout_plan

	def get_random_exercises(self, exercise_list: Array, count: int) -> Array:
		shuffled_list = exercise_list.duplicate()  
		shuffled_list.shuffle()  
		return shuffled_list.slice(0, count)

	def select_random(self, options: Array) -> int:
		return options[randi() % options.size()]
