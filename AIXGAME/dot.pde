class Dot
{
   PVector pos;
   PVector vel;
   PVector acc;
   Brain brain;
   boolean dead = false;
   float fitness = 0;
   boolean reachedGoal = false;
   boolean isBest = false;
   Dot()
   {
     brain  = new Brain(400);
     pos = new PVector(width/2 , height-10);  //middle of the screen (POSITION OF THE VECTOR) 
     vel = new PVector(0,0);  
     acc = new PVector(0,0);
   }
   
   void show()
   {
     if(isBest)
     {
        fill(0,255,0);
        ellipse(pos.x,pos.y,8,8);
     }
     else
     {
       fill(0);
       ellipse(pos.x,pos.y,4,4);
     }
   }
    
   void move()
   {
     if(brain.directions.length > brain.step)
     {
       acc = brain.directions[brain.step];
       brain.step++;
     }
     else 
     {
       dead = true;
     }
      vel.add(acc);
      vel.limit(5);
      pos.add(vel);
   }
   
  void update()
  {
    if(!dead && !reachedGoal)
    {
      move();
      if(pos.x < 2 || pos.y < 2 || pos.x > width-2 || pos.y > height-2)
      {
        dead = true;
      }
      else if(dist(pos.x,pos.y,goal.x,goal.y)<5)
      {
          // if reached goal
          reachedGoal = true;
      }
      else if(pos.x<700 && pos.y <310 && pos.x > 100 && pos.y > 300)
      {
          dead = true;
      }
    }
  } 
  
  void calculateFitness()
  {
    if(reachedGoal){
      fitness = 1.0/16.0 + 10000.0/(float)(brain.step * brain.step);
    }
    else
    {  
      float distanceToGoal = dist(pos.x,pos.y,goal.x,goal.y);
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
  }
  
   Dot gimmeBaby(){
    Dot baby = new Dot();
    baby.brain = brain.clone();
    return baby;
  }
  
}
