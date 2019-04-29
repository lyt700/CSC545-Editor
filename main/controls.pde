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
    //sharpening
  sharp_button = cp5.addButton("sharpButton");
  sharp_button.setPosition(5, 325).setSize(115,30);
  sharp_button.setLabel("Sharpening");
  //bluring
  blur_button = cp5.addButton("blurButton");
  blur_button.setPosition(5, 360).setSize(115,30);
  blur_button.setLabel("Bluring");
  //color picker button
  colors = cp5.addButton("colors");
  colors.setPosition(5, 395).setSize(115,30);
  colors.setLabel("Colors");             
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
    sharp_button.setPosition(5, 325).setSize(115,30);
    blur_button.setPosition(5, 360).setSize(115,30);
    colors.setPosition(5, 395).setSize(115,30);
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
  else   if (theEvent.getController().getName() == "sharpButton") {
    sharp();
  }
  else   if (theEvent.getController().getName() == "blurButton") {
    blur();
  }
  else   if (theEvent.getController().getName() == "Colors") {
    colors();
  }
  else   if (color_labels.contains(theEvent.getController().getName())) {
    //find the index of selected color in color_list
    int i = color_labels.indexOf(theEvent.getController().getName());
    //set bursh color to selected color
    brush_color = color_list[i];
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
    loaded_img = loadImage(selection.getAbsolutePath());
    displayed_img = loaded_img;
    resize_window(loaded_img);
  }
}

void save_img() {
  //TODO - Write this function
  println("save");
}

void grayscale_img() {
  // using the formula : Val = 0.299*R + 0.587*G + 0.114*B
  PImage grayImg = displayed_img.get();
  grayImg.loadPixels();
  for (int i = 0; i < grayImg.pixels.length; i++) {
    color c = grayImg.pixels[i];
    float gray = 0.299*red(c) + 0.587*green(c) + 0.114*blue(c);
    grayImg.pixels[i] = color(gray);
    updatePixels();
  }
  displayed_img = grayImg;    
}

void negative_img() {
  float gain = -1.0; // gain in the linear scaling
  float bias = 255;  // bias in the linear scaling
  PImage negImg = displayed_img.get();
  negImg.loadPixels();
  for (int i = 0; i < negImg.pixels.length; i++) {
    color c = negImg.pixels[i];
    float r = constrain(gain * red(c) + bias, 0, 255);
    float g = constrain(gain * green(c) + bias, 0, 255);
    float b = constrain(gain * blue(c) + bias, 0, 255);
    negImg.pixels[i] = color(r,g,b);
    updatePixels();
  }
  displayed_img = negImg;  
}

void brighten_img() {
  float ba = 5.0;  // brighten amount
  PImage brightenImg = displayed_img.get();
  brightenImg.loadPixels();
  for (int i = 0; i < brightenImg.pixels.length; i++) {
    color c = brightenImg.pixels[i];
    float r = constrain(red(c) + ba, 0, 255);
    float g = constrain(green(c) + ba, 0, 255);
    float b = constrain(blue(c) + ba, 0, 255);
    brightenImg.pixels[i] = color(r,g,b);
    updatePixels();
  }
  displayed_img = brightenImg;
}

void darken_img() {
  float da = 5.0; // darken amount
  PImage darkenImg = displayed_img.get();
  darkenImg.loadPixels();
  for (int i = 0; i < darkenImg.pixels.length; i++) {
    color c = darkenImg.pixels[i];
    float r = constrain(red(c) - da, 0, 255);
    float g = constrain(green(c) - da, 0, 255);
    float b = constrain(blue(c) - da, 0, 255);
    darkenImg.pixels[i] = color(r,g,b);
    updatePixels();
  }
  displayed_img = darkenImg;
}

void binary_img() {
  float threshold = 128.0; // using threshold to modify pixels
  PImage binImg = displayed_img.get();
  binImg.loadPixels();
  for (int i = 0; i < binImg.pixels.length; i++) {
    color c = binImg.pixels[i];
    float val = (red(c) + green(c) + blue(c))/3.0;
    if(val >= threshold) binImg.pixels[i] = color(255);
    else binImg.pixels[i] = color(0);
    updatePixels();
  }
  displayed_img = binImg;  
}

void highlight_img() {
  //TODO - Write this function
  println("highlight");
}

void brush_img() {
  if(brush_active) brush_active = false;
  else brush_active = true;
}

void erase() {
  //TODO - Write this function
  println("erase");
}

void sharp() {
  //TODO write a function to sharp image
  println("sharp");
}

void blur() {
  //TODO write a function to blur image
  println("blur");
}

void colors() {
  if (showColors) {
    showColors = false;
    for (int i = 0; i < color_label.length; i++) {
      cp5.remove(color_label[i]);
    }
  }
  else {
    showColors = true;
    //show the color table
    color_table_black = cp5.addBang("black").setPosition(5, 430).setSize(30, 30).setLabel("").setColorForeground(color(0));
    color_table_white = cp5.addBang("white").setPosition(35,430).setSize(30, 30).setLabel("").setColorForeground(color(255));
    color_table_red = cp5.addBang("red").setPosition(65,430).setSize(30, 30).setLabel("").setColorForeground(color(255, 0, 0));
    color_table_yellow = cp5.addBang("yellow").setPosition(95,430).setSize(30, 30).setLabel("").setColorForeground(color(255, 255, 0));
    color_table_blue = cp5.addBang("blue").setPosition(5,460).setSize(30, 30).setLabel("").setColorForeground(color(0, 0, 255));
    color_table_green = cp5.addBang("green").setPosition(35,460).setSize(30, 30).setLabel("").setColorForeground(color(0, 255, 0));
    color_table_cyan = cp5.addBang("cyan").setPosition(65,460).setSize(30, 30).setLabel("").setColorForeground(color(0, 255, 255));
    color_table_magenta = cp5.addBang("magenta").setPosition(95,460).setSize(30, 30).setLabel("").setColorForeground(color(255, 0, 255));
    color_table_silver = cp5.addBang("silver").setPosition(5,490).setSize(30, 30).setLabel("").setColorForeground(color(192, 192, 192));
    color_table_maroon = cp5.addBang("maroon").setPosition(35,490).setSize(30,30).setLabel("").setColorForeground(color(128, 0, 0));
    color_table_gray = cp5.addBang("gray").setPosition(65,490).setSize(30, 30).setLabel("").setColorForeground(color(128, 128, 128));
    color_table_teal = cp5.addBang("teal").setPosition(95,490).setSize(30, 30).setLabel("").setColorForeground(color(0, 128, 128));
    color_table_navy = cp5.addBang("navy").setPosition(5,520).setSize(30, 30).setLabel("").setColorForeground(color(0, 0, 128));
    color_table_olive = cp5.addBang("olive").setPosition(35,520).setSize(30, 30).setLabel("").setColorForeground(color(128, 128, 0));
    color_table_purple = cp5.addBang("purple").setPosition(65,520).setSize(30, 30).setLabel("").setColorForeground(color(128, 0, 128));
    color_table_orange = cp5.addBang("orange").setPosition(95,520).setSize(30, 30).setLabel("").setColorForeground(color(255, 165, 0));
    }
}


//image selection method
void dummyMethod() {
}


//brush functional method
//TODO: try to make smooth line
void draw_the_line() {
   PImage target = displayed_img.get();
   int startX, startY;
   startX = mouseX - side_bar_width - brush_size/2;
   startY = mouseY - top_bar_height - brush_size/2;
   if (startX > 0 && startX < target.width && startY > 0 && startY < target.height) {
     for (int y = startY; y < startY + brush_size; y++) {
       for(int x = startX; x < startX + brush_size; x++){
         target.set(x, y, brush_color);
       }
     }
   }
   displayed_img = target;
}
