//create a molecule class
//needs input image, start location
//necessary functionality: rotate around own center. rotate around a 
//specified point
//check if this molecule is colliding with another molecule
//"head towards" another molecule?
//Move in a specified direction

class Molecule{
  // this is the upper left corner of the molecule, which may change
  float x;
  float y;
  String filename;
  float molecule_width;
  float molecule_height;
  PImage img;
  float rotation = 0;
  float radius;
  
  Molecule(float x, float y, String filename){
    float RADIUS_FUDGE = 10;
    this.x = x;
    this.y = y;
    this.filename = filename;
    this.img = loadImage(filename);
    this.molecule_width = img.width;
    this.molecule_height = img.height;
    //calculate radius for collision detection purposes
    this.radius = sqrt(pow(this.get_width()/2, 2) + 
                       pow(this.get_height()/2, 2)) - RADIUS_FUDGE;
  }
  
  void display(){
    //Need to display things in their proper rotation
    pushMatrix();
    translate(this.molecule_width/2 + this.x, this.molecule_height/2 + this.y);
    rotate(this.rotation);
    translate(-(this.molecule_width/2 + this.x), -(this.molecule_height/2 + this.y));
    image(this.img, this.x, this.y);
    popMatrix();
  }
  
  
  void rotate_molecule(float rotation_delta){
    this.rotation += rotation_delta;
    this.rotation = this.rotation%TWO_PI;
  }
  
//  // rotate around other at distance from center radius
//  void rotate_around_molecule(Molecule other, float rotation_delta, int radius){
//    float x_pivot = other.get_center_x();
//    float y_pivot = other.get_center_y();
//    pushMatrix();
//    translate(x_pivot - this.x, y_pivot - this.y);
//    rotate(this.rotation);
//    this.display();
//    popMatrix();
//  }
  
  boolean is_colliding(Molecule other){
    float dx = this.get_center_x() - other.get_center_x();
    float dy = this.get_center_y() - other.get_center_y();
    float distance_between_centers = sqrt(pow(dx, 2) + pow(dy, 2));
    if (distance_between_centers < (this.get_radius() + other.get_radius())){
      println("true");
      return true;
    }
    println("false");
    return false;
  }
  
  float get_radius(){
    return this.radius;
  }
  
  float get_x(){
    return this.x;
  }
  
  float get_y(){
    return this.y;
  }
  
  void set_x(int x){
    this.x = (float) x;
  }
  
  void set_x(float x){
    this.x = x;
  }
  
  void set_y(int y){
    this.y = (float) y;
  }
  
  void set_y(float y){
    this.y = y;
  }
  
  float get_center_x(){
    return this.x + this.molecule_width/2;
  }
  
  float get_center_y(){
    return this.y + this.molecule_height/2;
  }
  
  float get_width(){
    //println(this.molecule_width);
    return this.molecule_width;
  }
  
  float get_height(){
    //println(this.molecule_height);
    return this.molecule_height;
  }
  
  //Use this method if radius is not of appropriate size
  void set_radius(float r){
    this.radius = r;
  }
  
  float rotation(){
    return this.rotation;
  }
  
  //Go one step towards another object and stop once hits
  void go_towards(Molecule other, int current_frame){
    background(0,0,0);
    // how many steps until this would hit center of other
    int numSteps = 100;
    int image_speed = 3;
    float dx = (other.get_center_x() - this.get_center_x())/numSteps;
    float dy = (other.get_center_y() - this.get_center_y())/numSteps;
    if (this.is_colliding(other) == false){
      if (current_frame%image_speed == 0){
        this.x += dx;
        this.y += dy;
      }
    }
  }
}

//An arrow that goes from one place to another place 
//draw arrow from one mouse click to another mouse click.
//While mouse is held continuously, 
class Arrow{
  float start_x;
  float start_y;
  float end_x;
  float end_y;
  
  Arrow(float x, float y){
    this.start_x = x;
    this.start_y = y;
    this.end_x = x;
    this.end_y = y;
  }
  
  void display(){
    line(this.start_x, this.start_y, this.end_x, this.end_y);
    pushMatrix();
    translate(this.end_x, this.end_y);
    rotate(atan2(this.end_y-this.start_y, this.end_x-this.start_x));
    triangle(0, 0, -10, 5, -10, -5);
    popMatrix(); 
  }
  
  void set_end(){
    this.end_x = mouseX;
    this.end_y = mouseY;
  }
  
  //TODO write getters and setters if used
  
}



int window_width = 1000;
int window_height = 1000;
Molecule m; 
Molecule m2;
int current_frame = 0;
Arrow a;
void setup(){
  size(window_width, window_height);
  background(255,255,255);
  //frameRate(1);
  m = new Molecule((float) 0,(float) 0,"h2o_dots.png");
  m2 = new Molecule((float) 600, (float) 600, "hcl_dots.png");
  m.is_colliding(m2);
  a = new Arrow((float)100, (float)100);
}

//void draw(){
//  background(255,255,255);
//  a.set_end();
//  a.display();
//}
  

void draw(){
  background(255,255,255);
  if (mousePressed){
  //m.go_towards(m2, frameCount);
  // Need to offset set_x and set_y by half of width and height to
  // get center of image
  float old_x = m.get_x();
  float old_y = m.get_y();
  m.set_x((int)(mouseX - (m.get_width()/2)));
  m.set_y((int)(mouseY - (m.get_height()/2)));
  if (m.is_colliding(m2)){
    m.set_x(old_x);
    m.set_y(old_y);
  }
  }
  m.display();
  m2.display();
}

//rotate with left and right arrows
void keyPressed(){
  if (keyCode == 37){
    m.rotate_molecule(-0.2);
  }
  else if(keyCode == 39){
    m.rotate_molecule(0.2);
  }
}
