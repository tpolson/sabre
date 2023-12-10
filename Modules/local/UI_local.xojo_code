#tag Module
Protected Module UI_local
	#tag Method, Flags = &h0
		Sub LockWindow(hw As Integer)
		  #if TargetWin32 Then
		    Declare Sub LockWindowUpdate Lib "user32" (ByVal hWnd As Integer)
		    LockWindowUpdate hw
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		cBG As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		ccForm As ccUI_Control
	#tag EndProperty

	#tag Property, Flags = &h0
		ccMenu(-1) As ccUI_Control
	#tag EndProperty

	#tag Property, Flags = &h0
		ccWorkspace As ccUI_Control
	#tag EndProperty

	#tag Property, Flags = &h0
		cDRKGRY As Color = &c404040
	#tag EndProperty

	#tag Property, Flags = &h0
		cMOUSE_OVER As Color = &cFF8030
	#tag EndProperty

	#tag Property, Flags = &h0
		cSPACER As Color = &c202020
	#tag EndProperty

	#tag Property, Flags = &h0
		cTXT As Color = &cC0C0C0
	#tag EndProperty

	#tag Property, Flags = &h0
		cWARNING As Color = &cBB0000
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultButtonBevel As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultButtonHeight As Integer = 24
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultButtonSpace As Integer = 4
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultButtonWidth As Integer = 116
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultColumnPad As Integer = 40
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultColumnWidth As Integer = 20
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultFieldHeight As Integer = 26
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultFieldWidth As Integer = 116
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultMenuHeight As Integer = 36
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultSidebarWidth As Integer = 170
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultSliderMargin As Integer = 40
	#tag EndProperty

	#tag Property, Flags = &h0
		defaultTopMargin As Integer = 10
	#tag EndProperty


	#tag Constant, Name = kIMPORT_REVERT, Type = String, Dynamic = False, Default = \"REVERT", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSUBMENU, Type = String, Dynamic = False, Default = \"SUBMENU", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="cBG"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cDRKGRY"
			Group="Behavior"
			InitialValue="&c404040"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cMOUSE_OVER"
			Group="Behavior"
			InitialValue="&cFF8030"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cSPACER"
			Group="Behavior"
			InitialValue="&c202020"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cTXT"
			Group="Behavior"
			InitialValue="&cC0C0C0"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cWARNING"
			Group="Behavior"
			InitialValue="&cBB0000"
			Type="Color"
		#tag EndViewProperty
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
End Module
#tag EndModule
