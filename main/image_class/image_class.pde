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
  frames = new ArrayList();
  Image firstImage = new Image("../../images/Frame 1 HCl.png", 130, 50, 40, 50);
  frames.add(firstImage);
  frames.add(new Image("../../images/Frame 1.5 HCl.png", 300, 20, 100, 60));
  frames.add(new Image("../../images/Frame 2 HCl.png", 320, 30, 60, 40));
  frames.add(new Image("../../images/Frame 2.5 HCl.png", 420, 20, 100, 80));
  frames.add(new Image("../../images/Frame 3 HCl.png", 0, 0, 1000, 1000));
  frames.add(new Image("../../images/Frame 4 HCl.png", 0, 0, 1000, 1000));
  index = 0;
  size(700, 500);
  background(255);
  firstImage.display();
  println("setup done");
  println(frames.size());
  currentImage = (Image) frames.get(index);
}
Image currentImage;
void draw() {
  background(255);
  currentImage.display();
  if (mousePressed) {
    if (currentImage.satisfied()){
      println("Next frame");
      println("Advance");
      index = index + 1;
      if (index >= frames.size()) {
        println("YOU WON!!!");
        index = 0;
      }
      println("New index");
      println(index);
      currentImage = (Image) frames.get(index);
    }
  }
  try {
    Thread.sleep(130);
  } catch (InterruptedException e) {
    e.printStackTrace();
  }
  
}


