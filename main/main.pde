import controlP5.*;
import java.util.List;
import java.util.Arrays;
import java.util.Deque;
import java.util.ArrayDeque;

void setup() {
  size(500, 500, FX2D);
  frameRate(30);   
  smooth();

  button_font = createFont("Verdona",20,true); 
  //println(PFont.list());
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
  //if ((frameCount%30 == 0) && (displayed_img != null)) {
  //  update_history();
  //}
}

//void update_history() {
//  //if current img different than latest one in history [0]
//  //then push current img onto history stack
//  //println("Updating history...");
//  boolean match = true;
//  if (undo_deque.size() == 0) {
//    undo_deque.offerFirst(displayed_img);
//  }
//  for (int i = 0; i < displayed_img.pixels.length; i++) {
//      if (displayed_img.pixels[i] != undo_deque.peekFirst().pixels[i]) {
//          match = false;
//          i = displayed_img.pixels.length;
//      }
//  }
//  if ((!match) && (undo_deque.size() < history_length)){
//     println("Pushing to undo deque");
//     newly_added_history = true;
//     undo_deque.offerFirst(displayed_img);
//  } else if ((!match) && (undo_deque.size() >= history_length)) {
//     undo_deque.pollLast();
//     undo_deque.offerFirst(displayed_img);
//  }
  
//}
