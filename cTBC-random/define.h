
#pragma once

#define Rock 0
#define Machine 1
#define Tower 2
#define Armed 3
#define Knight 4
#define Footman 5
#define Engineer 6
#define Cannon 7

#define Fail 0
#define Produce 1
#define Carry 2
#define Capture 3
#define Shoot 4
#define Exchange 5
#define Suicide 6
#define Birth 7

#define RED 0
#define BLUE 1
typedef char byte;

#define null -1
#define MAX_DEPTH 20
#define MAX_MOVES 255
#define MAX_STALE 100

#define inside(x,y) ((x)<=5)&&((x)>=0)&&((y)<=3)&&((y)>=0)
#define abp(k) ((k)&7)
#define isblue(k) ((k)>>3)
#define isred(k) ((k)>0 && !(k)>>3)
#define diffrom(k2,k1) (((k1)^(k2))>>3 && k2)  //k1 must not equal to 0
#define getx(l) ((l)>>2)
#define gety(l) ((l)&3)

const char PieceName[8][10]={
	"Rock",
	"Machine",
	"Tower",
	"Armed",
	"Knight",
	"Footman",
	"Engineer",
	"Cannon",
};
struct Position
{
	byte height;
    byte pTop;
	byte pUnder[8];
};
struct RMTarget
{
	byte l2;
	byte k2;
	byte method;
};
struct RMList
{
	byte l1;
	byte k1;
	RMTarget Tmove[17];
	int count;
	int operator =(RMList orgRMList)
	{
		l1=orgRMList.l1;
		k1=orgRMList.k1;
		for(count=0;count<orgRMList.count;count++)
			Tmove[count]=orgRMList.Tmove[count];
		return 1;}
};
struct general_move
{
	byte method;
	byte k1;
	byte l1;
	byte k2;
	byte ltag;
};
struct GMList
{
	general_move GMoves[MAX_MOVES];
	int count;
	int operator=(GMList orgGML){
		for(count=0;count<orgGML.count;count++)
			this->GMoves[count]=orgGML.GMoves[count];
		return 1;}
};
/*
const byte InBoard[80]={
	0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,
	0,0,1,1,1,1,0,0,
	0,0,1,1,1,1,0,0,
	0,0,1,1,1,1,0,0,
	0,0,1,1,1,1,0,0,
	0,0,1,1,1,1,0,0,
	0,0,1,1,1,1,0,0,
	0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0
};


const byte MTL[13]={0,1,-1,8,-8,9,7,-7,-9,2,-2,16,-16};
*/
const byte MTX[13]={0,1,-1,0, 0,1,-1, 1,-1,2,-2,0, 0};
const byte MTY[13]={0,0, 0,1,-1,1, 1,-1,-1,0, 0,2,-2};
const byte MTL[13]={0,4,-4,1,-1,5,-3, 3,-5,8,-8,2,-2};

const byte transfer_MTL[5][5]={
	{0,1,2,3,4},
	{1,9,0,5,7},
	{2,0,10,6,8},
	{3,5,6,11,0},
	{4,7,8,0,12}
};
inline void Ppush(Position board[],byte l, byte k)
{
	if (board[l].height > 0)
		board[l].pUnder[board[l].height] = board[l].pTop;
	board[l].height++;
	board[l].pTop = k;
}
inline void Ppop(Position board[],byte l)
{
	board[l].height--;
	board[l].pTop=(board[l].height==0)?Rock:board[l].pUnder[board[l].height];
}
inline void Pproduce(Position board[],byte l, byte k)
{
	board[l].pUnder[board[l].height - 1] = k;
}
inline void RMtoGM(byte l1,byte k1,RMTarget*prt,general_move*pgm)
{
	pgm->k1=k1;
	pgm->l1=l1;
	pgm->method=prt->method;
	pgm->k2=prt->k2;
	pgm->ltag=prt->l2;
}
inline bool IsRelated(byte x1,byte y1,byte x2,byte y2)
{
	return (abs(x1-x2)+abs(y1-y2)<=2)?true:false;
}
typedef float score;

//#ifndef IS_P
#include"Piece.h"
//#endif
//#ifndef IS_MG
#include"MoveGenerator.h"
//#endif

const general_move emptymove;
static int idle; //varible to set break point in test
