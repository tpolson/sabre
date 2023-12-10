#tag Module
Protected Module Globals
	#tag Property, Flags = &h0
		appCache As Dictionary
	#tag EndProperty


	#tag Constant, Name = kCMD_COMMAND, Type = String, Dynamic = False, Default = \"COMMAND", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCMD_CONTROL, Type = String, Dynamic = False, Default = \"ccUI", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCMD_CONTROL_TAG, Type = String, Dynamic = False, Default = \"CONTROL TAG", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCMD_DATA, Type = String, Dynamic = False, Default = \"COMMAND DATA", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCMD_MENU_LIST, Type = String, Dynamic = False, Default = \"MENU LIST", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCMD_PAGETYPE, Type = String, Dynamic = False, Default = \"PAGE TYPE", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCMD_PROJECT_ID, Type = String, Dynamic = False, Default = \"projectID", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCMD_PROJECT_LIST, Type = String, Dynamic = False, Default = \"PROJECT LIST", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCMD_PROJECT_NAME, Type = String, Dynamic = False, Default = \"project_name", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCMD_TABLE_COLUMNS, Type = String, Dynamic = False, Default = \"TABLE COLUMNS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCMD_TABLE_NAME, Type = String, Dynamic = False, Default = \"table_name", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCURRENT_CONTROL, Type = String, Dynamic = False, Default = \"Current Control", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFIELDS_SCENE_NAME, Type = String, Dynamic = False, Default = \"scene_name", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNULL, Type = String, Dynamic = False, Default = \"NULL", Scope = Public
	#tag EndConstant


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
End Module
#tag EndModule
