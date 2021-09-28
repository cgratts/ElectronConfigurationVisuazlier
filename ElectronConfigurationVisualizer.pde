import java.io.*;
import java.util.*;

Table refTable;
String symbol = "";
String config = "";
int input, atomicNum, numElecs, tempNum;
float angle;
float r  = 30; // Nucleus radius
float e = 7.5; // Electron radius
IntList subShell = new IntList(2,2,6,2,6,2,10,6,2,10,6,2,14,10,6,2,14,10,6,14,10,14);
StringList configs = new StringList();
StringList letters = new StringList("1s","2s","2p","3s","3p","4s","3d","4p","5s","4d","5p",
                                    "6s","4f","5d","6p","7s","5f","6d","7p","6f","7d","7f");
                                    
Electron elec = new Electron(); // Can reuse 1 electron object to display multiple
                                                              
void setup(){
  //size(1100, 700, P3D);
  size(700, 700, P3D);
  textSize(20);
  
  Table table = loadTable("PeriodicTable.csv", "header");
  refTable = table;
  input = getInt("Enter an element's atomic number (1-103)\nEnter 0 to exit"); // Refer to Yahoo! bookmark as to why 103
  
  if(input == 0 || str(input) == null){ 
    System.exit(0);
  }
  
  atomicNum = Integer.valueOf(table.getRow(input).getString("AtomicNumber"));
  symbol = table.getRow(Integer.valueOf(input - 1)).getString("Symbol"); // index starts at 0 in csv file
  atomicNum = atomicNum - 1; // index starts at 0 in csv file
  numElecs = atomicNum;
  tempNum = numElecs;

  // Process electron configuration string
  for(int i = 0; i < subShell.size(); i++){
    tempNum -= subShell.get(i);
    if(tempNum == 0){
      config += letters.get(i) + "(" + subShell.get(i) + ")";
      break;
    }
    else if(tempNum < 0){
      config += letters.get(i) + "(" + (subShell.get(i) + tempNum) + ")"; // tempNum is added since it is negative
      break;
    }
    else{
      config += letters.get(i) + "(" + subShell.get(i) + ")";
    }     
  }
  
  // Store config string in a String list to reference when calculating abbreviated string
  // Current issue: strings are added to the list as user input is provided, so an 
  // abbreviation might not be accessible/applicable if the required config string has not 
  // been stored into the list yet
  
  // configs.append(config);
  // println(configs);
}

void draw(){
  background(180, 180, 180); // Create background color
  translate(width * 0.5, height * 0.5); // Center the object
  
  // Nucleus and label creation/placement
  noStroke();
  fill(255, 255, 0);
  sphere(r);
  textAlign(CENTER, CENTER);
  textMode(SHAPE); // Place text on nucleus
  fill(0, 0, 0); // Black text
  text(symbol, 0, 0, r); // Center text within nucleus
  text(config, 0, 190); // Display electron configuration below diagram
  text("Element: " + refTable.getRow(input - 1).getString("Element"), 0, -260);
  text("Number of Electrons: " + atomicNum, 0, -220);
 
  // Create first electron shell
  if(numElecs - 2 <= 0){ 
    ElectronShell firstShell = new ElectronShell();
    firstShell.createShell(1);
    
    // Fill first electron shell
    for(int i = 1; i <= numElecs; i++){
      elec.fillShell1(e, i);
    }
  }
  // Create first two electron shells
  else if(numElecs - 10 <= 0){ 
    ElectronShell firstShell = new ElectronShell();
    ElectronShell secondShell = new ElectronShell();
    firstShell.createShell(1);
    secondShell.createShell(2);
    
    // Fill first and second electron shells
    for(int i = 1; i <= 2; i++){
      elec.fillShell1(e, i);
    }
    for(int i = 1; i <= numElecs - 2; i++){
      elec.fillShell2(e, i);
     
    }
  }
  // Create first three electron shells
  else if(numElecs - 28 <= 0){ 
    ElectronShell firstShell = new ElectronShell();
    ElectronShell secondShell = new ElectronShell();
    ElectronShell thirdShell = new ElectronShell();
    firstShell.createShell(1);
    secondShell.createShell(2);
    thirdShell.createShell(3);
    
    // Fill first, second, and third electron shells
    for(int i = 1; i <= 2; i++){
      elec.fillShell1(e, i);
    }
    for(int i = 1; i <= numElecs - 2; i++){
      elec.fillShell2(e, i);
    }
    for(int i = 1; i <= numElecs - 10; i++){
      elec.fillShell3(e, i);
    }
  }
  // Create first four electron shells
  else if(numElecs - 60 <= 0){ 
    ElectronShell firstShell = new ElectronShell();
    ElectronShell secondShell = new ElectronShell();
    ElectronShell thirdShell = new ElectronShell();
    ElectronShell fourthShell = new ElectronShell();
    firstShell.createShell(1);
    secondShell.createShell(2);
    thirdShell.createShell(3);
    fourthShell.createShell(4);
    
    // Fill first, second, third, and fourth electron shells
    for(int i = 1; i <= 2; i++){
      elec.fillShell1(e, i);
    }
    for(int i = 1; i <= numElecs - 2; i++){
      elec.fillShell2(e, i);
    }
    for(int i = 1; i <= numElecs - 10; i++){
      elec.fillShell3(e, i);
    }
    for(int i = 1; i <= numElecs - 28; i++){
      elec.fillShell4(e, i);
    }
  }
  reset();
}

// Reset config string and canvas for next input display
void reset(){
  config = "";
  frameCount = -1;
}
