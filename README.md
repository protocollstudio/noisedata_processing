# noisedata
Collection of OSC graphics modules.

## Requirements
- [Processing](https://processing.org/)
- OscP5 (processing library). To download it : Tools > Add a tool

## Usage
Each module send an osc message at the address /panelName between 0 and 1.
Press h for help.
LFO send a continuous signal between 0 and 1.
GATE send a bang (a variable which pass from zero to one) when the ball hit the border.
SEQUENCER send a bang each time a rotary is at twelve o'clock.
NODES send a array of continuous signals between 0 and 1, as much as there are nodes (follow the displayed instructions).

## Best practices
1. Create your sketch outside of noise_data. 
2. Think about what kind of data it could send on OSC.
3. Once your done, turn it into a module.
