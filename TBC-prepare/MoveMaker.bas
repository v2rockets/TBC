Attribute VB_Name = "MoveMaker"
Option Explicit
Public Sub ListMove(x1%, y1%, Goal As PStates)
Static n%, x2%, y2%, m%, ts%, temp(0 To 14) As PState
n = 0
Goal.x(0) = x1: Goal.y(0) = y1: Goal.s(0) = IIf(Producable(x1, y1), Produce, Fail)
  Select Case Abs(Board(x1, y1).pTop)
  Case Tower
   For m = 5 To 8
     x2 = x1 + MTX(m): y2 = y1 + MTY(m)
     If Inside(x2, y2) Then
       ts = CheckTower(x2, y2)
       If Not ts = 0 Then
       n = n + 1
       temp(n).s = ts: temp(n).x = x2: temp(n).y = y2
       End If
     End If
   Next
  Case Cannon
   n = DoNormal(x1, y1, temp)
   For m = 9 To 12
     x2 = x1 + MTX(m): y2 = y1 + MTY(m)
     If Inside(x2, y2) Then
       ts = CheckCannon(x2, y2)
       If Not ts = 0 Then
       n = n + 1
       temp(n).s = ts: temp(n).x = x2: temp(n).y = y2
       End If
     End If
   Next
  Case Knight
    n = DoKnight(x1, y1, temp)
  Case Footman
    n = DoFootman(x1, y1, temp)
  Case Else
    n = DoNormal(x1, y1, temp)
  End Select
Goal.n = n
For m = 0 To n
Goal.s(m) = temp(m).s
Goal.x(m) = temp(m).x
Goal.y(m) = temp(m).y
Next
End Sub
Public Function DoFootman(x%, y%, g() As PState) As Integer
Static m%, n%, k%, h%, tx%, ty%, ts%
k = Footman * Turn
h = Board(x, y).height
n = 0
For m = 1 To 8
tx = x + MTX(m): ty = y + MTY(m)
If Inside(tx, ty) Then
  ts = PMove(k, h, Board(tx, ty).pTop, Board(tx, ty).height)
  If Not ts = 0 Then
    n = n + 1
    g(n).s = ts: g(n).x = tx: g(n).y = ty
  End If
End If
Next
DoFootman = n
End Function
Public Function JudgePiece(x%, y%) As Boolean
Static ps As PStates
If Turn * Board(x, y).pTop > 0 Then
JudgePiece = True
Host = x + 6 * y
ListMove x, y, ps
Dim n%, x2%, y2%
For n = 1 To ps.n
x2 = ps.x(n): y2 = ps.y(n)
PSelected(x2 + 6 * y2) = ps.s(n)
Next
Else
JudgePiece = False
End If
End Function
Public Function DoNormal(x%, y%, g() As PState) As Integer
Static m%, n%, k%, h%, tx%, ty%, ts%
k = Board(x, y).pTop
h = Board(x, y).height
n = 0
For m = 1 To 4
tx = x + MTX(m): ty = y + MTY(m)
If Inside(tx, ty) Then
  ts = PMove(k, h, Board(tx, ty).pTop, Board(tx, ty).height)
  If Not ts = 0 Then
    n = n + 1
    g(n).s = ts: g(n).x = tx: g(n).y = ty
  End If
End If
Next
DoNormal = n
End Function
Public Function DoKnight(x0%, y0%, g() As PState) As Integer
Static m%, mm%, n1%, n2%, k%, h%, x1%, y1%, x2%, y2%, ts%, tb(-2 To 2, -2 To 2) As Integer, tm(1 To 4) As PState
k = Board(x0, y0).pTop
h = Board(x0, y0).height
n1 = DoNormal(x0, y0, g)
Erase tb
For m = 1 To n1
  x1 = g(m).x: y1 = g(m).y
  If g(m).s = Carry And h = Board(x1, y1).height + 1 Then
    Ppush x1, y1, Knight * Turn
    n2 = DoNormal(x1, y1, tm)
    For mm = 1 To n2
      x2 = tm(mm).x - x0: y2 = tm(mm).y - y0
      If tb(x2, y2) = 0 Then tb(x2, y2) = tm(mm).s
    Next
    Ppop x1, y1
  End If
Next
If tb(0, 0) = Carry Then KnightBack = True
If Board(x0, y0).height > 1 Then
  If (Board(x0, y0).pUnder(Board(x0, y0).height - 1) * k = -24) Then KnightBack = False
End If
For m = 5 To 12
  ts = tb(MTX(m), MTY(m))
  If Not ts = 0 Then
    n1 = n1 + 1
    g(n1).x = x0 + MTX(m): g(n1).y = y0 + MTY(m): g(n1).s = ts
  End If
Next
DoKnight = n1
End Function

'move rule
Public Function Movable(k1, h1, k2, h2) As Integer
If Abs(k1) = Tower Or Abs(k1) = Rock Then '  If Abs(x1 - x2) = 1 And Abs(y1 - y2) = 1 Then Movable = Shoot
   Movable = Fail
   Exit Function
End If
If k1 * k2 < 0 Then
  If h1 - h2 = 2 Then Movable = Capture: Exit Function
  If Abs(k1) = Footman And h1 - h2 = 3 Then Movable = Capture: Exit Function
  If h1 - h2 > 2 Then Movable = Exchange: Exit Function
  If Abs(k1) = Engineer Then
    If h1 - h2 = 1 Then
      If Abs(k2) = Engineer Then
      Movable = Exchange
      ElseIf Abs(k2) = Tower Then
      Movable = Carry
      Else
      Movable = Capture
      End If
      Exit Function
    ElseIf h1 = h2 And Abs(k2) = Machine Then 'PSelected = PMove(Board(x1, y1).pTop, Board(x1, y1).height, Board(x2, y2).pTop, Board(x2, y2).height)
      Movable = Capture
      Exit Function
    End If
  End If
  If h1 - h2 = 1 Then
    If Abs(k2) = Engineer Then
      Movable = Fail
    Else
      Movable = Carry
    End If
    Exit Function
  End If
  If h1 = h2 Then
    If Abs(k1) = Cannon Then Movable = Fail: Exit Function
    If Abs(k1) = Machine And Abs(k2) = Engineer Then Movable = Fail: Exit Function
    If Abs(k1) < Abs(k2) Then
     Movable = Capture
     Exit Function
    ElseIf Abs(k1) = Abs(k2) Then
     Movable = Exchange
     Exit Function
    End If
  End If
Else
  If h1 - h2 >= 0 And h1 - h2 <= 2 Then Movable = Carry: Exit Function
  If (h1 - h2 = -1 Or h1 - h2 = 3) And Abs(k1) = Footman Then Movable = Carry: Exit Function
End If
Movable = Fail
End Function
Private Function CheckCannon(x%, y%) As Integer
If Board(x, y).pTop * Turn < 0 And Not (Abs(Board(x, y).pTop) = Engineer Or Abs(Board(x, y).pTop) = Tower) Then
CheckCannon = Shoot
Else
CheckCannon = Fail
End If
End Function

Private Function CheckTower(x%, y%) As Integer
      If Board(x, y).pTop * Turn < 0 And Abs(Board(x, y).pTop) > Tower Then
       CheckTower = Shoot
      Else
       CheckTower = Fail
      End If
End Function

'tx = x + 1: ty = y
'tx = x - 1: ty = y
'tx = x: ty = y + 1
'tx = x: ty = y - 1

Public Function Producable(x%, y%) As Boolean
Static h%
h = Board(x, y).height
If Not h = 1 Then
If Board(x, y).pUnder(h - 1) = Rock Then Producable = True
End If
End Function
Sub Record(x1%, y1%, ps As PState)
Recs(Steps + 1).methed = ps.s
Recs(Steps + 1).x1 = x1
Recs(Steps + 1).y1 = y1
Recs(Steps + 1).p1 = Board(x1, y1).pTop
Recs(Steps + 1).x2 = ps.x
Recs(Steps + 1).y2 = ps.y
Recs(Steps + 1).p2 = Board(ps.x, ps.y).pTop
If ps.s = Carry Then
    LastChange(Steps + 1) = LastChange(Steps)
Else
    LastChange(Steps + 1) = Steps + 1
End If
End Sub
Sub Record_p(x%, y%, pk%)
Recs(Steps + 1).methed = Produce
Recs(Steps + 1).x1 = x
Recs(Steps + 1).y1 = y
Recs(Steps + 1).p1 = Board(x, y).pTop
Recs(Steps + 1).x2 = x
Recs(Steps + 1).y2 = y
Recs(Steps + 1).p2 = pk
LastChange(Steps + 1) = Steps + 1
End Sub
Sub Record_s(x%, y%)
Recs(Steps + 1).methed = Suicide
Recs(Steps + 1).x1 = x
Recs(Steps + 1).y1 = y
Recs(Steps + 1).p1 = Board(x, y).pTop
Recs(Steps + 1).x2 = x
Recs(Steps + 1).y2 = y
Recs(Steps + 1).p2 = 0
LastChange(Steps + 1) = Steps + 1
End Sub
Public Sub ClPs()
Dim i%
Host = -1
KnightBack = False
For i = 0 To 23
PSelected(i) = 0
Next
End Sub

Public Sub DoMove(x1%, y1%, ps As PState)
Select Case ps.s
Case Carry
Ppush ps.x, ps.y, Board(x1, y1).pTop
Ppop x1, y1
Case Capture
Board(ps.x, ps.y).pTop = Board(x1, y1).pTop
Ppop x1, y1
Case Shoot
Ppop ps.x, ps.y
Case Exchange
Ppop x1, y1
Ppop ps.x, ps.y
Case Suicide
Ppop x1, y1
End Select
End Sub
Public Sub UndoMove(MR As Rec)
If Steps <= 2 Then
    Board(MR.x1, MR.y1).pTop = Rock
    Storage(MR.p2) = Storage(MR.p2) + 1
    Exit Sub
End If
Select Case MR.methed
Case Produce
Board(MR.x1, MR.y1).pUnder(Board(MR.x1, MR.y1).height - 1) = Rock
Storage(MR.p2) = Storage(MR.p2) + 1
Case Carry
Ppop MR.x2, MR.y2
Ppush MR.x1, MR.y1, MR.p1
Case Capture
Ppop MR.x2, MR.y2
Ppush MR.x1, MR.y1, MR.p1
Ppush MR.x2, MR.y2, MR.p2
Case Shoot
Ppush MR.x2, MR.y2, MR.p2
Case Exchange
Ppush MR.x1, MR.y1, MR.p1
Ppush MR.x2, MR.y2, MR.p2
Case Suicide
Ppush MR.x1, MR.y1, MR.p1
End Select
End Sub

