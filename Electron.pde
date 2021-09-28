class Electron{
  
  Electron(){
  }
  
  // push() and pop() preserve origin of electron for proper translation
  // Electron placement order: CCW starting at 90 degrees
  void fillShell1(float radius, int elecNum){
    stroke(255, 0, 0);
    float theta;
    
    if(elecNum == 1){      
      theta = 90 * (PI / 180);
      push();
      translate(r * 2.5 * cos(theta), -r * 2.5 * sin(theta), 0);
      sphere(radius);
      pop();
    } 
    else if(elecNum  == 2){
      theta = 270 * (PI / 180);   
      push();
      translate(r * 2.5 * cos(theta), r * 2.5 * -sin(theta), 0);
      sphere(radius); 
      pop();
    }
  } 
  
  void fillShell2(float radius, int elecNum){
    stroke(0, 255, 0);
    float theta = 45 * (PI / 180);
    
    for(int i = 1; i <= numElecs - 2; i++){  
      push();
      translate(r * 3.5 * -sin(theta*(elecNum - 1)), r * 3.5 * -cos(theta*(elecNum - 1)));
      sphere(radius); 
      pop();
    }
  }
  
  void fillShell3(float radius, int elecNum){
    stroke(0, 0, 255);
    float theta = 20 * (PI / 180);
    
    for(int i = 1; i <= numElecs - 10; i++){
      push();
      translate(r * 4.5 * -sin(theta*(elecNum - 1)), r * 4.5 * -cos(theta*(elecNum - 1)));
      sphere(radius); 
      pop();
    }
  }
  
  void fillShell4(float radius, int elecNum){
    stroke(255, 0, 255);
    float theta = 11.25 * (PI / 180);
    
    for(int i = 1; i <= numElecs - 28; i++){
      push();
      translate(r * 5.5 * -sin(theta*(elecNum - 1)), r * 5.5 * -cos(theta*(elecNum - 1)));
      sphere(radius); 
      pop();
    }
  }
}
