PImage skull;
float rotation;
float rotation_delta = 0.2;
int skull_width;
int skull_height;
int window_width = 1000;
int window_height = 1000;

void setup(){
size(window_width, window_height);
background(0,0,0);
skull = loadImage("flyer image.gif");
skull_width = skull.width;
skull_height = skull.height;
rotation = 0;
}

void draw(){
  background(0,0,0);
  if (mousePressed){
    //move origin to center of screen, rotate screen by rotation,
    //
    translate(window_width/2, window_height/2);
    rotate(rotation);
    image(skull, -skull_width/2, -skull_height/2);
    rotation = (rotation + rotation_delta)%TWO_PI;
  }
}
