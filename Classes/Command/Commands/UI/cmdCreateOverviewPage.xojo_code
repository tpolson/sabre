#tag Class
Protected Class cmdCreateOverviewPage
Implements Command
	#tag Method, Flags = &h0
		Sub execute()
		  // Part of the Command interface.
		  Dim ccWidget(-1) As ccUI_Control
		  Dim projectsList() As Variant=SabreDatabaseManager.ProjectsList.Values
		  Dim widgetLeft As Integer=defaultTopMargin*4
		  Dim widgetTop As Integer=defaultButtonHeight
		  Dim widgetWidth As Integer=300
		  Dim widgetHeight As Integer=200
		  
		  ccWorkspace.Visible=False
		  
		  For i As Integer=0 To projectsList.Ubound
		    ccWidget.Append(New ccUI_Control)
		    
		    if widgetLeft+widgetWidth+defaultButtonWidth>ccWorkspace.Width then
		      ccWidget(i).EmbedWithin ccWorkspace,widgetLeft,widgetTop,widgetWidth,widgetHeight
		      
		      widgetLeft=defaultTopMargin*4
		      widgetTop=widgetTop+widgetHeight+defaultTopMargin
		      
		    else
		      ccWidget(i).EmbedWithin ccWorkspace,widgetLeft,widgetTop,widgetWidth,widgetHeight
		      
		      widgetLeft=widgetLeft+widgetWidth+defaultTopMargin
		      
		    end if
		    
		    ccWidget(i).formLabel(0).top=10
		    ccWidget(i).formLabel(0).Left=10
		    ccWidget(i).formLabel(0).TextColor=cTXT
		    ccWidget(i).formLabel(0).text=projectsList(i)
		    ccWidget(i).formLabel(0).visible=True
		    ccWidget(i).HasBackColor=True
		    ccWidget(i).BackColor=cDRKGRY
		    ccWidget(i).Visible=True
		    
		  Next i
		  
		  ccWorkspace.Visible=True
		End Sub
	#tag EndMethod


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
