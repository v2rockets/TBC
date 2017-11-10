// Piece.h: interface for the Piece class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_PIECE_H__D17A0595_E070_499D_B3AE_F1607727B644__INCLUDED_)
#define AFX_PIECE_H__D17A0595_E070_499D_B3AE_F1607727B644__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

struct Piece  
{  
	byte cover;
	byte l;
	byte kn;
	byte height;
	bool producable;
	float relative_sum;
	Piece();
	virtual ~Piece();
};
class PieceList
{
public:
	Piece piece[18];
	bool exist[18];
	int count;
	PieceList()
	{
		Clean();
	}
	void Clean()
	{
		for(int i=0;i<18;i++)
			exist[i]=false;
		count=0;
	}
	int CreatePiece(byte k,byte h,byte l,byte ncover,bool is_prable);
};
#endif // !defined(AFX_PIECE_H__D17A0595_E070_499D_B3AE_F1607727B644__INCLUDED_)
