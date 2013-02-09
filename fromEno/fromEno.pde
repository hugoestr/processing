import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


SwingingRGB a, b, c;
int limit, start;

void setup() {
  size(displayWidth, displayHeight);
  
  a = new SwingingRGB();
  b = new SwingingRGB();
  c = new SwingingRGB();
}

void draw() {
  background(a.value(), b.value(), c.value());
  
  println("a " + a.value() + " b " + b.value() + " c " + c.value());

  a.update();
  b.update();
  c.update();
}

class SwingingRGB {
  int value, direction, speed, tick;
   
  SwingingRGB(){
   tick = 0;
   value = (int)random(255);
   
   changeSpeed();
   setDirection();
  }
  
  void update(){
    if (tick == speed){
      value += direction;
      tick = 0;
      bounceOnEdge();
    }
    tick++;    
  }
 
 void bounceOnEdge(){
   if (value == 255 || value == 0){
     direction *= -1;
     changeSpeed();
   }
 }
 
 void setDirection(){
   int positive = (int)random(1);
   
   if (positive == 1){
     direction = 1;
   } else {
     direction = -1; 
   }
 }
 
 void changeSpeed(){
   speed = (int)random(5, 10);
 }

 int value(){
   return value;
 } 
}
