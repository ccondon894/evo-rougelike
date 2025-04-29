extends Node2D

# Configuration
var max_generations = 10
var current_generation = 0
var game_ended = false

# Entity genetics
var genetics = {
	"strength": 1.0,
	"intelligence": 1.0,
	"speed": 1.0
}

func _ready():
	# Initial UI setup
	$UI/GameOverLabel.visible = false
	update_ui()
	
	# Connect button
	$UI/NextGenButton.pressed.connect(_on_next_gen_pressed)

func _on_next_gen_pressed():
	if game_ended:
		return
		
	# Increment generation
	current_generation += 1
	
	# Evolve entity
	evolve_entity()
	
	# Update UI
	update_ui()
	
	# Check for game end
	if current_generation >= max_generations:
		game_ended = true
		$UI/NextGenButton.disabled = true
		$UI/GameOverLabel.visible = true

func evolve_entity():
	# Mutate traits
	if randf() < 0.5:
		genetics["strength"] += (randf() * 0.4) - 0.2
		genetics["strength"] = max(0.1, genetics["strength"])
	
	if randf() < 0.5:
		genetics["intelligence"] += (randf() * 0.4) - 0.2
		genetics["intelligence"] = max(0.1, genetics["intelligence"])
		
	if randf() < 0.5:
		genetics["speed"] += (randf() * 0.4) - 0.2
		genetics["speed"] = max(0.1, genetics["speed"])
	
	# Update entity appearance
	var scale_value = 0.5 + genetics["strength"] * 0.2
	$Entity.scale = Vector2(scale_value, scale_value)
	
	# Set color based on intelligence
	var red_value = 1.0
	var green_blue_value = 1.0 - genetics["intelligence"] * 0.5
	$Entity.modulate = Color(red_value, green_blue_value, green_blue_value)
	
	print("Entity evolved: ", genetics)

func update_ui():
	$UI/GenerationLabel.text = "Generation: " + str(current_generation)
	
	var stats_text = "Entity Stats:\n"
	stats_text += "Strength: " + str(snapped(genetics["strength"], 0.01)) + "\n"
	stats_text += "Intelligence: " + str(snapped(genetics["intelligence"], 0.01)) + "\n"
	stats_text += "Speed: " + str(snapped(genetics["speed"], 0.01))
	$UI/StatsLabel.text = stats_text
