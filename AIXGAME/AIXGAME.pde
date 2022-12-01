Population test;
PVector goal = new PVector(400,10);
int count;
void setup()
{
  f = createFont("Arial",16,true);
  size(800,800);
  test = new Population(100);
}

PFont f;                           // STEP 1 Declare PFont variable

void draw()
{
   background(255);
   f = createFont("Arial",16,true);
   textFont(f,36);
   fill(255,20,244);
   text("Gen:", width-150,50);
   count = test.count;
   String str = count + " ";
   text(str,width-70,50);
   fill(255,0,0);
   ellipse(goal.x,goal.y,10,10);
   
   //obst
   
   fill(0,0,255);
   rect(100,300,600,10);
   
   
   
   if(test.allDotsDead())
   {
       // genetic algorithm
       test.calculateFitness();
       test.naturalSelection();
       test.mutateDemBabies();
   }
   else
   {
     test.update();
     test.show();
   }
}
