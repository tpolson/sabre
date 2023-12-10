#tag Class
Protected Class cmdLogout
Implements Command
	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  'dim ccUI As ccUI_Control=ccMenu(0) 'data.Value(kCMD_CONTROL)
		  
		  //connect and assign database
		  'if SabreDatabaseManager.Setup then
		  dim cm As Command
		  dim cmdData As new Dictionary
		  
		  '//create new workspace
		  'cm=new cmdCreateWorkspace
		  'cm.execute
		  '
		  //hide inputFields
		  'ccMenu(0).inputField(0).Visible=True
		  'ccMenu(0).inputField(1).Visible=True
		  //updates projects menu
		  //top menu
		  'dim menuListNull As new Dictionary
		  'cmdData.Value(kCMD_MENU_LIST)=menuListNull
		  'cmdData.Value(kCMD_PAGETYPE)=kPG_PROJECTS
		  cmdData.Value(kCMD_CONTROL)=ccMenu(0)
		  'cmdData.Value(kCMD_PROJECT_ID)=data.Value(kCMD_PROJECT_ID)
		  
		  cm =new cmdMenuClear(cmdData)
		  cm.execute
		  
		  '//bottom menu
		  'cmdData.Clear
		  'cmdData.Value(kCMD_MENU_LIST)=kMANAGE_SETUP+DL+kMANAGE_USERS_GROUPS+DL+kMANAGE_PROJECTS
		  'cmdData.Value(kCMD_PAGETYPE)=kPG_PROJECTS
		  cmdData.Value(kCMD_CONTROL)=ccMenu(1)
		  
		  cm =new cmdMenuClear(cmdData)
		  cm.execute
		  
		  //close overview in workspace
		  'cm=new cmdCreateOverviewPage
		  'cm.execute
		  
		  if ccWorkspace<>nil then ccWorkspace.Close
		  'end if
		  
		  'ccMenu(0).init
		  'ccMenu(1).init
		End Sub
	#tag EndMethod


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
