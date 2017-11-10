#include "stdafx.h"
#include "Evaluation.h"
#include "HistorySuggest.h"


long HistorySuggest::S[MAX_MOVES];
const int HistorySuggest::MethodPriority[8]={
	0,
	2,
	0,
	4,
	4,
	0,
	0,
	0
};
void HistorySuggest::SavetoHistory(int antidepth,general_move*pgm)
{
	if(pgm->method==Produce)
		Scores_p[pgm->l1][pgm->k2]+=1<<antidepth;
	else
		Scores_m[pgm->l1][pgm->ltag]+=1<<antidepth;
}

void HistorySuggest::SortMoves(GMList *pml,int pr[])
{
	pl=pml;
	general_move *pm;
	for(int i=pl->count-1;i>=0;i--){
		pr[i]=i;
		pm=&pl->GMoves[i];
		S[i]=((pm->method==Produce)?Scores_p[pm->l1][pm->k2]+1:Scores_m[pm->l1][pm->ltag]+1)<<MethodPriority[pm->method];
	}
	qsort(&pr[0],pl->count,sizeof(int),move_cmp_s);
}
inline int HistorySuggest::move_cmp_s(const void*m1,const void*m2)
{
	return S[*(byte*)m2]-S[*(byte*)m1];
}

inline int HistorySuggest::move_cmp(const void*m1,const void*m2)
{
	general_move *pm1=&pl->GMoves[*(byte*)m1],*pm2=&pl->GMoves[*(byte*)m2];
	long s1=(pm1->method==Produce)?Scores_p[pm1->l1][pm1->k2]+1:Scores_m[pm1->l1][pm1->ltag]+1;
	long s2=(pm2->method==Produce)?Scores_p[pm2->l1][pm2->k2]+1:Scores_m[pm2->l1][pm2->ltag]+1;
	return (s2<<MethodPriority[pm2->method])-(s1<<MethodPriority[pm1->method]);
}


void HistorySuggest::ChangeOrder(GMList *pl,int pr[],int n)
{
	int i,N=pl->count,best=n;
	for(i=n+1;i<N;i++) 
		if(move_cmp(&pr[best],&pr[i])>0) best=i;
	std::swap(pr[n],pr[best]);
}

		
