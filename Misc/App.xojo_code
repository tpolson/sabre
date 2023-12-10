#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // SpeedUpPragmas
		  // -------------------------------
		  #if DebugBuild
		    #pragma BoundsChecking True
		    #pragma BackgroundTasks True
		    #pragma StackOverflowChecking True
		    #pragma NilObjectChecking True
		  #else
		    #pragma BoundsChecking False
		    #pragma BackgroundTasks True  // change as needed
		    #pragma StackOverflowChecking False
		    #pragma NilObjectChecking False
		  #endif
		  // -------------------------------
		  
		  //checks system DPI and adjusts
		  #if TargetWin32 then
		    if largeFont then sysFontSize=10 else sysFontSize=12
		  #endif
		  
		  #if TargetWin32 then
		    defaultButtonBevel=4
		    
		  #elseif TargetMacOS then
		    sysFont="Lucida Grande"
		    
		    defaultButtonBevel=3
		    defaultButtonHeight=20
		    defaultButtonBevelwi=124
		    
		  #endif
		  
		  //init app paths
		  #if DebugBuild then
		    pathApp=app.ExecutableFile.Parent.Parent.NativePath
		    pathTmp=SpecialFolder.Desktop.NativePath
		    pathAppData=SpecialFolder.Desktop
		  #else
		    pathApp=app.ExecutableFile.Parent.NativePath
		    pathTmp=SpecialFolder.Temporary.NativePath
		    pathAppData=SpecialFolder.ApplicationData
		  #endif
		  
		  //init appCache
		  appCache=new Dictionary
		  
		  //init selection icon for menu button
		  initSelectionIcon
		  
		  //assign database server
		  SabreDatabaseManager=new dbManager_CubeSQL
		  
		  //init tableColumnsCache
		  tableColumnsCache=new Dictionary
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		pathApp As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pathAppData As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		pathTmp As String
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="pathApp"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="pathTmp"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
