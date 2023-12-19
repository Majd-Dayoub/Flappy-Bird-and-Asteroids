//Creating a super class that stores the Player, and has other subclasses like the pipes. 
class Player 
{
  float x, y, sx, sy, w, h; //used in all subclasses as well. 

  Player()//Constructor
  {
    x= 100;
    y=250;
    sy=1;
    w = 70; //width of player
    h=70; //height of player
  }

  void display()//Displays the player.
  {
    player = loadImage("player.png"); //loads image
    player.resize((int)h, (int)w); 
    image(player, x, y);
  }

  void act()//The behaviour of the Player. 
  { 


    if (press==true) //if mouse is pressed, player accelerates upwards.
    {
      fly.play();
      sy = -25;
      y +=sy;
      press=false;
    } else
    {
      sy += 5;//Acts as gravity when mouse isn't pressed
      y += sy;
      if (y >= height || y< -70)
      {
        state=3;
        die.play();
      }
    }
  }
}

//Subclass that stores same methods and variables as the superclass Player.
class Pipe extends Player
{
  //float x1, y1, sy1;
  int [] pipeX, pipeY;

  Pipe()//Constructor
  { 
    //bottom pipe
    x= 100;
    y=height-200;
    sy=1;
    w = 100; //width of pipe
    h = 300; // height of pipe

    pipeX= new int[5];
    pipeY = new int[5];

    for (int i =0; i<5; i++)
    {
      pipeX[i] = 200*i +width; //200 is how far apart the pipes are to each other, and i did +width to make the pipes start at the rightside of the screen. 
      pipeY[i] = (int)random(-200, 0); //creates random lengths for pipe.
    }
  }

  void display()
  {
    pipe = loadImage("pipe.png"); 
    pipe.resize(100, 300); 

    pipe1 = loadImage("pipe1.png"); 
    pipe1.resize(100, 300); 
    
    if (restart ==true) // if r key is pressed while dead, set the pipes back to end of screen.
    {
      for (int i=0; i<5; i++)
      {        

        pipeX[i] += width; //if the r key is pressed,all the pipes are moved to the end of the screen. 

        restart=false;
      }
    }
    
    for (int i =0; i<5; i++)
    {
      image(pipe, pipeX[i], pipeY[i]+500); 
      image(pipe1, pipeX[i], pipeY[i]);
      pipeX[i] -= 10;
      if (pipeX[i] <-100)
      {
        pipeX[i] = width; //it equals width so that the new pipes can spawn off the screen
      }

      //Collison Detection 
      if (myPlayer.x + myPlayer.w-30 >= pipeX[i] && myPlayer.x <=pipeX[i] +w && myPlayer.y + myPlayer.h >= pipeY[i] && myPlayer.y <= pipeY[i] + h -30//Top pipe collison
        ||  myPlayer.x + myPlayer.w-30 >= pipeX[i] && myPlayer.x <= pipeX[i]+w && myPlayer.y + myPlayer.h >= pipeY[i] && myPlayer.y >= pipeY[i]+475 ) //Bottom pipe collison
      {
        die.play(); 
        state=3;
      }

      //Gap Detection
      else  if ( myPlayer.x == pipeX[i] +w || myPlayer.x == pipeX[i] +1&& myPlayer.y + myPlayer.h >= pipeY[i]+h-30 && myPlayer.y <= pipeY[i] +500)
      {    
        flappyScore++;    
        point.play();
      }
    }
  }

  void act()
  {
  }
}
