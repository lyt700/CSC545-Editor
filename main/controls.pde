//Controls methods

//initialize control objects
void init_controls() {
  cp5 = new ControlP5(this);
  //load button
  load_button = cp5.addButton("loadButton");
  load_button.setPosition(5, 5).setSize(115,30);
  load_button.setLabel("Load Image");
  //save button
  save_button = cp5.addButton("saveButton");
  save_button.setPosition(125, 5).setSize(115,30);
  save_button.setLabel("Save Image");
  //grayscale
  grayscale_button = cp5.addButton("grayscaleButton");
  grayscale_button.setPosition(5, 45).setSize(115,30);
  grayscale_button.setLabel("Grayscale Filter");
  //negative
  negative_button = cp5.addButton("negativeButton");
  negative_button.setPosition(5, 80).setSize(115,30);
  negative_button.setLabel("Negative Filter");
  //binary
  binary_button = cp5.addButton("binaryButton");
  binary_button.setPosition(5, 115).setSize(115,30);
  binary_button.setLabel("Binary Filter");
  //brighten
  brighten_button = cp5.addButton("brightenButton");
  brighten_button.setPosition(5, 150).setSize(115,30);
  brighten_button.setLabel("Brighten");
  //darken
  darken_button = cp5.addButton("darkenButton");
  darken_button.setPosition(5, 185).setSize(115,30);
  darken_button.setLabel("Darken");
  //highlight
  highlight_button = cp5.addButton("highlightButton");
  highlight_button.setPosition(5, 220).setSize(115,30);
  highlight_button.setLabel("Highlight");
  //brush
  brush_button = cp5.addButton("brushButton");
  brush_button.setPosition(5, 255).setSize(115,30);
  brush_button.setLabel("Brush");
  //erase
  erase_button = cp5.addButton("eraseButton");
  erase_button.setPosition(5, 290).setSize(115,30);
  erase_button.setLabel("Erase");
  
  //TODO - shapes
  
}

//draw the controls in the window
void draw_controls() {
    load_button.setPosition(5, 5).setSize(115,30);
    save_button.setPosition(125, 5).setSize(115,30);
    grayscale_button.setPosition(5, 45).setSize(115,30);
    negative_button.setPosition(5, 80).setSize(115,30);
    binary_button.setPosition(5, 115).setSize(115,30);
    brighten_button.setPosition(5, 150).setSize(115,30);
    darken_button.setPosition(5, 185).setSize(115,30);
    highlight_button.setPosition(5, 220).setSize(115,30);
    brush_button.setPosition(5, 255).setSize(115,30);
    erase_button.setPosition(5, 290).setSize(115,30);
}

//method to perform operations when a control event occurs
public void controlEvent(ControlEvent theEvent) {
  if (theEvent.getController().getName() == "loadButton") {
    selectInput("Select a file to process:", "imgSelected");
  } 
  else if (theEvent.getController().getName() == "saveButton") {
    save_img();
  }
  else   if (theEvent.getController().getName() == "grayscaleButton") {
    grayscale_img();
  }
  else   if (theEvent.getController().getName() == "negativeButton") {
    negative_img();
  }
  else   if (theEvent.getController().getName() == "brightenButton") {
    brighten_img();
  }
  else   if (theEvent.getController().getName() == "darkenButton") {
    darken_img();
  }
  else   if (theEvent.getController().getName() == "binaryButton") {
    binary_img();
  }
  else   if (theEvent.getController().getName() == "highlightButton") {
    highlight_img();
  }
  else   if (theEvent.getController().getName() == "brushButton") {
    brush_img();
  }
  else   if (theEvent.getController().getName() == "eraseButton") {
    erase();
  }
  else   if (theEvent.getController().getName() == "nullButton") {
    dummyMethod();
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

void save_img() {
  //TODO - Write this function
  println("save");
}

void grayscale_img() {
  //TODO - Write this function
  println("grayscale");
}

void negative_img() {
  //TODO - Write this function
  println("negative");
}

void brighten_img() {
  //TODO - Write this function
  println("brighten");
}

void darken_img() {
  //TODO - Write this function
  println("darken");
}

void binary_img() {
  //TODO - Write this function
  println("binary");
}

void highlight_img() {
  //TODO - Write this function
  println("highlight");
}

void brush_img() {
  //TODO - Write this function
  println("brush");
}

void erase() {
  //TODO - Write this function
  println("erase");
}

//image selection method
void dummyMethod() {
}
