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
Control stato=new Control();
float posX=1;
float posY=1;
float vel=0.08;
int time=0;
float dista=0;

int g_time=0;
float g_stato=0;
float g_angolo=0;
int g_livello=0;
float g_diametro=1000;
float g_y_centro=g_diametro;
float g_x_centro=0;
float g_d_luce=150;
float g_x_luce=0;
float g_y_luce=0; 
float g_r_luce=250; 
int g_tracciato=0;
int frame=0;

void setup(){
  size(500,500);
  stato.setS("setup","avvia");
  g_x_centro=width/2;
  g_x_luce=width/2;
  g_y_luce=height/2;
  pxs = new ArrayList<Px>();  // Create an empty ArrayList
  background(0);
  time=millis();
}

void draw(){
  background(0);
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      if(stato.getS("ruota")!="attivo"){
        stato.setS("registra","disabilitato");
        stato.setS("ruota","attivo");
        frame=0;
      }
    }
  }
  if(stato.getS("setup")=="avvia"){
    stato.setS("setup","done");
    stato.setS("registra","abilitata");
  }
  if(stato.getS("registra")=="abilitata" && g_angolo<2*PI){ 
    if(mousePressed){ 
      stato.setS("tracciato","iniziato");
      registra();
    }else if(stato.getS("tracciato")=="iniziato"){
     stato.setS("tracciato","finito");
     g_tracciato++; 
      
    }
  }
  
  if(stato.getS("ruota")=="attivo" && g_angolo<2*PI){
    int tot_frame_roto=1000;
    if(frame<tot_frame_roto){
    frame++;
     g_angolo+=(PI/12 * abs(sin(PI/tot_frame_roto*frame)))-(PI/12 * abs(sin(PI/tot_frame_roto*(frame-1))));
    
    println(frame);
    }
  }
  
  if(g_stato==2 && g_angolo>=2*PI){
    //animazione finale
  }
disegna();  
  
  
  
  
}


void trace(String str){
  
  println(str);
}

