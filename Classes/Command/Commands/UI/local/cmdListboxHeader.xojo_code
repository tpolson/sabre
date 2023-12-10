#tag Class
Protected Class cmdListboxHeader
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
		  dim columnHeader As New Dictionary
		  dim headerName As String
		  dim listboxWidth As Integer
		  dim columnWidth As String=str(defaultColumnWidth)
		  
		  columnHeader=data.Value(kCMD_TABLE_COLUMNS)
		  
		  if ccUI.dataListbox(0).LastIndex=-1 then ccUI.dataListbox(0).AddRow ""
		  
		  ccUI.dataListbox(0).ColumnCount=columnHeader.Count+1
		  
		  for i As Integer=1 to columnHeader.Count
		    headerName=columnHeader.Value(i-1)
		    
		    ccUI.dataListbox(0).Cell(0,i)=headerName.titleString
		    ccUI.dataListbox(0).ColumnTag(i)=headerName
		    
		    listboxWidth=listboxWidth+headerName.StringWidth+defaultColumnPad
		    columnWidth=columnWidth+","+str(headerName.StringWidth+defaultColumnPad)
		    
		  next i
		  
		  ccUI.dataListbox(0).Height=defaultFieldHeight
		  ccUI.dataListbox(0).isHeader=True
		  ccUI.dataListbox(0).ColumnWidths=columnWidth
		  
		  ccUI.dataListbox(1).DeleteAllRows
		  ccUI.dataListbox(1).ColumnCount=ccUI.dataListbox(0).ColumnCount
		  ccUI.dataListbox(1).ColumnWidths=columnWidth
		  ccUI.dataListBox(1).ColumnWidthTotal=listboxWidth
		  ccUI.dataListbox(1).isHeader=False
		  
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
