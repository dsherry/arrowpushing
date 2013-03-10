PImage hcl;
PImage h2o;
int XWIDTH = 320;
int YWIDTH = 320;

float hcl_x = XWIDTH/2;
float hcl_y = YWIDTH/3;

float h2o_x = XWIDTH/2;
float h2o_y = 2*YWIDTH/3;

void setup()
{
  size (XWIDTH, YWIDTH);
  smooth();
  imageMode(CENTER);
  hcl = loadImage("../images/hcl_dots.png");
  h2o = loadImage("../images/h2o_dots.png");
}

void draw ()
{
    background(255);
    image(hcl, hcl_x, hcl_y);
    image(h2o, h2o_x, h2o_y);
}

void mouseClicked ()
{
    hcl_x = mouseX;
    hcl_y = mouseY;
}

void mouseDragged ()
{
    hcl_x = mouseX;
    hcl_y = mouseY;
}

class Image {
  int x, y;
  PImage img;
  
  Image(path) {
    img = loadImage("../images/hcl_dots.png")
  }

}
