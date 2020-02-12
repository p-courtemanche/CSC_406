Panda[] pandaList;

void settings(){
    size(800, 600);
}

void setup(){
    background(127);
    
    Panda[] tempList = {  new Panda(180, 400, color(255), color(0), 0.7, pandaStatus.mouthOpen),
                          new Panda(100, 100, color(255), color(0), 0.4, pandaStatus.mouthClosed),
                          new Panda(350, 125, color(255), color(0), 0.3, pandaStatus.tongueOut),
                          new Panda(600, 125, color(255), color(0), 0.5, pandaStatus.mouthOpen),
                          new Panda(575, 425, color(255), color(0), 1, pandaStatus.tongueOut)};
    pandaList = tempList;
}

void draw(){
    background(127);
    pandaList[0].draw();
    pandaList[1].draw();
    pandaList[2].draw();
    pandaList[3].draw();
    pandaList[4].draw();
}
