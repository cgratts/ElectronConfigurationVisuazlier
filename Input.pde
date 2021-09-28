import javax.swing.*;

String prompt(String s){
  try{
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
  }
  catch(Exception e){
    e.printStackTrace();
  }
  
  String entry = JOptionPane.showInputDialog(s);
  
  // Exit program if 'Cancel' button clicked, empty string entered, 
  // or any string not parseable to an int is entered (1 <= string length <= 3)
  if (entry == null || entry.length() == 0 || !entry.matches("^([0-9]{1}|[0-9]{2}|[0-9]{3})$")){
    System.exit(0);
    return null;
  }
  return entry;
}

String getString(String s){
  return prompt(s);
}

int getInt(String s){
  return Integer.parseInt(getString(s)); 
}
