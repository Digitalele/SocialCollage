class Instagram  {
  
  int kind, tag, x, y, w, h, i;
  
  String[] kinds =
    {
      "#", "#"
    };
  
  String[][] tags =
    {
      { "#", "#"},
      { "#", "#"},
    };
  
  String apiKey = "#";
  
  PImage img1, img2;
  
  processing.data.JSONObject photos1, photos2;
  
  String url1, url2;
  
  Instagram(){
  
    x = 0;
    y = 0;
    w = 2;
    h = 2;
    
    for (i = 0; i < 1; i++){
        kind = int(random(kinds.length));
        //println(kinds[kind]);
        tag = int(random(tags[kind].length));
        //println(beasts[kind][beast]);
        
        photos1 = loadJSONObject("https://api.instagram.com/v1/tags/" + kinds[kind] + "/media/recent?access_token=" + apiKey + "&count=2");
        photos2 = loadJSONObject("https://api.instagram.com/v1/tags/" + tags[kind][tag] + "/media/recent?access_token=" + apiKey + "&count=2");
        println(kinds[kind]);
        println(tags[kind][tag]);
        
        url1 = photos1.getJSONArray("data").getJSONObject(0).getJSONObject("images").getJSONObject("standard_resolution").getString("url");
        url2 = photos2.getJSONArray("data").getJSONObject(1).getJSONObject("images").getJSONObject("standard_resolution").getString("url");
        img1 = loadImage(url1, "jpg");
        img2 = loadImage(url2, "jpg");    
    } 
  }
  
  void display(){
   while (x < width && y < height) { 
    PImage slice1 = img1.get(x+w, 0, w, 612);   //get x, y, w, h
    image(slice1, x+w, 0, w, 612);
    PImage slice2 = img2.get(0, y+h, 612, h);
    image(slice2, 0, y+h, 612, h);
  x = x+3;
  y = y+3;
    }
  }
  
  void action(){
    x=0;
    y=0;
     for (i = 0; i < 2; i++){
       kind = int(random(kinds.length));
       //println(kinds[kind]);
       tag = int(random(tags[kind].length));
       //println(beasts[kind][beast]);
  
       photos1 = loadJSONObject("https://api.instagram.com/v1/tags/" + kinds[kind] + "/media/recent?access_token=" + apiKey + "&count=2");
       photos2 = loadJSONObject("https://api.instagram.com/v1/tags/" + tags[kind][tag] + "/media/recent?access_token=" + apiKey + "&count=2");
  
       println(kinds[kind]);
       println(tags[kind][tag]);
  
       url1 = photos1.getJSONArray("data").getJSONObject(0).getJSONObject("images").getJSONObject("standard_resolution").getString("url");
       url2 = photos2.getJSONArray("data").getJSONObject(1).getJSONObject("images").getJSONObject("standard_resolution").getString("url");
  
       img1 = loadImage(url1, "jpg");
       img2 = loadImage(url2, "jpg");  
         } 
     } 
    
    void saveCollage(){
        saveFrame("pic.png");
        println("pic saved");
  } 
} 