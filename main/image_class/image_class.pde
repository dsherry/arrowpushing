class Image{
  //Assumes the image's left corner is at 0,0
  String filename;
  PImage img;

  //defines hitbox1
  float box1_x;
  float box1_y;
  float box1_width;
  float box1_height;

  Image(String filename, float x1, float y1, float width1, float height1){
    this.filename = filename;
    this.img = loadImage(filename);
    //defines hitbox1
    this.box1_x = x1;
    this.box1_y = y1;
    this.box1_width = width1;
    this.box1_height = height1;
  }

  boolean satisfied(){
    if ((mouseX > this.box1_x) && (mouseX < this.box1_x + this.box1_width) &&
        (mouseY > this.box1_y) && (mouseY < this.box1_y + this.box1_height)){
          return true;
        }
    return false;
  }

  int get_width(){
    return this.img.width;
  }

  int get_height(){
    return this.img.height;
  }

  void display(){
    image(this.img, 0, 0);
  }
}

Image i;
int index;
ArrayList frames;

void setup(){
  //change image location
  i = new Image("data/flyer_image.gif", 0, 0, 100, 100);
  index = 0;
  int w = i.get_width();
  int h = i.get_height();
  size(w, h);
  i.display();
  

}

void draw(){
  i.display();
  if (mousePressed) {
    if (i.satisfied()){
      println("A winner is you!");
      //noLoop();
    }
  }
}


