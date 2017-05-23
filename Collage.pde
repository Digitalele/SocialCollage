Twitt t;
Instagram i;

void setup(){
  size(600, 600);
  i = new Instagram();
  t = new Twitt();
}

void draw(){
  i.display();
}

void keyPressed(){    
  switch(keyCode){
    case 78:  //next n
        i.action();
    break; 
    case 83:  //save s
        i.saveCollage();
    break;  
    case 85:  //upload u
        t.upload();
    break;
    case 45:  //exit -
      exit();
    break;
  }
} 