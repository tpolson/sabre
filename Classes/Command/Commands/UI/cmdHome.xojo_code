#tag Class
Protected Class cmdHome
Implements Command
	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  
		  //this gets permissions and assign database
		  if SabreDatabaseManager.Setup then
		    dim cm As Command
		    Dim cmdData As New Dictionary
		    
		    //create new workspace
		    cm=new cmdCreateWorkspace
		    cm.execute
		    
		    //updates projects menu
		    //top menu
		    cmdData.Value(kCMD_MENU_LIST)=SabreDatabaseManager.ProjectsList
		    cmdData.Value(kCMD_PAGETYPE)=kPG_PROJECTS
		    cmdData.Value(kCMD_CONTROL)=ccMenu(0)
		    
		    cm =new cmdMenuUpdateTop(cmdData)
		    cm.execute
		    
		    //bottom menu
		    cmdData.Clear
		    cmdData.Value(kCMD_MENU_LIST)=kMANAGE_SETUP+DL+kMANAGE_USERS_GROUPS+DL+kMANAGE_PROJECTS
		    cmdData.Value(kCMD_PAGETYPE)=kPG_PROJECTS
		    cmdData.Value(kCMD_CONTROL)=ccMenu(1)
		    
		    cm =new cmdMenuUpdateBot(cmdData)
		    cm.execute
		    
		    //create overview in workspace
		    cm=new cmdCreateOverviewPage
		    cm.execute
		    
		  end if
		  
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
