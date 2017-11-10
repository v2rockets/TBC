
#include "stdafx.h"
#include"try.h"
#include "SearchEngine.h"
#include <fstream>
#include <stdio.h>
#include <stdlib.h>

using namespace std;

GMList cur_move;
MoveGenerator MEngine;
Position cur_board[24];
byte storlist[16];
char msg[25];
int Turn,Depth,lc;
general_move past_moves[5];

int atok(const char* s)
{
	int t=atoi(s);
	return (t<0)?(-t+8):t;
}
void getdata()
{
    char c[3];
	int n,h,emerg;
	ifstream reader;

	reader.open("c:\\exchange.txt");
	reader>>c;
	Turn=(atoi(c)==-1);
	reader>>c;
	Depth=atoi(c);
	For(n,1,7){
		reader>>c;
		storlist[8+n]=atoi(c);
		reader>>c;
		storlist[n]=atoi(c);
	}
	for(n=0;n<24;++n){
		emerg=50;
		do{
 			reader>>c;
			emerg--;
			if (emerg==0) system("pause");
		}while(c[0]!='|'&& emerg>0);
		reader>>c;
		h=atoi(c);
		cur_board[n].height=h;
		reader>>c;
		cur_board[n].pTop=atok(c);
		for(;--h>0;){
			reader>>c;
			if(c[0]=='|') system("pause");
			cur_board[n].pUnder[h]=atok(c);
		}
	}
	reader>>c;
	lc=atoi(c);
	for(n=0;n<5;n++){
		reader>>c;
		past_moves[n].method=atoi(c);
		reader>>c;
		past_moves[n].l1=atoi(c);
		reader>>c;
		past_moves[n].ltag=atoi(c);
		reader>>c;
		past_moves[n].k1=atok(c);
	}
	reader.close();
	For(n,0,23) cur_board[n].pUnder[0]=null;   //related to the algorithm about producing
	//MEngine.ListAll(cur_board,storlist,t,&cur_move);
	
}
void workdata()
{
	EvaCurBoard(cur_board,storlist,Turn);
}

void EvaCurBoard(Position board[],byte storage[],int t)
{
	score v1,v2;
	int x,y;
	long c;
	char s[10];
	general_move bm;
	SearchEngine*pSE=new SearchEngine;
	pSE->SetPastMoves(past_moves,lc);
	bm=pSE->MakeBestMove(Depth,board,storage,t,10);
	v1=pSE->ValOpt;
	v2=pSE->ValExtra;
	c=pSE->count;
	delete pSE;

	ofstream writer;
	writer.open("C:\\strange.txt",ios::out);
	/*
		if(abs(v)>1){
		_itoa(int(v),s,10);
		strcpy(ps,"value error: ");
		strcat(ps,s);
	}else{
		_itoa((int)bm.l1,s,10);
		strcpy(ps,"Best :");strcat(ps,s);
		if(bm.method==Produce){
			strcat(ps," make ");
			_itoa((int)abp(bm.k2),s,10);
			strcat(ps,s);
		}else{
			strcat(ps," to ");
			_itoa((int)bm.ltag,s,10);
			strcat(ps,s);
		}
	}
		*/
	if(abs(v2)>1){
		writer<<"value error: "<<v2;
	}else{
		x=bm.l1/4+1;y=bm.l1%4+1;
		writer<<"Best : ("<<x<<","<<y<<")";
		if(bm.method==Produce){
			strcpy(s,PieceName[abp(bm.k2)]);
			writer<<" make "<<s;
		}else{
			x=bm.ltag/4+1;y=bm.ltag%4+1;
			writer<<" go to "<<"("<<x<<","<<y<<")";
		}
		writer<<" : V="<<v1;
	}
	writer<<std::endl;
	writer<<char(bm.method+'A')<<std::endl;
	writer<<char(bm.l1+'A')<<std::endl;
	writer<<char(bm.ltag+'A')<<std::endl;
	writer<<char(abp(bm.k2)+'A')<<std::endl;
	writer.close();
}


