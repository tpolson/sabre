#tag Window
Begin Window mainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   2127706111
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
   Begin Label mainLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   13
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // SpeedUpPragmas
		  // -------------------------------
		  #if DebugBuild
		    #pragma BoundsChecking True
		    #pragma BackgroundTasks False
		    #pragma StackOverflowChecking True
		    #pragma NilObjectChecking True
		  #else
		    #pragma BoundsChecking False
		    #pragma BackgroundTasks False  // change as needed
		    #pragma StackOverflowChecking False
		    #pragma NilObjectChecking False
		  #endif
		  // -------------------------------
		  
		  //main window config
		  me.Visible=False
		  me.Width=Screen(0).AvailableWidth*.75
		  me.Height=Screen(0).AvailableHeight*.75
		  me.Left=Screen(0).AvailableWidth*.5-me.Width*.5
		  me.Top=Screen(0).AvailableHeight*.5-me.Height*.5
		  me.Title=kAPP_TITLE+" "+str(app.MajorVersion)+"."+str(app.MinorVersion)+"."+str(app.BugVersion)
		  me.HasBackColor=True
		  me.BackColor=cBG
		  
		  //main logo
		  mainLabel(0).Left=defaultTopMargin
		  mainLabel(0).Top=defaultButtonSpace
		  mainLabel(0).Width=defaultSidebarWidth
		  mainLabel(0).Height=defaultButtonHeight
		  mainLabel(0).Text=kAPP_TITLE
		  mainLabel(0).TextColor=cTXT
		  mainLabel(0).TextSize=16
		  mainLabel(0).Bold=True
		  
		  //create main window columns
		  Dim ml As  mainLabel
		  
		  for i As Integer=0 to 1
		    ml = New mainLabel
		  next i
		  
		  // general info label
		  mainLabel(1).Left=mainLabel(0).Left+defaultSidebarWidth
		  mainLabel(1).Top=defaultTopMargin-2
		  mainLabel(1).Width=me.Width*.5
		  mainLabel(1).Height=mainLabel(0).Height
		  mainLabel(1).Text=""
		  mainLabel(1).TextColor=cTXT
		  mainLabel(1).TextSize=sysFontSize
		  mainLabel(1).LockRight=True
		  mainLabel(1).Visible=True
		  
		  //status
		  mainLabel(2).Width=defaultButtonSpace*100
		  mainLabel(2).Left=me.Width-mainLabel(2).Width-defaultTopMargin
		  mainLabel(2).Top=defaultTopMargin
		  mainLabel(2).Height=mainLabel(0).Height
		  mainLabel(2).Text=kLOGOUT
		  mainLabel(2).TextAlign=2
		  mainLabel(2).TextColor=cTXT
		  mainLabel(2).TextSize=sysFontSize
		  mainLabel(2).Bold=True
		  mainLabel(2).LockBottom=False
		  mainLabel(2).LockLeft=False
		  mainLabel(2).LockRight=True
		  mainLabel(2).LockTop=True
		  mainLabel(2).Visible=False
		  
		  //add top menu
		  dim cmdData As new Dictionary
		  ccMenu.Append(new ccUI_Control)
		  
		  cmdData.Value(kMENU_TOP)=True
		  cmdData.Value(kMENU_TAG)=kPG_MENU
		  cmdData.Value(kMENU_TYPE)=kLOGIN
		  cmdData.Value(kCMD_CONTROL)=ccMenu(0)
		  cmdData.Value(kCURRENT_CONTROL)=me
		  
		  //default user and password
		  #if DebugBuild then
		    cmdData.Value(kUSER_NAME)="admin"
		    cmdData.Value(kUSER_PASSWORD)="admin"
		    'cmdData.Value(kUSER_NAME)="joe"
		    'cmdData.Value(kUSER_PASSWORD)="joe"
		  #endif
		  
		  dim cmd As New cmdMenuCreate(cmdData)
		  cmd.execute
		  
		  //add bot menu
		  ccMenu.Append(new ccUI_Control)
		  
		  cmdData.Value(kMENU_TOP)=False
		  cmdData.Value(kMENU_TYPE)=""
		  cmdData.Value(kCMD_CONTROL)=ccMenu(1)
		  
		  cmd=new cmdMenuCreate(cmdData)
		  cmd.execute
		  
		  me.Maximize
		  
		  me.Visible=True
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"10 - Drawer Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
