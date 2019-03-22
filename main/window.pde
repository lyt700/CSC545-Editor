//Window functions

//resize the window
void resize_window(PImage img) {
  if ((img.width + side_bar_width + 1 >= min_window_width) && (img.height + top_bar_height + 1 >= min_window_height)) {
      surface.setSize(img.width + side_bar_width + bar_border_width, img.height + top_bar_height + bar_border_width);
  }
  else {
      surface.setSize(min_window_width, min_window_height);
  }
}

//draw the window elements
void draw_window() {
  background(bg_color);
  strokeWeight(bar_border_width);
  stroke(bar_border_color);
  fill(bar_colors);
  rect(0, 0, width, top_bar_height);
  rect(0, top_bar_height, side_bar_width, height);
}
