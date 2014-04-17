
class Io {
  float stato=0;
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
  
    
    
 void registra(){   
      trace(" getS "+getS(1)+" stato:"+stato);
  if(getS(1) == 0){
    if(mousePressed){
      setS(1,1);
     }
  }
   if(getS(1) == 1){
      if(mousePressed){
         pxs.add(new Px(mouseX, mouseY, livello,tracciato, -g_angolo));  // Start by adding one element
         trace("scrivo!");
      }else{
         tracciato++;
         //setS(2,1);
      }
   
   }   
 }

void disegna(){
  g_angolo+=0.001;
  int tmp_tracciato=-1;
  int tmp_dist=0;
  int prev_x=0;
  int prev_y=0;
  int tmp_i=0;
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
    if(tmp_tracciato!=px.getTracciato() && tmp_tracciato!=-1) endShape();
    if(tmp_tracciato!=px.getTracciato()) beginShape();
    px.display(g_angolo,x_centro,y_centro);
    tmp_tracciato=px.getTracciato();
  }
  
  
  
}





  void setS(int f, int p){  //f:fase p:profondità
   p++;
   stato=floor(stato)+abs(f)/pow(10,abs(p)-1);
   if(abs(p)==1) stato=abs(f);  
  }
  
  float getS(int p){//p: profondità
    p++;
    if(p>1) return(floor((stato%(p-1))*10));
    else return(floor(stato));
   
  }
  
}

