// Setup the Canvas
void setup()
{
  // Declare the Canvas
  size(300, 500);
}


void horizontalSplit(int x1, int y1, int x2, int y2, float braight, int z)
{
  braight = braight / 1.618;
  // Choose a Mode of the horizontl Split
  int splitParameter = int(random(3));
  int diff = int((x2-x1)/1.618);
  // Controll tp prevend Overfow by repeated Division
  z = z + 1;
  if( z < 6)
  {
      // Process the Vertical Slit Mode
    switch(splitParameter)
    {
      // Mode to draw the Divided Stripes
      case 0: 
        probablyDrawRectangle( x1, y1,  x2, y2);
        break;
        
      // Mode to make a Lower Division
      case 1:
        dispatcher(x1, y1, x1+diff, y2, braight, z);
        dispatcher(x1+diff, y1, x2, y2,  braight, z);
        break;
      // Mode to make a Upper Division
      case 2:
        dispatcher(x1, y1, x2-diff, y2, braight, z);
        dispatcher(x2-diff, y1, x2, y2, braight, z);
        break;
    }
  }
   drawLine(x1, y1, x1, y2, int(braight));
   drawLine(x2, y1, x2, y2, int(braight));
   drawLine(x1, y1, x2, y1, int(braight));
   drawLine(x1, y2, x2, y2, int(braight));
}

void verticalSplit(int x1, int y1, int x2, int y2, float braight, int z)
{
  braight = braight / 1.618;
  // Choose a Mode of the horizontl Split
  int splitParameter = int(random(3));
  int diff = int((y2-y1)/1.618);
  // Controll tp prevend Overfow by repeated Division
  z = z + 1;
  if( z < 6)
  {
      // Process the Vertical Slit Mode
    switch(splitParameter)
    {
      // Mode to draw the Divided Stripes
      case 0: 
        probablyDrawRectangle( x1, y1,  x2, y2);
        break;
        
      // Mode to make a Lower Division
      case 1:
        dispatcher(x1, y1, x2, y1+diff, braight, z);
        dispatcher(x1, y1+diff, x2, y2,  braight, z);
        break;
      // Mode to make a Upper Division
      case 2:
        dispatcher(x1, y1, x2, y2-diff, braight, z);
        dispatcher(x1, y2-diff, x2, y2, braight, z);
        break;
    }
  }
      drawLine(x1, y1, x2, y1, int(braight));
      drawLine(x1, y2, x2, y2, int(braight));
      drawLine(x1, y1, x1, y2, int(braight));
      drawLine(x2, y1, x2, y2, int(braight));
} 

void dispatcher(int x1, int y1, int x2, int y2, float braight, int z)
{
  int d = int(random(2));
  if( d == 0)
  {
    verticalSplit( x1, y1, x2, y2, braight, z);
  }
  else
  {
    horizontalSplit( x1, y1, x2, y2, braight, z);
  }
}

void probablyDrawRectangle(int x1, int y1, int x2, int y2)
{
  int z = int(random(2));
  if(z == 1)
  {
    drawRectangle( x1, y1, x2, y2);
  }
}

void drawRectangle(int x1, int y1, int x2, int y2)
{
   int colorrandom = int(random(4));
  // Set the Colors in respect to the Color-Number
  switch(colorrandom)
  {
    // Set Color to Read
    case 0: fill(255, 0, 0); break;
    // Set Color to Green
    case 1: fill(0, 255, 0); break;
    // Set Color to Yellow
    case 2: fill(255, 255, 0); break;
    // Set Color to Blue
    case 3: fill(0, 0, 255); break;
  }
  rect(x1, y1, x2-x1, y2-y1);
}

// Method to draw a Line
void drawLine( int x1, int y1, int x2, int y2, int bright)
{
  // Set the bright of the Line
  
  bright = max(bright, 3);
  strokeWeight(bright);
  line(x1, y1, x2, y2);
}

// Empty draw Method for Commpatiblity with the KeyPresed Method
void draw()
{
}

// Generator Method to paint the Image
void generate()
{
  // Clears the Canvas for a new Image
  background(255);
  // drawRectangle(12,23,22, 55);
  dispatcher(0, 0, 300, 500, 36, 0);
  

}

// KeyPressed Method to Handle the User Controll
void keyPressed()
{
  // Stores the Selected Option
  char kei = key;
  // If n Pressed geneate a new Image
  if(kei == 'n'){
    generate();
  }
  if(kei == 's'){
    save("MondrianStripes2.png");
  }
}
