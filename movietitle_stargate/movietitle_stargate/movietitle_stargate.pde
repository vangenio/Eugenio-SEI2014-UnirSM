/*
Descrizione: 

todo: 
- salvare da ogni press al release successivo del mouse il tratto disegnato in un array con un livello diverso
- al release bloccare la possibilià di disegnare
- attivare l'animazione di luce che passa dallo sfondo
- attivare l'aminazione di scalfitura di una superficie
- ruotare tutti i segni come se fossero sullo stargate
- attivare zoom out
- attivare l'animazione dello stargate


Premere A o a per attivare la rotazione

Premere s o S per spostare la luce di sfondo


*/

//import javax.media.opengl.*;
//import processing.opengl.*;
void setup(){
  size(1024,600,OPENGL);
 
 
  stato.setS("setup","avvia");
  g_x_centro=width/2;
  g_x_luce=width/2;
  g_y_luce=height/2;
  background(0);
  time=millis();


}

void draw(){
  
g_d_luce=g_d_luce_base+100*noise(1000+float(millis())/5000.0);
g_x_luce=width/2+g_range_luce/2-g_range_luce*noise(10000+float(millis())/5000.0);
g_y_luce=height/2+g_range_luce/2-g_range_luce*noise(10000+float(millis())/5000.0);
//  filter(blur); // Blurs more each time through draw()
    //filter(BLUR, 1);

//  PImage img;
  
  background(0);
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      register=true;
    }if (key == 'e' || key == 'E') {
      register=false;
    }
    if (key == 'q' || key == 'Q') {
      g_d_luce_base+=0.2;
    }if (key == 'w' || key == 'W') {
      g_d_luce_base-=0.2;
    }if (key == 'a' || key == 'A') {
      if(stato.getS("ruota")!="attivo"){
        stato.setS("registra","disabilitato");
        stato.setS("ruota","attivo");
         stato.setS("tracciato","finito");
        frame=0;
        
      }
    }if (key == 's' || key == 'S') {
      if(millis()-stato.getT("luce")>1000){
        if(stato.getS("luce")=="segui mouse"){
         
          stato.setS("luce","reset");
          g_x_luce=width/2;
          g_y_luce=height/2;
         
          
        }else{
         
         
         stato.setS("luce","segui mouse");
        }
      }
      
    }
  }
  if(stato.getS("setup")=="avvia"){
    stato.setS("setup","done");
    stato.setS("registra","abilitata");
  }
  if(stato.getS("luce")=="segui mouse"){
     g_x_luce=mouseX;
     g_y_luce=mouseY;
  
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
    int tot_frame_roto=600;
    float rotaz=PI*2/7;
    if(frame<tot_frame_roto){
      frame++;
      
     g_angolo+=rotaz/2*abs(cos((float(frame)+1.0)/float(tot_frame_roto)*PI)-cos(float(frame)/float(tot_frame_roto)*PI));
     //g_angolo+=rotaz/tot_frame_roto;//abs((rotaz/2 * (cos(PI/tot_frame_roto*frame)))-(rotaz/2 * (cos(PI/tot_frame_roto*(frame-1)))));
     // else g_angolo+=(rotaz * abs(sin(PI/tot_frame_roto*(frame-1))))-(rotaz * (sin(PI/tot_frame_roto*(frame))));
    //g_d_luce=600;
    //g_r_luce=800;
    //println(frame);
    }else{
      stato.setS("ruota","disattivo");
      stato.setS("registra","abilitata");
    }
  }
  
  if(g_stato==2 && g_angolo>=2*PI){
    //animazione finale
  }


disegna(pxs);  
  
if(register)saveFrame("starcagate-######.png");  
  
  
}

