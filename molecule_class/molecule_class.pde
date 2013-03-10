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
    this.x = x;
    this.y = y;
    this.filename = filename;
    this.img = loadImage(filename);
    this.molecule_width = img.width;
    this.molecule_height = img.height;
    //calculate radius for collision detection purposes
    this.radius = sqrt(pow(this.get_width()/2, 2) + 
                       pow(this.get_height()/2, 2));
  }
  
  void display(){
    image(this.img, this.x, this.y);
  }
  
  //May behave oddly for long skinny molecules
  void rotate_molecule(float rotation_delta){
    //will display rotated molecule
    //background may be changed
    background(0,0,0);
    translate(this.molecule_width/2 + this.x, this.molecule_height/2 + this.y);
    this.rotation += rotation_delta;
    this.rotation = this.rotation%TWO_PI;
    rotate(this.rotation);
    translate(-(this.molecule_width/2 + this.x), -(this.molecule_height/2 + this.y));
    image(this.img, this.x, this.y);
  }
  
  void rotate_around_point(){
  }
  
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
  
  float get_center_x(){
    println(this.x + this.molecule_width/2);
    return this.x + this.molecule_width/2;
  }
  
  float get_center_y(){
    println(this.y + this.molecule_height/2);
    return this.y + this.molecule_height/2;
  }
  
  float get_width(){
    println(this.molecule_width);
    return this.molecule_width;
  }
  
  float get_height(){
    println(this.molecule_height);
    return this.molecule_height;
  }
  
  //Use this method if radius is not of appropriate size
  void set_radius(float r){
    this.radius = r;
  }
  
  //Go one step towards another object and stop once hits
  void go_towards(Molecule other, int current_frame){
    background(0,0,0);
    // how many steps until this would hit center of other
    int numSteps = 100;
    int image_speed = 5;
    float dx = (other.get_center_x() - this.get_center_x())/numSteps;
    float dy = (other.get_center_y() - this.get_center_y())/numSteps;
    if (this.is_colliding(other) == false){
      
      image(this.img, this.x, this.y);
      
      if (current_frame%image_speed == 0){
        this.x += dx;
        this.y += dy;
      }
    }
  }

  
}

int window_width = 1000;
int window_height = 1000;
Molecule m; 
Molecule m2;
int current_frame = 0;
void setup(){
  size(window_width, window_height);
  background(0,0,0);
  //frameRate(1);
  m = new Molecule((float) 0,(float) 0,"flyer image.gif");
  m2 = new Molecule((float) 900, (float) 900, "flyer image.gif");
  m.is_colliding(m2);
}

void draw(){
  m2.display();
  current_frame += 1;
  if (mousePressed){
  m.go_towards(m2, current_frame);
  }
}
