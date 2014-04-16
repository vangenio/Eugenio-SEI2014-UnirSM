ArrayList<Px> pxs;
float posX=1;
float posY=1;
float vel=0.05;
int time=0;
float dista=0;
void setup(){
   size(500,500);
  pxs = new ArrayList<Px>();  // Create an empty ArrayList
  background(0);
  time=millis();
}


void draw(){
  //background(0);
  pxs.add(new Px(mouseX, mouseY));  // Start by adding one element
  beginShape();
  noFill();
  float tmp_dist=0;
  int prev_x=0;
  int prev_y=0;
  int tmp_i=0;
  for(int i=0; i<pxs.size();i++){
    Px px=pxs.get(i);
    if(tmp_dist<=dista){
      tmp_dist+=(dist(int(prev_x),int(prev_y),int(px.getX()),int(px.getY())));
      prev_x=px.getX();
      prev_y=px.getY();
      tmp_i=i;
    }
      
    
    px.display();
  }
  
  
  print("tmp_dist:");
  print(tmp_dist);
  print(", dista:");
  println(dista);
  
  endShape();
  //if(time+50<millis()){
    //aggiungo alla posizione dell'ellisse il corrispettivo cartesiano x e y della velocità moltiplicato per il tempo
  float tmp_vel=vel*float(millis()-time);
  posX+=(prev_x-posX)/dist(posX,posY,prev_x,prev_y)*tmp_vel;
  posY+=(prev_y-posY)/dist(posX,posY,prev_x,prev_y)*tmp_vel;
  dista+=tmp_vel;
  time=millis();
  float tmp_size=10;
  if(tmp_i+1<pxs.size()){
   Px px=pxs.get(tmp_i+1);
   
    tmp_size=dist(px.getX(),px.getY(),prev_x,prev_y)/tmp_vel*2;
  }   
   
  
  
  ellipse(posX,posY,tmp_size,tmp_size);
  //
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
   vertex(x,y); 
 }
 int getX(){
   return(x);
 }
 int getY(){
   return(y);
 }
}
