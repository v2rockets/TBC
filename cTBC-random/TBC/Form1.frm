VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  '´°¿ÚÈ±Ê¡
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      Height          =   375
      Left            =   2880
      TabIndex        =   6
      Top             =   1080
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   375
      Left            =   2880
      TabIndex        =   5
      Top             =   2400
      Width           =   975
   End
   Begin VB.TextBox Text4 
      Height          =   375
      Left            =   3600
      TabIndex        =   4
      Text            =   "0"
      Top             =   360
      Width           =   375
   End
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   2880
      TabIndex        =   3
      Text            =   "0"
      Top             =   360
      Width           =   375
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   2280
      TabIndex        =   2
      Text            =   "0"
      Top             =   360
      Width           =   375
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   1560
      TabIndex        =   1
      Text            =   "0"
      Top             =   360
      Width           =   375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   375
      Left            =   2760
      TabIndex        =   0
      Top             =   1680
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
Form1.Cls
Dim k1%, k2%, h1%, h2%
k1 = Text1.Text
h1 = Text2.Text
k2 = Text3.Text
h2 = Text4.Text
Print Movable(k1, h1, k2, h2)
End Sub

Private Sub Command2_Click()
Dim mFileS As New FileSystemObject
Dim mFile As File
Dim mtxt As TextStream
Dim k1%, k2%, h1%, h2%, m%
Dim count As Long
mFileS.CreateTextFile ("C:\rule.txt")
Set mFile = mFileS.GetFile("C:\rule.txt")
Set mtxt = mFile.OpenAsTextStream(ForWriting)
For k1 = -7 To 7
For h1 = 1 To 7
For h2 = 0 To 7
For k2 = -7 To 7
m = Movable(k1, h1, k2, h2)
mtxt.WriteLine ("PMove(" & k1 & "," & h1 & "," & k2 & "," & h2 & ")=" & m)
count = count + 1
Next
Next
Next
Next
Print count
End Sub

Private Sub Command3_Click()
Command1.Enabled = False
End Sub
