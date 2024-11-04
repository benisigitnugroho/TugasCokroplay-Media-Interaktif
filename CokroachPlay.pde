import processing.sound.*;

ArrayList<Cokroach> coks;
PImage img;
SoundFile hitSound;
int spawnTimer = 0;

void setup() {
  size(800, 800);
  coks = new ArrayList<Cokroach>();
  img = loadImage("kecoa.png");
  hitSound = new SoundFile(this, "hit.mp3"); 
}

void draw() {
  background(255);
  
  // tambah coro 5 detik sekali 
  if (frameCount - spawnTimer >= 300) {
    float randX = random(width);
    float randY = random(height);
    coks.add(new Cokroach(img, randX, randY));
    spawnTimer = frameCount;
  }
  
 
  for (int i = coks.size() - 1; i >= 0; i--) {
    Cokroach c = coks.get(i);
    c.live();
  }
  
  fill(51);
  textSize(16);
  text("nums: " + coks.size(), 50, 750); 
}

void mouseClicked() {
  
  for (int i = coks.size() - 1; i >= 0; i--) {
    Cokroach c = coks.get(i);
    float d = dist(mouseX, mouseY, c.pos.x, c.pos.y);
    

    if (d < img.width / 2) {
      coks.remove(i);
      hitSound.play(); 
      break; 
    }
  }
}
