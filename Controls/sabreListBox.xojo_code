#tag Class
Protected Class sabreListBox
Inherits Listbox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #pragma DisableBackgroundTasks
		  
		  if  me.ColumnCount>column and column<>-1 and not me.isHeader then //handles out of range or nil column
		    If row = mSelectedRow and column = mSelectedColumn and mouseOver and column>0 Then
		      
		      // This is the selected cell, so change its background
		      textColor=colorFG_highlight
		      g.ForeColor = colorBG_highlight
		      
		      g.FillRect(0, 0, g.Width, g.Height)
		      
		      //add icon
		      if me.ColumnTag(column)<>sabreListBox.kColumnTypeDefault then
		        g.drawpicture icon(me.ColumnTag(column)),g.Width-iconWidth,0
		      end if
		      
		    else
		      
		      if me.Selected(row) then
		        //selected colors
		        textColor=colorFG_select
		        g.ForeColor=colorBG_select
		      else
		        //default colors
		        textColor=colorFG
		        g.ForeColor = colorBG
		      End If
		      
		      g.FillRect(0, 0, g.Width, g.Height)
		      
		    end if
		    
		  else
		    //out of bounds colors
		    textColor=colorFG_null
		    g.ForeColor = colorBG_null
		    
		    g.FillRect(0, 0, g.Width, g.Height)
		    
		  End If
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub CellLostFocus(row as Integer, column as Integer)
		  // Invalidate cell so that background is redrawn
		  Me.InvalidateCell(mSelectedRow, mSelectedColumn)
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #pragma DisableBackgroundTasks
		  
		  g.ForeColor=textColor
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  #pragma DisableBackgroundTasks
		  
		  // Sort the number column numerically rather than using
		  // the string value which causes sort order like:
		  // 1, 101, 2, 201, 3, etc.
		  Select Case column
		  Case 8 // Number column
		    If Val(Me.Cell(row1, column)) < Val(Me.Cell(row2, column)) Then
		      result = -1
		    ElseIf Val(Me.Cell(row1, column)) > Val(Me.Cell(row2, column)) Then
		      result = 1
		    Else
		      result = 0
		    End If
		    
		    Return True
		    
		  Case 3 // PopupMenu
		    // Sort by text of color
		    If Me.CellTag(row1, column) < Me.CellTag(row2, column) Then
		      result = -1
		    ElseIf Me.CellTag(row1, column) > Me.CellTag(row2, column) Then
		      result = 1
		    Else
		      result = 0
		    End If
		    
		    Return True
		    
		  Case 5 // CheckBox
		    // Checked cells sort higher than unchecked cells
		    If Me.CellCheck(row1, column) And Not Me.CellCheck(row2, column) Then
		      result = 1
		    ElseIf Not Me.CellCheck(row1, column) And Me.CellCheck(row2, column) Then
		      result = -1
		    Else
		      result = 0
		    End If
		    
		    Return True
		  End Select
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #pragma DisableBackgroundTasks
		  
		  dim row As Integer=me.RowFromXY(x,y)
		  dim column As Integer=me.ColumnFromXY(x,y)
		  
		  if  me.ColumnCount>column  and column<>-1 and row<>-1 then
		    
		    //check if icon is necessary
		    if me.ColumnTag(column)=sabreListBox.kColumnTypeDefault then
		      iconX=cellX+me.Column(column).WidthActual
		    else
		      iconX=cellX+me.Column(column).WidthActual-iconWidth
		    end if
		    
		    iconY=cellY
		    
		  end if
		  
		  if x>iconX then Return True
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  #pragma DisableBackgroundTasks
		  
		  mouseOver=True
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  #pragma DisableBackgroundTasks
		  
		  mouseOver=False
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  #pragma DisableBackgroundTasks
		  
		  dim row As Integer=me.RowFromXY(x,y)
		  dim column As Integer=me.ColumnFromXY(x,y)
		  
		  // Remember last row/column that was clicked
		  mSelectedRow = row
		  mSelectedColumn = column
		  
		  app.DoEvents 10
		  
		  //determines mouse position for selecting icon
		  if column=-1 or row=-1 or column>=me.ColumnCount or row>=me.ListCount then
		    me.MouseCursor=System.Cursors.StandardPointer
		    
		  else
		    if me.ColumnTag(column)<>"" then
		      //calaculate cell left and top
		      cellX=x
		      
		      do until me.ColumnFromXY(cellX,y)<>column
		        cellX=cellX-1
		      loop
		      
		      cellY=y
		      
		      do until me.RowFromXY(x,cellY)<>row
		        cellY=cellY-1
		      loop
		      
		      //change cursor when over icon
		      if x>=cellX+me.Column(column).WidthActual-iconWidth then
		        me.MouseCursor=System.Cursors.FingerPointer
		      else
		        me.MouseCursor=System.Cursors.StandardPointer
		      end if
		      
		    end if
		    
		    'Window1.Label1.Text="cell left, top= ("+str(cellX)+","+str(cellY)+")"
		  end if
		  
		  // Invalidate cell so that background is redrawn
		  Me.InvalidateCell(row, column)
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  #pragma DisableBackgroundTasks
		  
		  dim row As Integer=me.RowFromXY(x,y)
		  dim column As Integer=me.ColumnFromXY(x,y)
		  
		  if  me.ColumnCount>column and column<>-1 then //handles out of range or nil column
		    if x>iconX then
		      
		      if me.ColumnTag(column)=me.kColumnTypeList then
		        Me.ListIndex = row
		        Me.Selected(row) = True
		        
		        Dim base As New MenuItem
		        base.Append(New MenuItem("Red"))
		        base.Append(New MenuItem("Green"))
		        base.Append(New MenuItem("Blue"))
		        base.Append(New MenuItem("Black"))
		        base.Append(New MenuItem("White"))
		        
		        app.DoEvents 10
		        
		        Dim selectedMenu As MenuItem
		        selectedMenu = base.PopUp
		        
		        If selectedMenu <> Nil Then
		          Me.Cell(row, column) = selectedMenu.Text
		          
		          
		        End If
		        
		      end if
		      
		    else
		      //select row
		      
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  'Super.Constructor
		  
		  me.Border=False
		  me.UseFocusRing=False
		  
		  //init color
		  me.colorFG=cTXT
		  me.colorBG=cDRKGRY
		  me.colorFG_highlight=&cffffff
		  me.colorBG_highlight=cMOUSE_OVER
		  me.colorFG_select=cBG
		  me.colorBG_select=&caabbee
		  me.colorFG_null=cTXT
		  me.colorBG_null=cDRKGRY
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function icon(iconType As String) As Picture
		  // creates new picture
		  dim pic As new Picture(iconWidth,iconHeight,32)
		  
		  if iconType=kColumnTypeList then
		    // fill with color
		    pic.Graphics.ForeColor = &cFF0000
		    
		  ElseIf iconType=kColumnTypeCheckbox then
		    pic.Graphics.ForeColor = &c00FF00
		    
		  ElseIf iconType=kColumnTypeTextArea then
		    pic.Graphics.ForeColor = &c0000FF
		    
		  ElseIf iconType=kColumnTypeTextField then
		    pic.Graphics.ForeColor = &cFFFF00
		    
		  ElseIf iconType=kColumnTypeDefault then
		    pic.Graphics.ForeColor = &cFF00FF
		    
		  end if
		  
		  
		  pic.Graphics.FillRect 0,0,iconWidth,iconHeight
		  
		  return pic
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private cellEditMode As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private cellX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private cellY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		colorBG As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		colorBG_highlight As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		colorBG_null As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		colorBG_select As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		colorFG As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		colorFG_highlight As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		colorFG_null As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		colorFG_select As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ColumnWidthTotal As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iconHeight As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iconWidth As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iconX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private iconY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		isHeader As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			SelectForeColor=&cffff22
		#tag EndNote
		Private mouseOver As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedColumn As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private textColor As Color
	#tag EndProperty


	#tag Constant, Name = kColumnTypeCheckbox, Type = String, Dynamic = False, Default = \"checkbox", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kColumnTypeDefault, Type = String, Dynamic = False, Default = \"default", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kColumnTypeList, Type = String, Dynamic = False, Default = \"list", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kColumnTypeTextArea, Type = String, Dynamic = False, Default = \"textArea\r", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kColumnTypeTextField, Type = String, Dynamic = False, Default = \"textField", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="colorBG"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="colorBG_highlight"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="colorBG_null"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="colorBG_select"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="colorFG"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="colorFG_highlight"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="colorFG_null"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="colorFG_select"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnsResizable"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidthTotal"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDragReorder"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontal"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVertical"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hierarchical"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isHeader"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollBarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
