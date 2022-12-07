// Setup the Application
void setup()
{
  // Defins the Size of the Canvas
  size(300, 500);
}

// Global Spacing Parameter with Boundaries
// Spacing in x Direction
int xSpacesG = 36;
// Spacing in y Direction
int ySpacesG = 77;

// Global Calculatiing of the Spacing Parameters
int xSpaces = int(xSpacesG / 1.2);
int ySpaces = int(ySpacesG / 1.2);

// Method to paint the Crosses
void drawCross( int x, int y)
{
  // Sets the Color for the Cross
  fill(0);
  // Calculate and Choose the x upper left Corner diff
  int xb = int(random(xSpaces/4))+(xSpaces/4);
  // Calculate and Choose the y upper left Corner diif
  int yb = int(random(ySpaces/4));
  // Generates the Truth x Corner
  int x1 = x - xb;
  // Generates the Truth y Corner
  int y1 = y - yb;
  // Choose the Wide of the Cross Rectangle
  int xc = int(random(xSpaces/2 - ((xSpaces/2)-xb)))+(xSpaces/2);
  // Calculate the possible Height of the Cross Rectangle
  int yLeftSpace = ySpaces - ((ySpaces/2) -yb);
  // Choose a Height from the possible Height but not greater then the weidth
  int yc = int(random(min(xc/2, yLeftSpace)));
  // Paint the Cross Rectangle
  rect(x1, y1, xc, yc);   
  // +++
  
   // Calculate and Choose the x upper left Corner diff
  yb = int(random(ySpaces/4))+(ySpaces/4);
  // Calculate and Choose the y upper left Corner diif
  xb = int(random(xSpaces/4));
  // Generates the Truth x Corner
  y1 = y - yb;
  // Generates the Truth y Corner
  x1 = x - xb;
  // Choose the Wide of the Cross Rectangle
  yc = int(random(ySpaces/2 - ((ySpaces/2)-yb)))+(ySpaces/2);
  // Calculate the possible Height of the Cross Rectangle
  int xLeftSpace = xSpaces - ((xSpaces/2) -xb);
  // Choose a Height from the possible Height but not greater then the weidth
  xc = int(random(min(yc/2, xLeftSpace)));
  // Paint the Cross Rectangle
  rect(x1, y1, xc, yc);
  
  // ++
  
}

// generates the Image
void generate()
{
  // Clear and Set the Background to Whithe
  background(255);
  // Draw a simple Cross
  int maxx = int(width / xSpacesG)-4;
  int maxy = int(height / ySpacesG);
  for(int n = 1; n < maxx; n++)
  {
      for(int m = 1; m < maxy; m++)
      {
         drawCross(n*ySpacesG, m*ySpacesG);
      }
  }
}

// empty draw Methode for compatibility with keyPressed Method
void draw()
{
}

// Menue Methode
void keyPressed()
{
  char keye = key;
  // If n is pressed generate a new Image
  if(keye == 'n')
  {
    generate();
  }
  // if s is pressed save the current Image
  if(keye == 's')
  {
    save("Mondrian Composition Black White.png");
  }
}
