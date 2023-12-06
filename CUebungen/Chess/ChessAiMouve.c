#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ChessAiMethodes.h"

ChessBoard *MouvePeasInNewBoard(ChessBoard *Board,char xFrom, char yFrom,char xTo,char yTo);

char AddChildBoard(ChessBoard *Parent,ChessBoard *newChild);

char GeneratNewChild(ChessBoard *Board,char xFrom,char yFrom,char xTo,char yTo){
  return AddChildBoard(Board,MouvePeasInNewBoard(Board,xFrom,yFrom,xTo,yTo));
}

ChessBoard *MouvePeace(ChessBoard *Board,char x, char y){
  fprintf(stderr,"start Mouve funk\n");
  switch (Board->board[x*8+y]&0x0f){

    case 1: //bauer
      if(Board->board[x*8+y]&0x80){//Pawn of Player 1:
       fprintf(stderr,"SfirstPlayer\n");
        //forward mouvment:
        if(Board->board[(x+1)*8+y]==0) GeneratNewChild(Board,x,y,x+1,y);
        //destroying mouvment:
        if(y>0 && Board->board[(x+1)*8+y-1]!=0 && (Board->board[(x+1)*8+y-1]&0x80)==0)
          GeneratNewChild(Board,x,y,x+1,y-1);
        if(y<7 && Board->board[(x+1)*8+y+1]!=0 && (Board->board[(x+1)*8+y+1]&0x80)==0)
          GeneratNewChild(Board,x,y,x+1,y+1);
        //Satart mouvment:
        if(x==1 && Board->board[(x+2)*8+y]==0) GeneratNewChild(Board,x,y,x+2,y);
        //Todo: add the chek for the last row!
      }

      else{
        fprintf(stderr,"SecondPlayer\n");
        //forward mouvment:
        if(Board->board[(x-1)*8+y]==0) GeneratNewChild(Board,x,y,x-1,y);
        //destroying mouvment:
        if(y>0 && Board->board[(x-1)*8+y-1]!=0 && Board->board[(x-1)*8+y-1]&0x80)
          GeneratNewChild(Board,x,y,x-1,y-1);
        if(y<7 && Board->board[(x-1)*8+y+1]!=0 && Board->board[(x-1)*8+y+1]&0x80)
          GeneratNewChild(Board,x,y,x-1,y+1);
        //Satart mouvment:
        if(x==6 && Board->board[(x-2)*8+y]==0) GeneratNewChild(Board,x,y,x-2,y);
        //TODO: add the chek for the last row!

      }
      break;

    case 2: //turm
      //Horizontal:
      for(char i=x-1;i>=0;i--){//Up
        if(Board->board[i*8+y]==0) GeneratNewChild(Board,x,y,i,y);
        else if((Board->board[i*8+y]^Board->board[x*8+y])&0xf0){ 
          GeneratNewChild(Board,x,y,i,y);
          break;
        }
        else break;
      }

      for(char i=x+1;i<8;i++){//down
        if(Board->board[i*8+y]==0) GeneratNewChild(Board,x,y,i,y);
        else if((Board->board[i*8+y]^Board->board[x*8+y])&0xf0){ 
          GeneratNewChild(Board,x,y,i,y);
          break;
        }
        else break;
      }

      for(char i=y-1;i>=0;i--){//left
        if(Board->board[x*8+i]==0) GeneratNewChild(Board,x,y,x,i);
        else if((Board->board[x*8+i]^Board->board[x*8+y])&0xf0){ 
          GeneratNewChild(Board,x,y,x,i);
          break;
        }
        else break;
      }

      for(char i=y+1;i<8;i++){//right
        if(Board->board[x*8+i]==0) GeneratNewChild(Board,x,y,x,i);
        else if((Board->board[x*8+i]^Board->board[x*8+y])&0xf0){ 
          GeneratNewChild(Board,x,y,x,i);
          break;
        }
        else break;
      }
      break;

    case 3: //springer
      //TODO: einfaches XOR zur bestimmung der anderen Persohn geht im momantanen aufbau nicht, da bei spieler 0x bei einem xor mit 00 auch null herrauskommt, obwohl deis ain möglichse verhalten wäre
      //Könnte gelößt werden indem Kodierung für die Steine geändert werid. forderes Nibbel codiert dann    x                   x00
      //   |                   |
      //Erster Spieler  Zwieter Spieler
      printf("%d,%d\n",x,y);
      //Mouvment for the Horse:
      if(x-2>=0 && y-1>=0 && (Board->board[(x-2)*8+(y-1)]^Board->board[(x-2)*8+(y-1)])&0xf0){
        printf("1\n");
        GeneratNewChild(Board,x,y,x-2,y-1);
      }
      if(x-2>=0 && y+1>=0 && (Board->board[(x-2)*8+(y+1)]^Board->board[(x-2)*8+(y-1)])&0xf0){
        printf("2\n");
        GeneratNewChild(Board,x,y,x-2,y+1);
      }
      if(x+2>=0 && y-1>=0 && (Board->board[(x-2)*8+(y-1)]^Board->board[(x-2)*8+(y-1)])&0xf0){
        printf("3\n");
        GeneratNewChild(Board,x,y,x+2,y-1);
      }
      if(x+2>=0 && y+1>=0 && (Board->board[(x-2)*8+(y+1)]^Board->board[(x-2)*8+(y-1)])&0xf0){ 
        printf("4\n");
        GeneratNewChild(Board,x,y,x+2,y+1);
      }
      if(x-1>=0 && y-2>=0 && (Board->board[(x-1)*8+(y-2)]^Board->board[(x-2)*8+(y-1)])&0xf0){
        printf("5\n");
        GeneratNewChild(Board,x,y,x-1,y-2);
      }
      if(x+1>=0 && y-2>=0 && (Board->board[(x+1)*8+(y-2)]^Board->board[(x-2)*8+(y-1)])&0xf0){
        printf("6\n");
        GeneratNewChild(Board,x,y,x+1,y-2);
      }
      if(x-1>=0 && y+2>=0 && (Board->board[(x-1)*8+(y+2)]^Board->board[(x-2)*8+(y-1)])&0xf0){
        printf("7\n");
        GeneratNewChild(Board,x,y,x-1,y+2);
      }
      if(x+1>=0 && y+2>=0 && (Board->board[(x+1)*8+(y+2)]^Board->board[(x-2)*8+(y-1)])&0xf0){
        printf("8\n");
        GeneratNewChild(Board,x,y,x+1,y+2);
      }

      break;
    case 4: //läufer

      for(char i=x-1, j=y-1;i>=0 && j>=0;i--,j--){
        if(Board->board[i*8+j]==0) GeneratNewChild(Board,x,y,i,j);
        else if((Board->board[i*8+j]^Board->board[x*8+y])&0xf0){ 
          GeneratNewChild(Board,x,y,i,j);
          break;
        }
        else break;
      }

      for(char i=x+1, j=y-1;i<8 && j>=0;i++,j--){
        if(Board->board[i*8+j]==0) GeneratNewChild(Board,x,y,i,j);
        else if((Board->board[i*8+j]^Board->board[x*8+y])&0xf0){ 
          GeneratNewChild(Board,x,y,i,j);
          break;
        }
        else break;
      }

      for(char i=x+1, j=y+1;i<8 && j<8;i++,j++){
        if(Board->board[i*8+j]==0) GeneratNewChild(Board,x,y,i,j);
        else if((Board->board[i*8+j]^Board->board[x*8+y])&0xf0){ 
          GeneratNewChild(Board,x,y,i,j);
          break;
        }
        else break;
      }

      for(char i=x-1, j=y+1;i>=0 && j<8;i--,j++){
        if(Board->board[i*8+j]==0) GeneratNewChild(Board,x,y,i,j);
        else if((Board->board[i*8+j]^Board->board[x*8+y])&0xf0){ 
          GeneratNewChild(Board,x,y,i,j);
          break;
        }
        else break;
      }
      break;
      
    case 5: //dame
    case 6: //könig
      break;
  }
  return Board;
}

char AddChildBoard(ChessBoard *Parent,ChessBoard *newChild){
  if(Parent->childArrLen > Parent->childCount){//Adding is unproblematik the array is long inaff
    Parent->child[Parent->childCount]=newChild;
    Parent->childCount++;
    return 0;
  }
  else{//Arry is to schort moust bee made greater!
    Parent->child=realloc(Parent->child,sizeof(ChessBoard*)*2*Parent->childArrLen);
    Parent->childArrLen*=2;
    Parent->child[Parent->childCount]=newChild;
    Parent->childCount++;
    return 0;
  }
}

ChessBoard *MouvePeasInNewBoard(ChessBoard *Board,char xFrom, char yFrom,char xTo,char yTo){
  //Creat new Board:
  ChessBoard *newBoard=malloc(sizeof(ChessBoard));
  *newBoard=(ChessBoard){
    0,
    MOUVES_PER_ROUND,
    0,
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

