import geomerative.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[][] points;


PImage sfuma;
ArrayList<Px> pxs = new ArrayList<Px>();  // Create an empty ArrayList
Control stato=new Control();
float posX=1;
float posY=1;
float vel=0.08;
int time=0;
float dista=0;
boolean register=false;
int g_time=0;
float g_stato=0;
float g_angolo=0;
int g_livello=0;
float g_diametro=2000;
int code_register=(int) random(999999999);
float g_y_centro=g_diametro;
float g_x_centro=0;
float g_d_luce=0;
float g_d_luce_base=700;
float g_x_luce=0;
float g_y_luce=0; 
float g_r_luce=780;
int g_range_luce=100;
int g_tracciato=0;
int frame=0;

