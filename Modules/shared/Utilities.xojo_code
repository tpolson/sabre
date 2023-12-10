#tag Module
Protected Module Utilities
	#tag Method, Flags = &h0
		Function CR() As string
		  return chr(13)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dbQTE(Extends s As String) As String
		  return "'"+s.Trim+"'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub dictContents(d As Dictionary)
		  dim tableKeys() As Variant
		  dim tableKey As Variant
		  dim contents As String
		  dim tabs As String
		  
		  if screencount = 2 then
		    //screen(0) is the first screen
		    dictContentWindow.left = screen(1).left
		  else
		    dictContentWindow.left=20
		  end
		  
		  dictContentWindow.Top=20
		  dictContentWindow.Height=800
		  dictContentWindow.Width=500
		  
		  if d.HasKey(kCMD_COMMAND) then
		    contents=dictContentWindow.TextArea1.Text+"=="+d.Value(kCMD_COMMAND)+"=="+EndOfLine
		  else
		    contents=dictContentWindow.TextArea1.Text
		  end if
		  
		  //check dictionary
		  tableKeys=d.Keys
		  
		  for each tableKey in tableKeys
		    if tableKey.StringValue.Len<8 then
		      tabs=chr(9)+chr(9)+chr(9)
		    elseif tableKey.StringValue.Len>11 then
		      tabs=chr(9)
		    else
		      tabs=chr(9)+chr(9)
		    end if
		    
		    Select case d.Value(tableKey)
		    case IsA Dictionary
		      contents=contents+tableKey+tabs+"- Dictionary"+EndOfLine
		      
		    case IsA ContainerControl
		      contents=contents+tableKey+tabs+"- Container Control"+EndOfLine
		      
		    else
		      contents=contents+tableKey+tabs+"- "+d.Value(tableKey).StringValue+EndOfLine
		      
		    End Select
		    
		    dictContentWindow.Refresh
		  next
		  
		  contents=contents+"=============="+EndOfLine+EndOfLine
		  
		  dictContentWindow.TextArea1.Text=contents
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DL() As String
		  Return chr(126)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function largeFont() As Boolean
		  //determines if system is set for large fonts
		  #if TargetWin32
		    Declare Function GetDC Lib "User32" (hwnd As Integer) As Integer
		    Declare Sub ReleaseDC Lib "User32" (hwnd As Integer, hdc As Integer)
		    Declare Function GetDeviceCaps Lib "Gdi32" (hdc As Integer, index As Integer) As Integer
		    
		    dim hdcScreen As Integer=GetDC(0)
		    dim iDPI As Integer=-1
		    
		    if hdcScreen<>0 then
		      Const LOGPIXELSX=88
		      iDPI=GetDeviceCaps(hdcScreen,LOGPIXELSX)
		      ReleaseDC(0, hdcScreen)
		    end if
		    
		    return iDPI>96
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub msg(v As Variant)
		  select case VarType(v)
		  case 0
		    MsgBox("nil")
		    
		  case 2
		    MsgBox( Format(v,"#")+" int32" )
		    
		  case 3
		    MsgBox(Format(v,"#")+" int64")
		    
		  case 4
		    MsgBox( Format(v,"#")+" single")
		    
		  case 5
		    MsgBox(Format(v,"#")+" double")
		    
		  case 6
		  case 7
		  case 8
		    MsgBox(v)
		    
		  case 9
		  case 11
		    if v then MsgBox("true") else MsgBox("false")
		  case 16
		    
		  else
		    
		    MsgBox( Format(v,"#"))
		    
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringWidth(Extends s As String) As Integer
		  dim p As Picture
		  
		  p=new Picture(1,1,1)
		  
		  p.Graphics.TextSize=sysFontSize
		  p.Graphics.TextFont=sysFont
		  
		  Return p.Graphics.StringWidth(s)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function titleString(Extends s As String) As String
		  Return s.ReplaceAll("_"," ").Titlecase.Trim.ReplaceAll(" id", " ID")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrimChar(Extends s As String, char As String) As String
		  Return s.Left(s.len-char.Len)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrimDL(Extends s As String) As String
		  Return s.Left(s.len-DL.Len)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function unCapString(Extends s As String) As String
		  Return s.Trim.unixC.Lowercase
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function unixC(Extends s As string) As String
		  //replace space with '_'
		  return s.Trim.ReplaceAll(" ","_")
		End Function
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
End Module
#tag EndModule
