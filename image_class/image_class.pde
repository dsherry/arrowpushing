class Image{
  //Assumes the image's left corner is at 0,0
  String filename;
  PImage img;
  //defines hitbox1
  float box1_x;
  float box1_y;
  float box1_width;
  float box1_height;
  
  //defines hitbox2
  float box2_x;
  float box2_y;
  float box2_width;
  float box2_height;
  
  boolean clicked_box1;
  boolean clicked_box2_after_box1;
  
  Image(String filename, float x1, float y1, float width1, float height1,
        float x2, float y2, float width2, float height2){
    this.filename = filename;
    this.img = loadImage(this.filename);
    //defines hitbox1
    this.box1_x = x1;
    this.box1_y = y1;
    this.box1_width = width1;
    this.box1_height = width2;
    
    //defines hitbox2
    this.box2_x = x2;
    this.box2_y = y2;
    this.box2_width = width2;
    this.box2_height = height2;
    
    this.clicked_box1 = false;
    this.clicked_box2_after_box1 = false;
    
        }
        
  boolean is_box1_hit(){
    if ((mouseX > this.box1_x) && (mouseX < this.box1_x + this.box1_width) &&
        (mouseY > this.box1_y) && (mouseY < this.box1_y + this.box1_height)){
          return true;
        }
    return false;
  }
  
  boolean is_box2_hit(){
    if ((mouseX > this.box2_x) && (mouseX < this.box2_x + this.box2_width) &&
        (mouseY > this.box2_y) && (mouseY < this.box2_y + this.box2_height)){
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
  
  void set_box1_clicked(){
    this.clicked_box1 = true;
  }
  
  void set_satisfied(){
    this.clicked_box2_after_box1 = true;
  }
  
  boolean did_click_box1(){
    return this.clicked_box1;
  }
  
  boolean satisfied(){
    return this.clicked_box2_after_box1;
  }
  
  void clear_box1(){
    this.clicked_box1 = false;
  }
  
  void display(){
    image(this.img, 0, 0);
  }
}

//change image location
Image i = new Image("/home/earthstar/ArrowPushing/image_class/data/flyer image.gif", 0.0, 0.0, 50.0, 50.0, 100.0, 100.0, 50.0, 50.0);
int w = i.get_width();
int h = i.get_height();

void setup(){
  size(w, h);
  
}

void draw(){
  i.display();
  if (i.satisfied()){
      println("A winner is you!");
      noLoop();
  }
  if (mousePressed){
    
    if (i.is_box1_hit()){
      i.set_box1_clicked();
    }
    else if(i.did_click_box1() && i.is_box2_hit()){
      i.set_satisfied();
    }
    else {
      i.clear_box1();
    }
  }
}
  
  
