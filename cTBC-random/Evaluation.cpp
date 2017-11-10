// Evaluation.cpp: implementation of the Evaluation class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Evaluation.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
const float Evaluation::RMatrix[8][8]={
	{0,  0,  0,  0,  0,  0,  0,  0},
	{0,  5, 45, 28, 23, 25,  1, 27},
	{0,  0,  0, 25, 18, 15, 15, 25},
	{0,  2,  4,  5, 25, 27, 13, 29},
	{0,  2,  5,  2,  5, 25, 14, 28},
	{0,  2,  5,  2,  2,  5, 15, 30},
	{0, 30,  4,  5,  5,  5,  4, 27},
	{0, 18,  4, 16, 12, 14,  1,  8},
};
/*
const int Evaluation::RMatrix[8][8]={
	{0,0,0,0,0,0,0,0},
	{0,0,50,32,23,28,-30,5},
	{0,-50,0,20,14,10,15,20},
	{0,-32,-20,0,20,25,15,5},
	{0,-23,-14,-20,0,30,20,15},
	{0,-28,-10,-25,-30,17,15},
	{0,30,-15,-15,-20,-17,0,26},
	{0,-5,-20,-5,-15,-15,-26,0}
};
*/
const float Evaluation::W_Cover[15]={
	1, //not covered
	0.88f,
	0.7f,
	0.5f,
	0.28f,
	0.2f,
	0.15f,
	0.1f,
	0.05f,
};
const score Evaluation::BaseVal[8]={
	0,
	140,
	95,
	125,
	120,
	110,
	90,
	110
};

const score Evaluation::MobileVal[2][8]={
	{0,0,5,25,30,0,0,0},
	{0,0,3,10,12,0,0,0}
};
const score Evaluation::PositionVal_normal[24]={
	7,9,9,7,
	10,14,14,10,
	13,16,16,13,
	13,16,16,13,
	10,14,14,10,
	7,9,9,7
};
const score Evaluation::PositionVal_tower[24]={
	10,25,25,10,
	30,65,65,30,
	35,75,75,35,
	35,75,75,35,
	30,65,65,30,
	10,25,25,10,
};
const score Evaluation::PositionVal_cannon[24]={
	17,19,19,17,
	22,26,26,22,
	29,33,33,29,
	29,33,33,29,
	22,26,26,22,
	17,19,19,17,
};
const score Evaluation::HeightVal_normal[9]={
	0,
	0,//1
	15,
	25,
	20,
	10,
	0,
	-10,
	-30,
};
const score Evaluation::HeightVal_footman[9]={
	0,
	5,//1
	15,
	30,
	25,
	15,
	5,
	0,
	-10,
};
const score Evaluation::DeltaHVal[9]={
	0,
	6,
	0, //on plain
	12,
	8, //similar to others
	0,
	0,
	0,
	0,
};
const score Evaluation::PrableVal_each=2.5f;
const score Evaluation::PotentialVal=25;
const score Evaluation::ProducableVal[2]={12,5};
const score Evaluation::ActiveVal=8;
const score Evaluation::RichnessVal=300;
const float Evaluation::WRO_num[24][3]={  //add free space value 4~6
	{4,13,25},{5,14,28},{5,14,28},{4,13,25},
	{5,15,29},{6,17,33},{6,17,33},{5,15,29},
	{5,16,31},{6,18,37},{6,18,37},{5,16,31},
	{5,16,31},{6,18,37},{6,18,37},{5,16,31},
	{5,15,29},{6,17,33},{6,17,33},{5,15,29},
	{4,13,25},{5,14,28},{5,14,28},{4,13,25},
};
const float Evaluation::W_OccRelax=0.33f;

float Evaluation::RelativeFactor_bydis(float dis)
{
	if(dis==0)
		return 2.5f;
	else
		return 3-dis*0.25f;
}
Evaluation::Evaluation()
{
	int x1,y1,x2,y2,dx,dy,k;
	float d;
	//RichnessVal[0]=0;
	//for(int i=1;i<=18;i++)
		//RichnessVal[i]=RichnessVal[i-1]+(float)250/i;
	For(x1,0,5) For(y1,0,3) For(x2,0,5) For(y2,0,3)
	{
		dx=abs(x1-x2);dy=abs(y1-y2);
		d=(float)(dx+dy);
		For(k,1,7){
			switch(k){
				case Knight:
					PW_ROcc[k][(x1<<2)+y1][(x2<<2)+y2]=4*pow(d*0.75f+1,-2);
					PW_RFactor[k][(x1<<2)+y1][(x2<<2)+y2]=RelativeFactor_bydis(d*0.75f);
					break;
				case Footman:
					PW_ROcc[k][(x1<<2)+y1][(x2<<2)+y2]=4*pow((float)max(dx,dy)+1,-2);
					PW_RFactor[k][(x1<<2)+y1][(x2<<2)+y2]=RelativeFactor_bydis((float)max(dx,dy));
					break;
				case Tower:
					PW_ROcc[k][(x1<<2)+y1][(x2<<2)+y2]=(dx==1 && dy==1)? 3:4*pow(d*2+1,-2);
					PW_RFactor[k][(x1<<2)+y1][(x2<<2)+y2]=(dx==1 && dy==1)?3:0.5f*RelativeFactor_bydis(d);
					break;
				case Cannon:
					PW_ROcc[k][(x1<<2)+y1][(x2<<2)+y2]=((dx==0 && dy==2 || dx==2 && dy==0)? 2 :4*pow(d+1,-2));
					PW_RFactor[k][(x1<<2)+y1][(x2<<2)+y2]=(dx==0 && dy==2 || dx==2 && dy==0)?3:((d<2)?2.4f:RelativeFactor_bydis(d));
					break;
				default:
					PW_ROcc[k][(x1<<2)+y1][(x2<<2)+y2]=4*pow(d+1,-2);
					PW_RFactor[k][(x1<<2)+y1][(x2<<2)+y2]=RelativeFactor_bydis(d);
			}
		}
	}
}

Evaluation::~Evaluation()
{

}
void Evaluation::ListbyPiece(DynInfo* pdi,int turn,GMList*pl)
{
	int N=0,n,i;	
	byte kflag=turn<<3;
	static RMList tRML;
	static bool stor[8];
	Piece*p;
	For(n,1,7)
		stor[n]=(pdi->Storage[(kflag)+n]>0);
	for(n=pdi->Pieces[turn].count-1;n>=0;n--) if(pdi->Pieces[turn].exist[n] && pdi->Pieces[turn].piece[n].active){
		p=&pdi->Pieces[turn].piece[n];
		if(p->producable)
			For(i,1,7)
			if(stor[i]&&(p->height==2 || i!=Tower)){
				pl->GMoves[N].method=Produce;
				pl->GMoves[N].k1=p->kn+kflag;pl->GMoves[N].k2=i+kflag;pl->GMoves[N].l1=p->l;
				N++;
			}
			MG.ListRegularMove(pdi->board,turn,p->l,&tRML);
			for(i=tRML.count-1;i>=0;i--){
				pl->GMoves[N].method=tRML.Tmove[i].method;
				pl->GMoves[N].k1=p->kn+kflag;pl->GMoves[N].l1=p->l;
				pl->GMoves[N].k2=tRML.Tmove[i].k2;
				pl->GMoves[N].ltag=tRML.Tmove[i].l2;
				N++;
			}
	}
	pl->count=N;
}
score Evaluation::CalValue(DynInfo*pdi,int flag)
{
	byte i,n,cov;
	byte ks=0,np=0;
	float V=0,Vsum_under=0,sum_occ=0,vt,eqn_under,op_eqn=0;
	double td;
	Piece* p;

	V=CalMobileValue(pdi,flag);
	if(V==null)
		return -MAXV;
	for(n=pdi->Pieces[!flag].count-1;n>=0;n--)
		if(pdi->Pieces[!flag].exist[n]) op_eqn++;

	for(i=0;i<24;i++){
		td=pdi->rock_occ[i].COcc[flag]+pdi->rock_occ[i].COcc[!flag];
		vt=float((td>1)?pdi->rock_occ[i].COcc[flag]/td:pdi->rock_occ[i].COcc[flag]);
		V+=WRO_num[i][pdi->rock_occ[i].nRock]*vt;
		sum_occ+=pdi->rock_occ[i].nRock*vt;
	}
	if(sum_occ>pdi->nStor[flag]){
		eqn_under=pdi->nStor[flag];
		op_eqn+=W_OccRelax*float(pdi->nStor[!flag])+(1-W_OccRelax)*float(pdi->nStor[flag]+pdi->nStor[!flag]-sum_occ);  //This value will take part in relative calculation,consider whether it is reasonable.
	}else{
		eqn_under=W_OccRelax*float(pdi->nStor[flag])+(1-W_OccRelax)*sum_occ;
		op_eqn+=pdi->nStor[!flag];
	}
	byte*ps=pdi->Storage+(flag<<3);
	for(i=1;i<8;i++) if(ps[i]){
		Vsum_under+=BaseVal[i]*ps[i];
		ks++;
	}
	Vsum_under+=pdi->Relative_under[flag]/op_eqn;

	for(n=pdi->Pieces[flag].count-1;n>=0;n--) if(pdi->Pieces[flag].exist[n]){
		np++;
		p=&pdi->Pieces[flag].piece[n];
		V+=BaseVal[p->kn];
		vt=0;cov=0;
		if(!p->active){
			for(i=pdi->board[p->l].height;i>p->height;i--)
				++cov+=(pdi->PieceIndex[p->l][i]>>5)^flag;
		}
		if(p->kn==Tower)
			vt+=PositionVal_tower[p->l];
		else if(p->kn==Cannon)
			vt+=PositionVal_cannon[p->l];
		else
			vt+=PositionVal_normal[p->l];

		if(p->kn==Footman)
			vt+=HeightVal_footman[p->height];
		else
			vt+=HeightVal_normal[p->height];
		if(p->kn==Engineer){          //Engineer's preference of rough terrain
			For(i,1,4) if(MG.MoveIn[p->l][i])
				vt+=DeltaHVal[p->height+1-pdi->rock_occ[p->l+MTL[i]].nRock];
		}

		if(p->producable && ks) vt+=ProducableVal[flag^pdi->turn]+ks*PrableVal_each;

		vt+=p->relative_sum/op_eqn;
		V+=W_Cover[cov]*vt;
	}
	if(pdi->nStor[flag]>0)
		V+=Vsum_under/pdi->nStor[flag]*eqn_under;
	V+=RichnessVal*log(np+eqn_under);   //RichnessVal
	return V;
}

score Evaluation::CalMobileValue(DynInfo*pdi,int flag)
{
	byte n,l1,l2,kn,k2,h,m,ts,prable=0,diff=flag^pdi->turn;
	score MV,MVsum=0;
	Piece*p;
	static byte mvsted[13];
	for(n=pdi->Pieces[flag].count-1;n>=0;n--) if(pdi->Pieces[flag].exist[n] && pdi->Pieces[flag].piece[n].active){
		p=&pdi->Pieces[flag].piece[n];
		if(p->producable)
			prable++;
		kn=p->kn;
		h=p->height;
		l1=p->l;
		MV=0;
		switch (kn){
			case Tower:
				For(m,5,8) if(MG.MoveIn[l1][m]){			
					k2=pdi->board[l1+MTL[m]].pTop;
					if(flag^(k2>>3) && k2){
						MV+=MobileVal[diff][MG.CheckTower[abp(k2)]];
					}
				}break;
			case Cannon:
				For(m,1,4) if(MG.MoveIn[l1][m]){
					k2=pdi->board[l1+MTL[m]].pTop;
					MV+=MobileVal[diff][MG.PMove[flag^(k2>>3) && k2][kn][h][abp(k2)][pdi->board[l1+MTL[m]].height]];
				}
				For(m,9,12) if(MG.MoveIn[l1][m]){
					k2=pdi->board[l1+MTL[m]].pTop;
					if(flag^(k2>>3) && k2)
						MV+=MobileVal[diff][MG.CheckTower[abp(k2)]];
				}break;
			case Footman:
				For(m,1,8) if(MG.MoveIn[l1][m]){
					k2=pdi->board[l1+MTL[m]].pTop;
					MV+=MobileVal[diff][MG.PMove[flag^(k2>>3) && k2][kn][h][abp(k2)][pdi->board[l1+MTL[m]].height]];
				}break;
			case Knight:                       
				byte mm,ss;
				memset(&mvsted,0,13);
				mvsted[0]=1;                         //Ignore knight back
				For(m,1,4) if(MG.MoveIn[l1][m]){
					l2=l1+MTL[m];
					ts=MG.PMove[flag^(pdi->board[l2].pTop>>3) && pdi->board[l2].pTop][kn][h][abp(pdi->board[l2].pTop)][pdi->board[l2].height];
					if(ts){
						MV+=MobileVal[diff][ts];
					}
					if(ts==Carry && h==pdi->board[l2].height+1){
						For(mm,1,4) if(MG.MoveIn[l2][mm]){
							k2=pdi->board[l2+MTL[mm]].pTop;
							if(!mvsted[transfer_MTL[m][mm]]){
								ss=MG.PMove[flag^(k2>>3) && k2][kn][h][abp(k2)][pdi->board[l2+MTL[mm]].height];
								if(ss){
									MV+=MobileVal[diff][ss];
									mvsted[transfer_MTL[m][mm]]=1;
								}
							}
						}
					}
				}
				break;
			default:
				For(m,1,4) if(MG.MoveIn[l1][m]){
					k2=pdi->board[l1+MTL[m]].pTop;
					MV+=MobileVal[diff][MG.PMove[flag^(k2>>3) && k2][kn][h][abp(k2)][pdi->board[l1+MTL[m]].height]];
				}
		}
		if(MV>0)
			MVsum+=ActiveVal+MV;
	}
	if(MVsum || prable || flag!=pdi->turn)
		return MVsum;
	else 
		return null;
}

void Evaluation::Gen_Pieces(const Position board[],PieceList goallist[2],byte index[24][9])
{
	byte l,h;
	Piece temp_piece;
	goallist[0].Clean();
	goallist[1].Clean();
	For(l,0,23){
		if(isblue(board[l].pTop))
			index[l][board[l].height]=32+goallist[1].CreatePiece(board[l].pTop,board[l].height,l,true,!board[l].pUnder[board[l].height-1]);
		else if(board[l].pTop!=0)
			index[l][board[l].height]=goallist[0].CreatePiece(board[l].pTop,board[l].height,l,true,!board[l].pUnder[board[l].height-1]);
		else continue;
		for(h=board[l].height-1;h>0;h--){
			if(isblue(board[l].pUnder[h]))
				index[l][h]=32+goallist[1].CreatePiece(board[l].pUnder[h],h,l,false,!board[l].pUnder[h-1]);
			else if(board[l].pUnder[h]!=0)
				index[l][h]=goallist[0].CreatePiece(board[l].pUnder[h],h,l,false,!board[l].pUnder[h-1]);
			else break;}
	}
}

DynInfo Evaluation::InitializeDI(const Position now_board[],const byte now_storage[],int turn)
{
	byte i,j,n;
	DynInfo info;
	memset(info.PieceIndex,null,sizeof(info.PieceIndex));
	Gen_Pieces(now_board,info.Pieces,info.PieceIndex);
	info.nStor[0]=0;info.nStor[1]=0;
	For(i,1,7){
		info.Storage[i]=now_storage[i];
		info.Storage[i+8]=now_storage[i+8];
		info.nStor[0]+=now_storage[i];
		info.nStor[1]+=now_storage[i+8];
	}
	info.turn=turn;
	For(i,0,23){
		n=0;
		info.board[i]=now_board[i];
		for(j=1;j<now_board[i].height;j++)
			if(now_board[i].pUnder[j]==Rock) n++;
		if(now_board[i].pTop==Rock  && now_board[i].height>0) n++;
		info.rock_occ[i].nRock=n;
		info.rock_occ[i].COcc[0]=0;
		info.rock_occ[i].COcc[1]=0;
	}
	info.Relative_under[0]=0;
	info.Relative_under[1]=0;
	For(j,0,17) if(info.Pieces[0].exist[j])
		effect_add_on(&info,j,0);
	For(i,0,1) For(j,0,17) if(info.Pieces[i].exist[j]){
		effect_occ_push(info.rock_occ,info.Pieces[i].piece[j].kn,info.Pieces[i].piece[j].l,i);
	}
	For(i,1,7) for(j=info.Storage[i];j>0;j--)
			effect_add_under(&info,i,0);
	return info;
}

inline void Evaluation::effect_occ_push(RockOcc rocc[],byte kn,byte l,int flag)
{
	for(byte i=0;i<24;i++)
		rocc[i].COcc[flag]+=PW_ROcc[kn][l][i];
}
inline void Evaluation::effect_occ_pop(RockOcc rocc[],byte kn,byte l,int flag)
{
	for(byte i=0;i<24;i++)
		rocc[i].COcc[flag]-=PW_ROcc[kn][l][i];
}
void Evaluation::effect_move(DynInfo*pdi,byte pn,byte l1,byte l2,int flag)
{
	Piece *pt;
	byte i,kn=pdi->Pieces[flag].piece[pn].kn;
	for(i=pdi->Pieces[!flag].count;i>=0;i--) if(pdi->Pieces[!flag].exist[i]){
		pt=&pdi->Pieces[!flag].piece[i];
		pdi->Pieces[flag].piece[pn].relative_sum+=(PW_RFactor[kn][l2][pt->l]-PW_RFactor[kn][l1][pt->l])*RMatrix[kn][pt->kn];
		pt->relative_sum+=(PW_RFactor[pt->kn][pt->l][l2]-PW_RFactor[pt->kn][pt->l][l1])*RMatrix[pt->kn][kn];
	}
}
void Evaluation::effect_add_on(DynInfo*pdi,byte pn,int flag)
{
	Piece *pt;
	byte i,kn=pdi->Pieces[flag].piece[pn].kn,l=pdi->Pieces[flag].piece[pn].l;

	for(i=pdi->Pieces[!flag].count;i>=0;i--) if(pdi->Pieces[!flag].exist[i]){
		pt=&pdi->Pieces[!flag].piece[i];
		pdi->Pieces[flag].piece[pn].relative_sum+=PW_RFactor[kn][l][pt->l]*RMatrix[kn][pt->kn];
		pt->relative_sum+=PW_RFactor[pt->kn][pt->l][l]*RMatrix[pt->kn][kn];
	}
	byte* st=pdi->Storage+((!flag)<<3);
	for(i=1;i<8;i++) if(st[i]){
		pdi->Pieces[flag].piece[pn].relative_sum+=st[i]*RMatrix[kn][i];
		pdi->Relative_under[!flag]+=st[i]*RMatrix[i][kn];
	}
}

void Evaluation::effect_sub_on(DynInfo*pdi,byte pn,int flag)
{
	Piece *pt;
	byte i,kn=pdi->Pieces[flag].piece[pn].kn,l=pdi->Pieces[flag].piece[pn].l;

	for(i=pdi->Pieces[!flag].count;i>=0;i--) if(pdi->Pieces[!flag].exist[i]){
		pt=&pdi->Pieces[!flag].piece[i];
		pt->relative_sum-=PW_RFactor[pt->kn][pt->l][l]*RMatrix[pt->kn][kn];
	}
	byte* st=pdi->Storage+((!flag)<<3);
	for(i=1;i<8;i++) if(st[i])
		pdi->Relative_under[!flag]-=st[i]*RMatrix[i][kn];
	pdi->Pieces[flag].piece[pn].relative_sum=0;
}
void Evaluation::effect_add_under(DynInfo*pdi,byte kn,int flag)
{
	Piece *pt;
	byte i;
	for(i=pdi->Pieces[!flag].count;i>=0;i--) if(pdi->Pieces[!flag].exist[i]){
		pt=&pdi->Pieces[!flag].piece[i];
		pt->relative_sum+=RMatrix[pt->kn][kn];
		pdi->Relative_under[flag]+=RMatrix[kn][pt->kn];
	}
	byte* st=pdi->Storage+((!flag)<<3);
	for(i=1;i<8;i++) if(st[i]){
		pdi->Relative_under[!flag]+=st[i]*RMatrix[i][kn];
		pdi->Relative_under[flag]+=st[i]*RMatrix[kn][i];
	}
}
void Evaluation::effect_sub_under(DynInfo*pdi,byte kn,int flag)
{
	Piece *pt;
	byte i;
	for(i=pdi->Pieces[!flag].count;i>=0;i--) if(pdi->Pieces[!flag].exist[i]){
		pt=&pdi->Pieces[!flag].piece[i];
		pt->relative_sum-=RMatrix[pt->kn][kn];
		pdi->Relative_under[flag]-=RMatrix[kn][pt->kn];
	}
	byte* st=pdi->Storage+((!flag)<<3);
	for(i=1;i<8;i++) if(st[i]){
		pdi->Relative_under[!flag]-=st[i]*RMatrix[i][kn];
		pdi->Relative_under[flag]-=st[i]*RMatrix[kn][i];
	}
}   

void Evaluation::refresh_go(const general_move*pgm,DynInfo*pdi,MoveInfo*pmi)
{
	byte l1=pgm->l1,l2=pgm->ltag,k1=pgm->k1,k2=pgm->k2,h1=pdi->board[l1].height,h2,t=pdi->turn;
	byte p1=(pdi->PieceIndex[l1][h1])&31,p2=-1,pt;
	switch(pgm->method){
		case Produce:
			Pproduce(pdi->board,l1,k2);
			p2=pdi->Pieces[t].CreatePiece(k2,h1-1,l1,false,h1>2);
			pdi->Pieces[t].piece[p1].producable=false;
			pdi->PieceIndex[l1][h1-1]=p2+(t<<5);
			pdi->Storage[k2]--;
			pdi->nStor[t]--;
			pdi->rock_occ[l1].nRock--;
			effect_sub_under(pdi,abp(k2),t);
			effect_add_on(pdi,p2,t);
			effect_occ_push(pdi->rock_occ,abp(k2),l1,t);
			break;
		case Carry:
			Ppop(pdi->board,l1);
			Ppush(pdi->board,l2,k1);
			h2=pdi->Pieces[t].piece[p1].height=pdi->board[l2].height;
			pdi->Pieces[t].piece[p1].l=l2;
			pdi->Pieces[t].piece[p1].producable=(h2-1) && !pdi->board[l2].pUnder[h2-1];
			pdi->PieceIndex[l1][h1]=null;pdi->PieceIndex[l2][h2]=p1+(t<<5);
			effect_move(pdi,p1,l1,l2,t);
			effect_occ_pop(pdi->rock_occ,abp(k1),l1,t);
			effect_occ_push(pdi->rock_occ,abp(k1),l2,t);
			//change active state
			if((pt=pdi->PieceIndex[l1][h1-1])!=null)  //Special use of p2 here,whithout mod operation.Be careful.
				pdi->Pieces[pt>>5].piece[pt&31].active=true;
			if((pt=pdi->PieceIndex[l2][h2-1])!=null) 
				pdi->Pieces[pt>>5].piece[pt&31].active=false;
			break;
		case Capture:
			h2=pdi->board[l2].height;
			p2=(pdi->PieceIndex[l2][h2])&31;
			effect_occ_pop(pdi->rock_occ,abp(k2),l2,!t);
			effect_sub_on(pdi,p2,!t);
			pdi->Pieces[!t].exist[p2]=false;
			Ppop(pdi->board,l2);

			Ppush(pdi->board,l2,pgm->k1);
			Ppop(pdi->board,pgm->l1);
			pdi->Pieces[t].piece[p1].height=h2;
			pdi->Pieces[t].piece[p1].l=l2;
			pdi->Pieces[t].piece[p1].producable=(h2-1) && !pdi->board[l2].pUnder[h2-1];
			pdi->PieceIndex[l1][h1]=null;pdi->PieceIndex[l2][h2]=p1+(t<<5);	
			effect_move(pdi,p1,l1,l2,t);
			effect_occ_pop(pdi->rock_occ,abp(k1),l1,t);
			effect_occ_push(pdi->rock_occ,abp(k1),l2,t);

			if((pt=pdi->PieceIndex[l1][h1-1])!=null)  //Special use of p2 here,whithout mod operation.Be careful.
				pdi->Pieces[pt>>5].piece[pt&31].active=true;
			break;
		case Shoot:
			h2=pdi->board[l2].height;
			p2=(pdi->PieceIndex[l2][h2])&31;
			effect_occ_pop(pdi->rock_occ,abp(k2),l2,!t);
			effect_sub_on(pdi,p2,!t);
			pdi->PieceIndex[l2][h2]=null;
			pdi->Pieces[!t].exist[p2]=false;
			Ppop(pdi->board,l2);
			if((pt=pdi->PieceIndex[l2][h2-1])!=null) 
				pdi->Pieces[pt>>5].piece[pt&31].active=true;
			break;
		case Exchange:
			h2=pdi->board[l2].height;
			p2=(pdi->PieceIndex[l2][h2])&31;

			effect_occ_pop(pdi->rock_occ,abp(k2),l2,!t);
			effect_sub_on(pdi,p2,!t);
			pdi->PieceIndex[l2][h2]=null;
			pdi->Pieces[!t].exist[p2]=false;
			Ppop(pdi->board,l2);

			effect_occ_pop(pdi->rock_occ,abp(k1),l1,t);
			effect_sub_on(pdi,p1,t);
			pdi->PieceIndex[l1][h1]=null;
			pdi->Pieces[t].exist[p1]=false;
			Ppop(pdi->board,l1);

			if((pt=pdi->PieceIndex[l1][h1-1])!=null)  //Special use of p2 here,whithout mod operation.Be careful.
				pdi->Pieces[pt>>5].piece[pt&31].active=true;
			if((pt=pdi->PieceIndex[l2][h2-1])!=null)  //Special use of p2 here,whithout mod operation.Be careful.
				pdi->Pieces[pt>>5].piece[pt&31].active=true;
			break;	
		case Birth:
			pdi->board[l1].pTop=pgm->k2;
			p1=pdi->Pieces[t].CreatePiece(k2,h1,l1,true,h1>1);
			pdi->PieceIndex[l1][h1]=p1+(t<<5);
			pdi->Storage[pgm->k2]--;
			pdi->nStor[t]--;
			pdi->rock_occ[l1].nRock--;
			effect_sub_under(pdi,abp(k2),t);
			effect_add_on(pdi,p1,t);
			effect_occ_push(pdi->rock_occ,abp(k2),l1,t);
			break;
	}
	pmi->move=*pgm;
	pmi->p1=p1;pmi->p2=p2;
	pdi->turn=!t;
}
void Evaluation::refresh_back(DynInfo*pdi,const MoveInfo*pmi)
{
	byte l1=pmi->move.l1,l2=pmi->move.ltag,k1=pmi->move.k1,k2=pmi->move.k2,h1=pdi->board[l1].height,h2;
	byte p1=pmi->p1,p2=pmi->p2,pt;
	int t=pdi->turn=!pdi->turn;
	switch(pmi->move.method){
		case Produce:
			effect_occ_pop(pdi->rock_occ,abp(k2),l1,t);
			effect_add_under(pdi,abp(k2),t);
			effect_sub_on(pdi,p2,t);
			pdi->rock_occ[l1].nRock++;
			pdi->Storage[k2]++;
			pdi->nStor[t]++;
			pdi->PieceIndex[l1][h1-1]=null;
			pdi->Pieces[t].exist[p2]=false;pdi->Pieces[t].count--;
			pdi->board[l1].pUnder[h1-1]=Rock; //anti-produce
			pdi->Pieces[t].piece[p1].producable=true;
			break;
		case Carry:
			h2=pdi->board[l2].height;
			effect_move(pdi,p1,l2,l1,t);   //try bringing here to avoid errors
			Ppop(pdi->board,l2);
			Ppush(pdi->board,l1,k1);
			h1=pdi->Pieces[t].piece[p1].height=pdi->board[l1].height;
			pdi->Pieces[t].piece[p1].l=l1;
			pdi->Pieces[t].piece[p1].producable=(h1-1) && !pdi->board[l1].pUnder[h1-1];
			pdi->PieceIndex[l2][h2]=null;pdi->PieceIndex[l1][h1]=p1+(t<<5);
			effect_occ_pop(pdi->rock_occ,abp(k1),l2,t);
			effect_occ_push(pdi->rock_occ,abp(k1),l1,t);
			//change active state
			if((pt=pdi->PieceIndex[l2][h2-1])!=null) 
				pdi->Pieces[pt>>5].piece[pt&31].active=true;
			if((pt=pdi->PieceIndex[l1][h1-1])!=null)
				pdi->Pieces[pt>>5].piece[pt&31].active=false;
			break;
		case Capture:
			h2=pdi->board[l2].height;
			Ppop(pdi->board,l2);
			Ppush(pdi->board,l1,k1);
			pdi->Pieces[t].piece[p1].height=h1+1;
			pdi->Pieces[t].piece[p1].l=l1;
			pdi->Pieces[t].piece[p1].producable=h1 && !pdi->board[l1].pUnder[h1];
			pdi->PieceIndex[l1][h1+1]=p1+(t<<5);
			effect_move(pdi,p1,l2,l1,t);
			effect_occ_pop(pdi->rock_occ,abp(k1),l2,t);
			effect_occ_push(pdi->rock_occ,abp(k1),l1,t);

			Ppush(pdi->board,l2,k2);
			pdi->Pieces[!t].exist[p2]=true;
			pdi->PieceIndex[l2][h2]=p2+((!t)<<5);
			effect_add_on(pdi,p2,!t);
			effect_occ_push(pdi->rock_occ,abp(k2),l2,!t);
			//change active state
			if((pt=pdi->PieceIndex[l1][h1])!=null)
				pdi->Pieces[pt>>5].piece[pt&31].active=false;
			break;
		case Shoot:
			h2=pdi->board[l2].height;
			Ppush(pdi->board,l2,k2);
			pdi->Pieces[!t].exist[p2]=true;
			pdi->PieceIndex[l2][h2+1]=p2+((!t)<<5);
			effect_add_on(pdi,p2,!t);
			effect_occ_push(pdi->rock_occ,abp(k2),l2,!t);	
			if((pt=pdi->PieceIndex[l2][h2])!=null) 
				pdi->Pieces[pt>>5].piece[pt&31].active=false;
			break;
		case Exchange:
			h2=pdi->board[l2].height;

			Ppush(pdi->board,l1,k1);
			pdi->Pieces[t].exist[p1]=true;
			pdi->PieceIndex[l1][h1+1]=p1+(t<<5);
			effect_add_on(pdi,p1,t);
			effect_occ_push(pdi->rock_occ,abp(k1),l1,t);

			Ppush(pdi->board,l2,k2);
			pdi->Pieces[!t].exist[p2]=true;
			pdi->PieceIndex[l2][h2+1]=p2+((!t)<<5);
			effect_add_on(pdi,p2,!t);
			effect_occ_push(pdi->rock_occ,abp(k2),l2,!t);
			
			if((pt=pdi->PieceIndex[l1][h1])!=null)  //Special use of p2 here,whithout mod operation.Be careful.
				pdi->Pieces[pt>>5].piece[pt&31].active=false;
			if((pt=pdi->PieceIndex[l2][h2])!=null)  //Special use of p2 here,whithout mod operation.Be careful.
				pdi->Pieces[pt>>5].piece[pt&31].active=false;
			break;	
		case Birth:
			effect_occ_pop(pdi->rock_occ,abp(k2),l1,t);
			effect_add_under(pdi,abp(k2),t);
			effect_sub_on(pdi,p1,t);
			pdi->rock_occ[l1].nRock++;
			pdi->Storage[k2]++;
			pdi->nStor[t]++;
			pdi->PieceIndex[l1][h1]=null;
			pdi->Pieces[t].exist[p1]=false;pdi->Pieces[t].count--;
			pdi->board[l1].pTop=Rock; 
			break;
	}
}