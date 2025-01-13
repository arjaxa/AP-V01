# full_body_split_workout_plan.py

import random
from godot import exposed, Node, Label

@exposed
class FullBodySplitWorkoutPlan(Node):  # Adjust inheritance to match your needs
	exercises = {
		"1.": ["Barbell squats", "Leg press", "Smith squats", "Leg extensions"],
		"2.": ["Barbell chest press", "Dumbbell chest press", "Push ups", "Chest press machine"],
		# ... continue with the initialization
	}

	sets_options = [3, 4]
	reps_options = [8, 10, 12, 15]

	def _ready(self) -> None:
		self.workout_label = self.get_node("Label")  # Adjust the node path if needed
		self.generate_workout_plan()

	def generate_workout_plan(self) -> None:
		workout_plan = ""

		for muscle_group in self.exercises.keys():
			workout_plan += muscle_group 
			selected_exercises = self.get_random_exercises(self.exercises[muscle_group], 1)

			for exercise in selected_exercises:
				sets = self.select_random(self.sets_options)
				reps = self.select_random(self.reps_options)
				workout_plan += f"{exercise}      {sets} x {reps}\n"
			workout_plan += "\n"

		self.workout_label.text = workout_plan

	def get_random_exercises(self, exercise_list: list, count: int) -> list:
		shuffled_list = exercise_list.copy()
		random.shuffle(shuffled_list)
		return shuffled_list[:count]

	def select_random(self, options: list) -> int:
		return random.choice(options)
