class Panda {
   int originX, originY;
   color pandaWhite, pandaBlack;
   
   //variable from enum
   pandaStatus mouthStatus; 
    
   //base face, ears, and nose variables
   //these are present in all statuses
   int earOffsetH = 50, earOffsetV = 10;
   int faceSize = 350;
   int earSize = 150;
   int noseX = 50, noseY = 10;
   int noseLineY1 = 45, noseLineY2 = 82;
   int noseBridgeY1 = 40, noseBridgeY2 = 75;
   
   //variables for black eye rings
   int eyeRingShiftV = 70, eyeRingShiftH = 50;
   int eyeRingSizeV = 70, eyeRingSizeH = 160;
   
   //positions of eyes, gray eye lids, and eye shine
   int eyePositionX = 70, eyePositionY = 50;
   int eyeLidSize = 37, eyeSize = 35;
   int leftEyeShineX = 65, rightEyeShineX = 75;
   int eyeShineY = 55;
   int eyeShineSize = 10;
   
   //open jaw variables for mouthOpen status
   int jawOffsetX1 = 70, jawOffsetX2 = 40;
   int mouthOffsetY1 = 60; //used as the Y1 for jaw, skin, gums, and tongue
   int jawOffsetY2 = 160;
   int jawH = 100, jawV = 40;
    
   //black skin around open mouth
   int skinOffsetX1 = 65, skinOffsetX2 = 35;
   int skinOffsetY2 = 155;
   int skinSizeH = 70, skinSizeV = 31;
   
   //pink gums inside mouth
   int gumsOffsetX1 = 60, gumsOffsetX2 = 30;
   int gumsOffsetY2 = 150;
   int gumsSizeH = 60, gumsSizeV = 30;
    
   //pink tongue inside mouth
   int tongueOffsetX1 = 45, tongueOffsetX2 = 20;
   int tongueOffsetY2 = 140;
   int tongueSizeH = 40, tongueSizeV = 20;
    
   //white lips above mouth when mouth is open
   int lipOffsetX = 30, lipOffsetY = 60;
   int lipSizeH = 75, lipSizeV = 50;
   
   //the five teeth at edge of mouth
   int endTeethX = 20, innerTeethX = 10;
   int endTeethY = 150, innerTeethY = 155;
   int teethSize = 10;
   
   //tongue variables for tongueOut status
   int tongueOutX1 = 45, tongueOutX2 = 20;
   int tongueOutY1 = 85, tongueOutY2 = 140;
   int tongueOutH = 40, tongueOutV = 25;
   int tongueLineY1 = 85, tongueLineY2 = 150;

   //mouth variables for mouthClosed status
   float mouthX = 37.5;
   int mouthY = 75, mouthSize = 75;

   //constructor
   Panda(int theOriginX, int theOriginY, color pandaColorOne, color pandaColorTwo, float scale, pandaStatus theMouthStatus) {
      //these variables don't need to be multipled by scale
      originX = theOriginX;
      originY = theOriginY;
      pandaWhite = pandaColorOne;
      pandaBlack = pandaColorTwo;
      mouthStatus = theMouthStatus;
      
      //all of these variables are used in the base face
      earOffsetH *= scale;
      earOffsetV *= scale;
      faceSize *= scale;
      earSize *= scale;
      noseX *= scale;
      noseY *= scale;
      noseBridgeY1 *= scale; 
      noseBridgeY2 *= scale;
      
      eyeRingShiftV *= scale;
      eyeRingShiftH *= scale;
      eyeRingSizeV *= scale; 
      eyeRingSizeH *= scale;
      
      eyePositionX *= scale; 
      eyePositionY *= scale;
      eyeLidSize *= scale;
      eyeSize *= scale;
      leftEyeShineX *= scale; 
      rightEyeShineX *= scale;
      eyeShineY *= scale;
      eyeShineSize *= scale;
      
      noseLineY1 *= scale;
      noseLineY2 *= scale;
      
      //all of these variables are used in mouthOpen
      jawOffsetX1 *= scale;
      jawOffsetX2 *= scale;
      mouthOffsetY1 *= scale;
      jawOffsetY2 *= scale;
      jawH *= scale;
      jawV *= scale;

      skinOffsetX1 *= scale;
      skinOffsetX2 *= scale;
      skinOffsetY2 *= scale;
      skinSizeH *= scale;
      skinSizeV *= scale;

      gumsOffsetX1 *= scale; 
      gumsOffsetX2 *= scale;
      gumsOffsetY2 *= scale;
      gumsSizeH *= scale; 
      gumsSizeV *= scale;

      //all of these variables are used in tongueOut
      tongueOffsetX1 *= scale; 
      tongueOffsetX2 *= scale;
      tongueOffsetY2 *= scale;
      tongueSizeH *= scale; 
      tongueSizeV *= scale;

      lipOffsetX *= scale; 
      lipOffsetY *= scale;
      lipSizeH *= scale; 
      lipSizeV *= scale;
      
      endTeethX *= scale; 
      innerTeethX *= scale;
      endTeethY *= scale;
      innerTeethY *= scale;
      teethSize *= scale;
      
      tongueOutX1 *= scale; 
      tongueOutX2 *= scale;
      tongueOutY1 *= scale; 
      tongueOutY2 *= scale;
      tongueOutH *= scale; 
      tongueOutV *= scale;
      tongueLineY1 *= scale; 
      tongueLineY2 *= scale;
      
      //all of these variables are used in mouthClosed
      mouthX *= scale;
      mouthY *= scale;
      mouthSize *= scale;
   }
 
   //methods
   public void draw(){
      pushMatrix();
      
      //white face
      noStroke();
      fill(255);
      ellipse(originX, originY, faceSize, faceSize);
    
      //left and right ears
      fill(0);
      arc(originX - earSize, originY - earSize, earSize, earSize, HALF_PI, TWO_PI, OPEN);
      arc(originX + earSize, originY - earSize, earSize, earSize, PI, TWO_PI + HALF_PI, OPEN);
      
      //nose
      triangle(originX - noseX, originY + noseY, originX + noseX, originY + noseY, originX, originY + noseX);
      
      //left eye ring
      pushMatrix();
      translate(originX - eyeRingShiftV, originY - eyeRingShiftH);
      rotate(PI/6);
      ellipse(0, 0, eyeRingSizeV, eyeRingSizeH);
      popMatrix();
      
      //right eye ring
      pushMatrix();
      translate(originX + eyeRingShiftV, originY - eyeRingShiftH);
      rotate(-PI/6);
      ellipse(0, 0, eyeRingSizeV, eyeRingSizeH);
      popMatrix();
      
      //gray eyelids
      fill(#7E7E7E);
      ellipse(originX - eyePositionX, originY - eyePositionY, eyeLidSize, eyeLidSize);
      ellipse(originX + eyePositionX, originY - eyePositionY, eyeLidSize, eyeLidSize);
      
      //black eyes
      fill(#504F4F);
      ellipse(originX - eyePositionX, originY - eyePositionY, eyeSize, eyeSize);
      ellipse(originX + eyePositionX, originY - eyePositionY, eyeSize, eyeSize);
      
      //eye shine
      fill(#C1C1C1);
      ellipse(originX - leftEyeShineX, originY - eyeShineY, eyeShineSize, eyeShineSize);
      ellipse(originX + rightEyeShineX, originY - eyeShineY, eyeShineSize, eyeShineSize);
      
      //if status is mouthOpen, then the open jaw is drawn
      if (mouthStatus == pandaStatus.mouthOpen){
          noStroke();
          //white jaw
          fill(255);
          quad(originX - jawOffsetX1, originY + mouthOffsetY1, originX - jawOffsetX2, originY + jawOffsetY2, originX + jawOffsetX2, originY + jawOffsetY2, originX + jawOffsetX1, originY + mouthOffsetY1);
          arc(originX, originY + jawOffsetY2, jawH, jawV, 0, PI);
          
          //black skin
          fill(0);
          quad(originX - skinOffsetX1, originY + mouthOffsetY1, originX - skinOffsetX2, originY + skinOffsetY2 , originX + skinOffsetX2, originY + skinOffsetY2 , originX + skinOffsetX1, originY + mouthOffsetY1);
          arc(originX, originY + skinOffsetY2, skinSizeH, skinSizeV, 0, PI);
          
          //pink mouth
          fill(#E35973);
          quad(originX - gumsOffsetX1, originY + mouthOffsetY1, originX - gumsOffsetX2, originY + gumsOffsetY2, originX + gumsOffsetX2, originY + gumsOffsetY2, originX + gumsOffsetX1, originY + mouthOffsetY1);
          arc(originX, originY + gumsOffsetY2, gumsSizeH, gumsSizeV, 0, PI);
          
          //dark pink tongue
          fill(#8E1D46);
          quad(originX - tongueOffsetX1, originY + mouthOffsetY1, originX - tongueOffsetX2, originY + tongueOffsetY2, originX + tongueOffsetX2, originY + tongueOffsetY2, originX + tongueOffsetX1, originY + mouthOffsetY1);
          arc(originX, originY + tongueOffsetY2, tongueSizeH, tongueSizeV, 0, PI);
          
          //white upper lip
          fill(255);
          arc(originX - lipOffsetX, originY + lipOffsetY, lipSizeH, lipSizeV, 0, PI);
          arc(originX + lipOffsetX, originY + lipOffsetY, lipSizeH, lipSizeV, 0, PI);
          
          //teeth
          ellipse(originX - endTeethX, originY + endTeethY, teethSize, teethSize);
          ellipse(originX - innerTeethX , originY + innerTeethY, teethSize, teethSize);
          ellipse(originX, originY + innerTeethY, teethSize, teethSize);
          ellipse(originX + innerTeethX, originY + innerTeethY, teethSize, teethSize);
          ellipse(originX + endTeethX, originY + endTeethY, teethSize, teethSize);
      
      //if status is tongueOut, then the panda's mouth is closed, but its tongue is out
      } else if (mouthStatus == pandaStatus.tongueOut){
          //pink tongue
          noStroke();
          fill(#8E1D46);
          quad(originX - tongueOutX1, originY + tongueOutY1, originX - tongueOutX2, originY + tongueOutY2, originX + tongueOutX2, originY + tongueOutY2, originX + tongueOutX1, originY + tongueOutY1); //tongue
          arc(originX, originY + tongueOutY2, tongueOutH, tongueOutV, 0, PI); //curved edge of tongue
              
          //highlight line on tongue
          stroke(#B25D7C);
          strokeWeight(2);
          line(originX, originY + tongueLineY1, originX, originY + tongueLineY2);
       }
       //as long as the status is not mouthOpen, then the mouth is drawn closed
       if (mouthStatus != pandaStatus.mouthOpen) {
         //black mouth lines
          stroke(0);
          strokeWeight(3);
          fill(255);
          arc(originX - mouthX, originY + mouthY, mouthSize, mouthSize, 0, PI-QUARTER_PI);
          arc(originX + mouthX, originY + mouthY, mouthSize, mouthSize, QUARTER_PI, PI);
      }
      
      //black line connecting mouth and nose
      stroke(0);
      strokeWeight(3);
      line(originX, originY + noseBridgeY1, originX, originY + noseBridgeY2);
      
      popMatrix();
   }
}
