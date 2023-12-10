#tag Class
Protected Class cmdProjectDisplay
Implements Command
	#tag Method, Flags = &h0
		Sub Constructor(ByRef Data As Dictionary)
		  me.data=data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  dim cm As Command
		  dim cmdData As new Dictionary
		  dim ccUI As ccUI_Control=data.Value(kCMD_CONTROL)
		  ccUI.ccDisplay = new ccUI_Control
		  
		  ccUI.ccDisplay.EmbedWithin ccUI,defaultSidebarWidth,defaultButtonHeight, ccUI.Width-defaultSidebarWidth, ccUI.Height-defaultButtonHeight
		  
		  ccUI.ccDisplay.addControls(1,ccUI.dataListbox(0))
		  
		  ccUI.ccDisplay.LockBottom=True
		  ccUI.ccDisplay.LockLeft=True
		  ccUI.ccDisplay.LockRight=True
		  ccUI.ccDisplay.LockTop=True
		  ccUI.ccDisplay.Tag=kPG_DISPLAY
		  
		  //get schema
		  cmdData.Value(kCMD_PROJECT_ID)=data.Value(kCMD_PROJECT_ID)
		  
		  ccUI.ccDisplay.dataListbox(0).Top=0
		  ccUI.ccDisplay.dataListbox(0).Left=0
		  ccUI.ccDisplay.dataListbox(0).Width=ccUI.ccDisplay.Width-(ccUI.ccDisplay.dataListbox(0).Left*2)-defaultSidebarWidth*4
		  ccUI.ccDisplay.dataListbox(0).Height=defaultButtonHeight
		  ccUI.ccDisplay.dataListbox(0).DefaultRowHeight=defaultFieldHeight
		  ccUI.ccDisplay.dataListbox(0).GridLinesVertical=Listbox.BorderThinSolid
		  ccUI.ccDisplay.dataListbox(0).GridLinesHorizontal=Listbox.BorderThinSolid
		  ccUI.ccDisplay.dataListbox(0).ScrollBarVertical=False
		  ccUI.ccDisplay.dataListbox(0).ScrollBarHorizontal=False
		  
		  cmdData.Value(kCMD_CONTROL)=ccUI.ccDisplay
		  cmdData.Value(kCMD_COMMAND)=data.Value(kCMD_COMMAND)
		  cmdData.Value(kCMD_TABLE_COLUMNS)=data.Value(kCMD_TABLE_COLUMNS)
		  cmdData.Value(kCMD_TABLE_NAME)=kDB_SCENES ////////////////////////////////////////add default variable to store in db
		  
		  //set header
		  cm=new cmdListboxHeader(cmdData) // change to cache. cache before new workspace
		  cm.execute
		  
		  ccUI.ccDisplay.dataListbox(1).Top=ccUI.ccDisplay.dataListbox(0).Top+ccUI.ccDisplay.dataListbox(0).Height+defaultButtonSpace
		  ccUI.ccDisplay.dataListbox(1).Left=0
		  ccUI.ccDisplay.dataListbox(1).Width=ccUI.ccDisplay.dataListbox(0).Width
		  ccUI.ccDisplay.dataListbox(1).Height=ccUI.ccDisplay.Height-defaultButtonHeight*3
		  ccUI.ccDisplay.dataListbox(1).DefaultRowHeight=defaultFieldHeight
		  ccUI.ccDisplay.dataListbox(1).GridLinesVertical=Listbox.BorderThinSolid
		  ccUI.ccDisplay.dataListbox(1).GridLinesHorizontal=Listbox.BorderThinSolid
		  ccUI.ccDisplay.dataListbox(1).ScrollBarVertical=False
		  ccUI.ccDisplay.dataListbox(1).ScrollBarHorizontal=False
		  ccUI.ccDisplay.dataListbox(1).SelectionType=Listbox.SelectionMultiple
		  ccUI.ccDisplay.dataListbox(1).LockBottom=True
		  ccUI.ccDisplay.dataListbox(1).LockLeft=True
		  ccUI.ccDisplay.dataListbox(1).LockRight=False
		  ccUI.ccDisplay.dataListbox(1).LockTop=True
		  
		  //get table data
		  cm=new cmdListboxUpdate(cmdData)
		  cm.execute
		  
		  ccUI.ccDisplay.dataListbox(0).Visible=True
		  ccUI.ccDisplay.dataListbox(1).Visible=True
		  
		  ccUI.ccDisplay.ScrollVertical.Top=ccUI.ccDisplay.dataListbox(1).Top
		  ccUI.ccDisplay.ScrollVertical.Left=ccUI.ccDisplay.dataListbox(1).Left+ccUI.ccDisplay.dataListbox(1).Width+defaultTopMargin
		  ccUI.ccDisplay.ScrollVertical.Width=defaultFieldHeight
		  ccUI.ccDisplay.ScrollVertical.Height=ccUI.ccDisplay.dataListbox(1).Height
		  ccUI.ccDisplay.ScrollVertical.LiveScroll=True
		  ccUI.ccDisplay.ScrollVertical.Visible=True
		  
		  ccUI.ccDisplay.ScrollHorizontal.Top =ccUI.ccDisplay.dataListbox(1).Top+ccUI.ccDisplay.dataListBox(1).Height+defaultTopMargin
		  ccUI.ccDisplay.ScrollHorizontal.Left=ccUI.ccDisplay.dataListbox(1).Left
		  ccUI.ccDisplay.ScrollHorizontal.Height=defaultFieldHeight
		  ccUI.ccDisplay.ScrollHorizontal.Width=ccUI.ccDisplay.dataListbox(1).Width
		  ccUI.ccDisplay.ScrollHorizontal.LiveScroll=True
		  ccUI.ccDisplay.ScrollHorizontal.Visible=False
		  
		  'ccUI.ccDisplay.Rectangle1.Visible=True
		  'ccUI.ccDisplay.Rectangle2.Visible=True
		  'ccUI.ccDisplay.Rectangle3.Visible=True
		  'ccUI.ccDisplay.Rectangle4.Visible=True
		  
		  ccUI.ccDisplay.Visible=True
		  
		  //bottom menu
		  cmdData.Clear
		  cmdData.Value(kCMD_PROJECT_LIST)=kMANAGE_SETUP+DL+kMANAGE_PROJECTS+DL+kNULL+DL+kMANAGE_FILE_MANAGER+DL+kMANAGE_IMPORT
		  cmdData.Value(kCMD_PAGETYPE)=kPG_PROJECTS
		  cmdData.Value(kCMD_CONTROL)=ccMenu(1)
		  
		  cm =new cmdMenuUpdateBot(cmdData)
		  cm.execute
		  
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
