#tag Class
Protected Class cmdManageUsersGroups
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
		  cmdData.Value(kMANAGE_USERS)=SabreDatabaseManager.GetTableColumns(data.Value(kCMD_PROJECT_ID),kDB_USERS)
		  cmdData.Value(kMANAGE_GROUPS)=SabreDatabaseManager.GetTableColumns(data.Value(kCMD_PROJECT_ID),kDB_GROUPS)
		  cmdData.Value(kMANAGE_PRIVILEGES)=SabreDatabaseManager.GetTableColumns(data.Value(kCMD_PROJECT_ID),kDB_PRIVILEGES)
		  
		  //get data
		  cmdData.Value(kDATA_USERS)=SabreDatabaseManager.GetDataFromTable(cmdData, kMANAGE_USERS)
		  cmdData.Value(kDATA_GROUPS)=SabreDatabaseManager.GetDataFromTable(cmdData, kMANAGE_GROUPS)
		  cmdData.Value(kDATA_PRIVILEGES)=SabreDatabaseManager.GetDataFromTable(cmdData, kMANAGE_PRIVILEGES)
		  
		  //create new workspace
		  cm=new cmdCreateWorkspace
		  cm.execute
		  
		  //update
		  cmdData.Value(kCMD_CONTROL)=ccWorkspace
		  
		  //update list users
		  cmdData.Value(kCMD_COMMAND)=kMANAGE_USERS
		  cmdData.Value(kCMD_DATA)=kDATA_USERS
		  
		  cmdData.Value(kUI_LEFT)=0
		  cmdData.Value(kUI_TOP)=defaultFieldHeight*2
		  cmdData.Value(kUI_WIDTH)=ccWorkspace.Width-defaultSidebarWidth*4
		  cmdData.Value(kUI_HEIGHT)=(ccWorkspace.Height*.5)-defaultFieldHeight
		  
		  cmdData.Value(kMENU)=kUSER_NEW+DL+kUSER_EDIT+DL+kUSER_DELETE
		  cmdData.Value(kPG_DISPLAY_INDEX)=0
		  
		  cm=New cmdPageDisplayList(cmdData)
		  cm.execute
		  
		  //update list groups
		  cmdData.Value(kCMD_COMMAND)=kMANAGE_GROUPS
		  cmdData.Value(kCMD_DATA)=kDATA_GROUPS
		  
		  cmdData.Value(kUI_LEFT)=0
		  cmdData.Value(kUI_TOP)=((ccWorkspace.Height-defaultButtonHeight)*.5)+defaultFieldHeight+defaultButtonSpace
		  cmdData.Value(kUI_WIDTH)=ccWorkspace.Width*.5-defaultSidebarWidth*2
		  cmdData.Value(kUI_HEIGHT)=(ccWorkspace.Height*.5)-defaultFieldHeight
		  
		  cmdData.Value(kMENU)=kGROUP_NEW+DL+kGROUP_EDIT+DL+kGROUP_DELETE
		  cmdData.Value(kPG_DISPLAY_INDEX)=1
		  
		  cm=New cmdPageDisplayList(cmdData)
		  cm.execute
		  
		  //update list privileges
		  cmdData.Value(kCMD_COMMAND)=kMANAGE_PRIVILEGES
		  cmdData.Value(kCMD_DATA)=kDATA_PRIVILEGES
		  
		  cmdData.Value(kUI_LEFT)=ccWorkspace.Width*.5-defaultSidebarWidth*2
		  cmdData.Value(kUI_TOP)=((ccWorkspace.Height-defaultButtonHeight)*.5)+defaultFieldHeight+defaultButtonSpace
		  cmdData.Value(kUI_WIDTH)=ccWorkspace.Width*.5-defaultSidebarWidth*2
		  cmdData.Value(kUI_HEIGHT)=(ccWorkspace.Height*.5)-defaultFieldHeight
		  
		  cmdData.Value(kMENU)=kNULL
		  cmdData.Value(kPG_DISPLAY_INDEX)=2
		  
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
