
class Px{
  int x=0;
  int y=0;
  int livello=0;
  float angolo=0;
  int tracciato=0;
 Px(int n_x,int n_y, int n_livello, int n_tracciato, float n_angolo){
  x=n_x;
  y=n_y;
  livello=n_livello;
  angolo=n_angolo;
  tracciato=n_tracciato;
 } 
 void display(float ext_angolo,float x_centro, float y_centro){

   //x_centro=0;
   //y_centro=0;
   //vertex(x,y); 
   println(x_centro);
   float n_x=x_centro + (x-x_centro)*cos(angolo+ext_angolo)- (y-y_centro)*sin(angolo+ext_angolo);
   float n_y=y_centro + (x-x_centro)*sin(angolo+ext_angolo) + (y-y_centro)*cos(angolo+ext_angolo);
   //vertex(n_x, n_y);
   float cos_l=dist(n_x,n_y,me.x_luce,me.y_luce);
   float l_punto_luce=dist(0,me.d_luce,cos_l,0);
   float l_traspare = cos_l/ l_punto_luce *(me.r_luce*random(0.9,1.1)-l_punto_luce);
    //ellipse(n_x,n_y,3,3);
    stroke(255,255,255,random(0,55));
    line(n_x,n_y, n_x+(n_x-me.x_luce)/cos_l*l_traspare,n_y+(n_y-me.y_luce)/cos_l*l_traspare);
 }
 int getX(){
   return(x);
 }
 int getY(){
   return(y);
 }
 int getTracciato(){
   return(tracciato);
 }
}
