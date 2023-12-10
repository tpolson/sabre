#tag Class
Protected Class dbManager_CubeSQL
Inherits dbManager
	#tag Method, Flags = &h21
		Private Function connect(dbName As String) As Boolean
		  if me.dbMaster<>nil then me.dbMaster.Close
		  
		  if dbName.InStr(".sqlite")=0 then dbName=dbName+".sqlite"
		  
		  me.dbMaster=new CubeSQLServer
		  
		  me.dbMaster.Host = me.HostAddress
		  me.dbMaster.Port = me.HostPort
		  me.dbMaster.UserName = me.HostUser
		  me.dbMaster.Password =  me.HostPassword
		  
		  if me.dbMaster.Connect = false then
		    msg "Connection failed: " + me.dbMaster.ErrorMessage + " (" + Str(me.dbMaster.ErrorCode) + ")"
		    return False
		    
		  else
		    
		    ExecuteSQL("USE DATABASE "+dbName)
		    Return True
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ExecuteSQL(sql As String)
		  dbMaster.SQLExecute(sql)
		  
		  if (dbMaster.Error) then
		    msg sql +" Error: "+ dbMaster.ErrorMessage + EndOfLine + EndOfLine + "Error code: " + Str(dbMaster.ErrorCode)
		    
		    dbMaster.Rollback
		    
		  else
		    dbMaster.Commit
		    
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetDatabaseNameFromID(projectID As String) As String
		  dim rSet As RecordSet
		  
		  //get database name from projectID
		  if connect(kDB_MASTER_NAME) then
		    
		    rSet=dbMaster.SQLSelect( "SELECT * FROM projects WHERE project_id="+projectID)
		    
		    if rSet<>nil then return rSet.Field("database_name")
		    
		    release
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetDataFromTable(data As Dictionary, tableName As String) As Dictionary
		  Dim dbName As String
		  
		  if data.Value(kCMD_PROJECT_ID)=kDB_MASTER_NAME then
		    dbName=kDB_MASTER_NAME
		    
		  else
		    dbName=GetDatabaseNameFromID(data.Value(kCMD_PROJECT_ID))
		    
		  end if
		  
		  If connect(dbName) Then
		    Dim rSet As RecordSet
		    Dim tableData As New Dictionary
		    Dim columnData As Dictionary
		    Dim GetTableColumns As Dictionary=data.Value(tableName)
		    Dim columns As String
		    Dim col As Integer
		    Dim keys() As Variant
		    Dim k As Variant
		    
		    //table columns to string
		    keys=GetTableColumns.Keys
		    
		    For Each k In keys
		      columns=columns+GetTableColumns.Value(k)+", "
		    Next
		    
		    columns=columns.Trim.TrimChar(",")
		    
		    //get table data
		    If tableName=kDB_USERS Then
		      rSet=dbMaster.SQLSelect("SHOW USERS")
		      
		    Elseif tableName=kDB_GROUPS Then
		      rSet=dbMaster.SQLSelect("SHOW GROUPS")
		      
		    Elseif tableName=kDB_PRIVILEGES Then
		      rSet=dbMaster.SQLSelect("SHOW PRIVILEGES TABLE")
		      
		    Else
		      rSet=dbMaster.SQLSelect("SELECT "+columns+" FROM "+tableName)
		      
		    End If
		    
		    Do Until rSet.EOF
		      columnData=New Dictionary
		      
		      //store column data
		      For col=1 To rSet.FieldCount
		        columnData.Value(rSet.IdxField(col).Name)=rSet.IdxField(col).StringValue
		      Next col
		      
		      keys=columnData.Keys
		      
		      //store record
		      tableData.Value(columnData.Value(keys(0)))=columnData
		      
		      rSet.MoveNext
		      
		    Loop
		    
		    release
		    
		    Return tableData
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetProjectInfo(projectID As String) As Dictionary
		  If connect(kDB_MASTER_NAME) Then
		    Dim rSet As RecordSet
		    Dim columnData As New Dictionary
		    Dim col As Integer
		    
		    //get data
		    rSet=dbMaster.SQLSelect( "SELECT * FROM projects WHERE project_id="+projectID)
		    
		    Do Until rSet.EOF
		      //store column data
		      For col=1 To rSet.FieldCount
		        columnData.Value(rSet.IdxField(col).Name)=rSet.IdxField(col).StringValue
		      Next col
		      
		      rSet.MoveNext
		      
		    Loop
		    
		    Return columnData
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetTableColumns(projectID As String, tableName As String) As Dictionary
		  dim rSet As RecordSet
		  dim columnNames As New Dictionary
		  dim i As Integer
		  dim s As String
		  dim dbName As String
		  
		  if tableName=kDB_USERS  then
		    columnNames=TableColumnsUsers
		    
		  elseif tableName=kDB_GROUPS then
		    columnNames=TableColumnsGroups
		    
		  elseif tableName=kDB_PRIVILEGES then
		    columnNames=TableColumnsPrivileges
		    
		  else
		    
		    if tableName=kDB_PROJECTS then
		      dbName=kDB_MASTER_NAME
		    else
		      dbName=GetDatabaseNameFromID(projectID)
		      
		    end if
		    
		    if connect(dbName) then
		      //gets the names of the fields in the database
		      rSet=dbMaster.SQLSelect( "SHOW TABLE INFO "+tableName.unCapString)
		      
		      if rSet<>nil then
		        
		        Do Until rSet.EOF
		          s=rSet.IdxField(2).StringValue.Trim
		          
		          'if s.Right(3)<>"_id" and s<>"database_name" then
		          columnNames.Value(i)=s
		          
		          i=i+1
		          
		          'end if
		          
		          rSet.MoveNext
		          
		        Loop
		        
		      end if
		      
		    end if
		    
		  end if
		  
		  release
		  
		  //cache column names
		  tableColumnsCache.Value(tableName)=columnNames
		  
		  return columnNames
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetTableList(dbName As String) As Dictionary
		  //uses project ID to get a list of tables for a project
		  dim rSet As RecordSet
		  dim projectTables As New Dictionary
		  dim i As Integer
		  
		  //get tables for project
		  if connect(dbName) then
		    
		    rSet=dbMaster.SQLSelect( "SHOW TABLES FOR DATABASE "+dbName)
		    
		    if rSet<>nil then
		      do until rSet.EOF
		        projectTables.Value(i)=rSet.Field("tablename").StringValue
		        
		        rSet.MoveNext
		        
		        i=i+1
		        
		      loop
		      
		    end if
		    
		    release
		    
		  end if
		  
		  Return projectTables
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetUserInfo(username As String) As Dictionary
		  If connect(kDB_MASTER_NAME) Then
		    Dim rSet As RecordSet
		    Dim userData As New Dictionary
		    Dim col As Integer
		    
		    //get data
		    rSet=dbMaster.SQLSelect( "SHOW USERS")
		    
		    Do Until rSet.EOF
		      //store column data
		      
		      if rSet.IdxField(1).StringValue=username then
		        For col=1 To rSet.FieldCount
		          userData.Value(rSet.IdxField(col).Name)=rSet.IdxField(col).StringValue
		        Next col
		        
		      end if
		      
		      rSet.MoveNext
		      
		    Loop
		    
		    Return userData
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GroupDelete(data As Dictionary) As Boolean
		  //check if name exists
		  dim tableKeys() As Variant
		  dim tableKey As Variant
		  dim tableColumns As New Dictionary
		  dim groupList As Dictionary
		  dim groupName As String=data.Value("groupname")
		  
		  //create new group
		  if connect(kDB_MASTER_NAME) then
		    ExecuteSQL("DROP GROUP '"+groupName+"'")
		    release
		    
		    return True
		    
		  else
		    release
		    
		    return False
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GroupNew(data As Dictionary) As Boolean
		  //check if name exists
		  if SabreDatabaseManager.Setup then
		    dim tableKeys() As Variant
		    dim tableKey As Variant
		    dim tableColumns As New Dictionary
		    dim groupList As Dictionary
		    dim groupName As String=data.Value("groupname")
		    
		    tableColumns.Value(0)="groupname"
		    
		    data.Value(kCMD_TABLE_NAME)=kDB_GROUPS
		    data.Value(kCMD_PROJECT_ID)=kDB_MASTER_NAME
		    data.Value(kCMD_TABLE_COLUMNS)=tableColumns
		    data.Value(kMANAGE_GROUPS)=SabreDatabaseManager.GetTableColumns(data.Value(kCMD_PROJECT_ID),kDB_GROUPS)
		    
		    //check for duplicate names
		    groupList=self.GetDataFromTable(data,kDB_GROUPS)
		    tableKeys=groupList.Keys
		    
		    for each tableKey in tableKeys
		      if tableKey.Trim.Lowercase=groupName.Trim.Lowercase then
		        msg kWARNING_DUPLICATE_NAME
		        release
		        
		        return False
		        
		      end if
		    next
		    
		    //create new group
		    if connect(kDB_MASTER_NAME) then
		      ExecuteSQL("CREATE GROUP '"+groupName+"'")
		      release
		      
		      return True
		      
		    else
		      release
		      
		      return False
		      
		    end if
		    
		    
		  else
		    release
		    
		    Return False
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ProjectDelete(projectID As String) As Boolean
		  dim rSet As RecordSet
		  dim projectDBName As String
		  dim projectName As String
		  
		  projectID=projectID.Trim
		  
		  if connect(kDB_MASTER_NAME) then
		    
		    rSet=dbMaster.SQLSelect( "SELECT * FROM projects WHERE project_id="+projectID)
		    
		    if rSet<>nil then  //fix if database is in use in cubesqladmin then list record is deleted but not the actual data base
		      projectName=rSet.Field(kCMD_PROJECT_NAME)
		      projectDBName=rSet.Field(kDB_NAME)
		      
		      if dbMaster.Error=False then
		        
		        //delete project from master and drop database
		        if projectDBName<>"" then
		          rSet.DeleteRecord
		          
		          ExecuteSQL("DROP DATABASE "+projectDBName+" IF EXISTS")
		          
		          dbMaster.Commit
		          
		          //update projects list
		          ProjectsList=ProjectList
		          
		          release
		          
		          Return True
		          
		        else
		          
		          release
		          
		          return True
		          
		        end if
		        
		      else
		        release
		        
		        Return False
		        
		      end if
		      
		      release
		      
		      Return False
		      
		    end if
		    
		    return False
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProjectList() As Dictionary
		  if dbMaster<>nil then
		    dim rSet As RecordSet
		    dim results As  new Dictionary
		    
		    //list projects in menu button
		    rSet=dbMaster.SQLSelect( "SELECT * FROM projects")
		    
		    if rSet<>nil then
		      Do Until rSet.EOF
		        results.Value(rSet.IdxField(1).StringValue)=rSet.IdxField(5).StringValue
		        
		        rSet.MoveNext
		        
		      Loop
		      
		    end if
		    
		    //get user projects list
		    'SELECT user_type FROM users
		    //filter
		    
		    Return results
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProjectLoad(Assigns name As String)
		  if connect(name) then
		    
		    dbMaster.DatabaseName=name
		    dbMaster.AutoCommit=False
		    
		  end if
		  
		  release
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ProjectNew(data As Dictionary) As Boolean
		  dim dbName As String
		  dim keys() As Variant
		  dim k As Variant
		  
		  //check if name exists
		  dim projectName As String=data.Value(kCMD_PROJECT_NAME)
		  
		  //check for duplicate names
		  keys=self.ProjectsList.Keys
		  
		  for each k in keys
		    if self.ProjectsList.Value(k)=projectName then
		      msg "DUPLICATE PROJECT NAME"
		      return false
		    end if
		    
		  next
		  
		  //set db name
		  dbName=projectName.unCapString+".sqlite"
		  
		  //create new database
		  if connect(kDB_MASTER_NAME) then
		    
		    ExecuteSQL("CREATE DATABASE "+dbName+" IF NOT EXISTS;") '******************************this needs work.  it's to make a DB if one doesn't exist.
		    ExecuteSQL("USE DATABASE "+dbName+";")
		    
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_SCENES+" ("+kTABLE_SCENES+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_EDITORIAL+" ("+kTABLE_EDITORIAL+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_SEQUENCES+" ("+kTABLE_SEQUENCES+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_SHOTS+" ("+kTABLE_SHOTS+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_TASKS+" ("+kTABLE_TASKS+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_FILEPATHS+" ("+kTABLE_FILEPATHS+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_IMAGES+" ("+kTABLE_IMAGES+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_MEDIA+" ("+kTABLE_MEDIA+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_NOTES+" ("+kTABLE_NOTES+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_FILE_TEMPLATES+" ("+kTABLE_FILE_TEMPLATES+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_STATUS+" ("+kTABLE_STATUS+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_SETTINGS+" ("+kTABLE_SETTINGS+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_TYPES+" ("+kTABLE_TYPES+");")
		    ExecuteSQL("CREATE TABLE IF NOT EXISTS "+kDB_SYSTEM+" ("+kTABLE_SYSTEM+");")
		    
		  else
		    return False
		    
		  end if
		  
		  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////MUST REWITE TO MAKE DYNAMIC!!!!!!!!!!!!!!!!!!
		  //update master database
		  if connect(kDB_MASTER_NAME) then
		    //add to project list
		    dim sql As String= "INSERT INTO projects (project_name, database_name, company_id, project_type_id, working_title, description, status, start_date, end_date) VALUES ("+projectName.dbQTE+", "+dbName.dbQTE+", 0, 0,"+data.Value("working_title").dbQTE+", "+data.Value("description").dbQTE+", "+data.Value("status").dbQTE+", "+data.Value("start_date").dbQTE+", "+data.Value("end_date").dbQTE+");"
		    
		    ExecuteSQL(sql)
		    
		    //update projects list
		    ProjectsList=ProjectList
		    
		    release
		    
		    return True
		    
		  else
		    release
		    
		    return False
		    
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ProjectTables(ByRef data As Dictionary) As Dictionary
		  //uses project ID to get a list of tables for a project
		  dim projectID As String=data.Value(kCMD_PROJECT_ID)
		  dim dbName As String
		  
		  //get database name
		  dbName=GetDatabaseNameFromID(projectID)
		  
		  Return GetTableList(dbName)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ProjectUpdate(ByRef data As Dictionary) As Boolean
		  dim projectID As String=data.Value(kCMD_PROJECT_ID)
		  dim currentInfo As Dictionary
		  dim columns As String
		  dim key As String
		  dim updateInfo As new Dictionary
		  dim sql As String
		  dim rSet As RecordSet
		  dim tableKeys() As Variant
		  dim tableKey As Variant
		  
		  //get current project info
		  'currentInfo=SabreDatabaseManager.ShowProjectInfo(projectID)
		  currentInfo=GetProjectInfo(projectID)
		  
		  tableKeys=currentInfo.Keys
		  
		  for each tablekey in tableKeys
		    
		    //find update and save changes
		    if currentInfo.Value(tablekey)<>data.Value(tablekey) then updateInfo.Value(tablekey)=data.Value(tablekey)
		    
		  next
		  
		  if updateInfo.Count>0 then
		    //update master database
		    if connect(kDB_MASTER_NAME) then
		      //updateInfo
		      //get project record
		      sql ="SELECT * FROM projects WHERE project_id = " + projectID
		      
		      rSet= dbMaster.SQLSelect(sql)
		      
		      //update record
		      rSet.Edit
		      
		      //loop through changes
		      dim v as variant
		      
		      tableKeys = updateInfo.keys()
		      for each tableKey in tableKeys
		        v = updateInfo.value(tableKey)
		        
		        rSet.Field(tableKey).StringValue=v
		        
		      next
		      
		      rSet.Update
		      
		      if dbMaster.Error then
		        
		        dbMaster.Rollback
		        
		        release
		        
		        return False
		        
		      else
		        dbMaster.Commit
		        
		        //update projects list
		        ProjectsList=ProjectList
		        
		        return True
		        
		      end if
		      
		    else
		      release
		      
		      return False
		      
		    end if
		    
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub release()
		  if dbMaster<>nil then dbMaster.Close
		  
		  'mainWindow.mainLabel(2).Text=kOFFLINE
		  'mainWindow.mainLabel(2).TextColor=cWARNING
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Setup() As Boolean
		  if connect(kDB_MASTER_NAME) then
		    //list projects
		    me.ProjectsList=ProjectList
		    
		    release
		    
		    mainWindow.mainLabel(2).Text=kLOGOUT
		    mainWindow.mainLabel(2).Visible=True
		    
		    Return True
		    
		  Else
		    
		    release
		    
		    Return False
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ShowGroupsUser() As String
		  dim rSet As RecordSet
		  dim item As String
		  
		  if connect(kDB_MASTER_NAME) then
		    
		    rSet=dbMaster.SQLSelect("SHOW GROUPS FOR USER "+me.HostUser)
		    
		    if rSet<>nil then
		      do until rSet.EOF
		        for i As Integer=1 to rSet.FieldCount
		          item=item+rSet.IdxField(i).StringValue+DL
		          
		          rSet.MoveNext
		          
		        next
		        
		      loop
		      
		    end if
		    
		  end if
		  
		  release
		  
		  Return item.TrimDL
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ShowProjectInfo(projectID As String) As Dictionary
		  dim rSet As RecordSet
		  Dim tableInfo() as String=SabreDatabaseManager.ShowTableInfo(kDB_PROJECTS)
		  dim columns As String = tableInfo(0)
		  dim results As new Dictionary
		  dim i As Integer
		  
		  if connect(kDB_MASTER_NAME) then
		    //gets the fields in the database
		    rSet=dbMaster.SQLSelect( "SELECT * FROM projects WHERE project_id="+projectID)
		    results.Value("columns")=columns
		    
		    if rSet<>nil then
		      for i=1 to columns.CountFields(DL)
		        
		        results.Value(columns.NthField(DL,i))=rSet.Field(columns.NthField(DL,i)).StringValue
		        
		      next
		      
		    end if
		    
		  end if
		  
		  release
		  
		  return results
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ShowTableInfo(table As String) As String()
		  ////////////////////////////////////////////////////////////change return to dictionary
		  dim rSet As RecordSet
		  dim s,t As String
		  dim columns As String
		  dim tableInfo As String
		  
		  if connect(kDB_MASTER_NAME) then
		    //gets the names of the fields in the database
		    if table=kDB_USERS then
		      rSet=dbMaster.SQLSelect( "SHOW USERS")
		    elseif table=kDB_GROUPS then
		      rSet=dbMaster.SQLSelect( "SHOW GROUPS")
		    else
		      rSet=dbMaster.SQLSelect( "SHOW TABLE INFO "+table)
		    end if
		    
		    if rSet<>nil then
		      
		      Do Until rSet.EOF
		        s=rSet.IdxField(2).StringValue.Trim
		        
		        if s.Right(3)<>"_id" and s<>"database_name" then
		          columns=columns+s+DL
		          
		          if rSet.Field(s)<>nil then
		            t=rSet.Field(s)
		            
		            tableInfo=tableInfo+t+DL
		            
		          else
		            tableInfo=tableInfo+""+DL
		            
		          end if
		          
		        end if
		        
		        rSet.MoveNext
		        
		      Loop
		      
		    end if
		    
		  end if
		  
		  release
		  
		  return Split(columns.TrimDL+","+tableInfo.TrimDL,",")
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ShowUsers() As String()
		  dim rSet As RecordSet
		  dim item(-1) As String
		  
		  if connect(kDB_MASTER_NAME) then
		    
		    rSet=dbMaster.SQLSelect("SHOW USERS")
		    
		    if rSet<>nil then
		      do until rSet.EOF
		        for i As Integer=1 to rSet.FieldCount
		          
		          if rSet.IdxField(i).StringValue<>"" then item.Append rSet.IdxField(i).Name
		          
		          rSet.MoveNext
		          
		        next
		        
		      loop
		      
		    end if
		    
		  end if
		  
		  release
		  
		  Return item
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TableColumnsGroups() As Dictionary
		  dim rSet As RecordSet
		  dim columnNames As New Dictionary
		  dim i As Integer
		  
		  if connect(kDB_MASTER_NAME) then
		    
		    rSet=dbMaster.SQLSelect("SHOW GROUPS")
		    
		    if rSet<>nil then
		      
		      for i = 1 to rSet.FieldCount
		        
		        columnNames.Value(i-1)=rSet.IdxField(i).Name
		        
		        rSet.MoveNext
		        
		      next
		      
		    end if
		    
		  end if
		  
		  release
		  
		  Return columnNames
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TableColumnsPrivileges() As Dictionary
		  dim rSet As RecordSet
		  dim columnNames As New Dictionary
		  dim i As Integer
		  
		  if connect(kDB_MASTER_NAME) then
		    
		    rSet=dbMaster.SQLSelect("SHOW PRIVILEGES TABLE")
		    
		    if rSet<>nil then
		      
		      for i = 1 to rSet.FieldCount
		        
		        columnNames.Value(i-1)=rSet.IdxField(i).Name
		        
		        rSet.MoveNext
		        
		      next
		      
		    end if
		    
		  end if
		  
		  release
		  
		  Return columnNames
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TableColumnsUsers() As Dictionary
		  dim rSet As RecordSet
		  dim columnNames As New Dictionary
		  dim i As Integer
		  
		  if connect(kDB_MASTER_NAME) then
		    
		    rSet=dbMaster.SQLSelect("SHOW USERS")
		    
		    if rSet<>nil then
		      
		      for i = 1 to rSet.FieldCount
		        
		        columnNames.Value(i-1)=rSet.IdxField(i).Name
		        
		        rSet.MoveNext
		        
		      next
		      
		    end if
		    
		  end if
		  
		  release
		  
		  Return columnNames
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserDelete(data As Dictionary) As Boolean
		  //check if name exists
		  dim tableKeys() As Variant
		  dim tableKey As Variant
		  dim tableColumns As New Dictionary
		  dim userList As Dictionary
		  dim userName As String=data.Value("username")
		  
		  //create new group
		  if connect(kDB_MASTER_NAME) then
		    ExecuteSQL("DROP USER '"+userName+"'")
		    release
		    
		    return True
		    
		  else
		    release
		    
		    return False
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserNew(data As Dictionary) As Boolean
		  //check if name exists
		  dim tableKeys() As Variant
		  dim tableKey As Variant
		  dim tableColumns As New Dictionary
		  dim userList As Dictionary
		  dim userName As String=data.Value("username")
		  dim groupName As String=data.Value("groupname")
		  dim password As String=data.Value("password")
		  
		  tableColumns.Value(0)="username"
		  
		  data.Value(kCMD_TABLE_NAME)=kDB_USERS
		  data.Value(kCMD_PROJECT_ID)=kDB_MASTER_NAME
		  data.Value(kCMD_TABLE_COLUMNS)=tableColumns
		  data.Value(kMANAGE_USERS)=SabreDatabaseManager.GetTableColumns(data.Value(kCMD_PROJECT_ID),kDB_USERS)
		  
		  //check for duplicate names
		  userList=self.GetDataFromTable(data, kDB_USERS)
		  tableKeys=userList.Keys
		  
		  for each tableKey in tableKeys
		    if tableKey.Trim.Lowercase=userName.Trim.Lowercase then
		      msg kWARNING_DUPLICATE_NAME
		      
		      release
		      
		      return False
		      
		    end if
		  next
		  
		  //create new user
		  if connect(kDB_MASTER_NAME) then
		    ExecuteSQL("CREATE USER "+userName.dbQTE+" WITH PASSWORD "+password.dbQTE)
		    
		    if groupName<>"" then 
		      ExecuteSQL("ADD USER "+userName.dbQTE +" TO GROUP "+groupName.dbQTE)
		      
		    end if
		    
		    //add to user table
		    ExecuteSQL("INSERT INTO users (user_name, user_type,company_id) VALUES ("+userName.dbQTE+","+groupName.dbQTE+",'')")
		    
		    return True
		    
		  else
		    release
		    
		    return False
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UserUpdate(data As Dictionary) As Boolean
		  //check if name exists
		  dim tableKeys() As Variant
		  dim tableKey As Variant
		  dim tableColumns As New Dictionary
		  dim userList As Dictionary
		  dim oldInfo As Dictionary =data.Value(kUSER_UPDATE)
		  dim userName As String=data.Value("username")
		  dim password As String=data.Value("password")
		  dim groupName As String=data.Value("groupname")
		  
		  dim oldUser As String =oldInfo.Value("username")
		  dim oldPassword As String = oldInfo.Value("password")
		  dim oldGroup as String = oldInfo.Value("groupname")
		  
		  tableColumns.Value(0)="username"
		  
		  data.Value(kCMD_TABLE_NAME)=kDB_USERS
		  data.Value(kCMD_PROJECT_ID)=kDB_MASTER_NAME
		  data.Value(kCMD_TABLE_COLUMNS)=tableColumns
		  data.Value(kMANAGE_USERS)=SabreDatabaseManager.GetTableColumns(data.Value(kCMD_PROJECT_ID),kDB_USERS)
		  
		  
		  //create new user
		  if connect(kDB_MASTER_NAME) then
		    
		    if groupname<>oldGroup  then
		      if oldGroup<>"" then
		        ExecuteSQL("REMOVE USER "+oldUser.dbQTE +" FROM GROUP "+oldGroup.dbQTE)
		        ExecuteSQL("ADD USER "+oldUser.dbQTE +" TO GROUP "+groupName.dbQTE)
		      end if
		      
		    end if
		    
		    if oldGroup = ""  then ExecuteSQL("ADD USER "+oldUser.dbQTE +" TO GROUP "+groupName.dbQTE)
		    
		    if username<>"" and username<>oldUser then  ExecuteSQL("RENAME USER "+ oldUser.DBqte +" TO "+username.dbQTE)
		    
		    release
		    
		    return True
		    
		  else
		    release
		    
		    return False
		    
		  end if
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private dbMaster As CubeSQLServer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="HostAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HostPassword"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HostPort"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HostUser"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
