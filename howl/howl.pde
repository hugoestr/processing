Void theVoid;
int start;

void setup(){
  int width = 800;
  int height = 600;
  int lifeExpectency = 300;
  float rate = 0.5;
  int throttle = 5;
  
  
  size(width, height);
  theVoid = new Void(width, height, lifeExpectency, throttle, rate);
  
  start = millis();
  //frameRate(60);

}

void draw() {

  
  //if (millis() - start > 100){
    background(0);
    theVoid.update();
  //  start = millis();
  //}

}


class Void {
 float rate;
 ArrayList<Life> beings;
 int max, width, height, lifeExpectency;
 
 public Void(int w, int h, int le, int m, float r){
   width = w;
   height = h;
   lifeExpectency = le;
   max = m;
   rate = 5;
   
   beings = new ArrayList<Life>();
 }
  
 public void update(){
   spawn();
   lifeAndDeath(); 
 } 
  
 private void spawn(){
   int create = (int)Math.floor(random(100000));
   int frequency = 99555;
   
   if (beings.size() < max && create >= frequency){
      Life baby = new Life(width, height, lifeExpectency, rate);
      beings.add(baby);
   }
  
 }
 
 private void lifeAndDeath(){
   for (int i = 0; i < beings.size(); i++){
     Life current = beings.get(i);
     
     if (current.alive()) {
       current.update();
     } else {
       beings.remove(current);
     }
   }
 }
 
}

class Life {
  double x, y, frequency;
  float r, g, b, rate;
  int lifetime, years, tick;
  
  public Life(int width, int height, int lifeExpectency, float r){
    years = 0;
    rate = r;
    
    x = random(width);
    y = random(height);

    r = random(256);  
    g = random(256);   
    b = random(256);     
    
    lifetime = (int)random(lifeExpectency);
    frequency = random(20, 20000);
  }
  
  public void update(){
    float size = 0;
    //fill(r, g, b);
   // stroke(r, g, b);
   
   fill(0);
   stroke(0);
    
    if (years < (lifetime / 2)){
      size = (float)years; 
    } else {
      size = (lifetime /2) - (years - lifetime / 2);
    }
  
    ellipse((float)x, (float)y, size, size);
    years++;
  } 
  
  public Boolean alive(){
    Boolean result = true;
    
    if (years > lifetime){
     result = false; 
    }
    
    return result;  
  }
  
}


