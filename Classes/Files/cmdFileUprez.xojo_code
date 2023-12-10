#tag Class
Protected Class cmdFileUprez
Implements Command
	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  dim cm As Command
		  dim cmdData As New Dictionary
		  
		  //create new workspace
		  cm=new cmdCreateWorkspace
		  cm.execute
		  
		  //assign control
		  cmdData.Value(kCMD_CONTROL)=ccWorkspace
		  
		  //update list
		  cmdData.Value(kCMD_COMMAND)=kDB_SCENES
		  cmdData.Value(kCMD_DATA)=kDATA_SCENES
		  
		  cmdData.Value(kUI_LEFT)=0
		  cmdData.Value(kUI_TOP)=defaultFieldHeight*2
		  cmdData.Value(kUI_WIDTH)=ccWorkspace.Width-defaultSidebarWidth*3
		  cmdData.Value(kUI_HEIGHT)=(ccWorkspace.Height*.5)-defaultFieldHeight
		  
		  cmdData.Value(kMENU)= kDB_SCENES+DL+kDB_SHOTS+DL+kDB_TASKS+DL+kDB_NOTES
		  cmdData.Value(kPG_DISPLAY_INDEX)=0
		  
		  cm=New cmdPageDisplayList(cmdData)
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
