
class Twitt{
  
  Twitter twitter;
  int i;
  String nTweet;
  File file = new File("#");
    
  Twitt(){ 
    ConfigurationBuilder cb = new ConfigurationBuilder(); //creo nuovo oggetto configurazione
    cb.setOAuthConsumerKey("#");
    cb.setOAuthConsumerSecret("uk4YYhSsFUMKNKwggpZ4tn2XTxvstW78gwtRQVgdBN52GW8CpH");
    cb.setOAuthAccessToken("3208208985-X6n52YwG2bsp8bwBvN1SppUB1P317TtoUiPf7BQ");
    cb.setOAuthAccessTokenSecret("E5mtv0wdTB1PKszpR4FqJWVMmFBQCTq1CBZPuVJzx8QUH");
   
    TwitterFactory tf = new TwitterFactory(cb.build());
    twitter = tf.getInstance(); //creo instanza della classe
    i = 0;
  }

  void upload(){
    println("Caricamento..");
    i++;
    nTweet = "Social Collage N° " + i + " #SocialCollage";
    testPassingFile(file);
    tweetPic(file, nTweet);
  }
  
  void testPassingFile(File _file){
    println(_file.exists());
    println(_file.getName());
    println(_file.getPath());
    println(_file.canRead());
  }
 
 
  void tweetPic(File _file, String theTweet){
    try{
         StatusUpdate status = new StatusUpdate(theTweet);
         status.setMedia(_file);
         twitter.updateStatus(status);
      }
      catch (TwitterException te){
          println("Error: "+ te.getMessage()); 
      }
  }
}