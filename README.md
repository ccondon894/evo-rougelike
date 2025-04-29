# Evolutionary Roguelike

A simple evolutionary roguelike game built with Godot 4.4.1 that demonstrates evolution mechanics in a turn-based system.

## Overview

This project implements a minimal evolutionary system where an entity evolves over generations through random mutations of its genetic traits. The player advances through generations by clicking a button, with each generation offering a chance for the entity to evolve.


## Features

### Evolution System
- Turn-based gameplay representing generations in an evolutionary timeline
- Entity with three core genetic traits:
  - **Strength**: Affects the entity's size
  - **Intelligence**: Changes the entity's color (more red = more intelligent)
  - **Speed**: Currently visual representation only
- Random mutation system with a 10% chance per trait per generation
- Visual representation of genetic changes

### Game Mechanics
- Simple turn-based progression with "Next Generation" button
- Game ends after 10 generations
- Stats tracking and visual feedback on entity evolution

### User Interface
- Clean, organized UI layout
- Generation counter
- Stats display showing current genetic trait values
- Game over message when reaching the maximum generation

## How to Play

1. Open the project in Godot 4.4.1
2. Run the game
3. Click the "Next Generation" button to advance through generations
4. Watch how the entity evolves:
   - Its size changes based on the Strength trait
   - Its color becomes more red with higher Intelligence
5. The game ends after 10 generations

## Project Structure

```
evolutionary_roguelike/
├── project.godot
├── main.tscn          # Main scene with all game elements
├── main.gd            # Main script handling all game logic
├── entity.svg         # Entity sprite
```

## Implementation Details

### Genetics & Mutation

The core of the evolution system is the mutation function:

```gdscript
func evolve_entity():
    # Apply random mutations to each trait
    if randf() < 0.1:
        genetics["strength"] += (randf() * 0.4) - 0.2
        genetics["strength"] = max(0.1, genetics["strength"])
    
    if randf() < 0.1:
        genetics["intelligence"] += (randf() * 0.4) - 0.2
        genetics["intelligence"] = max(0.1, genetics["intelligence"])
        
    if randf() < 0.1:
        genetics["speed"] += (randf() * 0.4) - 0.2
        genetics["speed"] = max(0.1, genetics["speed"])
```

Each trait has a 10% chance to mutate in each generation, with mutation changing the trait value by a random amount between -0.2 and +0.2.

## Future Development Ideas

This project can be expanded in many ways:

- **Multiple Entities**: Create a population with many evolving entities
- **Reproduction**: Add reproduction mechanics between entities
- **Natural Selection**: Implement survival mechanics that favor certain traits
- **Environmental Factors**: Add environmental pressures that influence evolution
- **Procedural Level Generation**: Create evolving worlds for entities to explore
- **Player Interaction**: Allow players to influence the evolutionary process
- **Advanced Genetics**: More complex genetic systems (recessive traits, gene linkage)

## Requirements

- Godot 4.4.1 or later

## License

[MIT License](LICENSE)

## Credits

Created as a demonstration of evolutionary game mechanics using Godot Engine.
