//Controls methods

//initialize control objects
void init_controls() {
  cp5 = new ControlP5(this);
  load_button = cp5.addButton("loadButton");
  load_button.setPosition(5, 5).setSize(200,30);
  load_button.setLabel("Load Image");
}

//draw the controls in the window
void draw_controls() {
    load_button.setPosition(5, 5).setSize(200,30);
}

//method to perform operations when a control event occurs
public void controlEvent(ControlEvent theEvent) {
  if (theEvent.getController().getName() == "loadButton") {
    selectInput("Select a file to process:", "imgSelected");
  }
}

//image selection method
void imgSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    loaded_img = loadImage(selection.getName());
    displayed_img = loaded_img;
    resize_window(loaded_img);
  }
}
