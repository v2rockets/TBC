#pragma once


class HistorySuggest
{
public:
	HistorySuggest::HistorySuggest()
	{
		CleanHistory();
	}
	void CleanHistory()
	{
		memset(Scores_p,0,sizeof(Scores_p));
	    memset(Scores_m,0,sizeof(Scores_m));
	}
	void SortMoves(GMList *pl,int pr[]);
	void SavetoHistory(int antidepth,general_move*pgm);
	void ChangeOrder(GMList *pl,int pr[],int n);
	static const int MethodPriority[8];
protected:
	inline int move_cmp(const void*m1,const void*m2);
	static inline int move_cmp_s(const void*m1,const void*m2);
	static long S[MAX_MOVES];
	long Scores_p[24][8];
	long Scores_m[24][24];
	GMList*pl;
};
