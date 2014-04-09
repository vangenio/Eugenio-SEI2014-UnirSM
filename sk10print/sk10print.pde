/*

10 print con size proporzionale al numero di rettangoli

aggiunta progressione proporzionale al seno sull'asse x e y

TODO controllare l'approssimazione, tenere tutti i numeri in float e convertirli solo alla fine in int 

*/





ArrayList<Px> pxs; // array di oggetti
int g_n_c=20; // numero di colonne della griglia
int g_n_r=20; // numero di righe della griglia
int g_w=20; // larghezza delle celle
int g_h=20; // altezza delle celle

void setup(){
  size(g_n_c*g_w, g_n_r*g_h);   // creazione della finestra proporzionale
  pxs = new ArrayList<Px>();  //creazione dell array di oggetti 
  int prog=0;  // inizializzo la variabile con l'id univoco del pixel che verrà creato
  
  for(int i=0; i<g_n_c;i++){ //ciclo per ogni colonna
    for(int e=0; e<g_n_r;e++){  //ciclo per ogni riga
      int[] family_size=new int[2]; //  preparo l'array con il numero totale di colonne  e righe da passare all'oggetto
      family_size[0]=g_n_c;
      family_size[1]=g_n_r;
      pxs.add(new Px(i,e,g_w,g_h,prog,family_size));  // creo il mio pixel e gli passo tutti i parametri
      prog++;  //  incremento l'id univoco
    }
  }
  
} //fine setup

void draw(){
  background(200);
  for (int i = pxs.size()-1; i >= 0; i--) {  //processo tutto l'array di oggetti
      Px px = pxs.get(i);  //selezionono l'oggetto i dall'arraylist
      
      
    for (int e = pxs.size()-1; e >= 0; e--) {  //per ogni oggetto riprocesso tutti gli oggetti per dargli consapevolezza dell'ambiente circostante
        px.refresh(pxs.get(e).get_param());
    
     }
      px.display();//disegno l'oggetto
      
   }
   delay(20000);
}


class Px {
 int c=0;  //colonna dell'oggetto
 int r=0;  //riga dell'oggetto
 int w=0;  //larghezza dell'oggetto
 int h=0;  //altezza dell'oggetto
 int id=0;  //id univoco dell'oggetto
 int[] family_size=new int[2];  //[0] numero totale di colonne, [1] numero totale righe
  
  Px(int new_c, int new_r, int new_w, int new_h, int new_id, int[] new_family_size){ // setto tutti i parametri
    c=new_c;
    r=new_r;
    w=new_w;
    h=new_h;
    id=new_id;
    family_size=new_family_size;
  }
  
  void display(){  //disegno il quadratino
    fill(255,255,255);
    //rect(c*w,r*h,w,h);
    int randomico =0;
    while(randomico % 5 == 0 ) randomico=floor(random(16)); //escludo i casi in cui verrebbe disegnato un punto su uno dei 4 vertici
 int propW=int(( mappaSin(family_size[0],c+1)-mappaSin(family_size[0],c))*family_size[0]*w);
 int propH=int(( mappaSin(family_size[1],r+1)-mappaSin(family_size[1],r))*family_size[1]*h);
  
    //  int propW=int(sin(PI/2/family_size[0]*(c+1))*family_size[0]*w-sin(PI/2/family_size[0]*c)*family_size[0]*w); // calcolo della posizione reale seguendo una progressione sull'asse x = al seno
  //    int proph=int(sin(PI/2/family_size[1]*(r+1))*family_size[1]*h-sin(PI/2/family_size[0]*r)*family_size[1]*h); // calcolo della posizione reale seguendo una progressione sull'asse x = al seno
    line( //spostamento sui vertici aggiungendo o meno la larghezza / altezza controllando 0 o 1 dell'equivalente booleano del numero random da 0 a 7 (111)
    mappaSin(family_size[0],c)*family_size[0]*w+((randomico & 1) == 0 ? 0 : propW),    
    mappaSin(family_size[1],r)*family_size[1]*h+((randomico & 2)>>1 == 0 ? 0 : propH), 
    mappaSin(family_size[0],c)*family_size[0]*w+((randomico & 4)>>2 == 0 ? 0 : propW),
    mappaSin(family_size[1],r)*family_size[1]*h+((randomico & 8)>>3 == 0 ? 0 : propH));
    
  }
  
  int[] get_param(){
    int[] params= new int[2];
    params[0]=c;
    params[1]=r;
   return params; 
  }
  
  
  void refresh(int[] f_param){ //parametri dell'amico pixel con cui confrontarsi
    if(dist(c,r,f_param[0],f_param[1])<2){
      
    
    }
  }
  
 
}


float mappaSin(int tot, int pos){
  
  
     float prop=sin(PI/2/tot*pos);
 return prop;  
}
