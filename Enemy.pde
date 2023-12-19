class Enemy
{
  float x, y, sx, sy, sizeX, sizeY;
  
  Enemy () 
  {
    x = width +200; //x position of enemies starts at end of screen. 
    y = random(30, height-30); // y position of enemies is at 0 so that it starts from the top of the screen.
    sx = random(2, 5); //speed x of enemies
    sy =0 ; //speed y of enemys is random from 2 to 5.
    sizeX = 70;
    sizeY = 70;
  }

  void Display ()
  {
    asteroid = loadImage("asteroid.png");
    asteroid.resize((int)sizeX, (int)sizeY );
    image(asteroid, x, y);


    if (x < -70)
    {
      x = random(width+100, width+200);
      y = random(30, height-30);
  
    }
  }
  void Update()
  {

    x = x-sx;
    if (mouseX + 100 >= x && mouseX <= x +50 && mouseY + 80 >= y && mouseY <= y +20) // if player (mouseX,mouseY) collides with asteroids, go to game over state.
    {
      println("died");
      state =5; //GameOver State
    }
  }
}
