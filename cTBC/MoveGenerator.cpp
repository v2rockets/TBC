// MoveGenerator.cpp: implementation of the MoveGenerator class.
//
//////////////////////////////////////////////////////////////////////
#define IS_MG
#include "stdafx.h"
#include "Piece.h"
#include "MoveGenerator.h"
#include<math.h>
//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
byte MoveGenerator::CheckTower[]={0,0,0,4,4,4,4,4};
byte MoveGenerator::CheckCannon[]={0,4,0,4,4,4,0,4};

MoveGenerator::MoveGenerator()
{
	byte k1,h1,k2,h2,d;
	For(d,0,1)
		For(k1,1,7)
		For(k2,0,7)
		For(h1,1,7)
		For(h2,0,7)
		PMove[d][k1][h1][k2][h2] = IsMove_direct(d,k1, h1, k2, h2);
	byte x,y,m;
	For(x,0,5) For(y,0,3) For(m,0,12)
		MoveIn[x*4+y][m]=(inside(x+MTX[m],y+MTY[m]))?1:0;
}

MoveGenerator::~MoveGenerator()
{
	
}
void MoveGenerator::ListRegularMove(Position board[],int turn,byte l1,RMList*templist)  //(changed)This function does not fill the data of templist???
{
	byte l2,k1,n=0,m,ts;
	k1=board[l1].pTop;
	templist->k1=k1;
	templist->l1=l1;
	switch (abp(k1)){
	case Tower:
		For(m,5,8) if(MoveIn[l1][m]){
			l2=l1+MTL[m];
			if((k1^board[l2].pTop)>>3){
				ts=CheckTower[abp(board[l2].pTop)];
				if(ts){
					templist->Tmove[n].l2=l2;
					templist->Tmove[n].k2=board[l2].pTop;
					templist->Tmove[n].method=ts;
					n++;
				}
			}
		}break;
	case Cannon:
		n=gen_normal(board,l1,templist->Tmove);
		For(m,9,12) if(MoveIn[l1][m]){
			l2=l1+MTL[m];
			if(((k1^board[l2].pTop)>>3)){
				ts=CheckCannon[abp(board[l2].pTop)];
				if(ts!=0){
					templist->Tmove[n].l2=l2;
					templist->Tmove[n].k2=board[l2].pTop;
					templist->Tmove[n].method=ts;
					n++;
				}
			}
		}break;
	case Footman:n=gen_footman(board,l1,templist->Tmove);break;
	case Knight:n=gen_knight(board,l1,templist->Tmove);break;
	default:n=gen_normal(board,l1,templist->Tmove);
	}
	templist->count=n;
}
byte MoveGenerator::IsMove_direct(byte diff,byte k1,byte h1,byte k2,byte h2)
{
	if (k1==Rock||k1==Tower)
		return Fail;
	if(diff){
		if(h1-h2==2)return Capture;
		if((k1 == Footman)&&(h1 - h2 ==3))return Capture;
		if(h1 - h2 > 2)return Exchange;
		if(k1==Engineer){
			if (h1 - h2 == 1){
				if (k2 == Engineer)
					return Exchange;
				else if (k2 ==Tower)
					return Carry;
				else
					return  Capture;
			}		
			else if ((h1 == h2 )&&(k2 == Machine))
				return Capture;
		}
		if (h1 - h2==1){
			if (k2==Engineer)
				return Fail;
			else
				return Carry;
		}
		if (h1 == h2){
			if (k1==Cannon)return Fail;
			if (k1==Machine && k2==Engineer) return Fail;
			if (k1 < k2)
				return Capture;
			else if (k1 == k2) 
				return Exchange;
		}
	}
	else{
		if ((h1 - h2 >= 0)&&(h1 - h2 <= 2)) return Carry;
		if ((h1 - h2 == -1 || h1 - h2 == 3)&& k1 == Footman) return Carry;
	}
	return Fail;
}
int MoveGenerator::gen_normal(const Position board[],byte l1,RMTarget*pt)
{
	byte m,n,tl,ts;
	byte k = board[l1].pTop;
	byte h =board[l1].height;
	n = 0;
	For(m,1,4) if(MoveIn[l1][m]){
		tl=l1+MTL[m];
		ts = PMove[diffrom(board[tl].pTop,k)][abp(k)][h][abp(board[tl].pTop)][board[tl].height];
		if(ts){
			pt[n].k2=board[tl].pTop;pt[n].method =ts; pt[n].l2=tl;
			n++;
		}
	}
	return n;
}
int MoveGenerator::gen_footman(const Position board[],byte l1,RMTarget*pt)
{
	byte m, n,tl,ts;
	byte k = board[l1].pTop;
	byte h =board[l1].height;
	n = 0;
	For(m,1,8) if(MoveIn[l1][m]){
		tl=l1+MTL[m];
		ts = PMove[diffrom(board[tl].pTop,k)][abp(k)][h][abp(board[tl].pTop)][board[tl].height];
		if(ts){
			pt[n].k2=board[tl].pTop;pt[n].method =ts; pt[n].l2=tl;
			n++;
		}
	}
	return n;
}

int MoveGenerator::gen_knight(Position board[],byte l0,RMTarget*pt)
{
	byte m1,m2,l1,l2,s1,s2,n=0;
	static byte mvsted[13];
	byte k=board[l0].pTop;
	byte h=board[l0].height;
	memset(mvsted,0,sizeof(mvsted));
	Ppop(board,l0);
	For(m1,1,4) if(MoveIn[l0][m1]){
		l1=l0+MTL[m1];
		s1 = PMove[diffrom(board[l1].pTop,k)][abp(k)][h][abp(board[l1].pTop)][board[l1].height];
		if(s1){
			pt[n].k2=board[l1].pTop;pt[n].method =s1; pt[n].l2=l1;
			n++;
		}
		if(s1==Carry && h==board[l1].height+1){
			For(m2,1,4) if(MoveIn[l1][m2]){
				l2=l1+MTL[m2];
				if(!mvsted[transfer_MTL[m1][m2]]){
					s2=PMove[diffrom(board[l2].pTop,k)][abp(k)][h][abp(board[l2].pTop)][board[l2].height];
					if(s2){
						pt[n].k2=board[l2].pTop;pt[n].method =s2; pt[n].l2=l2;
						n++;mvsted[transfer_MTL[m1][m2]]=1;
					}
				}
			}
		}
	}
	Ppush(board,l0,k);
	return n;
}

/*
inline int MoveGenerator::gen_knight(Position board[6][4],byte x0,byte y0,RMTarget*pt)
{
	register byte m;
	byte x1,y1,n1,x2,y2,n2,k,h,mm,ts;
	byte ctb[5][5];
	RMTarget tm[5];
#define tb(x,y) ctb[x+2][y+2]
	tb(0,0)=0;
	For(m,5,12)
		tb(MTX[m],MTY[m]) =0;
	k=board[x0][y0].pTop;
	n1=gen_normal(board,x0,y0,pt);
	For(mm,1,n1){
		x1=pt[mm].x2;y1=pt[mm].y2;
		if (pt[mm].method==Carry && h==board[x1][y1].height+1){
			Ppush(board ,x1,y1,k);
			n2=gen_normal(board,x1,y1,tm);
			For(m,1,n2){
				x2=tm[m].x2-x0;y2=tm[m].y2-y0;
				if(tb(x2, y2)==0 ) 
					tb(x2, y2) = tm[m].method;
			}
			Ppop(board,x1,y1);
		}
	}
	ts = tb(0,0);
	if(ts==Carry){
		n1++;
		pt[n1].x2 = x0; pt[n1].y2 = y0 ; pt[n1].method =Carry;
	}
	For(m,5,12){
		ts=tb(MTX[m], MTY[m]);
		if(ts){
			n1++;
			pt[n1].x2 = x0+MTX[m]; pt[n1].y2 = y0+MTY[m] ; pt[n1].method =ts;
		}
	}
	return n1;
}
*/
void MoveGenerator::ListAll(Position board[],const byte storage[],int turn,GMList*pl)
{
	int l,N,n,h,k;	
	RMList tRML;
	bool stor[8];
	For(n,1,7)
		stor[n]=(storage[(turn<<3)+n]>0);
	N=0;
	For(l,0,23){
		k=board[l].pTop;
		h=board[l].height;
		if (abp(k)==Rock || isblue(k)^turn) continue;
		if(h>1 && board[l].pUnder[h-1]==Rock)
			For(n,1,7)
			if(stor[n]&&(h==2 || n!=Tower)){
				pl->GMoves[N].method=Produce;
				pl->GMoves[N].k1=k;pl->GMoves[N].k2=n+(turn<<3);pl->GMoves[N].l1=l;
				N++;
			}
			tRML.k1=k;tRML.l1=l;
			ListRegularMove(board,turn,l,&tRML);
			for(n=tRML.count-1;n>=0;n--){
				pl->GMoves[N].method=tRML.Tmove[n].method;
				pl->GMoves[N].k1=k;pl->GMoves[N].l1=l;
				pl->GMoves[N].k2=tRML.Tmove[n].k2;
				pl->GMoves[N].ltag=tRML.Tmove[n].l2;
				N++;
			}
	}
	pl->count=N;
}
inline bool MoveGenerator::IsProducable(const Position board[],byte l,byte k)
{
	return board[l].pUnder[board[l].height-1]==Rock;
}
/*
void MoveGenerator::Gen_Pieces(const Position board[],PieceList goallist[2])
{
	int l,h;
	Piece temp_piece;
	goallist[0].Clean();
	goallist[1].Clean();
	For(l,0,23){
	   if(isblue(board[l].pTop))
		   goallist[1].CreatePiece(board[l].pTop,board[l].height,l,true,0);
	   else if(board[l].pTop!=0)
		   goallist[0].CreatePiece(board[l].pTop,board[l].height,l,true,0);
	   else break;
	   for(h=board[l].pTop-1;h>0;h--){
		   if(isblue(board[l].pUnder[h]))
			   goallist[1].CreatePiece(board[l].pUnder[h],h,l,false,0);
		   else if(board[l].pUnder[h]!=0)
			   goallist[0].CreatePiece(board[l].pUnder[h],h,l,false,0);
		   else break;}
   }
}
*/







