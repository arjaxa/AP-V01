from godot import exposed, Node, Label
from random import choice, sample

@exposed
class FullBodySplitWorkoutPlanControl(Node):

	exercises = {
		"1.": ["Barbell squats", "Leg press", "Smith squats", "Leg extensions"],
		"2.": ["Barbell chest press", "Dumbbell chest press", "Push ups", "Chest press machine"],
		"3.": ["Lat pull downs", "Barbell rows", "Machine rows", "Single arm dumbbell row"],
		"4.": ["Dumbbell lunge", "Dumbbell deadlift", "Lying hamstring curl", "Dumbbell romanian deadlift"],
		"5.": ["Dumbbell shoulder press (seated)", "Shoulder press machine", "Dumbbell lateral raise", "Dumbbell reverse fly"],
		"6.": ["Dumbbell tricep kickbacks", "Tricep dips", "Cable tricep pushdown", "Over head tricep extension"],
		"7.": ["Bicep curls", "Barbell curl", "Concentration curls", "Cable bicep curls"],
		"8.": ["Plank", "Leg raise", "Mountain climbers", "Russian twists"]
	}

	sets_options = [3, 4]  
	reps_options = [8, 10, 12, 15]  

	workout_label: Label = None

	def _ready(self):
			def generate_workout_plan(self):
		workout_plan = ""
		
		for muscle_group in self.exercises.keys():
			workout_plan += muscle_group 
			selected_exercises = self.get_random_exercises(self.exercises[muscle_group], 1)
			for exercise in selected_exercises:
				sets = self.select_random(self.sets_options)
				reps = self.select_random(self.reps_options)
				workout_plan += f"{exercise}      {sets} x {reps}\n"
			workout_plan += "\n"
		
		if self.label:
			self.label.text = workout_plan  # Display workout plan in the label

	def get_random_exercises(self, exercise_list, count):
		return sample(exercise_list, count)

	def select_random(self, options):
		return choice(options)
