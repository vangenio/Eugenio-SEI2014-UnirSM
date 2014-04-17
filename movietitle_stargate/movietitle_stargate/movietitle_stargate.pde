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
}


void trace(String str){
  
  println(str);
}

