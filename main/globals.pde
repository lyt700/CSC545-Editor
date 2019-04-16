//All globals in the project

//File globals
PImage loaded_img;
PImage displayed_img;

//Window globals
color bg_color = color(100,100,100);
color bar_colors = color(70,70,70);
color bar_border_color = color(20,20,20);
int top_bar_height = 40;
int side_bar_width = 125;
int bar_border_width = 1;
int min_window_height = 768 + top_bar_height + bar_border_width;
int min_window_width = 1024 + side_bar_width + bar_border_width;

//controls globals
ControlP5 cp5;
Button load_button;
Button save_button;
Button grayscale_button;
Button negative_button;
Button brighten_button;
Button darken_button;
Button binary_button;
Button highlight_button;
Button brush_button;
Button erase_button;
Button sharp_button;
Button blur_button;
