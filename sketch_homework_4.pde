int step_X=width/2;
int step_Y=height/3;
int rectX=0;
int rectY=0;
Boolean wasMouseEverPressed=false;  

void setup() { //setup sker kun én gang
  size(700,500);
 
     for (int iX=0; iX<width; iX += step_X) {
     for (int iY=0; iY<height; iY += step_Y) {
        fill(random(255)); 
      rect(iX,iY,step_X,step_Y);
    }
  }

}

void draw(){ //<>//
  //vi skal have void draw funktionen, ellers kører programmet kun én gang
}

void mouseClicked() {
  if (wasMouseEverPressed){
  fill (random(0,255));
  rect(rectX, rectY, step_X, step_Y);
  }
  
  
  rectX = (mouseX/step_X)*step_X;
  rectY = (mouseY/step_Y)*step_Y;
  
  fill ((255),0,0);
  rect(rectX, rectY, step_X, step_Y);
  wasMouseEverPressed=1;
}
