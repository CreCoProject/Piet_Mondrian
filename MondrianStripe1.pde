// Method to Create the Image
void setup()
{
  // Defines the Size of the Image
  size(300, 500);
  // noLoop();
}

// Method to do Vertical Split
void verticalSplit(int x1, int x2, float braight, int z)
{
  braight = braight / 1.618;
  // Choose a Mode of the Vertical Split
  int splitParameter = int(random(3));
  // Controll tp prevend Overfow by repeated Division
  z = z + 1;
  if( z < 6)
  {
      // Process the Vertical Slit Mode
    switch(splitParameter)
    {
      // Mode to draw the Divided Stripes
      case 0: 
        // Draw Upper Stripe
        drawLine(int(x1+((x2-x1)/1.618)), true, int(braight));
        // Draw lower Stripe
        drawLine(int(x2-((x2-x1)/1.618)), true, int(braight));
        break;
        
      // Mode to make a Lower Division
      case 1:
        verticalSplit(x1, int(x1+((x2-x1)/1.618)), braight, z);
        verticalSplit(int(x2-((x2-x1)/1.618)), x2, braight, z);
        break;
      // Mode to make a Upper Division
      case 2:
        verticalSplit(x1, int(x1+((x2-x1)/1.618)), braight, z);
        verticalSplit(int(x2-((x2-x1)/1.618)), x2, braight, z);
        break;
    }
  }
  else
  {
    // Draw Upper Stripe
        drawLine(int(x1+((x2-x1)/1.618)), true, int(braight));
        // Draw lower Stripe
        drawLine(int(x2-((x2-x1)/1.618)), true, int(braight));
  }
}

// Method to do Horizontal Split
void horinzontalSplit(int x1, int x2, float braight, int z)
{
  braight = braight / 1.618;
  // Choose a Mode of the Horizontal Split
  int splitParameter = int(random(3));
  // Controll tp prevend Overfow by repeated Division
  z = z +1;
  if(z<6)
    // Process the Vertical Slit Mode
  {
    switch(splitParameter)
    {
      // Mode to draw the Divided Stripes
      case 0: 
        // Draw Upper Stripe
        drawLine(int(x1+((x2-x1)/1.618)), false, int(braight));
        // Draw lower Stripe
        drawLine(int(x2-((x2-x1)/1.618)), false, int(braight));
        break;
        
      // Mode to make a Lower Division
      case 1:
        horinzontalSplit(x1, int(x1+((x2-x1)/1.618)), braight, z);
        horinzontalSplit(int(x2-((x2-x1)/1.618)), x2, braight, z);
        break;
      // Mode to make a Upper Division
      case 2:
        horinzontalSplit(x1, int(x1+((x2-x1)/1.618)), braight, z);
        horinzontalSplit(int(x2-((x2-x1)/1.618)), x2, braight, z);
        break;
    }
  }
  else
  {
     // Draw Upper Stripe
        drawLine(int(x1+((x2-x1)/1.618)), false, int(braight));
        // Draw lower Stripe
        drawLine(int(x2-((x2-x1)/1.618)), false, int(braight));
  }
     
}

// Method to draw a Line
void drawLine( int x, boolean direction, int bright)
{
  // Set the bright of the Line
  bright = max(bright, 3);
  strokeWeight(bright);
  // Generate a Color-Number for the Coloring of the Line
  int colorrandom = int(random(4));
  // Set the Colors in respect to the Color-Number
  switch(colorrandom)
  {
    // Set Color to Read
    case 0: stroke(255, 0, 0); break;
    // Set Color to Green
    case 1: stroke(0, 255, 0); break;
    // Set Color to Yellow
    case 2: stroke(0, 255, 255); break;
    // Set Color to Blue
    case 3: stroke(0, 0, 255); break;
  }
  // Set the direction of the Line
  if(direction)
  {
    // Create a Horinzontal Line
    line(0, x, 300, x);
  }
  else
  {
    // Create a Vertical Line
    line(x, 0, x, 500);
  }
}

  

// Click on the image to give it focus,
// and then press any key.

int value = 0;

void draw() {
     
}

void keyPressed(){
  if( key == 'n'){
      background(255);
      horinzontalSplit(0, 300, 30, 0);
      verticalSplit(0, 500, 30, 0);
      print("Fertig \n");
  }
  if( key == 's'){
    save("Test.png");
  }
}
