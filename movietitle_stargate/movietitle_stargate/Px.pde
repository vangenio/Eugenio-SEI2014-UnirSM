
class Px{
  int x=0;
  int y=0;
 Px(int n_x,int n_y){
  x=n_x;
  y=n_y;
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
