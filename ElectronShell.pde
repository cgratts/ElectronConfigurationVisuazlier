class ElectronShell{  

// Number of electrons in each shell = 2(n^2), where n = shell number
// Shell Num: 1,2,3,4,5,
// Electrons: 2,8,18,32,50
  
  ElectronShell(){
  }
  
  void createShell(int shellNum){
    strokeWeight(1.5); // Adjust thickness of first electron shell
    stroke(0, 0, 0); // Black outline
    noFill(); // Hollow
    
    if(shellNum == 1){
      ellipse(0, 0, r * 5, r * 5); 
    }
    else if(shellNum == 2){
      ellipse(0, 0, r * 7, r * 7);
    }
    else if(shellNum == 3){
      ellipse(0, 0, r * 9, r * 9);
    }
    else if(shellNum == 4){
      ellipse(0, 0, r * 11, r * 11);
    }
    else if(shellNum == 5){
      ellipse(0, 0, r * 13, r * 13);
    }
  }
}
