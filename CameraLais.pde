import processing.video.*;
PImage img = null;
Capture cam;

int clickCount = 0;
void setup() {
  size(320, 240);
  colorMode(HSB);

  String[] cameras = Capture.list();
  if(cameras.length == 0) {
    println("No cameras available, bye");
    exit();
  }

  cam = new Capture(this, 320,240);
  cam.start();
}
void draw(){
  if(cam.available() == true) {
    cam.read();
  }
  
  
  
  if(img != null){
    image(img, 0,0);
  }else {
    image(cam, 0,0);
  }
  alpha(120);
  noStroke();
  fill(frameCount % 255,  255, 255, 80);
  //rect(0,0,width,height);

}

void mousePressed(){
  
  if(mouseButton == RIGHT){
    img = sortPixels(img);
    return;
  }
  
  clickCount++;
  
  if(clickCount % 2 == 1){  
    img = cam.copy();
   // cam.stop();
   }
  if(clickCount % 2 == 0){ 
    img = null;
  }
  
}

PImage sortPixels(PImage srcImage){
  println("TRANSFORMER");
  
  return srcImage;
}
