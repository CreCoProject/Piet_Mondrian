// Setup the Canvas
void setup()
{
  // Declare the Canvas
  size(300, 500);
}

// Does the horizontal Split
void horizontalSplit(int x1, int y1, int x2, int y2, float braight, float braight2, int z)
{
  // Calculates a smaller braight for the Lines
  braight = braight / 1.618;
  // Choose a Mode of the horizontl Split
  int splitParameter = int(random(3));
  // Calculate the Splitting Difference
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
        probablyDrawRectangle( x1, y1,  x2, y2, int(braight));
        break;
        
      // Mode to make a Lower Division
      case 1:
        dispatcher(x1, y1, x1+diff, y2, braight, z);
        dispatcher(x1+diff, y1, x2, y2,  braight, z);
        break;
      // Mode to make a Upper Division
      case 2:
        dispatcher(x1, y1, x2-diff, y2, braight, z);
        dispatcher(x2-diff, y1, x2, y2, braight, braight, z);
        break;
    }
  }
   // Draws the Lines at the Boundaries of the Divided Area
   drawBreakedLines(x1, y1, x1, y2, int(braight), false);
   drawBreakedLines(x2, y1, x2, y2, int(braight), false);
   drawBreakedLines(x1, y1, x2, y1, int(braight), true);
   drawBreakedLines(x1, y2, x2, y2, int(braight), true);
}

// Does the vertical Split
void verticalSplit(int x1, int y1, int x2, int y2, float braight, int z)
{
  // Calculate a smaller Braight for the Lines 
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
        probablyDrawRectangle( x1, y1,  x2, y2, int(braight));
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
      // Draws the Lines around the Bpundaries of the Divided Areas
      drawBreakedLines(x1, y1, x2, y1, int(braight), true);
      drawBreakedLines(x1, y2, x2, y2, int(braight), true);
      drawBreakedLines(x1, y1, x1, y2, int(braight), false);
      drawBreakedLines(x2, y1, x2, y2, int(braight), false);
} 

// Chose a Splitting Ditrection
void dispatcher(int x1, int y1, int x2, int y2, float braight, int z)
{
  // Chose the Splitting Direction
  int d = int(random(2));
  if( d == 0)
  {
    // Calls Vertical Division
    verticalSplit( x1, y1, x2, y2, braight, z);
  }
  else
  {
    // Calls horizontal Division
    horizontalSplit( x1, y1, x2, y2, braight, z);
  }
}

// Chose a Filling should be created
void probablyDrawRectangle(int x1, int y1, int x2, int y2, int braigt)
{
  int z = int(random(2));
  if(z == 1)
  {
    drawRectangle( x1, y1, x2, y2);
    // int z2 = int(random(2));
    // if(z2 == 1)
    {
      int diff = x2- x1;
      x1 = max(int(random(diff)), diff/6) + x1;
      x2 = x2 - max(int(random(diff)), diff/6);
      diff = y2- y1;
      y1 = max(int(random(diff)), diff/6) + y1;
      y2 = y2 - max(int(random(diff)), diff/6);
      noStroke();
      drawRectangle( x1, y1, x2, y2 );
      stroke(0);
    }
  }
}

// Draws the breaked Lines
void drawBreakedLines(int x1, int y1, int x2, int y2, int braight, boolean direction)
{
  // noStroke();
  float space;
  float possibleDivisions;
  float dividedSpace;
  // Handling the possible Directions of the Line
  if( direction )
  {
    // Calculates the true y Values from y and braight
    y1 = y1 - (braight / 2);
    y2 = y2 + (braight / 2);
    // Calculate the Space of the Line in master Direction
    space = x2 - x1;
    // Estimate the maximal possible Divisions
    possibleDivisions = space / braight;
    // Chose a Division of the Line
    possibleDivisions = int(random(possibleDivisions))+1;
    // Calculate the divided Space
    dividedSpace = space / possibleDivisions;
    // Iterrates about the Line in master Direction
    for(int z = 0; z < possibleDivisions; z++)
    {
      // Calculate the x Values from x1 by adding the divided Space multiple by Iteration
      // and Draws the Line
      drawRectangle(x1+int(dividedSpace * z), y1, x1+int(dividedSpace * (z+1)), y2);
    }
  }
  else
  {
    // Calculates the true x Values from x and braigt
    x1 = x1 - (braight / 2);
    x2 = x2 + (braight / 2);
    // Calculate the Space of the Line in master Direction
    space = y2 - y1;
    // Estimate the maximal possible Divisions
    possibleDivisions = space / braight;
    // Chose a Division of the Line
    int possibleDivisionsZ = 5; //int(random(possibleDivisions))+1;
    // Calculate the divided Space
    dividedSpace = space / possibleDivisionsZ;
    // Iterrates about the Line in master Direction
    for(int z = 0; z < possibleDivisionsZ; z++)
    {
      print(z); print("\n");
      // Calculate the x Values from x1 by adding the divided Space multiple by Iteration
      // and Draws the Line
      drawRectangle(x1, y1+int(dividedSpace * z), x2, y1+int(dividedSpace * (z+1)));
    }
        // drawRectangle(x1, y1+int(dividedSpace * possibleDivisionsZ), x2, y2);
  }
  stroke(0);
}

// Draws a Rectangle with a random Color of the four primary Colors
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
  // Draws the Line
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
  // drawBreakedLines(12, 45, 12, 150, 22, false);
  

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
    save("MondrianfilledStripes1.png");
  }
}
