#tag Class
Protected Class cmdMenuCreate
Implements Command
	#tag Method, Flags = &h0
		Sub Constructor(ByRef data As Dictionary)
		  me.data=data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute()
		  //remove menu init in ccUI_Control and put here
		  //must work to create for login and to go back to on logout
		  
		  dim menu_type As String =data.Value(kMENU_TYPE)
		  dim ccUi As ccUI_Control =data.Value(kCMD_CONTROL)
		  dim w As Window =data.Value(kCURRENT_CONTROL)
		  dim isTopMenu As Boolean=data.Value(kMENU_TOP)
		  
		  if isTopMenu then
		    ccUI.EmbedWithin w,0,defaultButtonHeight+defaultTopMargin,w.Width, defaultMenuHeight
		  else
		    ccUI.EmbedWithin w,0,w.Height-defaultFieldHeight-defaultButtonSpace*10, w.Width,defaultMenuHeight
		  end if
		  
		  ccUI.isTopMenu=isTopMenu
		  ccUI.LockBottom=not ccUI.isTopMenu
		  ccUI.LockLeft=True
		  ccUI.LockRight=True
		  ccUI.LockTop=ccUI.isTopMenu
		  ccUI.HasBackColor=True
		  ccUI.BackColor=cSPACER
		  ccUI.myIndex=ccMenu.Ubound
		  ccUI.Tag=data.Value(kMENU_TAG)
		  
		  select case menu_type
		  case kLOGIN
		    //login button
		    ccUI.menuButton(0).Left=defaultTopMargin*2
		    ccUI.menuButton(0).Top=ccUi.Height*.5-defaultButtonHeight*.5
		    ccUI.menuButton(0).Width=defaultButtonWidth
		    ccUI.menuButton(0).Height=defaultButtonHeight
		    ccUI.menuButton(0).Caption=kLOGIN
		    ccUI.menuButton(0).Visible=True
		    
		    #if TargetWin32 then
		      ccUI.menuButton(0).Bevel=defaultButtonBevel
		      defaultFieldHeight=defaultFieldHeight-defaultButtonSpace*2
		    #else
		      ccUI.menuButton(0).Bevel=3
		      defaultFieldHeight=defaultFieldHeight
		    #endif
		    
		    //username
		    ccUI.inputField(0).Left=ccUI.menuButton(0).Left+ccUI.menuButton(0).Width+defaultButtonSpace*2
		    
		    #if TargetWin32 then
		      ccUI.inputField(0).Top=ccUI.menuButton(0).Top+2
		    #else
		      ccUI.inputField(0).Top=ccUI.menuButton(0).Top+1
		    #endif
		    
		    ccUI.inputField(0).Width=defaultFieldWidth
		    ccUI.inputField(0).Height=defaultFieldHeight
		    ccUI.inputField(0).Text=data.Value(kUSER_NAME)
		    ccUI.inputField(0).TextSize=sysFontSize
		    ccUI.inputField(0).TextFont=sysFont
		    ccUI.inputField(0).TextColor=cTXT
		    ccUI.inputField(0).BackColor=cDRKGRY
		    ccUI.inputField(0).Border=False
		    ccUI.inputField(0).LockBottom=True
		    ccUI.inputField(0).LockLeft=True
		    ccUI.inputField(0).LockRight=False
		    ccUI.inputField(0).LockTop=False
		    ccUI.inputField(0).Visible=True
		    
		    //password
		    ccUI.inputField(1).Left=ccUI.inputField(0).Left+ccUI.inputField(0).Width+defaultButtonSpace
		    ccUI.inputField(1).Top=ccUI.inputField(0).Top
		    ccUI.inputField(1).Width=defaultFieldWidth
		    ccUI.inputField(1).Height=defaultFieldHeight
		    ccUI.inputField(1).Text=data.Value(kUSER_PASSWORD)
		    ccUI.inputField(1).TextSize=sysFontSize
		    ccUI.inputField(1).TextFont=sysFont
		    ccUI.inputField(1).Password=True
		    ccUI.inputField(1).TextColor=cTXT
		    ccUI.inputField(1).BackColor=cDRKGRY
		    ccUI.inputField(1).Border=False
		    ccUI.inputField(1).LockBottom=True
		    ccUI.inputField(1).LockLeft=True
		    ccUI.inputField(1).LockRight=False
		    ccUI.inputField(1).LockTop=False
		    ccUI.inputField(1).Visible=True
		    
		  else
		    
		    if not isTopMenu then
		      //exit button
		      ccUI.menuButton(0).Top=ccUi.Height*.5-defaultButtonHeight*.5
		      ccUI.menuButton(0).Width=defaultButtonWidth*.5
		      ccUI.menuButton(0).Left=ccUi.Width-ccUI.menuButton(0).Width-defaultTopMargin*2
		      ccUI.menuButton(0).Caption=kEXIT
		      ccUI.menuButton(0).LockBottom=True
		      ccUI.menuButton(0).LockLeft=False
		      ccUI.menuButton(0).LockRight=True
		      ccUI.menuButton(0).LockTop=False
		      ccUI.menuButton(0).Visible=True
		      
		    end if
		    
		  end select
		  
		  ccUI.Visible=True
		  
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
