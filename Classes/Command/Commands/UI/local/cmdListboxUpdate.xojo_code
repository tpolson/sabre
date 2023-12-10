#tag Class
Protected Class cmdListboxUpdate
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
		  dim tableKeys() As Variant
		  dim columnKeys() As Variant
		  dim columnData As Dictionary
		  dim tableKey As Variant
		  dim colKey As Variant
		  dim row As Integer
		  dim col As Integer
		  
		  //get data
		  dim tableData As Dictionary=data.Value(kCMD_DATA)
		  
		  //populate listbox
		  tableKeys=tableData.Keys
		  
		  ccUI.dataListbox(1).DeleteAllRows
		  
		  for each tableKey in tableKeys
		    columnData=tableData.Value(tableKey)
		    
		    columnKeys=columnData.Keys
		    
		    ccUI.dataListbox(1).AddRow ""
		    
		    ccUI.dataListbox(1).RowTag(ccUI.dataListbox(1).LastIndex)=tableKey
		    
		    col=1
		    
		    for each colKey in columnKeys
		      ccUI.dataListbox(1).Cell(row, col)=columnData.Value(colKey)
		      ccUI.dataListBox(1).ColumnTag(col)=sabreListBox.kColumnTypeTextField
		      
		      col=col+1
		      
		    next
		    
		    row=row+1
		    
		  next
		  
		  //set scrollbars
		  ccUI.ScrollVertical.Top=ccUI.dataListBox(1).Top
		  ccUI.ScrollVertical.Left=ccUI.dataListbox(1).Left+ccUI.dataListbox(1).Width+defaultTopMargin
		  ccUI.ScrollVertical.Height=ccUI.dataListBox(1).Height
		  ccUI.ScrollVertical.LiveScroll=True
		  
		  if row*ccUI.dataListbox(1).RowHeight>ccUI.dataListbox(1).Height then
		    ccUI.ScrollVertical.Maximum=ccUI.dataListbox(1).ListCount-(ccUI.dataListbox(1).Height/ccUI.dataListbox(1).RowHeight)+1
		    ccUI.ScrollVertical.Visible=True
		    
		  else
		    ccUI.ScrollVertical.Maximum=0
		    ccUI.ScrollVertical.Visible=False
		    
		  end if
		  
		  if ccUI.dataListBox(1).ColumnWidthTotal>ccUI.dataListbox(1).Width then
		    ccUI.ScrollHorizontal.Top =ccUI.dataListbox(1).Top+ccUI.dataListBox(1).Height+defaultTopMargin
		    ccUI.ScrollHorizontal.Left=ccUI.dataListbox(1).Left
		    ccUI.ScrollHorizontal.Height=defaultFieldHeight
		    ccUI.ScrollHorizontal.Width=ccUI.dataListbox(1).Width
		    ccUI.ScrollHorizontal.Maximum=ccUI.dataListbox(1).ColumnWidthTotal-ccUI.dataListbox(1).Width
		    ccUI.ScrollHorizontal.LiveScroll=True
		    ccUI.ScrollHorizontal.Visible=True
		    
		  else
		    ccUI.ScrollHorizontal.Maximum=0
		    ccUI.ScrollHorizontal.Visible=False
		    
		  end if
		  
		  if ccUI.dataListBox(1).ColumnCount>8 then
		    ccUI.dataListBox(1).SortedColumn=8 //add ability to determine and store in db sort column for each type of list.
		    ccUI.dataListBox(1).Sort
		    
		  end if
		  
		  ccUI.ScrollVertical.Value=0
		  ccUI.ScrollHorizontal.Value=0
		  
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
