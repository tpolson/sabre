#tag Class
Protected Class cmdLogin
Implements Command
	#tag Method, Flags = &h0
		Sub Constructor(ByRef data As Dictionary)
		  me.data=data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  dim ccUI As ccUI_Control=data.Value(kCMD_CONTROL)
		  
		  //connect and assign database
		  if SabreDatabaseManager.Setup then
		    dim cm As Command
		    dim cmdData As new Dictionary
		    
		    //create new workspace
		    cm=new cmdCreateWorkspace
		    cm.execute
		    
		    //hide inputFields
		    ccUI.inputField(0).Visible=False
		    ccUI.inputField(1).Visible=False
		    
		    //updates projects menu
		    //top menu
		    cmdData.Value(kCMD_MENU_LIST)=SabreDatabaseManager.ProjectsList
		    cmdData.Value(kCMD_PAGETYPE)=kPG_PROJECTS
		    cmdData.Value(kCMD_CONTROL)=ccMenu(0)
		    cmdData.Value(kCMD_PROJECT_ID)=data.Value(kCMD_PROJECT_ID)
		    
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
