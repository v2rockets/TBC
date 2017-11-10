// Evaluation.h: interface for the Evaluation class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_EVALUTION_H__604C4A06_24BA_4F3A_9464_75E7D7D64FD5__INCLUDED_)
#define AFX_EVALUTION_H__604C4A06_24BA_4F3A_9464_75E7D7D64FD5__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define MAXV float(50000)

struct RockOcc
{
	byte nRock;
	float COcc[2];
};

struct DynInfo //seems safe to copy with =
{
	int turn;
	Position board[24];
	PieceList Pieces[2];
	byte PieceIndex[24][9];
	byte Storage[16];
	byte nStor[2];
	float Relative_under[2];
	RockOcc rock_occ[24];
};

struct MoveInfo
{
	general_move move;
	byte p1;
	byte p2;
	RockOcc old_occ[24];
};
#define AddTargetVal(ts,h2,k2) if((ts) && (h2)) MV+=(k2)? ((flag^((k2)>>3))? 4:1): 2
class Evaluation  
{
protected:
	void effect_add_on(DynInfo*pdi,byte pn,int flag);
	void effect_sub_on(DynInfo*pdi,byte pn,int flag);
	void effect_add_under(DynInfo*pdi,byte kn,int flag);
	void effect_sub_under(DynInfo*pdi,byte kn,int flag);
	void effect_move(DynInfo*pdi,byte pn,byte l1,byte l2,int flag);
	inline void effect_occ_push(RockOcc rocc[],byte kn,byte l,int flag);
	inline void effect_occ_pop(RockOcc rocc[],byte kn,byte l,int flag);
	inline void effect_occ_change(RockOcc rocc[],byte kn,byte l,int flag,float rate);
	float RelativeFactor_bydis(float dis);
	byte CalCover(const Position board[],byte l,byte h);  //Piece must be really covered to make this function correct
	MoveGenerator MG;
	float PW_ROcc[8][24][24];
	float PW_RFactor[8][24][24];
	static const float W_Richness;
	static const float RMatrix[8][8];
	static const float W_Cover[15];
	static const score BaseVal[8];
	static const score MobileVal[8];
	static const score PositionVal_normal[24];
	static const score PositionVal_tower[24];
	static const score PositionVal_cannon[24];
	static const score HeightVal_normal[9];
	static const score HeightVal_footman[9];
	static const score DeltaHVal[9];
	static const score PrableVal_each;
	static const score PotentialVal;
	static const score ProducableVal[2];
	static const score ActiveVal;
	static const float WRO_num[24][3];
	static const float W_OccRelax;
public:
	Evaluation();
	virtual ~Evaluation();
	void Gen_Pieces(const Position board[],PieceList goallist[2],byte index[24][9]);
	score CalValue(DynInfo*pdi);
	score CalMobileValue(DynInfo*pdi,int flag);
	DynInfo InitializeDI(const Position now_board[],const byte now_storage[],int turn);
	void refresh_go(const general_move* pgm,DynInfo*pdi,MoveInfo*pmi);
	void refresh_back(DynInfo*pdi,const MoveInfo*pmi);
	void ListbyPiece(DynInfo*pdi,int turn,GMList*pl);
};

#endif // !defined(AFX_EVALUTION_H__604C4A06_24BA_4F3A_9464_75E7D7D64FD5__INCLUDED_)
