#define MOUVES_PER_ROUND 16

typedef unsigned char uchar;
typedef struct ChessBoard{
  uchar val;//The value of the board
  int childArrLen;
  int childCount;
  uchar *board;//The board;
  struct ChessBoard **child;//The children of tis board;
}ChessBoard;

void printBoard(uchar board[64]);
