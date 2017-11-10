// SearchEngine.h: interface for the SearchEngine class.
//

#include "Evaluation.h"
#include "HistorySuggest.h"
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_SEARCHENGINE_H__350BFF9A_D197_4E98_88CF_C41F342B90C8__INCLUDED_)
#define AFX_SEARCHENGINE_H__350BFF9A_D197_4E98_88CF_C41F342B90C8__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define RPSTD 5

class SearchEngine  
{
public:
	SearchEngine();
	virtual ~SearchEngine();
    general_move MakeBestMove(int SearchDepth,Position now_board[],byte now_storage[],int turn,score rnd_v);
	int JudgeBoard(Position board[]);
	int FindRepeatMove(GMList*pl,MoveInfo*now_pmstack);
	void SetPastMoves(general_move pms[],int last_change);
	long count;
	score ValOpt,ValExtra;
private:
	int SD,Turn,J;
	DynInfo now_info,backup_info;
	Evaluation *m_pEva;
	MoveGenerator *m_pMG;
	MoveInfo MoveStack[MAX_DEPTH+RPSTD];
	int mpr[MAX_DEPTH][MAX_MOVES];   //Move Priority
	GMList tempML[MAX_DEPTH];
	score ValList[MAX_MOVES];
	score RndV;
	score AlphaBeta(int depth,score alpha,score beta);
	score QuiescentSearch(int depth,score alpha,score beta);
	int ListBirth(Position board[],int turn,GMList*pl);
	int SelectRandom(score maxv,GMList*pl,score vl[]);
	int LastChange[MAX_DEPTH];
	float W_ClosingStale[MAX_STALE+MAX_DEPTH];
	static const int Center[8];
	general_move bestline[MAX_DEPTH][MAX_DEPTH];
	HistorySuggest suggest;
};

#endif // !defined(AFX_SEARCHENGINE_H__350BFF9A_D197_4E98_88CF_C41F342B90C8__INCLUDED_)
