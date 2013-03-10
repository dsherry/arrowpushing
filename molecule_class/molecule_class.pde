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
  int window_width;
  int window_height;
  float rotation = 0;
  
  Molecule(float x, float y, String filename){
    this.x = x;
    this.y = y;
    this.filename = filename;
    this.img = loadImage(filename);
    this.molecule_width = img.width;
    this.molecule_height = img.height;
  }
  
  void display(){
    image(this.img, this.x, this.y);
  }
  
  void rotate_molecule(float rotation_delta){
    //will display rotated molecule
    translate(this.molecule_width/2 + this.x, this.molecule_height/2 + this.y);
    this.rotation += rotation_delta;
    this.rotation = this.rotation%TWO_PI;
    rotate(this.rotation);
    translate(-(this.molecule_width/2 + this.x), -(this.molecule_height/2 + this.y));
    image(this.img, this.x, this.y);
  }
  
}

int window_width = 1000;
int window_height = 1000;
Molecule m; 
void setup(){
  size(window_width, window_height);
  background(0,0,0);
  m = new Molecule((float) 0,(float) 0,"flyer image.gif");
}

void draw(){
  m.display();
  if (mousePressed){
  m.rotate_molecule(0.2);
  }
}
