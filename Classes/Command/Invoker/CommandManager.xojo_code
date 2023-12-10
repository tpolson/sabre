#tag Class
Protected Class CommandManager
	#tag Method, Flags = &h0
		Sub runCommands()
		  app.MouseCursor=System.Cursors.Wait
		  'mainWindow.Cursor=System.WebCursors.Wait
		  
		  myCommand.execute
		  
		  app.MouseCursor=System.Cursors.StandardPointer
		  'mainWindow.Cursor=System.WebCursors.StandardPointer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCommand(ByRef data As Dictionary)
		  select case data.Value(kCMD_COMMAND)
		  case kEXIT
		    me.myCommand=new cmdExitApp
		    'me.myCommand=new cmdLogout
		    
		  case kLOGIN
		    me.myCommand=new cmdLogin(data)
		    
		  case kLOGOUT
		    me.myCommand=new cmdLogout
		    
		  case kPG_HOME
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdHome
		    
		  case kMANAGE_SETUP
		    me.myCommand=new cmdManageSetup
		    
		  case kMANAGE_PROJECTS
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdManageProjects(data)
		    
		  case kMANAGE_USERS_GROUPS
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdManageUsersGroups(data)
		    
		  case kMANAGE_FILE_MANAGER
		    me.myCommand=new cmdManageFiles
		    
		  case kMANAGE_IMPORT
		    if ccForm<>nil then ccForm.Close
		    if ccWorkspace<>nil then ccWorkspace.Close
		    me.myCommand=new nullCommand
		    
		    //projects commands
		  case kPROJECT_CREATE
		    me.myCommand=new cmdProjectNew(data)
		    
		  case kPROJECT_NEW
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdFormProjectNew(data)
		    
		  case kPROJECT_EDIT
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdFormProjectEdit(data)
		    
		  case kPROJECT_UPDATE
		    me.myCommand=new cmdProjectUpdate(data)
		    
		  case kPROJECT_DELETE
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdProjectDelete(data)
		    
		  case kPROJECT_ARCHIVE
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new nullCommand
		    
		    //user commands
		  case kUSER_CREATE
		    me.myCommand=new cmdUserNew(data)
		    
		  case kUSER_NEW
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdFormUserNew(data)
		    
		  case kUSER_EDIT
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdFormUserEdit(data)
		    
		  case kUSER_UPDATE
		    me.myCommand=new cmdUserEdit(data)
		    
		  case kUSER_DELETE
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdUserDelete(data)
		    
		    //group commands
		  case kGROUP_CREATE
		    me.myCommand=new cmdGroupNew(data)
		    
		  case kGROUP_NEW
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdFormGroupNew(data)
		    
		  case kGROUP_EDIT
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new nullCommand 'cmdFormUserNew(data)
		    
		  case kGROUP_UPDATE
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new nullCommand 'cmdFormUserNew(data)
		    
		  case kGROUP_DELETE
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdGroupDelete(data)
		    
		    //file commands
		  case kFILE_UPREZ
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new cmdFileUprez
		    
		    //system commands
		  case kSYSTEM_ACCOUNT
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new nullCommand
		    
		  case kSYSTEM_FOLDERS
		    if ccForm<>nil then ccForm.Close
		    me.myCommand=new nullCommand
		    
		  case kCLOSE
		    me.myCommand=new cmdCloseControl(data)
		    
		  else
		    //command is name of project
		    //loads projects
		    if data.Value(kCMD_CONTROL_TAG)=kPG_PROJECTS then
		      me.myCommand=new cmdProjectLoad(data)
		      
		    else
		      //updates already loaded project
		      me.myCommand=new cmdProjectPageUpdate(data)
		      
		    end if
		    
		  end select
		  
		  '#if DebugBuild
		  'dictContents(data)
		  '#endif
		  
		  runCommands
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		myCommand As Command
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
