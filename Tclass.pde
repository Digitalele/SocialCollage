
class Twitt{
  
  Twitter twitter;
  int i;
  String nTweet;
  File file = new File("#");
    
  Twitt(){ 
    ConfigurationBuilder cb = new ConfigurationBuilder();
    cb.setOAuthConsumerKey("#");
    cb.setOAuthConsumerSecret("#");
    cb.setOAuthAccessToken("#");
    cb.setOAuthAccessTokenSecret("#");
   
    TwitterFactory tf = new TwitterFactory(cb.build());
    twitter = tf.getInstance(); 
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
