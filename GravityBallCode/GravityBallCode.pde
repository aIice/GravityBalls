int count = 30; //number of balls

//array variables
float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];

//to make random colours
float[] r = new float[count];
float[] g = new float[count];
float[] b = new float[count];

float gravity = .5; //gravity

void setup() {
  size(800, 600);
  
  int i = 0;
  
  //while loop to define variables
  while (i < count) {
    x[i] = width/2;
    y[i] = random(0,height/2);
    velX[i] = random(-2,2);
    velY[i] = 0;
    diam[i] = random(40,80);
    
    r[i] = random(100,220);
    g[i] = random(100,220);
    b[i] = random(100,220);
    
    i++;
  }
}

void draw() {
  background(0);
  
  int i = 0;
  
  //while loop to make balls
  while (i < count) {
    fill(r[i],g[i],b[i],180);
    noStroke();
    ellipse(x[i],y[i],diam[i],diam[i]);
    
    //x,y positions
    x[i] += velX[i];
    y[i] += velY[i];
    
    //velocity accelerates with gravity
    velY[i] += gravity;
    
    //bounce off edges of screen
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);
    }
    
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i] - gravity);
    } else if (y[i] + diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
    
    i++;
  }
}