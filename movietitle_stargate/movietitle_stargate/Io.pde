/* controllore: gestice lo stato e la posizione e lo storico degli eventi avvenuti durante lo script */

class Control{
  StringList nome = new StringList();
  StringList stato = new StringList();
  IntList time = new IntList();
  
  //setta lo stato di una determinata fase
  void setS(String n, String s){   
    if(getS(n)!=s){
      nome.append(n);
      stato.append(s);
      time.append(millis());
    }
  }//setT
  
  //restituisce il momento in cui è stata settato l'ultima volta lo stato
  int getT(String n){
    int tmp_i=-1;
    for(int i=nome.size()-1; i>=0;i--){
      if(nome.get(i) == n ){
        tmp_i=i;
        break;
      }
    }
    if(tmp_i==-1) return(-1);
    else return(time.get(tmp_i));
  } //getT
  
  // restituisce l'ultimo stato per la fase di lavoro richiesta
  String getS(String n){
    int tmp_i=-1;
    for(int i=nome.size()-1; i>=0;i--){
     if(nome.get(i) == n ){
       tmp_i=i;
     break;}
    }// getS

    if(tmp_i==-1) return("");
    
    else{
      return stato.get(tmp_i);
    }
  }
}// Control



// aggiunge un pixel all'array dei punti disegnati
void registra(){ 
   if(pxs.size()>0){
     int quale=pxs.size()-1;
    Px px_prec=pxs.get(quale);
     if(dist(mouseX,mouseY,px_prec.getX(),px_prec.getY())>1){
       Px px=new Px(mouseX, mouseY, g_livello,g_tracciato, -g_angolo);
       pxs.add(px);  
     }
   }else{
      Px px=new Px(mouseX, mouseY, g_livello,g_tracciato, -g_angolo);
      pxs.add(px);  
     
   }
 }//registra



void disegna(ArrayList<Px> pxs_tmp){
 // g_angolo+=0.001;
  int tmp_tracciato=-1;
  int tmp_dist=0;
  int prev_x=0;
  int prev_y=0;
  int tmp_i=0;
  float[] ray=new float[4];
  float[] prev_ray=new float[4];
  PImage sfuma=createImage(100, 100, ARGB);
  sfuma.loadPixels();
  for (int i = 0; i < sfuma.pixels.length; i++) {
    sfuma.pixels[i] = color(255, 255, 255,255*cos((float(i) % float(sfuma.width))/float(sfuma.width)*PI/2)); 
  }
  sfuma.updatePixels();
  int textmax=100;

  if(pxs_tmp.size()>2){
    for(int i=0; i<pxs_tmp.size()-1;i++){
      Px px=pxs_tmp.get(i);
      int bordo=0;
      tmp_dist+=(dist(int(prev_x),int(prev_y),int(px.getX()),int(px.getY())));
      tmp_i=i;
      if(px.getRay(g_angolo,g_x_centro,g_y_centro,float(i)/10.0,float(millis())/3000.0)[0]>0){
        ray=px.getRay(g_angolo,g_x_centro,g_y_centro,float(i)/10.0,float(millis())/3000.0);
      }
      if(tmp_tracciato==px.getTracciato() ){
        ArrayList<CooPx> p;
        p = new ArrayList<CooPx>();  // Create an empty ArrayList
        p.add(new CooPx(prev_ray[0],prev_ray[1]));
        p.add(new CooPx(prev_ray[0]+prev_ray[2]+5*noise(1000+float(millis())/3000),prev_ray[1]+prev_ray[3]+5*noise(1000+float(millis())/3000))); 
        p.add(new CooPx(ray[0]+ray[2]+5*noise(1000+float(millis())/3000),ray[1]+ray[3]+5*noise(1000+float(millis())/3000))); 
        p.add(new CooPx(ray[0],ray[1])); 
       
        if(!self_intersect(p)){
          beginShape();
          noStroke();
          texture(sfuma);
         
          vertex(p.get(0).x,p.get(0).y,0,0);
          vertex(p.get(1).x,p.get(1).y,textmax,0);
          vertex(p.get(2).x,p.get(2).y,textmax,textmax);
          vertex(p.get(3).x,p.get(3).y,0,textmax);
          vertex(p.get(0).x,p.get(0).y,0,0);
          endShape();
        }
      }
    
      prev_ray=ray;
      tmp_tracciato=px.getTracciato();
    } 
  }
} // disegna



boolean self_intersect(ArrayList<CooPx> p ){
  for(int i=0; i<p.size();i++){
    if(Float.isNaN(p.get(i).x)) {
     println("na na na");
      return(true);
    }
    if(Float.isNaN(p.get(i).y)) {
      
     println("na na na");
      return(true);
    }
  }
  if(doIntersect(p.get(0),p.get(1),p.get(2),p.get(3)) || doIntersect(p.get(1),p.get(2),p.get(3),p.get(0)) ){
   return(true);
  }
  
  return(false);
}



class CooPx
{
    float x;
    float y;
    CooPx(float n_x,float n_y){
      x=n_x;
      y=n_y;
    }
}; 
 
 /*\   
 
 script di intersezione preso da qui:
 http://www.geeksforgeeks.org/check-if-two-given-line-segments-intersect/
 
 \*/
 
 
 
// Given three colinear points p, q, r, the function checks if
// point q lies on line segment 'pr'
boolean onSegment(CooPx p, CooPx q, CooPx r)
{
    if (q.x <= max(p.x, r.x) && q.x >= min(p.x, r.x) &&
        q.y <= max(p.y, r.y) && q.y >= min(p.y, r.y))
       return true;
    return false;
}
 
// To find orientation of ordered triplet (p, q, r).
// The function returns following values
// 0 --> p, q and r are colinear
// 1 --> Clockwise
// 2 --> Counterclockwise
int orientation(CooPx p, CooPx q, CooPx r)
{
    // See 10th slides from following link for derivation of the formula
    // http://www.dcs.gla.ac.uk/~pat/52233/slides/Geometry1x1.pdf
    float val = (q.y - p.y) * (r.x - q.x) -
              (q.x - p.x) * (r.y - q.y);
 
    if (val == 0) return 0;  // colinear
 
    return (val > 0)? 1: 2; // clock or counterclock wise
}
 
// The main function that returns true if line segment 'p1q1'
// and 'p2q2' intersect.
boolean doIntersect(CooPx p1, CooPx q1, CooPx p2, CooPx q2)
{
    // Find the four orientations needed for general and
    // special cases
    int o1 = orientation(p1, q1, p2);
    int o2 = orientation(p1, q1, q2);
    int o3 = orientation(p2, q2, p1);
    int o4 = orientation(p2, q2, q1);
 
    // General case
    if (o1 != o2 && o3 != o4)
        return true;
 
    // Special Cases
    // p1, q1 and p2 are colinear and p2 lies on segment p1q1
    if (o1 == 0 && onSegment(p1, p2, q1)) return true;
 
    // p1, q1 and p2 are colinear and q2 lies on segment p1q1
    if (o2 == 0 && onSegment(p1, q2, q1)) return true;
 
    // p2, q2 and p1 are colinear and p1 lies on segment p2q2
    if (o3 == 0 && onSegment(p2, p1, q2)) return true;
 
     // p2, q2 and q1 are colinear and q1 lies on segment p2q2
    if (o4 == 0 && onSegment(p2, q1, q2)) return true;
 
    return false; // Doesn't fall in any of the above cases
}


/*\  fine script importato
\*/
