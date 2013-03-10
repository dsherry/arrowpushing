//This file shows how you can have one stationary object and
//one rotating object

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
  rect(0,0,100,100);
  //Creates a rectangle that rotates in the middle of the screen
  if (mousePressed){
    translate(window_width/2,  window_height/2);
    rotate(rotation);
    //You can only have 32 things in the matrix, so you should
    //call popMatrix() for every pushMatrix()
    pushMatrix();
    rect(0,0,100,200);
    rotation = (rotation + rotation_delta)%TWO_PI;
    popMatrix();
  }
}
