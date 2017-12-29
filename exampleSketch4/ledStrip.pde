class ledStrip { 
  int x, y , w; 
  ledStrip (int _x, int _y, int _w) {  
    x = _x - _w;
    y = _y - 8 - height / 2 + img.height /2 + 50;
    w = _w;
  } 
  void update() { 
    copy(x, y + height / 2, w, 1, x, y, w, 9); 
   //for(int i = x; i < x  + w; i++){
   //  stroke(random(255),random(255),random(255));
   //  line(i, y - 3, i, y + 3);
   //}
  } 
} 