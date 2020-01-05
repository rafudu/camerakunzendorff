import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class CameraLais extends PApplet {



Capture cam;

public void setup() {
  
  colorMode(HSB);

  String[] cameras = Capture.list();
  if(cameras.length == 0) {
    println("No cameras available, bye");
    exit();
  }

  cam = new Capture(this, cameras[0]);
  cam.start();
}
public void draw(){
  if(cam.available() == true) {
    cam.read();
  }

  fill(frameCount % 255,  255, 255, 80);
  rect(0,0,640,480);
  image(cam, 0, 0);
}
  public void settings() {  size(640,480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CameraLais" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
