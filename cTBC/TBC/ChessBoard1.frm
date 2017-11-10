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
   Begin VB.CheckBox IsMsg 
      Caption         =   "Hint Message Mode"
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
      Left            =   2400
      TabIndex        =   42
      Top             =   9120
      Width           =   2535
   End
   Begin VB.Timer AutoMove 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   5520
      Top             =   240
   End
   Begin VB.CommandButton Command6 
      Caption         =   "E R"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   9600
      TabIndex        =   41
      Top             =   7320
      Width           =   855
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Command5"
      Height          =   495
      Left            =   9840
      TabIndex        =   40
      Top             =   8520
      Width           =   615
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   37
      Text            =   "6"
      Top             =   8400
      Width           =   735
   End
   Begin VB.Frame Frame2 
      Caption         =   " See Storage"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   5160
      TabIndex        =   34
      Top             =   8280
      Width           =   4335
      Begin VB.CommandButton Command4 
         Caption         =   "Show Blue"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   2520
         TabIndex        =   36
         Top             =   480
         Width           =   1455
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Show Red"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   480
         TabIndex        =   35
         Top             =   480
         Width           =   1455
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Compute"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   5520
      TabIndex        =   32
      Top             =   7320
      Width           =   1575
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
            Name            =   "Arial"
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
            Name            =   "Arial"
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
            Name            =   "Arial"
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
            Name            =   "Arial"
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
            Name            =   "Arial"
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
            Name            =   "Arial"
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
      Caption         =   "TakeBack"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   7560
      TabIndex        =   0
      Top             =   7320
      Width           =   1695
   End
   Begin VB.Label Label2 
      Caption         =   "steps: 0"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2400
      TabIndex        =   39
      Top             =   7920
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Search Depth:"
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
      Left            =   2400
      TabIndex        =   38
      Top             =   8400
      Width           =   1695
   End
   Begin VB.Label TurnName 
      Caption         =   "Red to go"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2400
      TabIndex        =   33
      Top             =   7320
      Width           =   2295
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
Dim flag%, l%, k%, tk%
Private Sub AutoMove_Timer()
Moving
End Sub
Private Sub Moving()
Select Case flag
Case 0
    PCircle(l).FillColor = CHost
    If MState.s = Produce Then
    flag = 1
    Else
    PCircle(MState.x + 6 * MState.y).FillColor = CCan
    flag = 3
    End If
    AutoMove.Enabled = True
Case 1
    tk = Board(l Mod 6, l \ 6).pTop
    Storage(k) = Storage(k) - 1
    Record_p l Mod 6, l \ 6, k
    If Steps < 2 Then
    Board(l Mod 6, l \ 6).pTop = k
    Else
    Pproduce l Mod 6, l \ 6, k
    Ppop l Mod 6, l \ 6
    End If
    Reseume
    PCircle(l).FillColor = CProduce
    flag = 2
Case 2
    If Steps >= 2 Then Ppush l Mod 6, l \ 6, tk
    NextTurn
    Reseume
    flag = 0
    AutoMove.Enabled = False
    BoardLock = False
Case 3
    Record l Mod 6, l \ 6, MState
    DoMove l Mod 6, l \ 6, MState
    Reseume
    PCircle(MState.x + 6 * MState.y).FillColor = CHost
    flag = 4
Case 4
    NextTurn
    Reseume
    flag = 0
    AutoMove.Enabled = False
    BoardLock = False
End Select
End Sub
Private Sub Command1_Click()
If BoardLock Then Exit Sub
If Steps > 0 Then
UndoMove Recs(Steps)
Turn = -Turn
TurnName.Caption = IIf(Turn = 1, "Red to go", "Blue to go")
Steps = Steps - 1
Label2.Caption = "steps: " & Steps
Else
Beep
End If
Reseume
End Sub

Private Sub Command2_Click()
Dim tm As MoveMsg
If BoardLock Then Exit Sub
'Text1.Text = 6
If IsMsg.Value = 0 Then
TurnName.Caption = "Thinking..."
Reseume
BoardLock = True
FBoardOut
tm = ConnecttoC
l = tm.l1 \ 4 + 6 * (tm.l1 Mod 4)
MState.s = tm.s
MState.x = tm.ltag \ 4
MState.y = tm.ltag Mod 4
k = tm.k * Turn
Moving
Else
FBoardOut
MsgBox ConnecttoC.info
End If
End Sub



Private Sub Command3_Click()
Visit = 1
ChooseBox.Show
End Sub

Private Sub Command4_Click()
Visit = -1
ChooseBox.Show
End Sub

Private Sub Command5_Click()
Dim tm As MoveMsg
If BoardLock Then Exit Sub
'Text1.Text = 7
If IsMsg.Value = 0 Then
TurnName.Caption = "Thinking..."
Reseume
BoardLock = True
FBoardOut
tm = ConnecttoC1
l = tm.l1 \ 4 + 6 * (tm.l1 Mod 4)
MState.s = tm.s
MState.x = tm.ltag \ 4
MState.y = tm.ltag Mod 4
k = tm.k * Turn
Moving
Else
FBoardOut
MsgBox ConnecttoC1.info
End If
End Sub

Private Sub Command6_Click()
Dim ts As PState
If BoardLock Then Exit Sub
If Steps > 2 Then
If Recs(Steps - 1).methed = Carry And Recs(Steps - 1).methed = Carry Then
    ts.x = Recs(Steps).x2: ts.y = Recs(Steps).y2: ts.s = Exchange
    Record Recs(Steps - 1).x2, Recs(Steps - 1).y2, ts
    DoMove Recs(Steps - 1).x2, Recs(Steps - 1).y2, ts
    NextTurn
    Reseume
    Exit Sub
End If
End If
Beep
End Sub

Private Sub Form_Load()
StartGame
BoardLock = False
End Sub
Public Sub Draw()
ChessBoard.Cls
Dim x As Integer, y As Integer, xx%, yy%
xx = 600
yy = 6800
For x = 0 To 5
For y = 0 To 3
FrameX(x, y) = 1600 * x + xx + 800
FrameY(x, y) = -1600 * y + yy - 800
Next
Next
For x = 0 To 6
Line1(x).x1 = 1600 * x + xx
Line1(x).x2 = 1600 * x + xx
Line1(x).y1 = yy
Line1(x).y2 = yy - 4 * 1600
Next
For y = 0 To 4
Line1(y + 7).y1 = -1600 * y + yy
Line1(y + 7).y2 = -1600 * y + yy
Line1(y + 7).x1 = xx
Line1(y + 7).x2 = xx + 6 * 1600
Next
For x = 0 To 5
For y = 0 To 3
PCircle(x + 6 * y).height = 1200
PCircle(x + 6 * y).Width = 1200
PCircle(x + 6 * y).Left = FrameX(x, y) - 600
PCircle(x + 6 * y).Top = FrameY(x, y) - 600
Next
Next
For x = 0 To 23
PName(x).Font.Bold = True
PName(x).Top = PCircle(x).Top + 170
PName(x).Left = PCircle(x).Left + 140
Next
For x = 0 To 5
Heap(x).Visible = False
Next
End Sub


Public Sub Redraw()
Dim h%, x%, y%, n%, t%
For x = 0 To 5
For y = 0 To 3
  h = Board(x, y).height
  For n = 1 To h - 1
  t = 800 - 200 * (n - 1) / (h - 1)
    Circle (FrameX(x, y), FrameY(x, y)), t
  Next
Next
Next
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = 2 Then Reseume
End Sub

Public Sub PName_Click(Index As Integer)
Static ts As PState, n%
If BoardLock Then Exit Sub
If Steps < 2 And Board(Index Mod 6, Index \ 6).pTop = Rock Then
  Host = Index
  Visit = 0
  ChooseBox.Show
  Exit Sub
End If
If Host = Index Then
    If Board(Index Mod 6, Index \ 6).pUnder(Board(Index Mod 6, Index \ 6).height - 1) = Rock Or KnightBack = True Then
      Visit = 0
      ChooseBox.Show
    Else
    Reseume
    End If
    Exit Sub
End If
If Not PSelected(Index) = 0 Then
  ts.x = Index Mod 6: ts.y = Index \ 6: ts.s = PSelected(Index)
  Record Host Mod 6, Host \ 6, ts
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
        If Board(Host Mod 6, Host \ 6).pUnder(Board(Host Mod 6, Host \ 6).height - 1) = Rock Then
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

Private Sub PName_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
If MLock = False Then
MLock = True
ShowHeap Index Mod 6, Index \ 6
End If
End Sub
Public Sub ShowHeap(x%, y%)
Dim n%
For n = 1 To 6
If n > Board(x, y).height Then Heap(n - 1).Visible = False Else Heap(n - 1).Visible = True
If n < Board(x, y).height Then
showH n, Board(x, y).pUnder(n)
ElseIf n = Board(x, y).height Then
showH n, Board(x, y).pTop
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
Turn = -Turn
If Steps > 0 And CountM(Turn) = 0 Then
MsgBox (IIf(Turn = -1, "Red", "Blue") & " wins!")
StartGame
Else
TurnName.Caption = IIf(Turn = 1, "Red to go", "Blue to go")
Steps = Steps + 1
Label2.Caption = "steps: " & Steps
End If
End Sub

Public Sub Reseume()
Dim x%, y%
ClPs
For x = 0 To 5
For y = 0 To 3
Apear x, y, Board(x, y).pTop
If Board(x, y).pTop = Rock And Board(x, y).height = 0 Then PCircle(x + 6 * y).Visible = False
Next
Next
End Sub

Private Sub Text1_Change()
Select Case Text1.Text
Case 1
Case 2
Case 3
Case 4
Case 5
Case 6
Case 7
Case 8
Case 9
Case Else
Text1.Text = 6
End Select
End Sub

