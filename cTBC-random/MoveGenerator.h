// MoveGenerator.h: interface for the MoveGenerator class.
//
//////////////////////////////////////////////////////////////////////


#if !defined(AFX_MOVEGENERATOR_H__7E4178FC_AE6B_4035_8244_527B9984FF59__INCLUDED_)
#define AFX_MOVEGENERATOR_H__7E4178FC_AE6B_4035_8244_527B9984FF59__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class MoveGenerator  
{
public:
	MoveGenerator();
	virtual ~MoveGenerator();
	void ListRegularMove(Position board[],int turn,byte l1,RMList*templist);
	void ListAll(Position board[],const byte storage[],int turn,GMList*pl);
	bool IsProducable(const Position board[],byte l,byte k);
	void Gen_Pieces(const Position board[],PieceList goallist[2]);
	byte MoveIn[24][13];
	friend class Evaluation;
protected:
	static byte CheckCannon[8];
    static byte CheckTower[8];
	byte PMove[2][8][8][8][8];
	byte IsMove_direct(byte diff,byte k1,byte h1,byte k2,byte h2);
	int gen_normal(const Position board[],byte l1,RMTarget*pt);
	inline int gen_footman(const Position board[],byte l1,RMTarget*pt);
	inline int gen_knight(Position board[],byte l0,RMTarget*pt);
};

#endif // !defined(AFX_MOVEGENERATOR_H__7E4178FC_AE6B_4035_8244_527B9984FF59__INCLUDED_)
