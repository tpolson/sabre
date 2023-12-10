#tag Class
Protected Class cmdMenuUpdateTop
Implements Command
	#tag Method, Flags = &h0
		Sub Constructor(ByRef data As Dictionary)
		  me.data=data
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  #pragma DisableBackgroundTasks
		  
		  dim ccUI As ccUI_Control=data.Value(kCMD_CONTROL)
		  dim menuList As Variant=data.Value(kCMD_MENU_LIST)
		  dim i As Integer
		  dim projectList As Dictionary=menuList
		  dim menuCount As Integer=projectList.Count
		  dim keys() As Variant=projectList.Keys
		  
		  //add enough buttons
		  if ccUI.menuButtonCount<menuCount then ccUI.addControls(menuCount+1, ccUI.menuButton(0))
		  
		  for i=0 to menuCount
		    if i<=menuCount then
		      
		      if i=0 then ccUI.menuButton(i).Caption=kPG_HOME else  ccUI.menuButton(i).Caption=projectList.Value(keys(i-1))
		      ccUI.menuButton(i).Left=defaultTopMargin*2+(defaultButtonWidth+defaultButtonSpace)*i
		      ccUI.menuButton(i).Top=defaultTopMargin-4
		      ccUI.menuButton(i).Width=defaultButtonWidth
		      ccUI.menuButton(i).Height=defaultButtonHeight
		      
		      ccUI.menuButton(i).Tag=kPG_PROJECTS
		      if i>0 then ccUI.menuButton(i).projectID=keys(i-1)
		      ccUI.menuButton(i).AllowSelectionIcon=True
		      ccUI.menuButton(i).Visible=True
		      
		    else
		      ccUI.menuButton(i).AllowSelectionIcon=False
		      ccUI.menuButton(i).Visible=False
		      
		    end if
		    
		  next
		  
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
