class ledStrip { 
  int x, y, w; 
  ledStrip (int _x, int _y, int _w) {  
    x = _x;
    y = _y - 6;
    w = _w;
    fill(50, 100, 100);
    rect(x, y-3, w, 6);
  } 
  void update() { 
    //fill(50,100,100);
    //rect(x,y-3,w,6);
    copy(x, y + height / 2, w, 1, x, y, w, 6);
  }
} 