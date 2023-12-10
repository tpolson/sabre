#tag Class
Protected Class cmdPageDisplayList
Implements Command
	#tag Method, Flags = &h0
		Sub Constructor(ByRef Data As Dictionary)
		  me.data=data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  #pragma DisableBackgroundTasks
		  
		  dim cm As Command
		  dim cmdData As new Dictionary
		  dim ccUI As ccUI_Control=data.Value(kCMD_CONTROL)
		  dim displayIndex As Integer=data.Value(kPG_DISPLAY_INDEX)
		  
		  //add more displays
		  if displayIndex>ccUI.ccDisplay.Ubound then ReDim ccUI.ccDisplay(displayIndex)
		  
		  ccUI.ccDisplay(displayIndex) = new ccUI_Control
		  ccUI.ccDisplay(displayIndex).EmbedWithin ccUI,data.Value(kUI_LEFT),data.Value(kUI_TOP), data.Value(kUI_WIDTH), (ccUI.Height-defaultButtonHeight)*.5
		  
		  //add second datalistbox
		  ccUI.ccDisplay(displayIndex).addControls(1,ccUI.dataListbox(0))
		  
		  ccUI.ccDisplay(displayIndex).LockBottom=True
		  ccUI.ccDisplay(displayIndex).LockLeft=True
		  ccUI.ccDisplay(displayIndex).LockRight=True
		  ccUI.ccDisplay(displayIndex).LockTop=True
		  ccUI.ccDisplay(displayIndex).Tag=kPG_DISPLAY
		  
		  //label
		  ccUI.ccDisplay(displayIndex).formLabel(0).top=0
		  ccUI.ccDisplay(displayIndex).formLabel(0).left=defaultTopMargin*2
		  ccUI.ccDisplay(displayIndex).formLabel(0).width=defaultButtonWidth+defaultTopMargin*2
		  ccUI.ccDisplay(displayIndex).formLabel(0).Height=defaultFieldHeight
		  ccUI.ccDisplay(displayIndex).formLabel(0).TextAlign=Label.AlignCenter
		  ccUI.ccDisplay(displayIndex).formLabel(0).Bold=True
		  ccUI.ccDisplay(displayIndex).formLabel(0).caption=data.Value(kCMD_COMMAND).StringValue.Titlecase
		  
		  //get schema
		  cmdData.Value(kCMD_CONTROL)=ccUI.ccDisplay(displayIndex)
		  cmdData.Value(kCMD_TABLE_COLUMNS)=data.Value(data.Value(kCMD_COMMAND))
		  
		  //pass data
		  cmdData.Value(kCMD_DATA)=data.Value(data.Value(kCMD_DATA))
		  
		  //set header
		  cm=new cmdListboxHeader(cmdData)
		  cm.execute
		  
		  ccUI.ccDisplay(displayIndex).dataListbox(0).Top=0
		  ccUI.ccDisplay(displayIndex).dataListbox(0).Left=defaultSidebarWidth
		  ccUI.ccDisplay(displayIndex).dataListbox(0).Width=ccUI.ccDisplay(displayIndex).Width-ccUI.ccDisplay(displayIndex).dataListbox(0).Left-defaultFieldHeight*2
		  ccUI.ccDisplay(displayIndex).dataListbox(0).DefaultRowHeight=defaultFieldHeight
		  ccUI.ccDisplay(displayIndex).dataListbox(0).GridLinesVertical=Listbox.BorderThinSolid
		  ccUI.ccDisplay(displayIndex).dataListbox(0).GridLinesHorizontal=Listbox.BorderThinSolid
		  ccUI.ccDisplay(displayIndex).dataListbox(0).ScrollBarVertical=False
		  ccUI.ccDisplay(displayIndex).dataListbox(0).ScrollBarHorizontal=False
		  
		  ccUI.ccDisplay(displayIndex).dataListbox(1).Top=ccUI.ccDisplay(displayIndex).dataListbox(0).Top+ccUI.ccDisplay(displayIndex).dataListbox(0).Height+defaultButtonSpace
		  ccUI.ccDisplay(displayIndex).dataListbox(1).Left=ccUI.ccDisplay(displayIndex).dataListbox(0).Left
		  ccUI.ccDisplay(displayIndex).dataListbox(1).Height=ccUI.ccDisplay(displayIndex).Height-ccUI.ccDisplay(displayIndex).dataListbox(1).Top-(defaultFieldHeight*2)-defaultButtonSpace
		  ccUI.ccDisplay(displayIndex).dataListbox(1).Width=ccUI.ccDisplay(displayIndex).dataListbox(0).Width
		  ccUI.ccDisplay(displayIndex).dataListbox(1).DefaultRowHeight=defaultFieldHeight
		  ccUI.ccDisplay(displayIndex).dataListbox(1).GridLinesVertical=Listbox.BorderThinSolid
		  ccUI.ccDisplay(displayIndex).dataListbox(1).GridLinesHorizontal=Listbox.BorderThinSolid
		  ccUI.ccDisplay(displayIndex).dataListbox(1).ScrollBarVertical=False
		  ccUI.ccDisplay(displayIndex).dataListbox(1).ScrollBarHorizontal=False
		  ccUI.ccDisplay(displayIndex).dataListbox(1).SelectionType=Listbox.SelectionSingle
		  ccUI.ccDisplay(displayIndex).dataListbox(1).LockBottom=True
		  ccUI.ccDisplay(displayIndex).dataListbox(1).LockLeft=True
		  ccUI.ccDisplay(displayIndex).dataListbox(1).LockRight=False
		  ccUI.ccDisplay(displayIndex).dataListbox(1).LockTop=True
		  
		  //get table data
		  cm=new cmdListboxUpdate(cmdData)
		  cm.execute
		  
		  //update buttons
		  cmdData.Clear
		  cmdData.Value(kCMD_MENU_LIST)=data.Value(kMENU)  //must make generic
		  cmdData.Value(kCMD_PAGETYPE)=kPG_MANAGE_USERS_GROUPS  //must make generic
		  cmdData.Value(kCMD_CONTROL)=ccUI.ccDisplay(displayIndex)
		  cmdData.Value(kPG_DISPLAY_INDEX)=0
		  
		  cm =new cmdMenuUpdatePage(cmdData)
		  cm.execute
		  
		  //show listboxes
		  ccUI.ccDisplay(displayIndex).dataListbox(0).Visible=True
		  ccUI.ccDisplay(displayIndex).dataListbox(1).Visible=True
		  ccUI.ccDisplay(displayIndex).formLabel(0).visible=True
		  
		  'ccUI.ccDisplay(displayIndex).Rectangle1.Visible=True
		  'ccUI.ccDisplay(displayIndex).Rectangle2.Visible=True
		  'ccUI.ccDisplay(displayIndex).Rectangle3.Visible=True
		  'ccUI.ccDisplay(displayIndex).Rectangle4.Visible=True
		  
		  ccUI.ccDisplay(displayIndex).Visible=True
		  
		  '//bottom menu
		  'cmdData.Clear
		  'cmdData.Value(kCMD_PROJECT_LIST)=kMANAGE_SETUP+DL+kMANAGE_USERS_GROUPS+DL+kMANAGE_PROJECTS+DL+kNULL+DL+kMANAGE_FILE_MANAGER+DL+kMANAGE_IMPORT
		  'cmdData.Value(kCMD_PAGETYPE)=kPG_PROJECTS
		  'cmdData.Value(kCMD_CONTROL)=ccMenu(1)
		  '
		  'cm =new cmdMenuUpdateBot(cmdData)
		  'cm.execute
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		data As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
