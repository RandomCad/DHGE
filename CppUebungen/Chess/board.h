#ifndef BOARD

#include <vector>
#include <cstring>

class Board{
  Board(char *fBoard) : child(vector<Board*>()), VaterCount(1) {
    memcpy(board,fBoard,sizeof(char)*Board_X*Board_Y);
  }
  
  ~Board(){
    for (auto i : child) delete i;
  }

  void CreatChild(char *Player){
    for(int i=0;i<Board_X;i++){
      for(int j=0;j<Board_Y;j++){
        if((*GBEl(i,j))^(*Player)) CreatChildAtPos(x,y);
      }
    }
  }

  void CreatChildAtPos(int x, int y) { }

  private
    char board[Board_X][Board_Y];
    vector<Board*> child;
    int VaterCount;


    const int Borad_X = 8;
    const int Board_Y =8;

    inline char *GBEl(const int x, const int y) const{
      return board[x*Board_X+y];
    }
}


#endif
