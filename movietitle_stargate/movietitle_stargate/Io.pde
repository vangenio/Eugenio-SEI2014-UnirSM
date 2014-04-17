
class Io {
  float stato=0;
  
  Io(){
    
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
  if(stato%1==0){
    if(mousePressed){
         pxs.add(new Px(mouseX, mouseY));  // Start by adding one element
         trace(" "+(pxs.size()));
    }
  } 
   
   
 }
  
}
