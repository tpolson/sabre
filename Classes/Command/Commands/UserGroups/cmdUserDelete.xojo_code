#tag Class
Protected Class cmdUserDelete
Implements Command
	#tag Method, Flags = &h0
		Sub Constructor(ByRef data As Dictionary)
		  me.data=data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  #pragma DisableBackgroundTasks
		  
		  Dim ccUI As ccUI_Control=data.value(kCMD_CONTROL)
		  dim username As String
		  
		  if ccUI.dataListbox(1).ListIndex<>-1 then
		    
		    username=ccUI.dataListbox(1).RowTag(ccUI.dataListbox(1).ListIndex)
		    
		    if username<>"admin" then
		      data.Value("username")=username
		      
		      //delete group
		      If SabreDatabaseManager.UserDelete(data) Then
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
		        
		      Else
		        
		        msg "DELETE USER FAILED"
		        
		      End If
		      
		    else
		      msg "NOT ALLOWED"
		      
		    end if
		    
		  else
		    msg "SELECT USER"
		    
		  end if
		  
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
