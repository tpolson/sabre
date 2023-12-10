#tag Class
Protected Class cmdCreateWorkspace
Implements Command
	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  if ccWorkspace<>nil then ccWorkspace.Close
		  
		  ccWorkspace = new ccUI_Control
		  ccWorkspace.EmbedWithin mainWindow,0,ccMenu(0).Top+ccMenu(0).Height,mainWindow.Width,mainWindow.Height-ccMenu(0).Top-ccMenu(0).Height*2
		  ccWorkspace.LockBottom=True
		  ccWorkspace.LockLeft=True
		  ccWorkspace.LockRight=True
		  ccWorkspace.LockTop=True
		  ccWorkspace.Visible=False
		  
		  ccWorkspace.Tag=kPG_WORKSPACE
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
