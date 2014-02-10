Void theVoid;

void setup(){
  int width = 800;
  int height = 600;
  int lifeExpectency = 300;
  size(width, height);
  
  theVoid = new Void(width, height, lifeExpectency);
}

void draw() {
  theVoid.update();
}


class Void {
 ArrayList<Life> beings;
 int width, height, lifeExpectency;
 
 public Void(int w, int h, int le){
   width = w;
   height = h;
   lifeExpectency = le;
   
   beings = new ArrayList<Life>();
 }
  
 public void update(){
   spawn();
   lifeAndDeath(); 
 } 
  
 private void spawn(){
   int create = 1; //(int)Math.floor(random(1));
   
   if (create == 1){
      Life baby = new Life(width, height, lifeExpectency);
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
  int lifetime, years;
  
  public Life(int width, int height, int lifeExpectency){
    years = 0;
    x = random(width);
    y = random(height);
    
    lifetime = (int)random(lifeExpectency);
    frequency = random(20, 20000);
  }
  
  public void update(){
    ellipse((float)x, (float)y, (float)years, (float)years);
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


