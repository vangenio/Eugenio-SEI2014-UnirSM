
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
   float n_x=x_centro + (x-x_centro)*cos(angolo+ext_angolo)- (y-y_centro)*sin(angolo+ext_angolo);
   float n_y=y_centro + (x-x_centro)*sin(angolo+ext_angolo) + (y-y_centro)*cos(angolo+ext_angolo);
  
   //vertex(n_x, n_y);
   float cos_l=dist(n_x,n_y,g_x_luce,g_y_luce);
   float l_punto_luce=dist(0,g_d_luce,cos_l,0);
   float r_luce=g_r_luce*random(0.99,1.01);
   float l_traspare = cos_l/ l_punto_luce *(r_luce-l_punto_luce);
    //ellipse(n_x,n_y,3,3);
    if(r_luce>l_punto_luce){
      int prog_tot=round(l_traspare)+10;
      strokeWeight(random(1,2));
      for(int prog=1;prog<prog_tot;prog++){
        
        float r_dist=dist(
        n_x,
        n_y,
        n_x+(n_x-g_x_luce)/cos_l*l_traspare/prog_tot*prog,
        n_y+(n_y-g_y_luce)/cos_l*l_traspare/prog_tot*prog
        ) / (cos_l/l_punto_luce); // distanza reale di quello che esce dal buco
       float alpha=80-80*pow(r_dist+l_punto_luce,2)/pow(r_luce,2)+random(2);
      float size=100*pow(prog,2)/pow(prog_tot,2)+random(1)+1; 
        stroke(255,255,255,alpha);
     //  strokeWeight(random(20/pow(r_dist,2)));
         if(prog==1){
           stroke(255,255,255,80+random(20));
           strokeWeight(size);
         }
           
           
        point(
          n_x+(n_x-g_x_luce)/cos_l*l_traspare/prog_tot*prog+random(-1,1)/prog_tot*prog,
          n_y+(n_y-g_y_luce)/cos_l*l_traspare/prog_tot*prog+random(-1,1)/prog_tot*prog
        );
      }
      }
     stroke(255,255,255,100);
      strokeWeight(1);
     vertex(n_x,n_y); 
     // line(n_x,n_y, n_x+(n_x-g_x_luce)/cos_l*l_traspare,n_y+(n_y-g_y_luce)/cos_l*l_traspare);
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
