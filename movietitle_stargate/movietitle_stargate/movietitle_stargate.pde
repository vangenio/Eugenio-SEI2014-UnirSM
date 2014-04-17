/*
todo: 
- salvare da ogni press al release successivo del mouse il tratto disegnato in un array con un livello diverso
- al release bloccare la possibilià di disegnare
- attivare l'animazione di luce che passa dallo sfondo
- attivare l'aminazione di scalfitura di una superficie
- ruotare tutti i segni come se fossero sullo stargate
- attivare zoom out
- attivare l'animazione dello stargate





*/
ArrayList<Px> pxs;
float posX=1;
float posY=1;
float vel=0.08;
int time=0;
float dista=0;

int g_time=0;
float g_stato=0;
float g_angolo=0;
float g_livello=0;

Io me=new Io();


void setup(){
  size(500,500);
  pxs = new ArrayList<Px>();  // Create an empty ArrayList
  background(0);
  time=millis();
}

void draw(){
  background(0);
  me.fa();
  
  
  noFill();
  stroke(255);
  float tmp_dist=0;
  int prev_x=0;
  int prev_y=0;
  int tmp_i=0;
  beginShape();
  for(int i=0; i<pxs.size();i++){
    Px px=pxs.get(i);
    if(tmp_dist<=dista){
      if(i==0){
        prev_x=px.getX();
        prev_y=px.getY();
      }
      
      tmp_dist+=(dist(int(prev_x),int(prev_y),int(px.getX()),int(px.getY())));
      prev_x=px.getX();
      prev_y=px.getY();
      tmp_i=i;
    }  
    px.display();
  }
  endShape();
  
  //if(time+50<millis()){
    //aggiungo alla posizione dell'ellisse il corrispettivo cartesiano x e y della velocità moltiplicato per il tempo
  float tmp_vel=vel*float(millis()-time);
  posX+=(prev_x-posX)/dist(posX,posY,prev_x,prev_y)*tmp_vel;
  posY+=(prev_y-posY)/dist(posX,posY,prev_x,prev_y)*tmp_vel;
  dista+=tmp_vel;
  time=millis();
  float tmp_size=10;
 /* if(tmp_i+1<pxs.size()){
   Px px=pxs.get(tmp_i+1);
   
    tmp_size=dist(px.getX(),px.getY(),prev_x,prev_y)/tmp_vel*2;
  }*/   
}


void trace(String str){
  
  println(str);
}

