// Piece.cpp: implementation of the Piece class.
//
//////////////////////////////////////////////////////////////////////

#define IS_P
#include "stdafx.h"
#include "Piece.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

Piece::Piece()
{
   
}

Piece::~Piece()
{

}
int PieceList::CreatePiece(byte k,byte h,byte l,byte ncover,bool is_prable)
{
	this->piece[count].cover=ncover;
	this->piece[count].producable=is_prable;
	this->piece[count].height=h;
	this->piece[count].kn=abp(k);
	this->piece[count].l=l;
	this->piece[count].relative_sum=0;
//to be continued
	exist[count]=true;
	return count++;
}
/*void Piece::refresh_moves()
{
	MEngine.ListRegularMove(cur_board,Turn,this->moves.x1,this->moves.y1,&(this->moves));
	this->producable=MEngine.IsProducable(cur_board,this->moves.x1,this->moves.y1,this->moves.k1);
}*/