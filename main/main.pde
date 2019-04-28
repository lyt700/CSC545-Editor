import controlP5.*;
import java.util.List;
import java.util.Arrays;

void setup() {
  size(500, 500);
  surface.setResizable(true);
  surface.setSize(min_window_width, min_window_height);
  draw_window();
  init_controls();
}

void draw() {
  draw_window();
  draw_controls();
  if (displayed_img != null) {
    image(displayed_img, side_bar_width + bar_border_width, top_bar_height + bar_border_width);
    if (brush_active && mousePressed) {
      draw_the_line();
    }
  }
}
