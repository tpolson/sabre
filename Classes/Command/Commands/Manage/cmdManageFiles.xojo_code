#tag Class
Protected Class cmdManageFiles
Implements Command
	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  dim cm As Command
		  dim cmdData As New Dictionary
		  
		  //create new workspace
		  cm=new cmdCreateWorkspace
		  cm.execute
		  
		  '//update buttons
		  'cmdData.Value(kCMD_PROJECT_LIST)=kSYSTEM_USERS+DL+kSYSTEM_FOLDERS
		  'cmdData.Value(kCMD_PAGETYPE)=kPG_SYSTEM_SETUP
		  'cmdData.Value(kCMD_CONTROL)=ccWorkspace
		  '
		  'cm =new cmdMenuUpdatePage(cmdData)
		  'cm.execute
		  
		  ccWorkspace.Visible=True
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
