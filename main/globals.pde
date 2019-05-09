//All globals in the project

//---File Globals---
PImage loaded_img;
PImage displayed_img;

PGraphics pg; //pgraphics canvas used for drawing
boolean pg_init = true; //signal for when new image needs to be added to the pg canvas

//---Undo/Redo Globals---
int history_length = 5;
Deque<PImage> undo_deque=new ArrayDeque<PImage>(history_length);
Deque<PImage> redo_deque=new ArrayDeque<PImage>(history_length);

boolean newly_added_history = false;
boolean recently_undone = false;

//---Window Globals---
color bg_color = color(100,100,100);
color bar_colors = color(70,70,70);
color bar_border_color = color(20,20,20);
int top_bar_height = 40;
int side_bar_width = 125;
int bar_border_width = 1;
int min_window_height = 768 + top_bar_height + bar_border_width;
int min_window_width = 1024 + side_bar_width + bar_border_width;

//---Controls Globals---
//Button colors/fonts
color button_default_color = color(66, 134, 244);
color button_hover_color = color(59, 120, 220);
color button_active_color = color(53, 107, 195);
PFont button_font;
ControlFont controls_font;

ControlP5 cp5;
Button colors;
Button load_button;
Button save_button;
Button grayscale_button;
Button negative_button;
Button brighten_button;
Button darken_button;
Button binary_button;
Button brush_button;
Button erase_button;
Button sharp_button;
Button blur_button;
Button undo_button;
Button redo_button;


//---Color Table Globals---
boolean showColors = false;
String[] color_label = {"black", "white", "red", "yellow", "blue", "green", "cyan", "magenta", "silver",
                         "maroon", "gray", "teal", "navy", "olive", "purple", "orange"};
List<String> color_labels = Arrays.asList(color_label);
color[] color_list = {color(0), color(255), color(255, 0, 0), color(255, 255, 0), color(0, 0, 255),
                      color(0, 255, 0), color(0, 255, 255), color(255, 0, 255), color(192, 192, 192),
                      color(128, 0, 0), color(128, 128, 128), color(0, 128, 128), color(0, 0, 128),
                      color(128, 128, 0), color(128, 0, 128), color(255, 165, 0)};
Bang color_table_black, color_table_white, color_table_red, color_table_green,
     color_table_blue, color_table_yellow, color_table_cyan, color_table_magenta,
     color_table_silver, color_table_gray, color_table_maroon, color_table_olive,
     color_table_purple, color_table_teal, color_table_navy, color_table_orange;
     
//---Brush Globals---
boolean brush_active = false;
color brush_color = color(0);
int brush_size = 3;

//arrays holding previous x&y positions for the previous 3 frames
int[] prev_mx = new int[3], prev_my = new int[3];
//previous stopping points for the last curve drawn
int prev_epx, prev_epy;


//---Erase Globals---
boolean erase_active = false;
int erase_size = 25;

//---kernels
float[][] k1 = {{1/9.0, 1/9.0, 1/9.0}, {1/9.0, 1/9.0, 1/9.0}, {1/9.0, 1/9.0, 1/9.0}};
float[][] k2 = {{0.0, -1.0, 0.0}, {-1.0, 5.0, -1.0}, {0.0, -1.0, 0.0}};
