#include <stdio.h>
#include <string.h>
#include "ChessAiMethodes.h"

ChessBoard *MouvePawn(ChessBoard *Board,char x, char y);

ChessBoard *MouvePeas(ChessBoard *Board,char xFrom, char yFrom,char xTo,char yTo);

ChessBoard *MouvePeace(ChessBoard *Board,char x, char y){
  printf("start Mouve funk\n");
  switch (Board->board[x*8+y]^0x80){
    case 1: //bauer
      
    case 2: //turm
    case 3: //springer
    case 4: //läufer
    case 5: //dame
    case 6: //könig
      break;
  }
  return Board;
}

ChessBoard *MouvePeasInNewBoard(ChessBoard *Board,char xFrom, char yFrom,char xTo,char yTo){
  //Creat new Board:
  ChessBoard *newBoard=malloc(sizeof(ChessBoard));
  *newBoard=(ChessBoard){
    0,
    MOUVES_PER_ROUND,
    malloc(sizeof(uchar)*64),
    malloc(sizeof(ChessBoard*)*MOUVES_PER_ROUND)
  };
  //Copy the oald Board to the new Board
  newBoard->board=memcpy(newBoard->board,Board->board,sizeof(uchar)*64);
  //Mouve the peas to the new pleas:
  newBoard->board[xTo*8+yTo]=newBoard->board[xFrom*8+yFrom];
  newBoard->board[xFrom*8+yFrom]=0;
  return newBoard;
}

ChessBoard *MouvePawn(ChessBoard *Board,char x, char y){
  if(Board->board[x*8+y]&0x80){
    if(Board->board[(x+1)*8+y]==0){
    //todo: extrakt to method wiche siwitches to places wich are indikated form outside
      ChessBoard *new=malloc(sizeof(ChessBoard));
      *new=(ChessBoard){
        0,
        MOUVES_PER_ROUND,
        malloc(sizeof(uchar)*64),
        malloc(sizeof(ChessBoard*)*MOUVES_PER_ROUND)
      };
      zwi->board = memcpy(zwi->board,Board->board,sizeof(uchar)*64);
      Board->board[(x+1)*8+y]=0x40;
    }
    if(y>0 && (Board->board[(x+1)*8+y-1]&8)==0 && Board->board[(x+1)*8+y-1]!=0)
      Board->board[(x+1)*8+y-1]+=0x40;
    if(y<8 && (Board->board[(x+1)*8+y+1]&8)==0 && Board->board[(x+1)*8+y+1]!=0)
      Board->board[(x+1)*8+y+1]+=0x40;
    if(x==1 && Board->board[(x+2)*8+y]==0) Board->board[(x+2)*8+y]=0x40;
  }
  else{

  }
}
