#tag Class
Protected Class cmdUserEdit
Implements Command
	#tag Method, Flags = &h0
		Sub Constructor(ByRef data As Dictionary)
		  me.data=data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute()
		  #pragma DisableBackgroundTasks
		  
		  Dim ccUI As ccUI_Control=data.value(kCMD_CONTROL)
		  Dim projectData As New Dictionary
		  Dim i As Integer
		  
		  //load data into dictionary
		  For i=1 To ccUI.maxFieldCount
		    projectData.Value(ccUI.inputField(i).Tag)=ccUI.inputField(i).Text.Trim
		  Next i
		  
		  projectData.Value(kUSER_UPDATE) = ccUI.formFieldList
		  
		  //create new project database and update projects list
		  If SabreDatabaseManager.UserUpdate(projectData) Then
		    Dim cm As Command
		    Dim cmdData As New Dictionary
		    
		    //update list
		    //set database
		    cmdData.Value(kCMD_PROJECT_ID)=SabreDatabaseManager.kDB_MASTER_NAME
		    
		    //get column names
		    cmdData.Value(kDB_USERS)=SabreDatabaseManager.GetTableColumns(cmdData.Value(kCMD_PROJECT_ID), kDB_USERS)
		    
		    //get data
		    cmdData.Value(kDATA_USERS)=SabreDatabaseManager.GetDataFromTable(cmdData, kDB_USERS)
		    
		    //assign control
		    cmdData.Value(kCMD_CONTROL)=ccWorkspace
		    
		    //
		    cmdData.Value(kCMD_COMMAND)=kDB_USERS
		    cmdData.Value(kCMD_DATA)=kDATA_USERS
		    cmdData.Value(kPG_DISPLAY_INDEX)=0
		    
		    cm=New cmdPageDisplayUpdate(cmdData)
		    cm.execute
		    
		    ccUI.Close
		    
		  Else
		    
		    msg "UPDATE USER FAILED"
		    
		  End If
		  
		  
		  
		  
		  
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
