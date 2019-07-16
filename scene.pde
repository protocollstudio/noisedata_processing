// scene handling
// TODO instance of scene contains a panel list
// TODO user can create and save a scene
// TODO user can display a scene
// TODO user can modify a scene
// TODO user can delete a scene

class Scene {
    ArrayList<Panel> panelList;

    Scene() {
        panelList = new ArrayList<Panel>();
    }

    void addPanel(String aName, String aPanelType) {
       Panel panel;
       switch (aPanelType) {
           case "ball" : panel = new Ball(aName, 2, 2, 15, 15);
           case "distance" : panel = new Distance(aName, 2, 2, 70, 40);
           case "line" : panel = new Line(aName, 2, 2, 25, 10);
           case "pot" : panel = new Pot(aName, 2, 2, 41, 15);
           default: panel = new Ball(aName, 2, 2, 15, 15); 
       }
       panelList.add(panel);
    }

<<<<<<< HEAD
    void run() {
        for (int i = 0; i < panels.length() {
            panels[i].run();
            // TODO only one panel must be active
=======
>>>>>>> 7f0d9fdcd2edb6fc303a730d55891ee96c985ffe
        }
    }
}
