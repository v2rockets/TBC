Attribute VB_Name = "DataPort"
Dim mFileS As New FileSystemObject
Dim mFile As File
Dim mtxt As TextStream
Dim wshS As New WshShell
Dim wshE As WshExec
Public Sub FBoardOut()
Attribute FBoardOut.VB_Description = "ssss"
Set mFile = mFileS.GetFile("exchange.txt")
Set mtxt = mFile.OpenAsTextStream(ForWriting)
mtxt.WriteLine (Turn & " " & ChessBoard.Text1.Text)
For n = 1 To 7
mtxt.Write (Storage(-n) & " " & Storage(n) & " ")
Next
mtxt.WriteLine
For n = 0 To 23
x = n \ 4: y = n Mod 4
h = Board(x, y).height
mtxt.Write ("| " & h)
mtxt.Write (" " & Board(x, y).pTop)
  For m = h - 1 To 1 Step -1
  mtxt.Write (" " & Board(x, y).pUnder(m))
  Next
mtxt.WriteLine
Next
mtxt.WriteLine Int(LastChange(Steps) - Steps)
For n = 4 To 0 Step -1
    If Steps > n Then
        mtxt.Write (Recs(Steps - n).methed) & " "
        mtxt.Write Int(Recs(Steps - n).x1 * 4 + Recs(Steps - n).y1) & " "
        mtxt.Write Int(Recs(Steps - n).x2 * 4 + Recs(Steps - n).y2) & " "
        mtxt.Write (Recs(Steps - n).p1) & " "
    Else
        mtxt.Write 0 & " "
        mtxt.Write 0 & " "
        mtxt.Write 0 & " "
        mtxt.Write 0 & " "
    End If
    mtxt.WriteLine
Next
mtxt.Close
End Sub

Public Function ConnecttoC() As MoveMsg

wshS.Run "cTBC.exe", vbHide, True
Set mFile = mFileS.GetFile("strange.txt")
Set mtxt = mFile.OpenAsTextStream(ForReading)
ConnecttoC.info = mtxt.ReadLine
ConnecttoC.s = Asc(mtxt.ReadLine) - Asc("A")
ConnecttoC.l1 = Asc(mtxt.ReadLine) - Asc("A")
ConnecttoC.ltag = Asc(mtxt.ReadLine) - Asc("A")
ConnecttoC.k = Asc(mtxt.ReadLine) - Asc("A")
mtxt.Close
End Function


Public Function CountM(aTurn As Integer) As Integer
Dim temp As PStates
Dim n%, x%, y%
For x = 0 To 5
For y = 0 To 3
  If Sgn(Board(x, y).pTop) = aTurn Then
  ListMove x, y, temp
  n = n + temp.n
  If KnightBack Then KnightBack = False: n = n + 1
  If Producable(x, y) Then
    For m = 1 To 7
    If (Storage(aTurn * m) > 0) And (Board(x, y).height = 2 Or Not m = Tower) Then n = n + 1
    Next
  End If
  End If
Next
Next
CountM = n
End Function
