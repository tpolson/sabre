#tag Module
Protected Module UI_shared
	#tag Method, Flags = &h0
		Sub initSelectionIcon()
		  // creates new picture
		  
		  IconSelected= new Picture(10, 10, 32)
		  IconUnselected= new Picture(10, 10, 32)
		  
		  
		  // fill with color
		  IconSelected.Graphics.ForeColor = cMOUSE_OVER
		  
		  #if TargetMacOS then
		    IconUnselected.Graphics.ForeColor =RGB(237,237,237)
		  #else
		    IconUnselected.Graphics.ForeColor =cDRKGRY
		  #endif
		  
		  IconSelected.Graphics.FillRect 0,0,10,10
		  IconUnselected.Graphics.FillRect 0,0,10,10
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pageAButton()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		currentIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		IconSelected As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		IconUnselected As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		parentIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		sysBorder As Integer = 20
	#tag EndProperty

	#tag Property, Flags = &h0
		sysFont As String = """""""""""""""System"""""""""""""""
	#tag EndProperty

	#tag Property, Flags = &h0
		sysFontSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		tableColumnsCache As Dictionary
	#tag EndProperty


	#tag Constant, Name = kAPP_TITLE, Type = String, Dynamic = False, Default = \"SabreTrac", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCANCEL, Type = String, Dynamic = False, Default = \"CANCEL", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kCLOSE, Type = String, Dynamic = False, Default = \"CLOSE", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDATA_GROUPS, Type = String, Dynamic = False, Default = \"data_groups", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDATA_PRIVILEGES, Type = String, Dynamic = False, Default = \"data_privileges", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDATA_PROJECTS, Type = String, Dynamic = False, Default = \"data_projects", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDATA_SCENES, Type = String, Dynamic = False, Default = \"data_scenes", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDATA_USERS, Type = String, Dynamic = False, Default = \"data_users", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEXIT, Type = String, Dynamic = False, Default = \"EXIT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFILE_UPREZ, Type = String, Dynamic = False, Default = \"FILE UPREZ", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGROUP_CREATE, Type = String, Dynamic = False, Default = \"CREATE NEW GROUP", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGROUP_DELETE, Type = String, Dynamic = False, Default = \"DELETE GROUP", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGROUP_EDIT, Type = String, Dynamic = False, Default = \"EDIT GROUP", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGROUP_NEW, Type = String, Dynamic = False, Default = \"NEW GROUP", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kGROUP_UPDATE, Type = String, Dynamic = False, Default = \"UPDATE GROUP", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kIMPORT_REVERT, Type = String, Dynamic = False, Default = \"REVERT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLOGIN, Type = String, Dynamic = False, Default = \"LOGIN", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLOGOUT, Type = String, Dynamic = False, Default = \"LOGOUT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMANAGE_EDITORIAL, Type = String, Dynamic = False, Default = \"Editorial", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMANAGE_FILE_MANAGER, Type = String, Dynamic = False, Default = \"File Manager", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMANAGE_GROUPS, Type = String, Dynamic = False, Default = \"groups", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMANAGE_IMPORT, Type = String, Dynamic = False, Default = \"Import", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMANAGE_PREFERENCES, Type = String, Dynamic = False, Default = \"PREFERENCES", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMANAGE_PRIVILEGES, Type = String, Dynamic = False, Default = \"privileges", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMANAGE_PROJECTS, Type = String, Dynamic = False, Default = \"Manage Projects", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMANAGE_SETUP, Type = String, Dynamic = False, Default = \"Setup", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMANAGE_USERS, Type = String, Dynamic = False, Default = \"users", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMANAGE_USERS_GROUPS, Type = String, Dynamic = False, Default = \"Users - Groups", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMENU, Type = String, Dynamic = False, Default = \"MENU", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMENU_BOT, Type = String, Dynamic = False, Default = \"BOTTOM MENU", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMENU_TAG, Type = String, Dynamic = False, Default = \"MENU TAG", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMENU_TOP, Type = String, Dynamic = False, Default = \"TOP MENU", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMENU_TYPE, Type = String, Dynamic = False, Default = \"MENU TYPE", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOK, Type = String, Dynamic = False, Default = \"OK", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_DISPLAY, Type = String, Dynamic = False, Default = \"DISPLAY", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_DISPLAY_INDEX, Type = String, Dynamic = False, Default = \"DISPLAY INDEX", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_GROUP_NEW, Type = String, Dynamic = False, Default = \"NEW GROUP SETTINGS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_HOME, Type = String, Dynamic = False, Default = \"HOME", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_MANAGE_PROJECTS, Type = String, Dynamic = False, Default = \"MANAGE PROJECTS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_MANAGE_USERS_GROUPS, Type = String, Dynamic = False, Default = \"MANAGE USERS AND GROUPS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_MENU, Type = String, Dynamic = False, Default = \"MENU", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_PROJECTS, Type = String, Dynamic = False, Default = \"PROJECTS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_PROJECT_EDIT, Type = String, Dynamic = False, Default = \"EDIT PROJECT SETTINGS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_PROJECT_NEW, Type = String, Dynamic = False, Default = \"NEW PROJECT SETTINGS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_SYSTEM_SETUP, Type = String, Dynamic = False, Default = \"SYSTEM SETUP", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_USER_EDIT, Type = String, Dynamic = False, Default = \"EDIT USER SETTINGS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_USER_NEW, Type = String, Dynamic = False, Default = \"NEW USER SETTINGS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPG_WORKSPACE, Type = String, Dynamic = False, Default = \"WORKSPACE", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_ARCHIVE, Type = String, Dynamic = False, Default = \"ARCHIVE PROJECT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_CREATE, Type = String, Dynamic = False, Default = \"CREATE NEW PROJECT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_DELETE, Type = String, Dynamic = False, Default = \"DELETE PROJECT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_DELIVERABLES, Type = String, Dynamic = False, Default = \"DELIVERABLES", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_EDIT, Type = String, Dynamic = False, Default = \"EDIT PROJECT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_FILEPATHS, Type = String, Dynamic = False, Default = \"FILES PATHS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_FORMAT, Type = String, Dynamic = False, Default = \"FORMAT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_LIST, Type = String, Dynamic = False, Default = \"PROJECT LIST", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_LOAD, Type = String, Dynamic = False, Default = \"SELECT PROJECT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_NEW, Type = String, Dynamic = False, Default = \"NEW PROJECT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_PREFERENCES, Type = String, Dynamic = False, Default = \"PREFERENCES", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_REVIEW, Type = String, Dynamic = False, Default = \"REVIEW", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_SCHEDULE, Type = String, Dynamic = False, Default = \"SCHEDULE", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_TASKS, Type = String, Dynamic = False, Default = \"TASKS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_TEMPLATES, Type = String, Dynamic = False, Default = \"TEMPLATES", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPROJECT_UPDATE, Type = String, Dynamic = False, Default = \"UPDATE PROJECT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSUBMENU, Type = String, Dynamic = False, Default = \"SUBMENU", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSYSTEM_ACCOUNT, Type = String, Dynamic = False, Default = \"SYSTEM ACCOUNT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSYSTEM_FOLDERS, Type = String, Dynamic = False, Default = \"SYSTEM FOLDERS", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUI_HEIGHT, Type = String, Dynamic = False, Default = \"HEIGHT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUI_LEFT, Type = String, Dynamic = False, Default = \"LEFT", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUI_TOP, Type = String, Dynamic = False, Default = \"TOP", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUI_WIDTH, Type = String, Dynamic = False, Default = \"WIDTH", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUSER_CREATE, Type = String, Dynamic = False, Default = \"CREATE NEW USER", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUSER_DELETE, Type = String, Dynamic = False, Default = \"DELETE USER", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUSER_EDIT, Type = String, Dynamic = False, Default = \"EDIT USER", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUSER_NAME, Type = String, Dynamic = False, Default = \"USER NAME", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUSER_NEW, Type = String, Dynamic = False, Default = \"NEW USER", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUSER_PASSWORD, Type = String, Dynamic = False, Default = \"USER PASSWORD", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUSER_UPDATE, Type = String, Dynamic = False, Default = \"UPDATE USER", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWARNING_DUPLICATE_NAME, Type = String, Dynamic = False, Default = \"DUPLICATE NAME", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWARNING_GROUP_NAME, Type = String, Dynamic = False, Default = \"GROUP NAME REQUIRED", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWARNING_PROJECT_NAME, Type = String, Dynamic = False, Default = \"PROJECT NAME REQUIRED", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="currentIndex"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultButtonBevel"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultButtonHeight"
			Group="Behavior"
			InitialValue="24"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultButtonSpace"
			Group="Behavior"
			InitialValue="4"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultButtonWidth"
			Group="Behavior"
			InitialValue="116"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultColumnPad"
			Group="Behavior"
			InitialValue="40"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultColumnWidth"
			Group="Behavior"
			InitialValue="20"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultFieldHeight"
			Group="Behavior"
			InitialValue="26"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultFieldWidth"
			Group="Behavior"
			InitialValue="116"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultMenuHeight"
			Group="Behavior"
			InitialValue="36"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultSidebarWidth"
			Group="Behavior"
			InitialValue="170"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultSliderMargin"
			Group="Behavior"
			InitialValue="40"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultTopMargin"
			Group="Behavior"
			InitialValue="10"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IconSelected"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IconUnselected"
			Group="Behavior"
			Type="Picture"
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
			Name="parentIndex"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sysBorder"
			Group="Behavior"
			InitialValue="20"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sysFont"
			Group="Behavior"
			InitialValue="""""""""""""""""""""""""""""System"""""""""""""""""""""""""""""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sysFontSize"
			Group="Behavior"
			Type="Integer"
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
