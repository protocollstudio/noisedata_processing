# noisedata
Collection of OSC graphics modules.

## Requirements
- OscP5 (processing library)

## Usage
Duplicate "Module" class to create another module.

### Scene managing
- Copy example.states.pde 
- Rename it states.pde
- And modify it at your convenience


## Best practices
1. Create your sketch outside of noise_data. 
2. Think about what kind of data it could send on OSC.
3. Once your done, turn it into a module.



## The Idea :
noise:data was created to serve audio generation as much as the visual generation
Each module sends OSC on its own way visualized graphicly in a minimal esthetic


## The Modules

Each module send a OSC message. There are two types of messages : bangs and waves.
A trigger is a value switching from zero to one. It's an integer value.
A wave is a continuous signal ranging from zero to one. It's a float value.

### Lines :
lines can't be controlled (for now)
Each line module send a continuous signal.
The OSC messages are :
- /LINE0 value
- /LINE1 value
etc.

### Gate :
A ball bounces on every side of the module when the ball collides with one of those side a bang message is sent (1 or true)

### Nodes
The node module is a central point surrounded by other points
Each of those point are linked to the central point and they all send an osc value based on the distance separating them from the central point
By default you can controll the central point position manually but other options are available

#### Mouse mode

#### Lissajous mode

#### Noise mode

### Sequence
In term of osc sent this module is close to the ball module
Each circle has a "point" rotating on the circle, when the point reaches the little dot it sends a bang (1) through OSC




### Shortcuts :
#### Numpad keys :
As mentioned above you can create your own scenes, It can be really useful to create a music or live structure 

By default there are 7 scenes declared, you can access each of them with the numpad keys (1 to 7)

**Scene 1 :**
- Line 0
- Line 1 
- Line 2
- Line 3
- Gate 0
- Gate 1
- Gate 2
- Gate 3
- Sequence
- Nodes

**Scene 2 :**
- Nodes

**Scene 3 :**
- Line 1 
- Gate 3

**Scene 4 :**
- Line 2 
- Sequence

**Scene 5 :** 
- Gate 2 
- Gate 3

**Scene 6 :** 
- Nodes
- Line 1
- Gate 1 
- Gate 2

**Scene 7 :** 
- Sequence
- Line 1
- Line 2
- Gate 0
- Gate 1
- Gate 2
- Gate 3

### How to use 

#### With ableton
##### TODO Make a video tutoriel
Launch noise:data
Launch Ableton 
Add a midi track
Select the midi track 
You will need to download the Ableton Connection Kit (url)
Once you've unzip all the files go to **OSC TouchOSC**
Double click on **OSC TouchOSC.amxd**  the module should appear in ableton on your midi track
Add a instrument on the midi track
**On OSC TouchOSC module : **
Change the port number to 7777
Click on **Learn** on the OSC TouchOSC
Some osc msg should be received (ex : LINE0 0.5 ) unclikc the learn button after that
Click on map on the same line you've "learned" and select a knob you would like to modify on the instrument (the pan for example)
The knob values should automaticly adapt to the osc message
You're DONE :D


##### Demo file
We've setup a demo file to show how noise:data can be interfaced with ableton
Download this project file



