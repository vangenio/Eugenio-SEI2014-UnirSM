
class Control{
  StringList nome = new StringList();
  StringList stato = new StringList();
  IntList time = new IntList();
  
  
  void setS(String n, String s){
    if(getS(n)!=s){
      nome.append(n);
      stato.append(s);
      time.append(millis());
    }
  }
  
  int getT(String n){
   int tmp_i=-1;
    for(int i=nome.size()-1; i>=0;i--){
     if(nome.get(i) == n ){
       tmp_i=i;
     break;}
    }

    if(tmp_i==-1) return(-1);
    
    else{
      return time.get(tmp_i);
    }
  }
  
  String getS(String n){
    int tmp_i=-1;
    for(int i=nome.size()-1; i>=0;i--){
     if(nome.get(i) == n ){
       tmp_i=i;
     break;}
    }

    if(tmp_i==-1) return("");
    
    else{
      return stato.get(tmp_i);
    }
  }
}




void registra(){
   //   trace(" getS "+getS(1)+" stato:"+stato);
   pxs.add(new Px(mouseX, mouseY, g_livello,g_tracciato, -g_angolo));  // Start by adding one element
   
 }



void disegna(){
 // g_angolo+=0.001;
  int tmp_tracciato=-1;
  int tmp_dist=0;
  int prev_x=0;
  int prev_y=0;
  int tmp_i=0;
  
    //pg.beginDraw();

  
  float[] ray=new float[4];
  float[] prev_ray=new float[4];
 PImage sfuma=createImage(100, 100, ARGB);
sfuma.loadPixels();
for (int i = 0; i < sfuma.pixels.length; i++) {
  sfuma.pixels[i] = color(255, 255, 255, 255-255*i/sfuma.width/sfuma.width); 
}
sfuma.updatePixels();
 
  for(int i=0; i<pxs.size();i++){
    Px px=pxs.get(i);
    
    int bordo=0;
      tmp_dist+=(dist(int(prev_x),int(prev_y),int(px.getX()),int(px.getY())));
      tmp_i=i;
     if(px.getRay(g_angolo,g_x_centro,g_y_centro)[0]>0){
      ray=px.getRay(g_angolo,g_x_centro,g_y_centro);
     }
   
    if(tmp_tracciato==px.getTracciato()){
       
    
     beginShape();
     
  noStroke();
      texture(sfuma);
      fill(255,0,0);
      vertex(prev_ray[0],prev_ray[1],0,0);
      vertex(prev_ray[0]+prev_ray[2],prev_ray[1]+prev_ray[3],100,0);
      vertex(ray[0]+ray[2],ray[1]+ray[3],100,100);
      vertex(ray[0],ray[1],0,100);
      vertex(prev_ray[0],prev_ray[1],0,0);
      //println(ray);
      endShape();
      
    }
    
      
    
    
    
   /*   
    if(i>0){
    }*/
    prev_ray=ray;
    //prev_x=px.getX();
    //prev_y=px.getY();
    //px.display(g_angolo,g_x_centro,g_y_centro);
    
    tmp_tracciato=px.getTracciato();
  }
  
  //pg.endDraw();
  
  //image(pg, 0, 0); 

  
}




/*

  void setS(float stato, int f, int p){  //f:fase p:profondità
   p++;
   stato=floor(stato)+abs(f)/pow(10,abs(p)-1);
   if(abs(p)==1) stato=abs(f);  
  }
  
  float getS(float stato, int p){//p: profondità
    p++;
    if(p>1) return(floor((stato%(p-1))*10));
    else return(floor(stato));
   
  }







class Io {
  float s_registra=0;
  float s_disegna=0;
  
  int livello=0;
  float angolo=0;
  int tracciato=0;  
  //si sta parlando dello stargate
  float diametro=1000;
  float y_centro=diametro;
  float x_centro=0;
  float d_luce=250;
  float x_luce=0;
  float y_luce=0; 
  float r_luce=350; 
  
  Io(){
    x_centro=width/2;  
  }
  
  void fa(){
     switch(floor(stato)){
      case 0:
      stato++;
      
    x_luce=width/2;
    y_luce=height/2;
    x_centro=width/2;
      break;
      case 1: //disegna
        registra(); 
        disegna();     
      
      break;
      case 2: //luce
      
      
      break;
      case 3: //roto
      
      
      break;
      case 4: //zoom
      
      
      break;
      case 5: //stargate
      
      
      break;
    }
 
  }
  
      
}
*/
