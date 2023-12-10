#tag Module
Protected Module DatabaseManager
	#tag Note, Name = notes
		
		maybe try and get rid of this method, but it is designed to try to hold all database related variables
	#tag EndNote


	#tag Property, Flags = &h0
		currentDB As String
	#tag EndProperty

	#tag Property, Flags = &h0
		currentProject As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SabreDatabaseManager As dbManager
	#tag EndProperty


	#tag Constant, Name = kDB_GROUPS, Type = String, Dynamic = False, Default = \"groups", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_NOTES, Type = String, Dynamic = False, Default = \"notes", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_PRIVILEGES, Type = String, Dynamic = False, Default = \"privileges", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_PROJECTS, Type = String, Dynamic = False, Default = \"projects", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_SCENES, Type = String, Dynamic = False, Default = \"scenes", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_SEQUENCES, Type = String, Dynamic = False, Default = \"sequences", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_SETTINGS, Type = String, Dynamic = False, Default = \"settings", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_SHOTS, Type = String, Dynamic = False, Default = \"shots", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_STATUS, Type = String, Dynamic = False, Default = \"status", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_STATUS_TYPE, Type = String, Dynamic = False, Default = \"status_type", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_SYSTEM, Type = String, Dynamic = False, Default = \"system", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_TASKS, Type = String, Dynamic = False, Default = \"tasks", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_TEMPLATES, Type = String, Dynamic = False, Default = \"templates", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_TYPES, Type = String, Dynamic = False, Default = \"types", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_USERS, Type = String, Dynamic = False, Default = \"users", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_USER_IMAGES, Type = String, Dynamic = False, Default = \"user_images", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLOGOUT, Type = String, Dynamic = False, Default = \"LOG OUT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOFFLINE, Type = String, Dynamic = False, Default = \"OFFLINE", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kONLINE, Type = String, Dynamic = False, Default = \"ONLINE", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="currentDB"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentProject"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
