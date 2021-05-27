function draw_text_outline(x, y, outline_color, str_color, str, size) {
//Outline  
draw_set_color(outline_color);  
draw_text(x+size, y+size, str);  
draw_text(x-size, y-size, str);  
draw_text(x,   y+size, str);  
draw_text(x+size,   y, str);  
draw_text(x,   y-size, str);  
draw_text(x-size,   y, str);  
draw_text(x-size, y+size, str);  
draw_text(x+size, y-size, str);  
  
//Text  
draw_set_color(str_color);  
draw_text(x, y, str);
}