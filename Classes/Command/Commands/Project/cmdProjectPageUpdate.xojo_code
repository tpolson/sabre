#tag Class
Protected Class cmdProjectPageUpdate
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
		  dim projectTable As String=data.Value(kCMD_COMMAND)
		  
		  //set database
		  cmdData.Value(kCMD_PROJECT_ID)=ccWorkspace.projectID
		  
		  //get column names
		  cmdData.Value(projectTable)=SabreDatabaseManager.GetTableColumns(ccWorkspace.projectID, projectTable)
		  
		  //get data
		  cmdData.Value(kDB_PROJECTS)=SabreDatabaseManager.GetDataFromTable(cmdData, projectTable)
		  
		  //assign control
		  cmdData.Value(kCMD_CONTROL)=ccWorkspace
		  
		  //update list
		  cmdData.Value(kCMD_COMMAND)=projectTable
		  cmdData.Value(kCMD_DATA)=kDB_PROJECTS
		  cmdData.Value(kPG_DISPLAY_INDEX)=0
		  
		  //display data
		  cm=new cmdPageDisplayUpdate(cmdData)
		  cm.execute
		  
		  ccWorkspace.ccDisplay(0).formLabel(0).Text=projectTable.titleString
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
