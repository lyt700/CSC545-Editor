import controlP5.*;
import java.util.List;
import java.util.Arrays;
import java.util.Deque; //for undo/redo image storage 
import java.util.ArrayDeque; //for undo/redo image storage

void setup() {
  size(500, 500, FX2D); //FX2D mode to fix blurry font
  frameRate(30);  
  smooth(); //turn on antialiasing
  button_font = createFont("Verdana",20,true);
  controls_font = new ControlFont(button_font, 10);
  surface.setResizable(true);
  surface.setSize(min_window_width, min_window_height);
  draw_window();
  init_controls();
}

void draw() {
  background(0); 
  draw_window();
  draw_controls();
  if (displayed_img != null) {
    image(displayed_img, side_bar_width + bar_border_width, top_bar_height + bar_border_width);
    if (brush_active && mousePressed) {
      draw_the_line();
    }
  }
}
