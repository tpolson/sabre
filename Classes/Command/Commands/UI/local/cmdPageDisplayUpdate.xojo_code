#tag Class
Protected Class cmdPageDisplayUpdate
Implements Command
	#tag Method, Flags = &h0
		Sub Constructor(ByRef Data As Dictionary)
		  me.data=data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  #pragma DisableBackgroundTasks
		  
		  dim cm As Command
		  dim cmdData As new Dictionary
		  dim ccUI As ccUI_Control=data.Value(kCMD_CONTROL)
		  dim displayIndex As Integer=data.Value(kPG_DISPLAY_INDEX)
		  
		  //get schema
		  cmdData.Value(kCMD_CONTROL)=ccUI.ccDisplay(displayIndex)
		  cmdData.Value(kCMD_TABLE_COLUMNS)=data.Value(data.Value(kCMD_COMMAND))
		  
		  //pass data
		  cmdData.Value(kCMD_DATA)=data.Value(data.Value(kCMD_DATA))
		  
		  //update header
		  cm=new cmdListboxHeader(cmdData)
		  cm.execute
		  
		  //get table data
		  cm=new cmdListboxUpdate(cmdData)
		  cm.execute
		  
		  
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
