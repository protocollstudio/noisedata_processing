class Distance extends Panel {

    String address;
    private OscMessage[] messages;
    // add global variables of your sketch here 
    int fg, bg; // foreground and background colors
    int nbNodes;
    Node[] nodes;
    float radius, angle; // variables for creating nodes
    float longest; // maximum length between a node and cursor ot make it equal to zero
    String mode;
    float cursorX, cursorY; // position of the cursor
    float inc, step, speed; // noise mode variables
    // lissajous mode variable
    float freqA, freqB, signalA, signalB, phaseA, phaseB;


    Distance(String title, float x, float y, float w, float h) {
        super(title, x, y, w, h);
        // insert your sketch setup here 
        fg = 255;
        bg = 0;
        nbNodes = 6;
        // calculate the maximum size of the nodes circle according to the resolution of the panel
        if (w > h) {
            radius = (h - h / 5) / 2;
        } else {
            radius = (w - w / 5) / 2;
        }
        // initialize noise mode variables
        inc = 0;
        step = 0.10;
        speed = 1;
        // initialize lissajous mode variables
        freqA = 0.2;
        freqB = 0.3;
        phaseA = 0;
        phaseB = 0;
        // default mode
        mode = "mouse";
        createNodes();
    }

    void run() {
        render();
        send();
    }

    void render() {
        push();
        display();
        // insert your sketch draw function here
        ellipseMode(CENTER);
        modes();
        for (int i = 0; i < nbNodes; i++) {
            stroke(fg);
            line(nodes[i].x, nodes[i].y, cursorX, cursorY); //display lines
            nodes[i].display(); // display nodes
            // display bars and percentages
            fill(fg);
            rect(10, i * 10 + 10, map(nodes[i].value, 0, longest, 0, 50), 5);
            textSize(8);
            float gui_value = round(map(nodes[i].value, 0, longest, 0, 1000));
            text(gui_value + "%", 63, i * 10 + 16);
        }
        // display cursor
        stroke(fg);
        fill(bg);
        ellipse(cursorX, cursorY, 15, 15);
        // noise factor
        inc += step;
        pop();
    }

    void send() {
        for (int i = 0; i < nbNodes; i++) {
            // each node send an osc message on a different address based on node number
            messages[i] = new OscMessage("/node" + i);
            /* each message is a float between 0 and 1 proportional to the distance
            between the node and the cursor */
            messages[i].add(norm(nodes[i].value, 0, longest));
            osc.send(messages[i], remote);
        }
    }

    void createNodes() {
        nodes = new Node[nbNodes];
        angle = -PI / 2;
        if (w > h) {
            radius = (h - h / 5) / 2;
        } else {
            radius = (w - w / 5) / 2;
        }
        for (int i = 0; i < nbNodes; i++) {
            x = cos(angle) * radius;
            y = sin(angle) * radius;
            nodes[i] = new Node(i, x + w / 2, y + h / 2);
            angle += TWO_PI / nbNodes;
        }
        longest = radius * 2 - radius / 5;
        messages = new OscMessage[nbNodes];
    }

    void modes() {
        if (mode == "mouse") {
            mouseMode();
        }
        if (mode == "noise") {
            noiseMode();
        }
        if (mode == "lissajous") {
            lissajousMode();
        }
    }

    void mouseMode() {
        noCursor();
        cursorX = mouseX;
        cursorY = mouseY;
    }

    void noiseMode() {
        cursor();
        if (dist(cursorX, cursorY, w / 2, h / 2) < radius) {
            cursorX += noise(inc) * speed * 2 - speed;
            cursorY += noise(inc + 100) * speed * 2 - speed;
        } else {
            if (cursorX > w / 2) {
                cursorX -= noise(inc) * speed * 2;
            } else {
                cursorX += noise(inc) * speed * 2;
            }
            if (cursorY > h / 2) {
                cursorY -= noise(inc) * speed * 2;
            } else {
                cursorY += noise(inc) * speed * 2;
            }
            inc += 10;
        }
    }

    void lissajousMode() {
        cursor();
        signalA = sin(radians(freqA * frameCount + phaseA));
        signalB = cos(radians(freqB * frameCount + phaseB));
        cursorX = signalA * radius + w / 2;
        cursorY = signalB * radius + h / 2;
    }

    class Node {
        float x, y, value;
        int n;

        Node(int aNumber, float aX, float aY) {
            n = aNumber;
            x = aX;
            y = aY;
        }

        void display() {
            push();
            noStroke();
            fill(fg);
            ellipse(x, y, 25, 25);
            value = constrain(longest - dist(x, y, cursorX, cursorY), 0, longest);
            float arcSize = map(value, 0, longest, 0, TWO_PI);
            fill(fg, 100);
            textSize(10);
            textAlign(CENTER);
            text(n, x, y + 4);
            pop();
        }
    }
}