VERSION 5.00
Begin VB.Form ChooseBox 
   Caption         =   "Form2"
   ClientHeight    =   3690
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4980
   LinkTopic       =   "Form2"
   ScaleHeight     =   3690
   ScaleWidth      =   4980
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command1 
      Caption         =   "Return"
      Height          =   495
      Left            =   3360
      TabIndex        =   10
      Top             =   3000
      Width           =   1095
   End
   Begin VB.CommandButton Button2 
      Caption         =   "Stay here"
      Height          =   495
      Left            =   1800
      TabIndex        =   1
      Top             =   3000
      Width           =   1095
   End
   Begin VB.CommandButton Button1 
      Caption         =   "Suicide"
      Enabled         =   0   'False
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   3000
      Width           =   975
   End
   Begin VB.Frame Frame1 
      Caption         =   "Frame1"
      Height          =   2775
      Left            =   240
      TabIndex        =   2
      Top             =   120
      Width           =   4455
      Begin VB.Label show_num 
         BackColor       =   &H00FFFF80&
         Caption         =   "  3"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   18
         Top             =   240
         Width           =   735
      End
      Begin VB.Label show_num 
         BackColor       =   &H00FFFF80&
         Caption         =   "  3"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   7
         Left            =   2880
         TabIndex        =   17
         Top             =   1560
         Width           =   735
      End
      Begin VB.Label show_num 
         BackColor       =   &H00FFFF80&
         Caption         =   "  3"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   6
         Left            =   1800
         TabIndex        =   16
         Top             =   1560
         Width           =   735
      End
      Begin VB.Label show_num 
         BackColor       =   &H00FFFF80&
         Caption         =   "  3"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   720
         TabIndex        =   15
         Top             =   1560
         Width           =   735
      End
      Begin VB.Label show_num 
         BackColor       =   &H00FFFF80&
         Caption         =   "  3"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   3480
         TabIndex        =   14
         Top             =   240
         Width           =   735
      End
      Begin VB.Label show_num 
         BackColor       =   &H00FFFF80&
         Caption         =   "  3"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   2400
         TabIndex        =   13
         Top             =   240
         Width           =   735
      End
      Begin VB.Label show_num 
         BackColor       =   &H00FFFF80&
         Caption         =   "  3"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   1320
         TabIndex        =   12
         Top             =   240
         Width           =   735
      End
      Begin VB.Label name_produce 
         BackColor       =   &H00FFFFC0&
         Caption         =   "炮"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   36
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   6
         Left            =   2880
         TabIndex        =   9
         Top             =   1800
         Width           =   735
      End
      Begin VB.Label name_produce 
         BackColor       =   &H00FFFFC0&
         Caption         =   "兵"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   36
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   5
         Left            =   1800
         TabIndex        =   8
         Top             =   1800
         Width           =   735
      End
      Begin VB.Label name_produce 
         BackColor       =   &H00FFFFC0&
         Caption         =   "象"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   36
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   4
         Left            =   720
         TabIndex        =   7
         Top             =   1800
         Width           =   735
      End
      Begin VB.Label name_produce 
         BackColor       =   &H00FFFFC0&
         Caption         =   "马"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   36
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   3
         Left            =   3480
         TabIndex        =   6
         Top             =   480
         Width           =   735
      End
      Begin VB.Label name_produce 
         BackColor       =   &H00FFFFC0&
         Caption         =   "车"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   36
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   2
         Left            =   2400
         TabIndex        =   5
         Top             =   480
         Width           =   735
      End
      Begin VB.Label name_produce 
         BackColor       =   &H00FFFFC0&
         Caption         =   "将"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   36
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   0
         Left            =   240
         TabIndex        =   4
         Top             =   480
         Width           =   735
      End
      Begin VB.Label name_produce 
         BackColor       =   &H00FFFFC0&
         Caption         =   "士"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   36
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Index           =   1
         Left            =   1320
         TabIndex        =   3
         Top             =   480
         Width           =   735
      End
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFF80&
      Caption         =   "  3"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   1560
      TabIndex        =   11
      Top             =   360
      Width           =   735
   End
End
Attribute VB_Name = "ChooseBox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim k As Integer, h%, x%, y%

Private Sub Button1_Click()
Record_s x, y
Ppop x, y
MakeMove
End Sub

Private Sub Button2_Click()
Dim cps As PState
cps.s = Carry
cps.x = x
cps.y = y
Record x, y, cps
MakeMove
End Sub

Private Sub Command1_Click()
Unload ChooseBox
End Sub

Private Sub Form_Load()
ChessBoard.Enabled = False
If Visit = 0 Then
    x = Host Mod 6
    y = Host \ 6
        h = Board(x, y).height
    For k = 1 To 7
        show_num(k).Caption = "  " & Storage(k * Turn)
        show_num(k).BackColor = IIf(Storage(k * Turn) > 0, CCan, CEmpty)
        name_produce(k - 1).BackColor = IIf(Turn = 1, CRed, CBlue)
        name_produce(k - 1).Enabled = True
    If Steps > 1 And (Storage(Turn * k) <= 0 Or Not Board(Host Mod 6, Host \ 6).pUnder(h - 1) = Rock) Then
        name_produce(k - 1).Enabled = False
        name_produce(k - 1).BackColor = CEmpty
    End If
    Next
    If h > 2 Then
        name_produce(1).BackColor = CEmpty
        name_produce(1).Enabled = False
    End If
    Button2.Enabled = KnightBack
Else
    For k = 1 To 7
        name_produce(k - 1).Enabled = False
        name_produce(k - 1).BackColor = IIf(Visit = 1, CRed, CBlue)
        show_num(k).BackColor = IIf(Storage(k * Visit) > 0, CKBP, CEmpty)
        show_num(k).Caption = "  " & Storage(k * Visit)
    Next
    Button2.Enabled = False
End If
'Button1.Enabled = (Steps > 1)
End Sub


Private Sub MakeMove()
ChessBoard.NextTurn
ChessBoard.Reseume
Unload ChooseBox
End Sub


Private Sub Form_Unload(Cancel As Integer)
ChessBoard.Enabled = True
End Sub

Private Sub name_produce_Click(Index As Integer)
k = (Index + 1) * Turn
Storage(k) = Storage(k) - 1
Record_p x, y, k
If Steps < 2 Then
  Board(x, y).pTop = k
Else
  Pproduce x, y, k
End If
MakeMove
End Sub
