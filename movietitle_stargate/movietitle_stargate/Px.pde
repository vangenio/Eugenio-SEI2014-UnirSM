
class Px{
  int x=0;
  int y=0;
  int livello=0;
  float angolo=0;
 Px(int n_x,int n_y, int n_livello, float n_angolo){
  x=n_x;
  y=n_y;
  livello=n_livello;
  angolo=n_angolo;
 } 
 void display(){
   vertex(x,y); 
   ellipse(x,y,3,3);
 }
 int getX(){
   return(x);
 }
 int getY(){
   return(y);
 }
}
