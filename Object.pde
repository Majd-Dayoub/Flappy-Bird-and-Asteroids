abstract class Object //Abstract superclass is used to give common functionality to related sub classes. it acts as a category for the objects in the game.
{
  float x, y, sx, sy; //all objects will use these variables so it is put in the super class GameObject.

  Object() //Constructor.
  {
  }

  void display() //Renders the shapes; displays the shapes, images, and effects.
  {
  }

  void act() //Renders the behaviour, decision making, etc.
  {
  }

  boolean isDead () //
  {
    return false;
  }
}

class Star extends Object //subclass, this automatically has the instance variables of the superclass GameObject and it also acquires the methods like void display() and void act().
{
  Star () //constructor where the stars are created.
  {
    x = width; //x position of stars start at the end of the screen 
    y = random(0, height); // y position of star is at 0 so that it starts from the top of the screen.
    sx =random(4, 8);
    sy = 0; // no y speed
  }
  void display() 
  {
    fill(255);
    stroke(255);
    rect(x, y, sx, sy);
  }

  void act() 
  {
    //stars move with the direction of sx and sy.
    x = x-sx; //it has to be minus for the stars to go left.
  }
}

class Player2 extends Object
{
  Player2() //constructor
  {
    x= width/2;
    y= height/2;
    sx=0;
    sy=0;
  }

  void display()
  {  

    player2 = loadImage("player2.png"); //loads image
    player2.resize(150, 150); 
    image(player2, mouseX, mouseY);

    noCursor(); //hides mouse cursor.
  }

  void act()
  {    
    if (press== true) 
    {
      object.add(new laser( mouseX+140, mouseY+75));   


      if (press ==true && power ==true) 
      {
        object.add(new laser( mouseX+140, mouseY+75));
        object.add(new laser(mouseX+70, mouseY+40));
        object.add(new laser(mouseX+70, mouseY+105));


        press = false;
      }
      press = false;
    }
  }
}

class laser extends Object
{
  float laserX, laserY, hits;

  laser(float x, float y) //Setting up periamters for laser class so that i can change x and y positions for power up. 
  {
    sx= 10;
    sy = 0;
    laserX = x; //laserX = the x position that is set in the periameters.
    laserY=y;
    hits = 0;
  }

  void display()
  {
    fill(255, 165, 0);
    stroke(255, 165, 0);
    rect(laserX, laserY, 3, 3);
  }

  void act()
  {
    laserX= laserX+sx;
    if (laserX >= width)
    {
      laserY= 2000;
    }



    for (int i= 0; i< enemy.length; i++)    

    {
      if (enemy[i].x < width && enemy[i].x +70 >= laserX && enemy[i].x <= laserX + 3 && enemy[i].y + 70 >= laserY && enemy[i].y <= laserY +3) //collison detection between lasers and asteroids.
      {

        afterHit = loadImage("afterHit.png");
        afterHit.resize(70, 70 );
        image(afterHit, enemy[i].x, enemy[i].y);

        hitSound.play();
        enemy[i].x = -100;
        laserY = -100; //go off screen when bullet hits
        asteroidScore++;
      }
    }
  }

  boolean isDead()
  {
    return false;
  }
}

class Power extends Object
{

  Power()
  {
    x=width;
    y= random(20, height-20);
    sx= 7;
    sy = 0;
  }

  void display()
  {
    fill(255, 11, 122);
    stroke(255, 165, 0);
    ellipse(x, y, 80, 80);

    fill(0);
    stroke(255);
    textSize(20);
    text("3 GUNS", x-35, y);
  }

  void act()
  {
    x= x-sx;

    if (mouseX + 150 >= myPower.x && mouseX <= myPower.x +50 && mouseY + 150 >= myPower.y && mouseY <= myPower.y +50) //Detection between power up and ship 
    {
      power=true;
      x = 2000;
      y = random(20, height-20);
      fill(255);    
      textSize(40);
      text("POWER UP!", width/2, 100);
    }
  }

  boolean isDead()
  {
    return false;
  }
}
