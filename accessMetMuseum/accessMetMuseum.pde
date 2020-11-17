/* accessMetMuseum.pde */

String url = "https://collectionapi.metmuseum.org/public/collection/v1/objects/45734";
JSONObject json;
PImage picture;

void setup() {
  size(500,500);
  background(0);
  fill(255);
  
  json = loadJSONObject(url);
  
  String title = json.getString("title");
  String artist = json.getString("artistDisplayName");
  String credit = json.getString("creditLine");
  String imageURL = json.getString("primaryImage");
  
  picture = loadImage(imageURL);
  
  int w = 400 * picture.width / picture.height;
  int h = 400;
  picture.resize(w, h);
  image(picture, 50, 50);
  rectMode(CORNERS);
  text(title + "\n" + artist + "\n" + credit, w + 50, 50, 450, 450);
}
