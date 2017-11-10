// SearchEngine.cpp: implementation of the SearchEngine class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "SearchEngine.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////


const int SearchEngine::Center[8]={
	6,10,14,18,
	5,9,13,17
};
SearchEngine::SearchEngine()
{
	m_pMG=new MoveGenerator;
	m_pEva=new Evaluation;
	for(int i=0;i<MAX_STALE;i++)
		W_ClosingStale[i]=log(float(MAX_STALE-i))/log(float(MAX_STALE));
}

SearchEngine::~SearchEngine()
{
	delete m_pMG;
	delete m_pEva;
}

score SearchEngine::QuiescentSearch(int depth,score alpha,score beta)
{
	//count++;

	int i,caps=0;
	score value,bestv;
	bestv=m_pEva->CalValue(&now_info);
	if(bestv==-MAXV){
		bestv=depth-MAXV;
		return bestv;
	}
	else
		bestv*=W_ClosingStale[depth-LastChange[depth]];
	if(depth>=SD+6)
		return bestv;
	if(bestv>=beta)
		return bestv;
	if(bestv>alpha)
		alpha=bestv;

	m_pEva->ListbyPiece(&now_info,now_info.turn,&tempML[depth]);

	for(i=0;i<tempML[depth].count;i++) if(tempML[depth].GMoves[i].method==Capture || tempML[depth].GMoves[i].method==Shoot){
		caps++;
		m_pEva->refresh_go(&tempML[depth].GMoves[i],&now_info,&MoveStack[depth+RPSTD]);
		LastChange[depth+1]=depth;
		value=-QuiescentSearch(depth+1,-beta,-alpha);
		m_pEva->refresh_back(&now_info,&MoveStack[depth+RPSTD]);

		if(value>=beta)
			return value;
		if(value>bestv){
			bestv=value;
			if(value>alpha)
				alpha=value;
		}
	}
	if((depth-SD)%2 && !caps){
		for(i=0;i<tempML[depth].count;i++) if(tempML[depth].GMoves[i].method==Produce){
			m_pEva->refresh_go(&tempML[depth].GMoves[i],&now_info,&MoveStack[depth+RPSTD]);
			value=-m_pEva->CalValue(&now_info);
			m_pEva->refresh_back(&now_info,&MoveStack[depth+RPSTD]);

			if(value>=beta)
				return value;
			if(value>bestv)
				bestv=value;
		}
	}
	return bestv;
}

score SearchEngine::AlphaBeta(int depth,score alpha,score beta)
{
	//count++;

	score value;

	int i,t=now_info.turn,bestmove=null;
	if(depth==SD){
		return QuiescentSearch(depth,alpha,beta);
		/*
		value=m_pEva->CalValue(&now_info);
		if(value==-MAXV) 
			return -MAXV+depth;
		return W_ClosingStale[depth-LastChange[depth]]*value;
		*/
	}
	if(depth-LastChange[depth]>=MAX_STALE)
		return 0;
	score bestv=-MAXV+depth;
	if(J+depth<2)
		ListBirth(now_info.board,t,&tempML[depth]);
	else
		m_pEva->ListbyPiece(&now_info,t,&tempML[depth]);
	FindRepeatMove(&tempML[depth],&MoveStack[depth+RPSTD-1]);
	suggest.SortMoves(&tempML[depth],mpr[depth]);

	for(i=0;i<tempML[depth].count;i++){
		//testv=m_pEva->CalValue(&now_info,t);
		m_pEva->refresh_go(&tempML[depth].GMoves[mpr[depth][i]],&now_info,&MoveStack[depth+RPSTD]);
		LastChange[depth+1]=(MoveStack[depth+RPSTD].move.method==Carry)?LastChange[depth]:depth;
		value=-AlphaBeta(depth+1,-beta,-alpha);
		m_pEva->refresh_back(&now_info,&MoveStack[depth+RPSTD]);
		/*
		for(d=depth-1;d>=0;d--)
		m_pEva->refresh_back(&now_info,&MoveStack[d]);
		For(j,0,18) if(backup_info.Pieces[0].exist[j]){
		if(abs(backup_info.Pieces[0].piece[j].relative_sum-now_info.Pieces[0].piece[j].relative_sum)>0.001)
		idle=0;
		}
		now_info=backup_info;
		for(d=0;d<depth;d++)
		m_pEva->refresh_go(&MoveStack[d].move,&now_info,&MoveStack[d+5]);
		*/
		if(value>=beta){
			suggest.SavetoHistory(SD-depth,&tempML[depth].GMoves[mpr[depth][i]]);
			return value;
		}
		if(value>bestv){
			bestv=value;
			if(value>alpha){
				alpha=value;
				bestmove=mpr[depth][i];
			}

		}
	}
	if(bestmove!=null){
		suggest.SavetoHistory(SD-depth,&tempML[depth].GMoves[bestmove]);
		for(i=SD-1;i>depth;i--)
			bestline[depth][i]=bestline[depth+1][i];
		bestline[depth][depth]=tempML[depth].GMoves[bestmove];
	}
	return bestv;
}

general_move SearchEngine::MakeBestMove(int SearchDepth,Position now_board[],byte now_storage[],int turn,score rnd_v)
{
	int i,j,bestm=null;
	score v,v1,v2,testv;
	ValOpt=-MAXV;
	SD=SearchDepth;
	J=JudgeBoard(now_board);
	Turn=turn;
	RndV=rnd_v*(1+(float)LastChange[0]/MAX_STALE);
	now_info=m_pEva->InitializeDI(now_board,now_storage,turn);

	backup_info=now_info;
	if(J>=2){
		v1=m_pEva->CalValue(&now_info);
	}
	count=0;
	suggest.CleanHistory();
	if(J<2)
		ListBirth(now_info.board,turn,&tempML[0]);
	else
		m_pEva->ListbyPiece(&now_info,turn,&tempML[0]);
	FindRepeatMove(&tempML[0],&MoveStack[RPSTD-1]);
	suggest.SortMoves(&tempML[0],mpr[0]);
	/*
	m_pEva->refresh_go(&tempML[0].GMoves[3],&now_info,&MoveStack[0]);
	m_pEva->ListbyPiece(&now_info,!turn,&tempML[1]);
	m_pEva->refresh_go(&tempML[1].GMoves[0],&now_info,&MoveStack[1]);
	m_pEva->ListbyPiece(&now_info,turn,&tempML[2]);
	m_pEva->refresh_go(&tempML[2].GMoves[0],&now_info,&MoveStack[2]);
	m_pEva->refresh_back(&now_info,&MoveStack[2]);
	m_pEva->refresh_back(&now_info,&MoveStack[1]);
	m_pEva->refresh_back(&now_info,&MoveStack[0]);

	For(j,0,18) if(backup_info.Pieces[0].exist[j])
	if(abs(backup_info.Pieces[0].piece[j].relative_sum-now_info.Pieces[0].piece[j].relative_sum)>0.001)
	idle=0;
	*/	
	for(i=0;i<tempML[0].count;i++){
		//v2=m_pEva->CalValue(&now_info,0)-m_pEva->CalValue(&now_info,1);
		//testv=m_pEva->CalValue(&now_info,0)-m_pEva->CalValue(&now_info,1);
		suggest.ChangeOrder(&tempML[0],mpr[0],i);
		m_pEva->refresh_go(&tempML[0].GMoves[mpr[0][i]],&now_info,&MoveStack[RPSTD]);
		LastChange[1]=(MoveStack[RPSTD].move.method==Carry)?LastChange[0]:0;
		v=-AlphaBeta(1,-MAXV,RndV-ValOpt);
		m_pEva->refresh_back(&now_info,&MoveStack[RPSTD]);
		/*
		For(j,0,18) if(backup_info.Pieces[0].exist[j])
		if(abs(backup_info.Pieces[0].piece[j].relative_sum-now_info.Pieces[0].piece[j].relative_sum)>0.001)
		idle=0;
		testv=m_pEva->CalValue(&now_info,0)-m_pEva->CalValue(&now_info,1);
		if(abs(v2-testv)>0.0001)
		idle=0;
		*/
		ValList[mpr[0][i]]=v;
		if(v>ValOpt){
			ValOpt=v;
			bestm=mpr[0][i];
			for(j=SD-1;j>0;j--)
				bestline[0][j]=bestline[1][j];
			bestline[0][0]=tempML[0].GMoves[bestm];
		}
	}
	/*
	For(i,0,18) if(backup_info.Pieces[0].exist[i])
	if(abs(backup_info.Pieces[0].piece[i].relative_sum-now_info.Pieces[0].piece[i].relative_sum)>0.001)
	idle=0;
	*/
	if(J>=2){
		v2=m_pEva->CalValue(&now_info);
		ValExtra=v1-v2;
	}else
		ValExtra=0;
	if(bestm==null) 
		return emptymove;
	if(RndV>1)
		bestm=SelectRandom(ValOpt,&tempML[0],ValList);
	return tempML[0].GMoves[bestm];
}

int SearchEngine::JudgeBoard(Position board[])
{
	int	i,j,n=0;
	For(i,0,23){
		for(j=1;j<board[i].height;j++)
			if(board[i].pUnder[j]==Rock) n++;
		if(board[i].pTop==Rock  && board[i].height>0) n++;
	}
	return 36-n;
}

int SearchEngine::ListBirth(Position board[],int turn,GMList*pl)
{
	int i,j,n=0;
	For(i,0,7) if(board[Center[i]].pTop==Rock){
		For(j,1,7) if(j!=Tower){
			pl->GMoves[n].method=Produce;
			pl->GMoves[n].l1=Center[i];
			pl->GMoves[n].k1=0;
			pl->GMoves[n].k2=j+(turn<<3);
			n++;
		}
	}
	pl->count=n;
	return n;
}

int SearchEngine::FindRepeatMove(GMList*pl,MoveInfo*now_pmstack)
{
	int i,j;
	for(i=0;i>-RPSTD;i--) 
		if(now_pmstack[i].move.method!=Carry) break;
	if(i!=-RPSTD) return null;
	i=now_pmstack[0].move.l1;j=now_pmstack[0].move.ltag;
	if(    i!=now_pmstack[-2].move.ltag
		|| i!=now_pmstack[-4].move.l1
		|| j!=now_pmstack[-2].move.l1
		|| j!=now_pmstack[-4].move.ltag
		|| now_pmstack[-1].move.l1!=now_pmstack[-3].move.ltag
		|| now_pmstack[-1].move.ltag!=now_pmstack[-3].move.l1)
		return null;
	int rl1=now_pmstack[-1].move.ltag,rl2=now_pmstack[-1].move.l1;
	for(i=pl->count-1;i>=0;i--){
		if(pl->GMoves[i].l1==rl1 && pl->GMoves[i].ltag==rl2){
			pl->GMoves[i].method=Exchange;
			pl->GMoves[i].ltag=now_pmstack[0].move.ltag;
			pl->GMoves[i].k2=now_pmstack[0].move.k1;
			break;
		}
	}
	return i;
}

void SearchEngine::SetPastMoves(general_move pms[],int last_change)
{
	for(int i=0;i<RPSTD;i++)
		MoveStack[i].move=pms[i];
	LastChange[0]=last_change;
}

int SearchEngine::SelectRandom(score maxv,GMList*pl,score vl[])
{
	int i,n=0;
	int rndlist[MAX_MOVES];
	if(MAXV-abs(maxv)<MAX_DEPTH){
		for(i=0;i<pl->count;i++) if(maxv==vl[i])
			rndlist[n++]=i;
	}else{
		score V_inorder[MAX_MOVES];
		memcpy(V_inorder,vl,sizeof(score)*pl->count);
		std::sort(&V_inorder[0],&V_inorder[pl->count]);
		int nlim=pl->count/4+1;
		for(i=pl->count-1;i>=0;i--) 
			if(maxv-V_inorder[i]>=RndV || pl->count-i>nlim) break;
		score vlim=V_inorder[i+1];
		for(i=0;i<pl->count;i++) if(vl[i]>=vlim)
			rndlist[n++]=i;
	}
	srand((int)time(NULL));
	return rndlist[rand()%n];
}

