
class Io {
  float stato=0;
  int livello=0;
  float angolo=0;
  
  //si sta parlando dello stargate
  float diametro=5000;
  float y_centro=diametro;
  float x_centro=0;
  
  Io(){
    x_centro=width/2;  
  }
  
  void fa(){
     switch(floor(stato)){
      case 0:
      stato++;
      break;
      case 1: //disegna
        registra();      
      
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
         pxs.add(new Px(mouseX, mouseY, livello, angolo));  // Start by adding one element
         trace("scrivo!");
      }else{
         livello++;
         setS(2,1);
      }
   
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

