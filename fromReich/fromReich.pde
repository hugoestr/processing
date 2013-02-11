// It emulates with colors 
// what Steve Reich did with Pendulum Music


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

  a.update(); b.update(); c.update();
}

class SwingingToRestRGB {
  int value, direction, speed, tick, swing_limit;
   
  SwingingRGB(){
   tick = 0;
   value = (int)random(255);
   swing_limit = (int)random(1,128);
   
   speed = 10;
   //changeSpeed();
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
   int upper, lower;
   upper = 255 - swing_limit;
   lower = swing_limit;
   
   if (value >= upper|| value <= 0){
     direction *= -1;
     
     if (swing_limit != 127){
      swing_limit++; 
     }
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
   speed = (int)random(7, 12);
 }

 int value(){
   return value;
 } 
}
