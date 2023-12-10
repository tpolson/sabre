#tag Class
Protected Class cmdManageProjects
Implements Command
	#tag Method, Flags = &h0
		Sub Constructor(ByRef data As Dictionary)
		  me.data=data
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute()
		  #pragma DisableBackgroundTasks
		  
		  // Part of the Command interface.
		  dim cm As Command
		  dim cmdData As New Dictionary
		  
		  //set database
		  cmdData.Value(kCMD_PROJECT_ID)=SabreDatabaseManager.kDB_MASTER_NAME
		  
		  //get column names
		  cmdData.Value(kDB_PROJECTS)=SabreDatabaseManager.GetTableColumns(cmdData.Value(kCMD_PROJECT_ID), kDB_PROJECTS)
		  
		  //get data
		  cmdData.Value(kDATA_PROJECTS)=SabreDatabaseManager.GetDataFromTable(cmdData, kDB_PROJECTS)
		  
		  //create new workspace
		  cm=new cmdCreateWorkspace
		  cm.execute
		  
		  //assign control
		  cmdData.Value(kCMD_CONTROL)=ccWorkspace
		  
		  //update list
		  cmdData.Value(kCMD_COMMAND)=kDB_PROJECTS
		  cmdData.Value(kCMD_DATA)=kDATA_PROJECTS
		  
		  cmdData.Value(kUI_LEFT)=0
		  cmdData.Value(kUI_TOP)=defaultFieldHeight*2
		  cmdData.Value(kUI_WIDTH)=ccWorkspace.Width-defaultSidebarWidth*3
		  cmdData.Value(kUI_HEIGHT)=(ccWorkspace.Height*.5)-defaultFieldHeight
		  
		  cmdData.Value(kMENU)=kPROJECT_NEW+DL+kPROJECT_EDIT+DL+kPROJECT_DELETE+DL+kPROJECT_ARCHIVE
		  cmdData.Value(kPG_DISPLAY_INDEX)=0
		  
		  cm=New cmdPageDisplayList(cmdData)
		  cm.execute
		  
		  ccWorkspace.Visible=True
		  
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
