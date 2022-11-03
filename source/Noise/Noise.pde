// Perlin Noise GIF Loops
// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/136.2-perlin-noise-gif-loops.html
// https://youtu.be/c6K-wJQ77yQ

int totalFrames = 480;
int counter = 0;
boolean record = true;
float[] bg = {random(0, 50), random(0, 50), random(0, 50)};

Particle[] particles = new Particle[250];

void setup() {
  size(600, 600);
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  float percent = 0;
  if (record) {
    percent = float(counter) / totalFrames;
  } else {
    percent = float(counter % totalFrames) / totalFrames;
  }
  render(percent);
  if (record) {
    saveFrame("/generated/"+nf(counter, 3)+".png");
    if (counter == totalFrames-1) {
      exit();
    }
  }
  counter++;
}

void render(float percent) {
  background(bg[0], bg[1], bg[2]);
  float a = percent * TWO_PI;
  for (Particle p : particles) {
    p.render(a);
  }

}
