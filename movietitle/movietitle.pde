ArrayList<Px> pxs;

void setup(){
   size(500,500);
  pxs = new ArrayList<Px>();  // Create an empty ArrayList
  background(0);
}


void draw(){
  pxs.add(new Px(mouseX, mouseY));  // Start by adding one element
  for(int i=0; i<pxs.size();i++){
    Px px=pxs.get(i);
    px.display();
  }
}

class Px{
  int x=0;
  int y=0;
 Px(int n_x,int n_y){
  x=n_x;
  y=n_y;
 } 
 void display(){
   stroke(255,0,0);
   point(x,y); 
 }
  
}
