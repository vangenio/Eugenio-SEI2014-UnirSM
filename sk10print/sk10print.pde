// oh lalala

ArrayList<Px> pxs;
int g_n_c=50;
int g_n_r=50;
int g_w=10;
int g_h=10;

void setup(){
  size(g_n_c*g_w, g_n_r*g_h);
  pxs = new ArrayList<Px>();
  int prog=0;
  for(int i=0; i<g_n_c;i++){
    for(int e=0; e<g_n_r;e++){
      int[] family_size=new int[2];
      family_size[0]=g_n_c;
      family_size[1]=g_n_r;
      
      pxs.add(new Px(i,e,g_w,g_h,prog,family_size));
      prog++;
    }  
  }
}
void draw(){
  for (int i = pxs.size()-1; i >= 0; i--) {
      Px px = pxs.get(i);
      
      
  for (int e = pxs.size()-1; e >= 0; e--) {
      px.refresh(pxs.get(e).get_param());
  
   }
      px.display();
      
   }
}


class Px {
 int[] param= new int[3]; //parametri
 int[] p_med= new int[6]; //media dei parametri degli amici
  
 int c=0;
 int r=0;
 int w=0;
 int h=0;
 int d=0;
 int id=0;
 int[] family_size=new int[2];
  Px(int new_c, int new_r, int new_w, int new_h, int new_id, int[] new_family_size){
    c=new_c;
    r=new_r;
    w=new_w;
    h=new_h;
    id=new_id;
    param[0]=int (random(0,255));
    param[1]=int (random(0,255));
    param[2]=int (random(0,255));
    family_size=new_family_size;
    p_med=new int[6];
  }
  
  void display(){
    noStroke();
    int i=10;
    if(p_med[0]/p_med[3]-param[0]<0) param[0]-=i;else param[0]+=i;
    if(p_med[1]/p_med[4]-param[1]<0) param[1]-=i;else param[1]+=i;
    if(p_med[2]/p_med[5]-param[2]<0) param[2]-=i;else param[2]+=i;
    
    if(param[0])<0)param[0]=0;
    it(param[0])>255) param[0]=255;
    if(param[1])<0)param[1]=0;
    it(param[1])>255) param[1]=255;
    if(param[2])<0)param[2]=0;
    it(param[2])>255) param[2]=255;
    fill(param[0],param[1],param[2]);
    rect(c*w,r*h,w,h);
    p_med=new int[6];
  }
  
  int[] get_param(){
    int[] params= new int[5];
    params[0]=param[0];
    params[1]=param[1];
    params[2]=param[2];
    params[3]=c;
    params[4]=r;
   return params; 
  }
  
  
  void refresh(int[] f_param){ //parametri dell'amico pixel con cui confrontarsi
  if(dist(c,r,f_param[3],f_param[4])<30){
    float peso_valore=(dist(0,0,family_size[0],family_size[1])-dist(c,r,f_param[3],f_param[4]));
      p_med[0]+=f_param[0]*peso_valore;
      p_med[3]+=peso_valore;
      p_med[1]+=f_param[1]*peso_valore;
      p_med[4]+=peso_valore;
      p_med[2]+=f_param[2]*peso_valore;
      p_med[5]+=peso_valore;
  }
  }
  
 
}
