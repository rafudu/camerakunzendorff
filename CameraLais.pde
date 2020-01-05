import processing.video.*;
PImage img = null;
Capture cam;
int CAM_WIDTH = 1280;
int CAM_HEIGHT = 720;
int clickCount = 0;
void setup() {
  size(1280, 720);
  colorMode(HSB);

  String[] cameras = Capture.list();
  if(cameras.length == 0) {
    println("No cameras available, bye");
    exit();
  }

  cam = new Capture(this, cameras[0]);
  cam.start();
}
void draw(){
  if(cam.available() == true) {
    cam.read();
  }
  
  
  alpha(120);
  noStroke();
  if(img != null){
    image(img, 0,0);
  }else {
    image(cam, 0,0);
  }
  fill(frameCount % 255,  255, 255, 80);
  rect(0,0,width,height);

}

void mousePressed(){
  if(mouseButton == RIGHT){
    img = transformImage(img);
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

PImage transformImage(PImage srcImage){
  println("TRASNFORMER");
  
  return srcImage;
}
