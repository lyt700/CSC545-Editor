//Controls methods

//initialize control objects
void init_controls() {
  cp5 = new ControlP5(this);
  cp5.setAutoDraw(false);
  cp5.setColorBackground(button_default_color).setColorActive(button_active_color).setColorForeground(button_hover_color).setFont(controls_font); //set the proper colors
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
  //brush
  brush_button = cp5.addButton("brushButton");
  brush_button.setPosition(5, 220).setSize(115,30);
  brush_button.setLabel("Brush");
  //erase
  erase_button = cp5.addButton("eraseButton");
  erase_button.setPosition(5, 255).setSize(115,30);
  erase_button.setLabel("Erase");
    //sharpening
  sharp_button = cp5.addButton("sharpButton");
  sharp_button.setPosition(5, 290).setSize(115,30);
  sharp_button.setLabel("Sharpening");
  //bluring
  blur_button = cp5.addButton("blurButton");
  blur_button.setPosition(5, 325).setSize(115,30);
  blur_button.setLabel("Bluring");
  //color picker button
  colors = cp5.addButton("colors");
  colors.setPosition(5, 360).setSize(115,30);
  colors.setLabel("Colors");
  //TODO - shapes

  //undo button
  undo_button = cp5.addButton("undoButton");
  undo_button.setPosition(245, 5).setSize(75,30);
  undo_button.setLabel("Undo");
  //redo button
  redo_button = cp5.addButton("redoButton");
  redo_button.setPosition(325, 5).setSize(75,30);
  redo_button.setLabel("Redo");

  //brush size slider
  brush_slider = cp5.addSlider("brushSlider").setLabel("");
  brush_slider.setPosition(15, 395).setSize(20,200).setRange(1, 15).setNumberOfTickMarks(15);
  brush_slider.setValue(5).setDecimalPrecision(0);

  //erase size slider
  erase_slider = cp5.addSlider("eraseSlider").setLabel("");
  erase_slider.setPosition(80, 395).setSize(20,200).setRange(1, 15).setNumberOfTickMarks(15);
  erase_slider.setValue(5).setDecimalPrecision(0);

}

//draw the controls in the window
void draw_controls() {
    cp5.draw();
    load_button.setPosition(5, 5).setSize(115,30);
    save_button.setPosition(125, 5).setSize(115,30);
    grayscale_button.setPosition(5, 45).setSize(115,30);
    negative_button.setPosition(5, 80).setSize(115,30);
    binary_button.setPosition(5, 115).setSize(115,30);
    brighten_button.setPosition(5, 150).setSize(115,30);
    darken_button.setPosition(5, 185).setSize(115,30);
    brush_button.setPosition(5, 220).setSize(115,30);
    erase_button.setPosition(5, 255).setSize(115,30);
    sharp_button.setPosition(5, 290).setSize(115,30);
    blur_button.setPosition(5, 325).setSize(115,30);
    colors.setPosition(5, 360).setSize(115,30);
    undo_button.setPosition(245, 5).setSize(75,30);
    redo_button.setPosition(325, 5).setSize(75,30);
    if (showColors) {
      brush_slider.setPosition(15, 525).setSize(20,200);
      erase_slider.setPosition(80, 525).setSize(20,200);
      //brush text
      pushMatrix();
      translate(30,720);
      rotate(-HALF_PI);
      fill(255, 255, 255);
      textFont(button_font);
      textSize(10);
      text("Brush Slider", 0, 0);
      popMatrix();
      //erase text
      pushMatrix();
      translate(95,720);
      rotate(-HALF_PI);
      fill(255, 255, 255);
      textFont(button_font);
      textSize(10);
      text("Erase Slider", 0, 0);
      popMatrix();
    } else {
      brush_slider.setPosition(15, 395).setSize(20,200);
      erase_slider.setPosition(80, 395).setSize(20,200);
      //brush text
      pushMatrix();
      translate(30,590);
      rotate(-HALF_PI);
      fill(255, 255, 255);
      textFont(button_font);
      textSize(10);
      text("Brush Slider", 0, 0);
      popMatrix();
      //erase text
      pushMatrix();
      translate(95,590);
      rotate(-HALF_PI);
      fill(255, 255, 255);
      textFont(button_font);
      textSize(10);
      text("Erase Slider", 0, 0);
      popMatrix();
    }


    //force the color of the brush button to stay as the active button color when it is active
    if (brush_active) {
      brush_button.setColorBackground(button_active_color);
    } else {
      brush_button.setColorBackground(button_default_color);
    }

    //force the color of the erase button to stay as the active button color when it is active
    if (erase_active) {
      erase_button.setColorBackground(button_active_color);
    } else {
      erase_button.setColorBackground(button_default_color);
    }
    

}

//method to perform operations when a control event occurs
public void controlEvent(ControlEvent theEvent) {

  //when any event occurs that will change the state of the image, push the displayed image into the deque
  if ((theEvent.getController().getName() != "loadButton") && (theEvent.getController().getName() != "saveButton") &&
       (theEvent.getController().getName() != "undoButton") && (theEvent.getController().getName() != "redoButton") &&
        (theEvent.getController().getName() != "colors") && (theEvent.getController().getName() != "brushSlider") &&
          (theEvent.getController().getName() != "eraseSlider")) {
          if (undo_deque.size() < history_length) {
             undo_deque.offerFirst(displayed_img);
          } else if (undo_deque.size() >= history_length) {
             undo_deque.pollLast();
             undo_deque.offerFirst(displayed_img);
          }
  }

  //make the brush no longer active when another button is pressed
  if ((theEvent.getController().getName() != "brushButton") && (theEvent.getController().getName() != "brushSlider") &&
       (theEvent.getController().getName() != "eraseSlider") && (theEvent.getController().getName() != "colors") &&
        (color_labels.contains(theEvent.getController().getName())) == false) {
            brush_active = false;
  }

  //set erase inactive when any button is pressed
  if ((theEvent.getController().getName() != "brushSlider") && (theEvent.getController().getName() != "eraseSlider")) {
          erase_active = false;
  }

  if (theEvent.getController().getName() == "loadButton") {
    selectInput("Select a file to process:", "imgSelected");
  }
  else if (theEvent.getController().getName() == "saveButton") {
    selectOutput("Select a file to write to:", "fileSelected");
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
  else   if (theEvent.getController().getName() == "brushButton") {
    brush_img();
  }
  else   if (theEvent.getController().getName() == "eraseButton") {
    erase();
  }
  else   if (theEvent.getController().getName() == "sharpButton") {
    sharp(displayed_img, k2);
  }
  else   if (theEvent.getController().getName() == "blurButton") {
    blur(displayed_img, k1);
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
  else   if (theEvent.getController().getName() == "undoButton") {
    undo();
  }
  else   if (theEvent.getController().getName() == "redoButton") {
    redo();
  }
  else if ((theEvent.getController().getName() == "brushSlider") && theEvent.getController().isMousePressed()){
    setBrushSize();
  }
  else if ((theEvent.getController().getName() == "eraseSlider") && theEvent.getController().isMousePressed()){
    setEraseSize();
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
    pg_init = true; //signal for new image to be loaded into pgraphics canvas
  }
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    displayed_img.save(selection.getAbsolutePath());
  }
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

void brush_img() {
  if(brush_active) brush_active = false;
  else brush_active = true;
}

void erase() {
   if(erase_active) erase_active = false;
   else erase_active = true;
}

void sharp(PImage source, float[][] kernel) {
  //TODO write a function to sharp image
  blur(source, kernel);
}

void blur(PImage source, float[][] kernel) {
  //TODO write a function to blur image
  PImage target = createImage(source.width, source.height, RGB);
  for (int y = 0; y < source.height; y++) {
    for (int x = 0; x < source.width; x++) {
      if (x == 0 || x == source.width - 1 || y == 0 || y == source.height - 1) {
        target.set(x,y, source.get(x,y));
      } else {
        float r = 0, g = 0, b = 0;
        for (int m = 0; m < 3; m ++) {
          for (int n = 0; n < 3; n++) {
            color c = source.get(x-1+m, y-1+n);
            r += red(c) * kernel[m][n];
            g += green(c) * kernel[m][n];
            b += blue(c) * kernel[m][n];
          }
        }
        target.set(x,y, color(r,g,b));
      }
    }
  }
  displayed_img = target;
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
    color_table_black = cp5.addBang("black").setPosition(5, 400).setSize(28, 30).setLabel("").setColorForeground(color(0));
    color_table_white = cp5.addBang("white").setPosition(33,400).setSize(29, 30).setLabel("").setColorForeground(color(255));
    color_table_red = cp5.addBang("red").setPosition(62,400).setSize(30, 29).setLabel("").setColorForeground(color(255, 0, 0));
    color_table_yellow = cp5.addBang("yellow").setPosition(91,400).setSize(29, 30).setLabel("").setColorForeground(color(255, 255, 0));
    color_table_blue = cp5.addBang("blue").setPosition(5,430).setSize(28, 30).setLabel("").setColorForeground(color(0, 0, 255));
    color_table_green = cp5.addBang("green").setPosition(33,430).setSize(29, 30).setLabel("").setColorForeground(color(0, 255, 0));
    color_table_cyan = cp5.addBang("cyan").setPosition(62,430).setSize(29, 30).setLabel("").setColorForeground(color(0, 255, 255));
    color_table_magenta = cp5.addBang("magenta").setPosition(91,430).setSize(29, 30).setLabel("").setColorForeground(color(255, 0, 255));
    color_table_silver = cp5.addBang("silver").setPosition(5,460).setSize(28, 30).setLabel("").setColorForeground(color(192, 192, 192));
    color_table_maroon = cp5.addBang("maroon").setPosition(33,460).setSize(29,30).setLabel("").setColorForeground(color(128, 0, 0));
    color_table_gray = cp5.addBang("gray").setPosition(62,460).setSize(29, 30).setLabel("").setColorForeground(color(128, 128, 128));
    color_table_teal = cp5.addBang("teal").setPosition(91,460).setSize(29, 30).setLabel("").setColorForeground(color(0, 128, 128));
    color_table_navy = cp5.addBang("navy").setPosition(5,490).setSize(28, 30).setLabel("").setColorForeground(color(0, 0, 128));
    color_table_olive = cp5.addBang("olive").setPosition(33,490).setSize(29, 30).setLabel("").setColorForeground(color(128, 128, 0));
    color_table_purple = cp5.addBang("purple").setPosition(62,490).setSize(29, 30).setLabel("").setColorForeground(color(128, 0, 128));
    color_table_orange = cp5.addBang("orange").setPosition(91,490).setSize(29, 30).setLabel("").setColorForeground(color(255, 165, 0));
    }
}

//brush functional method
void draw_the_line() {
    if (frameCount%4 == 0) {
      pg.beginDraw();
      pg.stroke(brush_color);
      pg.strokeWeight(brush_size);
      pg.noFill();
      pg.bezier(prev_epx-side_bar_width, prev_epy-top_bar_height, prev_mx[1]-side_bar_width, prev_my[1]-top_bar_height,
            prev_mx[2]-side_bar_width, prev_my[2]-top_bar_height, mouseX-side_bar_width, mouseY-top_bar_height);
      prev_epx = mouseX;
      prev_epy = mouseY;
      pg.endDraw();
    } else {
      prev_mx[(frameCount%4)-1] = mouseX;
      prev_my[(frameCount%4)-1] = mouseY;
    }
}
//erase edits to original loaded image
void erase_edits() {
   pg.beginDraw();
   int startX, startY;
   startX = mouseX - side_bar_width - erase_size/2;
   startY = mouseY - top_bar_height - erase_size/2;
   if (startX > 0 && startX < pg.width && startY > 0 && startY < pg.height) {
     for (int y = startY; y < startY + erase_size; y++) {
       for(int x = startX; x < startX + erase_size; x++){
         color c = loaded_img.get(x,y);
         pg.set(x, y, c);
       }
     }
   }
   pg.endDraw();
}

//undoes the last change to the image
void undo() {
  if (undo_deque.size() > 0) {
    PImage temp_img;
    redo_deque.offerFirst(displayed_img);
    temp_img = undo_deque.pollFirst();
    if (temp_img != null) {
      displayed_img = temp_img;

    }
  }
}

//redoes the last change to the image
void redo() {
  if (redo_deque.size() > 0) {
    undo_deque.offerFirst(displayed_img);
    PImage temp_img = redo_deque.pollFirst();
    if (temp_img != null) {
      displayed_img = temp_img;
    }
  }
}

void setBrushSize() {
  brush_size = int(brush_slider.getValue());
}

void setEraseSize() {
  erase_size = int(erase_slider.getValue());
}
