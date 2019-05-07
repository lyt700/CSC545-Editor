import controlP5.*;
import java.util.List;
import java.util.Arrays;
import java.util.Deque; //for undo/redo image storage 
import java.util.ArrayDeque; //for undo/redo image storage

void setup() {
  size(500, 500, FX2D); //FX2D mode to fix blurry font
  frameRate(60);  
  smooth(); //turn on antialiasing
  button_font = createFont("Verdana",20,true);
  controls_font = new ControlFont(button_font, 10);
  surface.setResizable(true);
  surface.setSize(min_window_width, min_window_height);
  draw_window();
  init_controls();
}

void draw() {
  draw_window();
  draw_controls();
  if (displayed_img != null) {
    //initialize the pgraphics canvas for new image
    if (pg_init) {
      pg = createGraphics(loaded_img.width, loaded_img.height);
      pg.beginDraw();
      pg.image(loaded_img, 0, 0);
      pg.endDraw();
      pg_init = false;
    } else { //update the current canvas with the latest displayed image 
      pg = createGraphics(displayed_img.width, displayed_img.height);
      pg.beginDraw();
      pg.image(displayed_img, 0, 0);
      pg.endDraw();
    }
    
    //update curve endpoint position for correct placement at start of new brush stroke
    if (brush_active && !mousePressed) {
      prev_epx = mouseX;
      prev_epy = mouseY;
    }
    
    if (brush_active && mousePressed && (mouseX > side_bar_width) && (mouseY > top_bar_height)) { //draw
      draw_the_line();
    } else if (erase_active && mousePressed) { //edit
      erase_edits();
    }
    
    displayed_img = pg; //copy the pgraphics canvas to displayed_img
    image(displayed_img, side_bar_width + bar_border_width, top_bar_height + bar_border_width); //draw the displayed_img
    
    //Highlight brush and erase area
    if (brush_active && (mouseX > side_bar_width) && (mouseY > top_bar_height)) {
      stroke(255,255,255);
      strokeWeight(2);
      noFill();
      ellipse(mouseX, mouseY, brush_size, brush_size);
    } else if (erase_active && (mouseX > side_bar_width) && (mouseY > top_bar_height)) {
      stroke(255,255,255);
      strokeWeight(2);
      noFill();
      rectMode(CENTER);
      rect(mouseX, mouseY, erase_size, erase_size);
      rectMode(CORNER);
    }
  }
}
