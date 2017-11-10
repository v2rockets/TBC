VERSION 5.00
Begin VB.Form ChessBoard 
   Caption         =   "Form2"
   ClientHeight    =   9825
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10830
   LinkTopic       =   "Form2"
   ScaleHeight     =   9825
   ScaleWidth      =   10830
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      Height          =   495
      Left            =   7080
      TabIndex        =   33
      Top             =   8280
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   615
      Left            =   5040
      TabIndex        =   32
      Top             =   7680
      Width           =   1335
   End
   Begin VB.Timer PRefresh 
      Interval        =   250
      Left            =   4680
      Top             =   240
   End
   Begin VB.Frame Frame1 
      Caption         =   "Heap"
      Height          =   2415
      Left            =   240
      TabIndex        =   25
      Top             =   7200
      Width           =   1935
      Begin VB.Label Heap 
         BackColor       =   &H00808000&
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "MingLiU"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   31
         Top             =   240
         Width           =   1695
      End
      Begin VB.Label Heap 
         BackColor       =   &H000000FF&
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "MingLiU"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   30
         Top             =   600
         Width           =   1695
      End
      Begin VB.Label Heap 
         BackColor       =   &H000000FF&
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "MingLiU"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   29
         Top             =   960
         Width           =   1695
      End
      Begin VB.Label Heap 
         BackColor       =   &H000000FF&
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "MingLiU"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   28
         Top             =   1320
         Width           =   1695
      End
      Begin VB.Label Heap 
         BackColor       =   &H000000FF&
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "MingLiU"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   27
         Top             =   1680
         Width           =   1695
      End
      Begin VB.Label Heap 
         BackColor       =   &H000000FF&
         Caption         =   "Label1"
         BeginProperty Font 
            Name            =   "MingLiU"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   26
         Top             =   2040
         Width           =   1695
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   615
      Left            =   6960
      TabIndex        =   0
      Top             =   6960
      Width           =   1455
   End
   Begin VB.Label TurnName 
      Caption         =   "red"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2400
      TabIndex        =   34
      Top             =   7320
      Width           =   1815
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   0
      Left            =   5760
      TabIndex        =   1
      Top             =   1080
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   23
      Left            =   3840
      TabIndex        =   24
      Top             =   1440
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   22
      Left            =   1560
      TabIndex        =   23
      Top             =   2520
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   21
      Left            =   3960
      TabIndex        =   22
      Top             =   2640
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   20
      Left            =   0
      TabIndex        =   21
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   19
      Left            =   0
      TabIndex        =   20
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   18
      Left            =   0
      TabIndex        =   19
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   17
      Left            =   0
      TabIndex        =   18
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   16
      Left            =   0
      TabIndex        =   17
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   15
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   14
      Left            =   0
      TabIndex        =   15
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   13
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   12
      Left            =   0
      TabIndex        =   13
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   11
      Left            =   0
      TabIndex        =   12
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   10
      Left            =   0
      TabIndex        =   11
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   9
      Left            =   0
      TabIndex        =   10
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   8
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   7
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   6
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   5
      Left            =   0
      TabIndex        =   6
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   4
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   3
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   2
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   975
   End
   Begin VB.Label PName 
      BackStyle       =   0  'Transparent
      Caption         =   "石"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   1
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   975
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   23
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   22
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   21
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   20
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   19
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   18
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   17
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   16
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   15
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   14
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   13
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   12
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   11
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   10
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   9
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   8
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   7
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   6
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   5
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   4
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   3
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   2
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      FillColor       =   &H00C0C0C0&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   1
      Left            =   0
      Shape           =   3  'Circle
      Top             =   0
      Width           =   1455
   End
   Begin VB.Shape PCircle 
      BackColor       =   &H80000002&
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   1215
      Index           =   0
      Left            =   5520
      Shape           =   3  'Circle
      Top             =   840
      Width           =   1455
   End
   Begin VB.Line Line1 
      Index           =   11
      X1              =   0
      X2              =   600
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Line Line1 
      Index           =   10
      X1              =   0
      X2              =   600
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Line Line1 
      Index           =   9
      X1              =   0
      X2              =   600
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Line Line1 
      Index           =   8
      X1              =   0
      X2              =   600
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Line Line1 
      Index           =   7
      X1              =   0
      X2              =   600
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Line Line1 
      Index           =   6
      X1              =   0
      X2              =   600
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Line Line1 
      Index           =   5
      X1              =   0
      X2              =   600
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Line Line1 
      Index           =   4
      X1              =   0
      X2              =   600
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Line Line1 
      Index           =   3
      X1              =   0
      X2              =   600
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Line Line1 
      Index           =   2
      X1              =   0
      X2              =   600
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Line Line1 
      Index           =   1
      X1              =   0
      X2              =   600
      Y1              =   0
      Y2              =   720
   End
   Begin VB.Line Line1 
      Index           =   0
      X1              =   360
      X2              =   960
      Y1              =   360
      Y2              =   1080
   End
End
Attribute VB_Name = "ChessBoard"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Command1_Click()
Redraw
End Sub

Private Sub Command2_Click()
Ppop 3, 3
Ppush 3, 3, 4
Ppush 1, 1, -1
Reseume
End Sub

Private Sub Command3_Click()
Form1.Show
End Sub

Private Sub Form_Load()
StartGame
End Sub
Public Sub Draw()
ChessBoard.Cls
Dim X As Integer, Y As Integer, xx%, yy%
xx = 600
yy = 6800
For X = 0 To 5
For Y = 0 To 3
FrameX(X, Y) = 1600 * X + xx + 800
FrameY(X, Y) = -1600 * Y + yy - 800
Next
Next
For X = 0 To 6
Line1(X).x1 = 1600 * X + xx
Line1(X).x2 = 1600 * X + xx
Line1(X).y1 = yy
Line1(X).y2 = yy - 4 * 1600
Next
For Y = 0 To 4
Line1(Y + 7).y1 = -1600 * Y + yy
Line1(Y + 7).y2 = -1600 * Y + yy
Line1(Y + 7).x1 = xx
Line1(Y + 7).x2 = xx + 6 * 1600
Next
For X = 0 To 5
For Y = 0 To 3
PCircle(X + 6 * Y).height = 1200
PCircle(X + 6 * Y).Width = 1200
PCircle(X + 6 * Y).Left = FrameX(X, Y) - 600
PCircle(X + 6 * Y).Top = FrameY(X, Y) - 600
Next
Next
For X = 0 To 23
PName(X).Font.Bold = True
PName(X).Top = PCircle(X).Top + 170
PName(X).Left = PCircle(X).Left + 140
Next
For X = 0 To 5
Heap(X).Visible = False
Next
End Sub


Public Sub Redraw()
Dim h%, X%, Y%, n%, t%
For X = 0 To 5
For Y = 0 To 3
  h = Board(X, Y).height
  For n = 1 To h - 1
  t = 800 - 200 * (n - 1) / (h - 1)
    Circle (FrameX(X, Y), FrameY(X, Y)), t
  Next
Next
Next
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 2 Then Reseume
End Sub

Public Sub PName_Click(Index As Integer)
Static ts As PState, n%
If Steps < 2 And Board(Index Mod 6, Index \ 6).pTop = Rock Then
  Host = Index
  ChooseBox.Show
  Exit Sub
End If
If Host = Index Then
  ChooseBox.Show
  Exit Sub
End If
If Not PSelected(Index) = 0 Then
  ts.X = Index Mod 6: ts.Y = Index \ 6: ts.s = PSelected(Index)
  Recs(Steps + 1) = Record(Host Mod 6, Host \ 6, ts)
  DoMove Host Mod 6, Host \ 6, ts
  NextTurn
  Reseume
  'Apear Host Mod 6, Host \ 6, Board(Host Mod 6, Host \ 6).pTop
  'Apear Index Mod 6, Index \ 6, Board(Index Mod 6, Index \ 6).pTop
Else
Reseume
  If JudgePiece(Index Mod 6, Index \ 6) Then
    For n = 0 To 23
      If n = Host Then
        If PSelected(n) = Produce Then
          PCircle(n).FillColor = IIf(KnightBack, CKBP, CProduce)
        Else
          PCircle(n).FillColor = IIf(KnightBack, CCan, CHost)
        End If
      Else
        If Not PSelected(n) = 0 Then
          PCircle(n).FillColor = CCan
        End If
      End If
    Next
  Else
  Beep
  End If
End If
End Sub

Private Sub PName_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If MLock = False Then
MLock = True
ShowHeap Index Mod 6, Index \ 6
End If
End Sub
Public Sub ShowHeap(X%, Y%)
Dim n%
For n = 1 To 6
If n > Board(X, Y).height Then Heap(n - 1).Visible = False Else Heap(n - 1).Visible = True
If n < Board(X, Y).height Then
showH n, Board(X, Y).pUnder(n)
ElseIf n = Board(X, Y).height Then
showH n, Board(X, Y).pTop
End If
Next
End Sub

Private Sub PRefresh_Timer()
Static t%
t = t + 1
If t = 10 Then t = 0: ChessBoard.Cls
MLock = False
Redraw
End Sub

Private Sub showH(n%, k%)
Heap(n - 1).Caption = n & " " & PieceName(Abs(k))
If k > 0 Then
Heap(n - 1).BackColor = CRed
ElseIf k < 0 Then
Heap(n - 1).BackColor = CBlue
Else
Heap(n - 1).BackColor = CEmpty
End If
End Sub
Public Sub Apear(pX As Integer, pY As Integer, k As Integer)
PCircle(pX + 6 * pY).Visible = True
If k > 0 Then
PCircle(pX + 6 * pY).FillColor = CRed
PName(pX + 6 * pY).Caption = ChineseName(k)
ElseIf k < 0 Then
PCircle(pX + 6 * pY).FillColor = CBlue
PName(pX + 6 * pY).Caption = ChineseName(-k)
Else
PCircle(pX + 6 * pY).FillColor = CEmpty
PName(pX + 6 * pY).Caption = ""
End If
End Sub

Public Sub NextTurn()
If Steps > 1 And IsWin(Board, Turn) Then
MsgBox (IIf(Turn = 1, "Red", "Blue") & "wins!")
StartGame
Else
Turn = -Turn
TurnName.Caption = IIf(Turn = 1, "red", "blue")
Steps = Steps + 1
End If
End Sub

Public Sub Reseume()
Dim X%, Y%
ClPs
For X = 0 To 5
For Y = 0 To 3
Apear X, Y, Board(X, Y).pTop
If Board(X, Y).pTop = Rock And Board(X, Y).height = 0 Then PCircle(X + 6 * Y).Visible = False
Next
Next
End Sub
