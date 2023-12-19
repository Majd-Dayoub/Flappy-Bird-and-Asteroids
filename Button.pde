class Button
{
  int button1X, button1Y, buttonW, buttonH;

  Button()
  {
    button1X= 150;
    button1Y= 150;
    buttonW= 150;
    buttonH= 150;
  }

  void drawButton(int x, int y, String flappy)
  {
    if (mouseX > x && mouseX < x + buttonW && mouseY > y && mouseY < y + buttonH) {
      fill(150);
    } else fill(255);

    rect(x, y, buttonW, buttonH,200);
    fill(0);

    text(flappy, x + buttonW/2 - textWidth(flappy)/2, y + buttonH/2 + 10);
    if (mouseX > x && mouseX < x + buttonW && mouseY > y && mouseY < y + buttonH & press == true)
    {
     state=1;
     press= false;
    }
  }
}

class Button2 extends Button
{
  int button1X, button1Y, buttonW, buttonH;

  Button2()
  {
    button1X= 150;
    button1Y= 150;
    buttonW= 150;
    buttonH= 150;
  }

  void drawButton(int x, int y, String asteroid)
  {
    if (mouseX > x && mouseX < x + buttonW && mouseY > y && mouseY < y + buttonH) {
      fill(150);
    } else fill(255);

    rect(x, y, buttonW, buttonH,200);
    fill(0);

    textFont(title);
    textSize(20);
    text(asteroid, x + buttonW/2 - textWidth(asteroid)/2, y + buttonH/2 + 10);
    if (mouseX > x && mouseX < x + buttonW && mouseY > y && mouseY < y + buttonH & press == true)
    {
     state=4;
     press= false;
    }
  }
}
