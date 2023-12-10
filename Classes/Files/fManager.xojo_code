#tag Class
Protected Class fManager
	#tag Method, Flags = &h0
		Sub deleteAnything(f as folderitem)
		  dim i as integer
		  
		  if not f.directory then
		    f.delete
		  else
		    for i = f.count downto 1
		      deleteAnything(f.trueitem(i))
		    next
		    f.delete
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getFileList(f As FolderItem) As FileListMBS
		  dim fileList As FileListMBS
		  
		  'f=GetFolderItem("M:\projects\Predator")
		  
		  fileList=new FileListMBS(f)
		  
		  Return fileList
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = kFILE_COUNT, Type = String, Dynamic = False, Default = \"file count", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFILE_EXTENSION, Type = String, Dynamic = False, Default = \"file extension", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFILE_FOLDER, Type = String, Dynamic = False, Default = \"file folder", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFILE_FORMAT, Type = String, Dynamic = False, Default = \"file format", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFILE_NAME, Type = String, Dynamic = False, Default = \"file name", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFILE_NUMBER, Type = String, Dynamic = False, Default = \"file number", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFILE_PREFIX, Type = String, Dynamic = False, Default = \"file prefix", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFILE_START_COUNT, Type = String, Dynamic = False, Default = \"file start count", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFILE_VOLUME, Type = String, Dynamic = False, Default = \"file volume", Scope = Public
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
End Class
#tag EndClass
