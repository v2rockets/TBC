Attribute VB_Name = "Standard"
Option Explicit
Public Const Rock = 0, Machine = 1, Tower = 2, Armed = 3, Knight = 4, Footman = 5, Engineer = 6, Cannon = 7
Public Const Fail = 0, Produce = 1, Carry = 2, Capture = 3, Shoot = 4, Exchange = 5, Suicide = 6, Ambush = 7
Public Const CRed = &HFF&, CBlue = &H808000, CEmpty = &HC0C0C0, CHost = &HFFFF&, CProduce = &H80FF&, CCan = &HFF00&, CKBP = &H80FF80
Public PieceName(7) As String, ChineseName(7) As String
Public FrameX(5, 3) As Integer, FrameY(5, 3) As Integer
Public PSelected(23) As Integer, Host As Integer
Public MLock As Boolean, KnightBack As Boolean
Public MTX(12) As Integer, MTY(12) As Integer
Public Type Position
height As Integer
pTop As Integer
pUnder(0 To 8) As Integer
End Type
Public Board(5, 3) As Position, Turn As Integer, Steps As Integer, Recs(1 To 2000) As Rec, Storage(-7 To 7) As Integer, Visit As Integer
Public LastChange(0 To 2000) As Integer
Public PMove(-7 To 7, 1 To 7, -7 To 7, 0 To 7)
Public PASS_PState As PState
Public Type Move
kind As Integer
startX As Integer
startY As Integer
endX As Integer
endY As Integer
End Type
Public Type PState
x As Integer
y As Integer
s As Integer
End Type
Public Type PStates
x(100) As Integer
y(100) As Integer
s(100) As Integer
n As Integer
End Type
Public Type Rec
x1 As Integer
y1 As Integer
p1 As Integer
x2 As Integer
y2 As Integer
p2 As Integer
methed As Integer
End Type
Public Function Inside(x%, y%) As Boolean
If x >= 0 And x <= 5 And y >= 0 And y <= 3 Then Inside = True
End Function
Public Sub Reflect()
PieceName(0) = "Rock": PieceName(1) = "Machine": PieceName(2) = "Tower": PieceName(3) = "Armed": PieceName(4) = "Knight": PieceName(5) = "Footman": PieceName(6) = "Engineer": PieceName(7) = "Cannon"
ChineseName(0) = "石": ChineseName(1) = "将": ChineseName(2) = "士": ChineseName(3) = "车": ChineseName(4) = "马": ChineseName(5) = "象": ChineseName(6) = "兵": ChineseName(7) = "炮"
MTX(0) = 0: MTY(0) = 0
MTX(1) = 1: MTY(1) = 0
MTX(2) = -1: MTY(2) = 0
MTX(3) = 0: MTY(3) = 1
MTX(4) = 0: MTY(4) = -1
MTX(5) = 1: MTY(5) = 1
MTX(6) = -1: MTY(6) = 1
MTX(7) = 1: MTY(7) = -1
MTX(8) = -1: MTY(8) = -1
MTX(9) = 2: MTY(9) = 0
MTX(10) = -2: MTY(10) = 0
MTX(11) = 0: MTY(11) = 2
MTX(12) = 0: MTY(12) = -2
Dim k1%, k2%, h1%, h2%
For k1 = -7 To 7
For h1 = 1 To 7
For h2 = 0 To 7
For k2 = -7 To 7
PMove(k1, h1, k2, h2) = Movable(k1, h1, k2, h2)
Next
Next
Next
Next
End Sub
Public Sub StartGame()
Reflect
Dim x%, y%
Turn = 1
Steps = 0
For x = 0 To 5
For y = 0 To 3
If (x + y) Mod 2 = 1 Then
Board(x, y).height = 2
Board(x, y).pTop = Rock
Board(x, y).pUnder(1) = Rock
Else
Board(x, y).height = 1
Board(x, y).pTop = Rock
End If
Board(x, y).pUnder(0) = -1
Next
Next
Storage(1) = 1: Storage(-1) = 1
Storage(2) = 2: Storage(-2) = 2
Storage(3) = 2: Storage(-3) = 2
Storage(4) = 2: Storage(-4) = 2
Storage(5) = 2: Storage(-5) = 2
Storage(6) = 7: Storage(-6) = 7
Storage(7) = 2: Storage(-7) = 2
ChessBoard.Draw
ChessBoard.Reseume
End Sub
Public Sub Pproduce(x As Integer, y As Integer, pk As Integer)
Board(x, y).pUnder(Board(x, y).height - 1) = pk
End Sub
Public Sub Ppush(x As Integer, y As Integer, k As Integer)
If Board(x, y).height > 0 Then Board(x, y).pUnder(Board(x, y).height) = Board(x, y).pTop
Board(x, y).height = Board(x, y).height + 1
Board(x, y).pTop = k
End Sub

Public Sub Ppop(x As Integer, y As Integer)
Board(x, y).height = Board(x, y).height - 1
If Board(x, y).height = 0 Then
Board(x, y).pTop = Rock
Else
Board(x, y).pTop = Board(x, y).pUnder(Board(x, y).height)
End If
End Sub
