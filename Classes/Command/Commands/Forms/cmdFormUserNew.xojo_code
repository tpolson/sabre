#tag Class
Protected Class cmdFormUserNew
Implements Command
	#tag Method, Flags = &h0
		Sub Constructor(ByRef data As Dictionary)
		  me.data=data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute()
		  #pragma DisableBackgroundTasks
		  
		  Dim tableColumns as Dictionary=SabreDatabaseManager.GetTableColumns(SabreDatabaseManager.kDB_MASTER_NAME, kDB_USERS)
		  dim ccUI As ccUI_Control=data.Value(kCMD_CONTROL)
		  dim tableKeys() As Variant
		  dim tableKey As Variant
		  dim i As Integer
		  
		  If tableColumns<>nil Then
		    ccForm = New ccUI_Control
		    
		    tableKeys=tableColumns.Keys
		    
		    //update buttons
		    ccForm.menuButtonCount=tableColumns.Count
		    ccForm.addControls(ccForm.menuButtonCount, ccUI.formLabel(0))
		    ccForm.addControls(ccForm.menuButtonCount, ccUI.inputField(0))
		    ccForm.Tag=kPG_USER_NEW
		    ccForm.LockLeft=True
		    ccForm.LockTop=True
		    
		    'ccForm.Rectangle1.Visible=True
		    'ccForm.Rectangle2.Visible=True
		    'ccForm.Rectangle3.Visible=True
		    'ccForm.Rectangle4.Visible=True
		    
		    //add form
		    dim formTop As Integer=ccUI.Top
		    dim formWidth As Integer=defaultButtonWidth+(defaultFieldWidth*2)+(defaultTopMargin*4)
		    dim formLeft As Integer=ccUI.Parent.Width-formWidth
		    dim formHeight As Integer=defaultButtonHeight*(ccForm.menuButtonCount+4)
		    
		    ccForm.EmbedWithin ccUI.Parent, formLeft, formTop, formWidth, formHeight
		    
		    //form title
		    ccForm.formLabel(0).Top=0
		    ccForm.formLabel(0).Left=defaultFieldWidth+defaultTopMargin
		    ccForm.formLabel(0).Width=defaultFieldWidth*2
		    ccForm.formLabel(0).Height=defaultFieldHeight
		    ccForm.formLabel(0).Text=kPG_USER_NEW
		    ccForm.formLabel(0).TextLeft
		    ccForm.formLabel(0).LockBottom=False
		    ccForm.formLabel(0).LockLeft=True
		    ccForm.formLabel(0).LockRight=True
		    ccForm.formLabel(0).LockTop=True
		    ccForm.formLabel(0).Visible=True
		    
		    //form fields
		    for each tableKey in tableKeys
		      i=i+1
		      
		      ccForm.formLabel(i).Top=((defaultFieldHeight+defaultTopMargin)*i)
		      ccForm.formLabel(i).Left=0
		      ccForm.formLabel(i).Width=defaultFieldWidth
		      ccForm.formLabel(i).Height=defaultFieldHeight
		      ccForm.formLabel(i).Text=tableColumns.Value(tableKey).titleString
		      ccForm.formLabel(i).TextRight
		      ccForm.formLabel(i).Visible=True
		      
		      ccForm.inputField(i).Left=ccForm.formLabel(0).Left
		      ccForm.inputField(i).Top=ccForm.formLabel(i).Top
		      ccForm.inputField(i).Height=defaultFieldHeight
		      ccForm.inputField(i).Width=defaultFieldWidth*2
		      ccForm.inputField(i).Tag=tableColumns.Value(tableKey).Trim
		      ccForm.inputField(i).TabStop=True
		      ccForm.inputField(i).TabIndex=i
		      ccForm.inputField(i).Visible=True
		      
		      //store field name and control index
		      ccForm.formFieldList.Value(tableColumns.Value(tableKey))=i
		      
		    next
		    
		    ccForm.addControls(1,ccUI.menuButton(0))
		    
		    //form buttons
		    ccForm.menuButton(0).Top=ccForm.inputField(i).Top+defaultButtonHeight+defaultButtonSpace
		    ccForm.menuButton(0).Left=0
		    ccForm.menuButton(0).Width=defaultButtonWidth*2
		    ccForm.menuButton(0).Height=defaultButtonHeight
		    ccForm.menuButton(0).Caption=kUSER_CREATE
		    ccForm.menuButton(0).LockBottom=False
		    ccForm.menuButton(0).LockLeft=True
		    ccForm.menuButton(0).LockRight=False
		    ccForm.menuButton(0).LockTop=True
		    ccForm.menuButton(0).Visible=True
		    
		    ccForm.menuButton(1).Top=ccForm.menuButton(0).Top
		    ccForm.menuButton(1).Left=ccForm.formLabel(0).Left+ccForm.formLabel(0).Width-defaultButtonWidth
		    ccForm.menuButton(1).Width=defaultButtonWidth
		    ccForm.menuButton(1).Height=defaultButtonHeight
		    ccForm.menuButton(1).Caption=kCLOSE
		    ccForm.menuButton(1).LockBottom=False
		    ccForm.menuButton(1).LockLeft=True
		    ccForm.menuButton(1).LockRight=False
		    ccForm.menuButton(1).LockTop=True
		    ccForm.menuButton(1).Visible=True
		    
		    ccForm.Visible=True
		    
		    
		  End If
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
