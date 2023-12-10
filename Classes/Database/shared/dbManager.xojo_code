#tag Class
Protected Class dbManager
	#tag Method, Flags = &h1
		Protected Function connect() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub createConfig()
		  'not sure about this
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub createDatabase()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDataFromTable(data As Dictionary, tableName As String) As Dictionary
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetProjectInfo(projectID As String) As Dictionary
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTableColumns(dbName As String, tableName As String) As Dictionary
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUserInfo(username As String) As Dictionary
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroupDelete(data As Dictionary) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GroupNew(data As Dictionary) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProjectDelete(projectID As String) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ProjectList() As Dictionary
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectLoad(Assigns name As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProjectNew(data As Dictionary) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProjectUpdate(ByRef data As Dictionary) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub release()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Setup() As Boolean
		  //for creating original setup
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowGroupsUser() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowProjectInfo(projectID As String) As Dictionary
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowTableInfo(table As String) As String()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowUsers() As String()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserDelete(data As Dictionary) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserNew(data As Dictionary) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserUpdate(data As Dictionary) As Boolean
		  
		End Function
	#tag EndMethod


	#tag Note, Name = source
		
		modeled after SQL Anywhere 12.0.0 UltrLite J API DatabaseManager class
		
		subclasses can be written for other databases and instatiated in app.open 
		
		it is meant to be decoupled from everything so it can be killed and reinstantiated (maybe even to a different database) without out crashing program
	#tag EndNote


	#tag Property, Flags = &h0
		HostAddress As String
	#tag EndProperty

	#tag Property, Flags = &h0
		HostPassword As String
	#tag EndProperty

	#tag Property, Flags = &h0
		HostPort As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		HostUser As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ProjectsList As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		rsProjectList As RecordSet
	#tag EndProperty


	#tag Constant, Name = kDB_ADDRESS, Type = String, Dynamic = False, Default = \"address", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_BANNED, Type = String, Dynamic = False, Default = \"banned", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_CITY, Type = String, Dynamic = False, Default = \"city", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_COMPANY, Type = String, Dynamic = False, Default = \"company\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_COUNTRIES, Type = String, Dynamic = False, Default = \"countries", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_DEPARTMENT, Type = String, Dynamic = False, Default = \"department", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_EDITORIAL, Type = String, Dynamic = False, Default = \"editorial", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_FILEPATHS, Type = String, Dynamic = False, Default = \"filepaths", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_FILE_TEMPLATES, Type = String, Dynamic = False, Default = \"file_templates", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_FORMATS, Type = String, Dynamic = False, Default = \"formats", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_GROUPS, Type = String, Dynamic = False, Default = \"groups", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_IMAGES, Type = String, Dynamic = False, Default = \"images", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_MASTER_NAME, Type = String, Dynamic = False, Default = \"SabreTracker_Master", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDB_MEDIA, Type = String, Dynamic = False, Default = \"media", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_NAME, Type = String, Dynamic = False, Default = \"database_name", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_NOTES, Type = String, Dynamic = False, Default = \"notes", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_PROJECTS, Type = String, Dynamic = False, Default = \"projects", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_PROJECT_TYPE, Type = String, Dynamic = False, Default = \"project_type", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_SCENES, Type = String, Dynamic = False, Default = \"scenes", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_SEQUENCES, Type = String, Dynamic = False, Default = \"sequences", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_SETTINGS, Type = String, Dynamic = False, Default = \"settings", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_SHOTS, Type = String, Dynamic = False, Default = \"shots", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_STATUS, Type = String, Dynamic = False, Default = \"status", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_STATUS_TYPE, Type = String, Dynamic = False, Default = \"status_type", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_SYSTEM, Type = String, Dynamic = False, Default = \"system", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_TASKS, Type = String, Dynamic = False, Default = \"tasks", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_TEMPLATES, Type = String, Dynamic = False, Default = \"templates", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_TYPES, Type = String, Dynamic = False, Default = \"types", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_USERS, Type = String, Dynamic = False, Default = \"users", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_USER_IMAGES, Type = String, Dynamic = False, Default = \"user_images", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDEFAULT_COUNTRIES, Type = String, Dynamic = False, Default = \"\"1\"\x2C\"AF\"\x2C\"Afghanistan\"\x2C\"AFG\"\x2C\"4\"\r\"2\"\x2C\"AL\"\x2C\"Albania\"\x2C\"ALB\"\x2C\"8\"\r\"3\"\x2C\"DZ\"\x2C\"Algeria\"\x2C\"DZA\"\x2C\"12\"\r\"4\"\x2C\"AS\"\x2C\"American Samoa\"\x2C\"ASM\"\x2C\"16\"\r\"5\"\x2C\"AD\"\x2C\"Andorra\"\x2C\"AND\"\x2C\"20\"\r\"6\"\x2C\"AO\"\x2C\"Angola\"\x2C\"AGO\"\x2C\"24\"\r\"7\"\x2C\"AI\"\x2C\"Anguilla\"\x2C\"AIA\"\x2C\"660\"\r\"8\"\x2C\"AQ\"\x2C\"Antarctica\"\x2CNULL\x2CNULL\r\"9\"\x2C\"AG\"\x2C\"Antigua and Barbuda\"\x2C\"ATG\"\x2C\"28\"\r\"10\"\x2C\"AR\"\x2C\"Argentina\"\x2C\"ARG\"\x2C\"32\"\r\"11\"\x2C\"AM\"\x2C\"Armenia\"\x2C\"ARM\"\x2C\"51\"\r\"12\"\x2C\"AW\"\x2C\"Aruba\"\x2C\"ABW\"\x2C\"533\"\r\"13\"\x2C\"AU\"\x2C\"Australia\"\x2C\"AUS\"\x2C\"36\"\r\"14\"\x2C\"AT\"\x2C\"Austria\"\x2C\"AUT\"\x2C\"40\"\r\"15\"\x2C\"AZ\"\x2C\"Azerbaijan\"\x2C\"AZE\"\x2C\"31\"\r\"16\"\x2C\"BS\"\x2C\"Bahamas\"\x2C\"BHS\"\x2C\"44\"\r\"17\"\x2C\"BH\"\x2C\"Bahrain\"\x2C\"BHR\"\x2C\"48\"\r\"18\"\x2C\"BD\"\x2C\"Bangladesh\"\x2C\"BGD\"\x2C\"50\"\r\"19\"\x2C\"BB\"\x2C\"Barbados\"\x2C\"BRB\"\x2C\"52\"\r\"20\"\x2C\"BY\"\x2C\"Belarus\"\x2C\"BLR\"\x2C\"112\"\r\"21\"\x2C\"BE\"\x2C\"Belgium\"\x2C\"BEL\"\x2C\"56\"\r\"22\"\x2C\"BZ\"\x2C\"Belize\"\x2C\"BLZ\"\x2C\"84\"\r\"23\"\x2C\"BJ\"\x2C\"Benin\"\x2C\"BEN\"\x2C\"204\"\r\"24\"\x2C\"BM\"\x2C\"Bermuda\"\x2C\"BMU\"\x2C\"60\"\r\"25\"\x2C\"BT\"\x2C\"Bhutan\"\x2C\"BTN\"\x2C\"64\"\r\"26\"\x2C\"BO\"\x2C\"Bolivia\"\x2C\"BOL\"\x2C\"68\"\r\"27\"\x2C\"BA\"\x2C\"Bosnia and Herzegovina\"\x2C\"BIH\"\x2C\"70\"\r\"28\"\x2C\"BW\"\x2C\"Botswana\"\x2C\"BWA\"\x2C\"72\"\r\"29\"\x2C\"BV\"\x2C\"Bouvet Island\"\x2CNULL\x2CNULL\r\"30\"\x2C\"BR\"\x2C\"Brazil\"\x2C\"BRA\"\x2C\"76\"\r\"31\"\x2C\"IO\"\x2C\"British Indian Ocean Territory\"\x2CNULL\x2CNULL\r\"32\"\x2C\"BN\"\x2C\"Brunei Darussalam\"\x2C\"BRN\"\x2C\"96\"\r\"33\"\x2C\"BG\"\x2C\"Bulgaria\"\x2C\"BGR\"\x2C\"100\"\r\"34\"\x2C\"BF\"\x2C\"Burkina Faso\"\x2C\"BFA\"\x2C\"854\"\r\"35\"\x2C\"BI\"\x2C\"Burundi\"\x2C\"BDI\"\x2C\"108\"\r\"36\"\x2C\"KH\"\x2C\"Cambodia\"\x2C\"KHM\"\x2C\"116\"\r\"37\"\x2C\"CM\"\x2C\"Cameroon\"\x2C\"CMR\"\x2C\"120\"\r\"38\"\x2C\"CA\"\x2C\"Canada\"\x2C\"CAN\"\x2C\"124\"\r\"39\"\x2C\"CV\"\x2C\"Cape Verde\"\x2C\"CPV\"\x2C\"132\"\r\"40\"\x2C\"KY\"\x2C\"Cayman Islands\"\x2C\"CYM\"\x2C\"136\"\r\"41\"\x2C\"CF\"\x2C\"Central African Republic\"\x2C\"CAF\"\x2C\"140\"\r\"42\"\x2C\"TD\"\x2C\"Chad\"\x2C\"TCD\"\x2C\"148\"\r\"43\"\x2C\"CL\"\x2C\"Chile\"\x2C\"CHL\"\x2C\"152\"\r\"44\"\x2C\"CN\"\x2C\"China\"\x2C\"CHN\"\x2C\"156\"\r\"45\"\x2C\"CX\"\x2C\"Christmas Island\"\x2CNULL\x2CNULL\r\"46\"\x2C\"CC\"\x2C\"Cocos (Keeling) Islands\"\x2CNULL\x2CNULL\r\"47\"\x2C\"CO\"\x2C\"Colombia\"\x2C\"COL\"\x2C\"170\"\r\"48\"\x2C\"KM\"\x2C\"Comoros\"\x2C\"COM\"\x2C\"174\"\r\"49\"\x2C\"CG\"\x2C\"Congo\"\x2C\"COG\"\x2C\"178\"\r\"50\"\x2C\"CD\"\x2C\"Congo\x2C the Democratic Republic of the\"\x2C\"COD\"\x2C\"180\"\r\"51\"\x2C\"CK\"\x2C\"Cook Islands\"\x2C\"COK\"\x2C\"184\"\r\"52\"\x2C\"CR\"\x2C\"Costa Rica\"\x2C\"CRI\"\x2C\"188\"\r\"53\"\x2C\"CI\"\x2C\"Cote D\'Ivoire\"\x2C\"CIV\"\x2C\"384\"\r\"54\"\x2C\"HR\"\x2C\"Croatia\"\x2C\"HRV\"\x2C\"191\"\r\"55\"\x2C\"CU\"\x2C\"Cuba\"\x2C\"CUB\"\x2C\"192\"\r\"56\"\x2C\"CY\"\x2C\"Cyprus\"\x2C\"CYP\"\x2C\"196\"\r\"57\"\x2C\"CZ\"\x2C\"Czech Republic\"\x2C\"CZE\"\x2C\"203\"\r\"58\"\x2C\"DK\"\x2C\"Denmark\"\x2C\"DNK\"\x2C\"208\"\r\"59\"\x2C\"DJ\"\x2C\"Djibouti\"\x2C\"DJI\"\x2C\"262\"\r\"60\"\x2C\"DM\"\x2C\"Dominica\"\x2C\"DMA\"\x2C\"212\"\r\"61\"\x2C\"DO\"\x2C\"Dominican Republic\"\x2C\"DOM\"\x2C\"214\"\r\"62\"\x2C\"EC\"\x2C\"Ecuador\"\x2C\"ECU\"\x2C\"218\"\r\"63\"\x2C\"EG\"\x2C\"Egypt\"\x2C\"EGY\"\x2C\"818\"\r\"64\"\x2C\"SV\"\x2C\"El Salvador\"\x2C\"SLV\"\x2C\"222\"\r\"65\"\x2C\"GQ\"\x2C\"Equatorial Guinea\"\x2C\"GNQ\"\x2C\"226\"\r\"66\"\x2C\"ER\"\x2C\"Eritrea\"\x2C\"ERI\"\x2C\"232\"\r\"67\"\x2C\"EE\"\x2C\"Estonia\"\x2C\"EST\"\x2C\"233\"\r\"68\"\x2C\"ET\"\x2C\"Ethiopia\"\x2C\"ETH\"\x2C\"231\"\r\"69\"\x2C\"FK\"\x2C\"Falkland Islands (Malvinas)\"\x2C\"FLK\"\x2C\"238\"\r\"70\"\x2C\"FO\"\x2C\"Faroe Islands\"\x2C\"FRO\"\x2C\"234\"\r\"71\"\x2C\"FJ\"\x2C\"Fiji\"\x2C\"FJI\"\x2C\"242\"\r\"72\"\x2C\"FI\"\x2C\"Finland\"\x2C\"FIN\"\x2C\"246\"\r\"73\"\x2C\"FR\"\x2C\"France\"\x2C\"FRA\"\x2C\"250\"\r\"74\"\x2C\"GF\"\x2C\"French Guiana\"\x2C\"GUF\"\x2C\"254\"\r\"75\"\x2C\"PF\"\x2C\"French Polynesia\"\x2C\"PYF\"\x2C\"258\"\r\"76\"\x2C\"TF\"\x2C\"French Southern Territories\"\x2CNULL\x2CNULL\r\"77\"\x2C\"GA\"\x2C\"Gabon\"\x2C\"GAB\"\x2C\"266\"\r\"78\"\x2C\"GM\"\x2C\"Gambia\"\x2C\"GMB\"\x2C\"270\"\r\"79\"\x2C\"GE\"\x2C\"Georgia\"\x2C\"GEO\"\x2C\"268\"\r\"80\"\x2C\"DE\"\x2C\"Germany\"\x2C\"DEU\"\x2C\"276\"\r\"81\"\x2C\"GH\"\x2C\"Ghana\"\x2C\"GHA\"\x2C\"288\"\r\"82\"\x2C\"GI\"\x2C\"Gibraltar\"\x2C\"GIB\"\x2C\"292\"\r\"83\"\x2C\"GR\"\x2C\"Greece\"\x2C\"GRC\"\x2C\"300\"\r\"84\"\x2C\"GL\"\x2C\"Greenland\"\x2C\"GRL\"\x2C\"304\"\r\"85\"\x2C\"GD\"\x2C\"Grenada\"\x2C\"GRD\"\x2C\"308\"\r\"86\"\x2C\"GP\"\x2C\"Guadeloupe\"\x2C\"GLP\"\x2C\"312\"\r\"87\"\x2C\"GU\"\x2C\"Guam\"\x2C\"GUM\"\x2C\"316\"\r\"88\"\x2C\"GT\"\x2C\"Guatemala\"\x2C\"GTM\"\x2C\"320\"\r\"89\"\x2C\"GN\"\x2C\"Guinea\"\x2C\"GIN\"\x2C\"324\"\r\"90\"\x2C\"GW\"\x2C\"Guinea-Bissau\"\x2C\"GNB\"\x2C\"624\"\r\"91\"\x2C\"GY\"\x2C\"Guyana\"\x2C\"GUY\"\x2C\"328\"\r\"92\"\x2C\"HT\"\x2C\"Haiti\"\x2C\"HTI\"\x2C\"332\"\r\"93\"\x2C\"HM\"\x2C\"Heard Island and Mcdonald Islands\"\x2CNULL\x2CNULL\r\"94\"\x2C\"VA\"\x2C\"Holy See (Vatican City State)\"\x2C\"VAT\"\x2C\"336\"\r\"95\"\x2C\"HN\"\x2C\"Honduras\"\x2C\"HND\"\x2C\"340\"\r\"96\"\x2C\"HK\"\x2C\"Hong Kong\"\x2C\"HKG\"\x2C\"344\"\r\"97\"\x2C\"HU\"\x2C\"Hungary\"\x2C\"HUN\"\x2C\"348\"\r\"98\"\x2C\"IS\"\x2C\"Iceland\"\x2C\"ISL\"\x2C\"352\"\r\"99\"\x2C\"IN\"\x2C\"India\"\x2C\"IND\"\x2C\"356\"\r\"100\"\x2C\"ID\"\x2C\"Indonesia\"\x2C\"IDN\"\x2C\"360\"\r\"101\"\x2C\"IR\"\x2C\"Iran\x2C Islamic Republic of\"\x2C\"IRN\"\x2C\"364\"\r\"102\"\x2C\"IQ\"\x2C\"Iraq\"\x2C\"IRQ\"\x2C\"368\"\r\"103\"\x2C\"IE\"\x2C\"Ireland\"\x2C\"IRL\"\x2C\"372\"\r\"104\"\x2C\"IL\"\x2C\"Israel\"\x2C\"ISR\"\x2C\"376\"\r\"105\"\x2C\"IT\"\x2C\"Italy\"\x2C\"ITA\"\x2C\"380\"\r\"106\"\x2C\"JM\"\x2C\"Jamaica\"\x2C\"JAM\"\x2C\"388\"\r\"107\"\x2C\"JP\"\x2C\"Japan\"\x2C\"JPN\"\x2C\"392\"\r\"108\"\x2C\"JO\"\x2C\"Jordan\"\x2C\"JOR\"\x2C\"400\"\r\"109\"\x2C\"KZ\"\x2C\"Kazakhstan\"\x2C\"KAZ\"\x2C\"398\"\r\"110\"\x2C\"KE\"\x2C\"Kenya\"\x2C\"KEN\"\x2C\"404\"\r\"111\"\x2C\"KI\"\x2C\"Kiribati\"\x2C\"KIR\"\x2C\"296\"\r\"112\"\x2C\"KP\"\x2C\"Korea\x2C Democratic People\'s Republic of\"\x2C\"PRK\"\x2C\"408\"\r\"113\"\x2C\"KR\"\x2C\"Korea\x2C Republic of\"\x2C\"KOR\"\x2C\"410\"\r\"114\"\x2C\"KW\"\x2C\"Kuwait\"\x2C\"KWT\"\x2C\"414\"\r\"115\"\x2C\"KG\"\x2C\"Kyrgyzstan\"\x2C\"KGZ\"\x2C\"417\"\r\"116\"\x2C\"LA\"\x2C\"Lao People\'s Democratic Republic\"\x2C\"LAO\"\x2C\"418\"\r\"117\"\x2C\"LV\"\x2C\"Latvia\"\x2C\"LVA\"\x2C\"428\"\r\"118\"\x2C\"LB\"\x2C\"Lebanon\"\x2C\"LBN\"\x2C\"422\"\r\"119\"\x2C\"LS\"\x2C\"Lesotho\"\x2C\"LSO\"\x2C\"426\"\r\"120\"\x2C\"LR\"\x2C\"Liberia\"\x2C\"LBR\"\x2C\"430\"\r\"121\"\x2C\"LY\"\x2C\"Libyan Arab Jamahiriya\"\x2C\"LBY\"\x2C\"434\"\r\"122\"\x2C\"LI\"\x2C\"Liechtenstein\"\x2C\"LIE\"\x2C\"438\"\r\"123\"\x2C\"LT\"\x2C\"Lithuania\"\x2C\"LTU\"\x2C\"440\"\r\"124\"\x2C\"LU\"\x2C\"Luxembourg\"\x2C\"LUX\"\x2C\"442\"\r\"125\"\x2C\"MO\"\x2C\"Macao\"\x2C\"MAC\"\x2C\"446\"\r\"126\"\x2C\"MK\"\x2C\"Macedonia\x2C the Former Yugoslav Republic of\"\x2C\"MKD\"\x2C\"807\"\r\"127\"\x2C\"MG\"\x2C\"Madagascar\"\x2C\"MDG\"\x2C\"450\"\r\"128\"\x2C\"MW\"\x2C\"Malawi\"\x2C\"MWI\"\x2C\"454\"\r\"129\"\x2C\"MY\"\x2C\"Malaysia\"\x2C\"MYS\"\x2C\"458\"\r\"130\"\x2C\"MV\"\x2C\"Maldives\"\x2C\"MDV\"\x2C\"462\"\r\"131\"\x2C\"ML\"\x2C\"Mali\"\x2C\"MLI\"\x2C\"466\"\r\"132\"\x2C\"MT\"\x2C\"Malta\"\x2C\"MLT\"\x2C\"470\"\r\"133\"\x2C\"MH\"\x2C\"Marshall Islands\"\x2C\"MHL\"\x2C\"584\"\r\"134\"\x2C\"MQ\"\x2C\"Martinique\"\x2C\"MTQ\"\x2C\"474\"\r\"135\"\x2C\"MR\"\x2C\"Mauritania\"\x2C\"MRT\"\x2C\"478\"\r\"136\"\x2C\"MU\"\x2C\"Mauritius\"\x2C\"MUS\"\x2C\"480\"\r\"137\"\x2C\"YT\"\x2C\"Mayotte\"\x2CNULL\x2CNULL\r\"138\"\x2C\"MX\"\x2C\"Mexico\"\x2C\"MEX\"\x2C\"484\"\r\"139\"\x2C\"FM\"\x2C\"Micronesia\x2C Federated States of\"\x2C\"FSM\"\x2C\"583\"\r\"140\"\x2C\"MD\"\x2C\"Moldova\x2C Republic of\"\x2C\"MDA\"\x2C\"498\"\r\"141\"\x2C\"MC\"\x2C\"Monaco\"\x2C\"MCO\"\x2C\"492\"\r\"142\"\x2C\"MN\"\x2C\"Mongolia\"\x2C\"MNG\"\x2C\"496\"\r\"143\"\x2C\"MS\"\x2C\"Montserrat\"\x2C\"MSR\"\x2C\"500\"\r\"144\"\x2C\"MA\"\x2C\"Morocco\"\x2C\"MAR\"\x2C\"504\"\r\"145\"\x2C\"MZ\"\x2C\"Mozambique\"\x2C\"MOZ\"\x2C\"508\"\r\"146\"\x2C\"MM\"\x2C\"Myanmar\"\x2C\"MMR\"\x2C\"104\"\r\"147\"\x2C\"NA\"\x2C\"Namibia\"\x2C\"NAM\"\x2C\"516\"\r\"148\"\x2C\"NR\"\x2C\"Nauru\"\x2C\"NRU\"\x2C\"520\"\r\"149\"\x2C\"NP\"\x2C\"Nepal\"\x2C\"NPL\"\x2C\"524\"\r\"150\"\x2C\"NL\"\x2C\"Netherlands\"\x2C\"NLD\"\x2C\"528\"\r\"151\"\x2C\"AN\"\x2C\"Netherlands Antilles\"\x2C\"ANT\"\x2C\"530\"\r\"152\"\x2C\"NC\"\x2C\"New Caledonia\"\x2C\"NCL\"\x2C\"540\"\r\"153\"\x2C\"NZ\"\x2C\"New Zealand\"\x2C\"NZL\"\x2C\"554\"\r\"154\"\x2C\"NI\"\x2C\"Nicaragua\"\x2C\"NIC\"\x2C\"558\"\r\"155\"\x2C\"NE\"\x2C\"Niger\"\x2C\"NER\"\x2C\"562\"\r\"156\"\x2C\"NG\"\x2C\"Nigeria\"\x2C\"NGA\"\x2C\"566\"\r\"157\"\x2C\"NU\"\x2C\"Niue\"\x2C\"NIU\"\x2C\"570\"\r\"158\"\x2C\"NF\"\x2C\"Norfolk Island\"\x2C\"NFK\"\x2C\"574\"\r\"159\"\x2C\"MP\"\x2C\"Northern Mariana Islands\"\x2C\"MNP\"\x2C\"580\"\r\"160\"\x2C\"NO\"\x2C\"Norway\"\x2C\"NOR\"\x2C\"578\"\r\"161\"\x2C\"OM\"\x2C\"Oman\"\x2C\"OMN\"\x2C\"512\"\r\"162\"\x2C\"PK\"\x2C\"Pakistan\"\x2C\"PAK\"\x2C\"586\"\r\"163\"\x2C\"PW\"\x2C\"Palau\"\x2C\"PLW\"\x2C\"585\"\r\"164\"\x2C\"PS\"\x2C\"Palestinian Territory\x2C Occupied\"\x2CNULL\x2CNULL\r\"165\"\x2C\"PA\"\x2C\"Panama\"\x2C\"PAN\"\x2C\"591\"\r\"166\"\x2C\"PG\"\x2C\"Papua New Guinea\"\x2C\"PNG\"\x2C\"598\"\r\"167\"\x2C\"PY\"\x2C\"Paraguay\"\x2C\"PRY\"\x2C\"600\"\r\"168\"\x2C\"PE\"\x2C\"Peru\"\x2C\"PER\"\x2C\"604\"\r\"169\"\x2C\"PH\"\x2C\"Philippines\"\x2C\"PHL\"\x2C\"608\"\r\"170\"\x2C\"PN\"\x2C\"Pitcairn\"\x2C\"PCN\"\x2C\"612\"\r\"171\"\x2C\"PL\"\x2C\"Poland\"\x2C\"POL\"\x2C\"616\"\r\"172\"\x2C\"PT\"\x2C\"Portugal\"\x2C\"PRT\"\x2C\"620\"\r\"173\"\x2C\"PR\"\x2C\"Puerto Rico\"\x2C\"PRI\"\x2C\"630\"\r\"174\"\x2C\"QA\"\x2C\"Qatar\"\x2C\"QAT\"\x2C\"634\"\r\"175\"\x2C\"RE\"\x2C\"Reunion\"\x2C\"REU\"\x2C\"638\"\r\"176\"\x2C\"RO\"\x2C\"Romania\"\x2C\"ROM\"\x2C\"642\"\r\"177\"\x2C\"RU\"\x2C\"Russian Federation\"\x2C\"RUS\"\x2C\"643\"\r\"178\"\x2C\"RW\"\x2C\"Rwanda\"\x2C\"RWA\"\x2C\"646\"\r\"179\"\x2C\"SH\"\x2C\"Saint Helena\"\x2C\"SHN\"\x2C\"654\"\r\"180\"\x2C\"KN\"\x2C\"Saint Kitts and Nevis\"\x2C\"KNA\"\x2C\"659\"\r\"181\"\x2C\"LC\"\x2C\"Saint Lucia\"\x2C\"LCA\"\x2C\"662\"\r\"182\"\x2C\"PM\"\x2C\"Saint Pierre and Miquelon\"\x2C\"SPM\"\x2C\"666\"\r\"183\"\x2C\"VC\"\x2C\"Saint Vincent and the Grenadines\"\x2C\"VCT\"\x2C\"670\"\r\"184\"\x2C\"WS\"\x2C\"Samoa\"\x2C\"WSM\"\x2C\"882\"\r\"185\"\x2C\"SM\"\x2C\"San Marino\"\x2C\"SMR\"\x2C\"674\"\r\"186\"\x2C\"ST\"\x2C\"Sao Tome and Principe\"\x2C\"STP\"\x2C\"678\"\r\"187\"\x2C\"SA\"\x2C\"Saudi Arabia\"\x2C\"SAU\"\x2C\"682\"\r\"188\"\x2C\"SN\"\x2C\"Senegal\"\x2C\"SEN\"\x2C\"686\"\r\"189\"\x2C\"CS\"\x2C\"Serbia and Montenegro\"\x2CNULL\x2CNULL\r\"190\"\x2C\"SC\"\x2C\"Seychelles\"\x2C\"SYC\"\x2C\"690\"\r\"191\"\x2C\"SL\"\x2C\"Sierra Leone\"\x2C\"SLE\"\x2C\"694\"\r\"192\"\x2C\"SG\"\x2C\"Singapore\"\x2C\"SGP\"\x2C\"702\"\r\"193\"\x2C\"SK\"\x2C\"Slovakia\"\x2C\"SVK\"\x2C\"703\"\r\"194\"\x2C\"SI\"\x2C\"Slovenia\"\x2C\"SVN\"\x2C\"705\"\r\"195\"\x2C\"SB\"\x2C\"Solomon Islands\"\x2C\"SLB\"\x2C\"90\"\r\"196\"\x2C\"SO\"\x2C\"Somalia\"\x2C\"SOM\"\x2C\"706\"\r\"197\"\x2C\"ZA\"\x2C\"South Africa\"\x2C\"ZAF\"\x2C\"710\"\r\"198\"\x2C\"GS\"\x2C\"South Georgia and the South Sandwich Islands\"\x2CNULL\x2CNULL\r\"199\"\x2C\"ES\"\x2C\"Spain\"\x2C\"ESP\"\x2C\"724\"\r\"200\"\x2C\"LK\"\x2C\"Sri Lanka\"\x2C\"LKA\"\x2C\"144\"\r\"201\"\x2C\"SD\"\x2C\"Sudan\"\x2C\"SDN\"\x2C\"736\"\r\"202\"\x2C\"SR\"\x2C\"Suriname\"\x2C\"SUR\"\x2C\"740\"\r\"203\"\x2C\"SJ\"\x2C\"Svalbard and Jan Mayen\"\x2C\"SJM\"\x2C\"744\"\r\"204\"\x2C\"SZ\"\x2C\"Swaziland\"\x2C\"SWZ\"\x2C\"748\"\r\"205\"\x2C\"SE\"\x2C\"Sweden\"\x2C\"SWE\"\x2C\"752\"\r\"206\"\x2C\"CH\"\x2C\"Switzerland\"\x2C\"CHE\"\x2C\"756\"\r\"207\"\x2C\"SY\"\x2C\"Syrian Arab Republic\"\x2C\"SYR\"\x2C\"760\"\r\"208\"\x2C\"TW\"\x2C\"Taiwan\x2C Province of China\"\x2C\"TWN\"\x2C\"158\"\r\"209\"\x2C\"TJ\"\x2C\"Tajikistan\"\x2C\"TJK\"\x2C\"762\"\r\"210\"\x2C\"TZ\"\x2C\"Tanzania\x2C United Republic of\"\x2C\"TZA\"\x2C\"834\"\r\"211\"\x2C\"TH\"\x2C\"Thailand\"\x2C\"THA\"\x2C\"764\"\r\"212\"\x2C\"TL\"\x2C\"Timor-Leste\"\x2CNULL\x2CNULL\r\"213\"\x2C\"TG\"\x2C\"Togo\"\x2C\"TGO\"\x2C\"768\"\r\"214\"\x2C\"TK\"\x2C\"Tokelau\"\x2C\"TKL\"\x2C\"772\"\r\"215\"\x2C\"TO\"\x2C\"Tonga\"\x2C\"TON\"\x2C\"776\"\r\"216\"\x2C\"TT\"\x2C\"Trinidad and Tobago\"\x2C\"TTO\"\x2C\"780\"\r\"217\"\x2C\"TN\"\x2C\"Tunisia\"\x2C\"TUN\"\x2C\"788\"\r\"218\"\x2C\"TR\"\x2C\"Turkey\"\x2C\"TUR\"\x2C\"792\"\r\"219\"\x2C\"TM\"\x2C\"Turkmenistan\"\x2C\"TKM\"\x2C\"795\"\r\"220\"\x2C\"TC\"\x2C\"Turks and Caicos Islands\"\x2C\"TCA\"\x2C\"796\"\r\"221\"\x2C\"TV\"\x2C\"Tuvalu\"\x2C\"TUV\"\x2C\"798\"\r\"222\"\x2C\"UG\"\x2C\"Uganda\"\x2C\"UGA\"\x2C\"800\"\r\"223\"\x2C\"UA\"\x2C\"Ukraine\"\x2C\"UKR\"\x2C\"804\"\r\"224\"\x2C\"AE\"\x2C\"United Arab Emirates\"\x2C\"ARE\"\x2C\"784\"\r\"225\"\x2C\"GB\"\x2C\"United Kingdom\"\x2C\"GBR\"\x2C\"826\"\r\"226\"\x2C\"US\"\x2C\"United States\"\x2C\"USA\"\x2C\"840\"\r\"227\"\x2C\"UM\"\x2C\"United States Minor Outlying Islands\"\x2CNULL\x2CNULL\r\"228\"\x2C\"UY\"\x2C\"Uruguay\"\x2C\"URY\"\x2C\"858\"\r\"229\"\x2C\"UZ\"\x2C\"Uzbekistan\"\x2C\"UZB\"\x2C\"860\"\r\"230\"\x2C\"VU\"\x2C\"Vanuatu\"\x2C\"VUT\"\x2C\"548\"\r\"231\"\x2C\"VE\"\x2C\"Venezuela\"\x2C\"VEN\"\x2C\"862\"\r\"232\"\x2C\"VN\"\x2C\"Viet Nam\"\x2C\"VNM\"\x2C\"704\"\r\"233\"\x2C\"VG\"\x2C\"Virgin Islands\x2C British\"\x2C\"VGB\"\x2C\"92\"\r\"234\"\x2C\"VI\"\x2C\"Virgin Islands\x2C U.s.\"\x2C\"VIR\"\x2C\"850\"\r\"235\"\x2C\"WF\"\x2C\"Wallis and Futuna\"\x2C\"WLF\"\x2C\"876\"\r\"236\"\x2C\"EH\"\x2C\"Western Sahara\"\x2C\"ESH\"\x2C\"732\"\r\"237\"\x2C\"YE\"\x2C\"Yemen\"\x2C\"YEM\"\x2C\"887\"\r\"238\"\x2C\"ZM\"\x2C\"Zambia\"\x2C\"ZMB\"\x2C\"894\"\r\"239\"\x2C\"ZW\"\x2C\"Zimbabwe\"\x2C\"ZWE\"\x2C\"716\"", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDEFAULT_FORMATS, Type = String, Dynamic = False, Default = \"\"720p\"\x2C\"720p 24p\"\x2C\"1440\"\x2C\"720\"\x2C\"23.976\"\x2C0\x2C\"1.78\"\x2C0\r\"1080p\"\x2C\"1080p 24p S3D\"\x2C\"1920\"\x2C\"1080\"\x2C\"23.976\"\x2C0\x2C\"1.78\"\x2C1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_ADDRESS, Type = String, Dynamic = False, Default = \"\"address_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"address_id\">\x3D0)\x2C\"address\" VARCHAR(45)\x2C\"address2\" VARCHAR(45)\x2C\"district\" VARCHAR(45)\x2C\"city_id\" INTEGER NOT NULL CHECK(\"city_id\">\x3D0)\x2C\"postal_code\" VARCHAR(10)\x2C\"phone\" VARCHAR(20)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_BANNED, Type = String, Dynamic = False, Default = \"\"banned_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"banned_id\">\x3D0)\x2C\"reason\" VARCHAR(45)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_CITY, Type = String, Dynamic = False, Default = \"\"city_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"city_id\">\x3D0)\x2C\"city\" VARCHAR(45)\x2C\"country_id\" INTEGER NOT NULL CHECK(\"country_id\">\x3D0)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_COLUMN_TYPE, Type = String, Dynamic = False, Default = \"\"id_column_type\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"project_type_id\">\x3D0)\x2C\"column_name\" VARCHAR(45)\x2C\"column_type\" VARCHAR(45)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_COMPANY, Type = String, Dynamic = False, Default = \"\"company_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"company_id\">\x3D0)\x2C\"user_id\" INTEGER NOT NULL CHECK(\"user_id\">\x3D0)\x2C\"company\" VARCHAR(45)\x2C\"department\" VARCHAR(45)\x2C\"contact\" VARCHAR(45)\x2C\"contact2\" VARCHAR(45)\x2C\"address_id\" INTEGER NOT NULL CHECK(\"address_id\">\x3D0)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_COUNTRIES, Type = String, Dynamic = False, Default = \"\"country_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"country_id\">\x3D0)\x2C\"iso\" VARCHAR(20)\x2C\"name\" VARCHAR(45)\x2C\"iso3\" VARCHAR(20)\x2C\"numcode\" VARCHAR(20)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_DEPARTMENT, Type = String, Dynamic = False, Default = \"\"dept_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"dept_id\">\x3D0)\x2C\"name\" VARCHAR(45)\x2C\"description\" TEXT\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_EDITORIAL, Type = String, Dynamic = False, Default = \"\"edit_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"edit_id\">\x3D0)\x2C\"reel\" VARCHAR(45)\x2C\"src_Frame_In\" VARCHAR(10)\x2C\"src_Frame_Out\" VARCHAR(10)\x2C\"src_TC_In\" VARCHAR(20)\x2C\"src_TC_Out\" VARCHAR(20)\x2C\"duration\" VARCHAR(10)\x2C\"frameRate\" VARCHAR(8)\x2C\"image_id\" INTEGER NOT NULL CHECK(\"image_id\">\x3D0)\x2C\"notes_id\" INTEGER NOT NULL CHECK(\"notes_id\">\x3D0)\x2C\"status_id\" INTEGER NOT NULL CHECK(\"status_id\">\x3D0)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_FILEPATHS, Type = String, Dynamic = False, Default = \"\"filepaths_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"filepaths_id\">\x3D0)\x2C\"filepath_name\" VARCHAR(45)\x2C\"relative_path\" VARCHAR(255)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_FILE_TEMPLATES, Type = String, Dynamic = False, Default = \"\"file_template_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"file_template_id\">\x3D0)\x2C\"name\" VARCHAR(20)\x2C\"template\" VARCHAR(45)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_FORMATS, Type = String, Dynamic = False, Default = \"\"format_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"format_id\">\x3D0)\x2C\"format_name\" VARCHAR(45)\x2C\"description\" VARCHAR(45)\x2C\"width\" VARCHAR(5)\x2C\"height\" VARCHAR(5)\x2C\"framerate\" VARCHAR(10)\x2C\"interlaced\" BOOLEAN\x2C\"aspect_ratio\" VARCHAR(10)\x2C\"S3D\" BOOLEAN", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_GROUPS, Type = String, Dynamic = False, Default = \"\"group_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"group_id\">\x3D0)\x2C\"title\" VARCHAR(45)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_IMAGES, Type = String, Dynamic = False, Default = \"\"image_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"image_id\">\x3D0)\x2C\"imagename\" VARCHAR(45)\x2C\"image\" BLOB\x2C\"user_id\" INTEGER NOT NULL CHECK(\"user_id\">\x3D0)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_MEDIA, Type = String, Dynamic = False, Default = \"\"media_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"media_id\">\x3D0)\x2C\"name\" VARCHAR(45)\x2C\"filepath\" VARCHAR(45)\x2C\"user_id\" INTEGER NOT NULL CHECK(\"user_id\">\x3D0)\x2C\"note_id\" INTEGER NOT NULL CHECK(\"note_id\">\x3D0)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_NOTES, Type = String, Dynamic = False, Default = \"\"note_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"note_id\">\x3D0)\x2C\"user_id\" INTEGER CHECK(\"user_id\">\x3D0)\x2C\"edit_id\" INTEGER CHECK(\"edit_id\">\x3D0)\x2C\"task_id\" INTEGER CHECK(\"task_id\">\x3D0)\x2C\"scene_id\" INTEGER CHECK(\"scene_id\">\x3D0)\x2C\"shot_id\" INTEGER CHECK(\"shot_id\">\x3D0)\x2C\"seq_id\" INTEGER CHECK(\"seq_id\">\x3D0)\x2C\"note_name\" VARCHAR(45)\x2C\"note_body\" TEXT\x2C\"status_id\" INTEGER NOT NULL CHECK(\"status_id\">\x3D0)\x2C\"date\" VARCHAR(20)\x2C\"time\" TIMESTAMP\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_PROJECTS, Type = String, Dynamic = False, Default = \"\"project_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"project_id\">\x3D0)\x2C\"company_id\" INTEGER NOT NULL CHECK(\"company_id\">\x3D0)\x2C\"project_type_id\" INTEGER NOT NULL CHECK(\"project_type_id\">\x3D0)\x2C\"format_id\" INTEGER CHECK(\"format_type_id\">\x3D0)\x2C\"project_name\" VARCHAR(45)\x2C\"database_name\" VARCHAR(45)\x2C\"working_title\" VARCHAR(45)\x2C\"description\" VARCHAR(45)\x2C\"status\" VARCHAR(10)\x2C\"start_date\" VARCHAR(20)\x2C\"end_date\" VARCHAR(20)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_PROJECT_TYPE, Type = String, Dynamic = False, Default = \"\"project_type_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"project_type_id\">\x3D0)\x2C\"project_type_name\" VARCHAR(45)\x2C\"decsription\" VARCHAR(45)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_SCENES, Type = String, Dynamic = False, Default = \"\"scene_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"scene_id\">\x3D0)\x2C\"scene_name\" VARCHAR(45)\x2C\"status_id\" INTEGER CHECK(\"status_id\">\x3D0)\x2C\"scene_description\" TEXT", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_SEQUENCES, Type = String, Dynamic = False, Default = \"\"seq_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"seq_id\">\x3D0)\x2C\"scene_id\" INTEGER NOT NULL CHECK(\"scene_id\">\x3D0)\x2C\"edit_id\" INTEGER NOT NULL CHECK(\"edit_id\">\x3D0)\x2C\"recFrameIn\" VARCHAR(10)\x2C\"recFrameOut\" VARCHAR(10)\x2C\"recTCIn\" VARCHAR(20)\x2C\"recTCOut\" VARCHAR(20)\x2C\"frameRate\" VARCHAR(8)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_SETTINGS, Type = String, Dynamic = False, Default = \"ID INTEGER NOT NULL PRIMARY KEY", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_SHOTS, Type = String, Dynamic = False, Default = \"\"shot_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"shot_id\">\x3D0)\x2C\"edit_id\" INTEGER CHECK(\"edit_id\">\x3D0)\x2C\"scene_id\" INTEGER CHECK(\"scene_id\">\x3D0)\x2C\"seq_id\" INTEGER CHECK(\"seq_id\">\x3D0)\x2C\"shot_name\" VARCHAR(45)\x2C\"shot_description\" VARCHAR(45)\x2C\"reel\" VARCHAR(45)\x2C\"src_Frame_In\" VARCHAR(10)\x2C\"src_Frame_Out\" VARCHAR(10)\x2C\"src_TC_In\" VARCHAR(20)\x2C\"src_TC_Out\" VARCHAR(20)\x2C\"shot_duration\" VARCHAR(10)\x2C \"image_id\" INTEGER CHECK(\"image_id\">\x3D0)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_STATUS, Type = String, Dynamic = False, Default = \"\"status_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"status_id\">\x3D0)\x2C\"status_name\" VARCHAR(20)\x2C\"image_id\" INTEGER NOT NULL CHECK(\"image_id\">\x3D0)\x2C\"type\" VARCHAR(10)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_STATUS_TYPE, Type = String, Dynamic = False, Default = \"\"status_type_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"status_type_id\">\x3D0)\x2C\"name\" VARCHAR(45)\x2C\"state\" INTEGER NOT NULL CHECK(\"state\">\x3D0)\x2C\"image_id\" INTEGER NOT NULL CHECK(\"image_id\">\x3D0)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_STEREO, Type = String, Dynamic = False, Default = \"ID integer NOT NULL PRIMARY KEY\x2C difficultyDimension integer\x2C difficultyFillin integer\x2C hasMasterFrames boolean\x2CconvergePoint integer\x2C convergeDegree integer\x2C maxPixelSeparation integer\x2C convergeCoord VARCHAR\x2C parallax integer\x2C cameraMove varchar\x2C retouchMethod varchar\x2C addVFX varchar\x2C depthScript varchar\x2C UMID varchar", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_SYSTEM, Type = String, Dynamic = False, Default = \"\"system_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"system_id\">\x3D0)\x2C\"software_version\" VARCHAR(10)\x2C\"system_database_version\" VARCHAR(10)\x2C \"project_database_version\" VARCHAR(10)\r\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_TASKS, Type = String, Dynamic = False, Default = \"\"task_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"task_id\">\x3D0)\x2C\"shot_id\" INTEGER CHECK(\"seq_id\">\x3D0)\x2C\"task_name\" VARCHAR(45)\x2C\"task_description\" VARCHAR(45)\x2C\"task_type_id\" VARCHAR(45)\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_TEMPLATES, Type = String, Dynamic = False, Default = \"\"template_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"template_id\">\x3D0)\x2C\"user_id\" INTEGER CHECK(\"user_id\">\x3D0)\x2C \"template_name\" VARCHAR(20)\x2C \"template_type\" VARCHAR(10)\x2C\"template\" TEXT\r\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_TYPES, Type = String, Dynamic = False, Default = \"ID INTEGER NOT NULL PRIMARY KEY\x2C category VARCHAR\x2C type VARCHAR\x2C description VARCHAR", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_USERS, Type = String, Dynamic = False, Default = \"\"user_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"user_id\">\x3D0)\x2C\"group_id\" INTEGER NOT NULL CHECK(\"group_id\">\x3D0) DEFAULT 0\x2C\"dept_id\" INTEGER NOT NULL CHECK(\"dept_id\">\x3D0) DEFAULT 0\x2C\"banned_id\" INTEGER NOT NULL CHECK(\"banned_id\">\x3D0) DEFAULT 0\x2C\"country_id\" INTEGER NOT NULL CHECK(\"country_id\">\x3D0) DEFAULT 0\x2C\"question_id\" INTEGER NOT NULL CHECK(\"question_id\">\x3D0) DEFAULT 0\x2C\"user_name\" VARCHAR(45)\x2C\"last_name\" VARCHAR(45)\x2C\"first_name\" VARCHAR(45)\x2C\"company_id\" INTEGER NOT NULL CHECK(\"company_id\">\x3D0)\x2C\"password\" VARCHAR(20)\x2C\"email\" VARCHAR(45)\x2C\"address_id\" INTEGER NOT NULL CHECK(\"address_id\">\x3D0)\x2C\"phone\" VARCHAR(20)\x2C\"phone_ext\" VARCHAR(10)\x2C\"mobile\" VARCHAR(20)\x2C\"user_type\" VARCHAR(20)\x2C\"hash\" VARCHAR(45)\x2C\"activation_code\" VARCHAR(45)\x2C\"forgotten_password_code\" VARCHAR(45)\x2C\"signature\" VARCHAR(45)\x2C\"status\" VARCHAR(10)\x2CCONSTRAINT \"fk_user_address\"FOREIGN KEY(\"address_id\")REFERENCES \"address\"(\"address_id\")ON DELETE RESTRICT ON UPDATE CASCADE\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_USER_GROUPS, Type = String, Dynamic = False, Default = \"groupID smallint(4) NOT NULL\x2CsiteID int(4) NOT NULL DEFAULT \'1\'\x2Cgroup_title VARCHAR(100) NOT NULL\x2Cgroup_description text NOT NULL\x2Cis_locked char(1) NOT NULL DEFAULT \'y\'\x2Ccan_view_offline_system char(1) NOT NULL DEFAULT \'n\'\x2Ccan_view_online_system char(1) NOT NULL DEFAULT \'y\'\x2Ccan_access_cp char(1) NOT NULL DEFAULT \'y\'\x2Ccan_access_publish char(1) NOT NULL DEFAULT \'n\'\x2Ccan_access_edit char(1) NOT NULL DEFAULT \'n\'\x2Ccan_access_design char(1) NOT NULL DEFAULT \'n\'\x2Ccan_access_comm char(1) NOT NULL DEFAULT \'n\'\x2Ccan_access_modules char(1) NOT NULL DEFAULT \'n\'\x2Ccan_access_admin char(1) NOT NULL DEFAULT \'n\'\x2Ccan_admin_weblogs char(1) NOT NULL DEFAULT \'n\'\x2Ccan_admin_members char(1) NOT NULL DEFAULT \'n\'\x2Ccan_delete_members char(1) NOT NULL DEFAULT \'n\'\x2Ccan_admin_mbr_groups char(1) NOT NULL DEFAULT \'n\'\x2Ccan_admin_mbr_templates char(1) NOT NULL DEFAULT \'n\'\x2Ccan_ban_users char(1) NOT NULL DEFAULT \'n\'\x2Ccan_admin_utilities char(1) NOT NULL DEFAULT \'n\'\x2Ccan_admin_preferences char(1) NOT NULL DEFAULT \'n\'\x2Ccan_admin_modules char(1) NOT NULL DEFAULT \'n\'\x2Ccan_admin_templates char(1) NOT NULL DEFAULT \'n\'\x2Ccan_edit_categories char(1) NOT NULL DEFAULT \'n\'\x2Ccan_delete_categories char(1) NOT NULL DEFAULT \'n\'\x2Ccan_view_other_entries char(1) NOT NULL DEFAULT \'n\'\x2Ccan_edit_other_entries char(1) NOT NULL DEFAULT \'n\'\x2Ccan_assign_post_authors char(1) NOT NULL DEFAULT \'n\'\x2Ccan_delete_self_entries char(1) NOT NULL DEFAULT \'n\'\x2Ccan_delete_all_entries char(1) NOT NULL DEFAULT \'n\'\x2Ccan_view_other_comments char(1) NOT NULL DEFAULT \'n\'\x2Ccan_edit_own_comments char(1) NOT NULL DEFAULT \'n\'\x2Ccan_delete_own_comments char(1) NOT NULL DEFAULT \'n\'\x2Ccan_edit_all_comments char(1) NOT NULL DEFAULT \'n\'\x2Ccan_delete_all_comments char(1) NOT NULL DEFAULT \'n\'\x2Ccan_moderate_comments char(1) NOT NULL DEFAULT \'n\'\x2Ccan_send_email char(1) NOT NULL DEFAULT \'n\'\x2Ccan_send_cached_email char(1) NOT NULL DEFAULT \'n\'\x2Ccan_email_member_groups char(1) NOT NULL DEFAULT \'n\'\x2Ccan_email_mailinglist char(1) NOT NULL DEFAULT \'n\'\x2Ccan_email_from_profile char(1) NOT NULL DEFAULT \'n\'\x2Ccan_view_profiles char(1) NOT NULL DEFAULT \'n\'\x2Ccan_delete_self char(1) NOT NULL DEFAULT \'n\'\x2Cmbr_delete_notify_emails varchar(255) NOT NULL\x2Ccan_post_comments char(1) NOT NULL DEFAULT \'n\'\x2Cexclude_from_moderation char(1) NOT NULL DEFAULT \'n\'\x2Ccan_search char(1) NOT NULL DEFAULT \'n\'\x2Csearch_flood_control mediumint(5) NOT NULL\x2Ccan_send_private_messages char(1) NOT NULL DEFAULT \'n\'\x2Cprv_msg_send_limit smallint(5) NOT NULL DEFAULT \'20\'\x2Cprv_msg_storage_limit smallint(5) NOT NULL DEFAULT \'60\'\x2Ccan_attach_in_private_messages char(1) NOT NULL DEFAULT \'n\'\x2Ccan_send_bulletins char(1) NOT NULL DEFAULT \'n\'\x2Cinclude_in_authorlist char(1) NOT NULL DEFAULT \'n\'\x2Cinclude_in_memberlist char(1) NOT NULL DEFAULT \'y\'\x2Cinclude_in_mailinglists char(1) NOT NULL DEFAULT \'y\'\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_USER_GROUPS_DEFAULT, Type = String, Dynamic = False, Default = \"groupID\x2C siteID\x2C group_title\x2C group_description\x2C is_locked\x2C can_view_offline_system\x2C can_view_online_system\x2C can_access_cp\x2C can_access_publish\x2C can_access_edit\x2C can_access_design\x2C can_access_comm\x2C can_access_modules\x2C can_access_admin\x2C can_admin_weblogs\x2C can_admin_members\x2C can_delete_members\x2C can_admin_mbr_groups\x2C can_admin_mbr_templates\x2C can_ban_users\x2C can_admin_utilities\x2C can_admin_preferences\x2C can_admin_modules\x2C can_admin_templates\x2C can_edit_categories\x2C can_delete_categories\x2C can_view_other_entries\x2C can_edit_other_entries\x2C can_assign_post_authors\x2C can_delete_self_entries\x2C can_delete_all_entries\x2C can_view_other_comments\x2C can_edit_own_comments\x2C can_delete_own_comments\x2C can_edit_all_comments\x2C can_delete_all_comments\x2C can_moderate_comments\x2C can_send_email\x2C can_send_cached_email\x2C can_email_member_groups\x2C can_email_mailinglist\x2C can_email_from_profile\x2C can_view_profiles\x2C can_delete_self\x2C mbr_delete_notify_emails\x2C can_post_comments\x2C exclude_from_moderation\x2C can_search\x2C search_flood_control\x2C can_send_private_messages\x2C prv_msg_send_limit\x2C prv_msg_storage_limit\x2C can_attach_in_private_messages\x2C can_send_bulletins\x2C include_in_authorlist\x2C include_in_memberlist\x2C include_in_mailinglists) VALUES (1\x2C 1\x2C \'Super Admins\'\x2C \'\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C \'\'\x2C \'y\'\x2C \'y\'\x2C \'y\'\x2C 0\x2C \'y\'\x2C 20\x2C 60\x2C \'y\'\x2C \'y\'\x2C \'n\'\x2C \'y\'\x2C \'y\'", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_USER_IMAGES, Type = String, Dynamic = False, Default = \"\"user_image_id\" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK(\"image_id\">\x3D0)\x2C\r\"image_name\" VARCHAR(45)\x2C\"image\" BLOB\x2C\"user_id\" INTEGER NOT NULL\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kTABLE_WORKORDER, Type = String, Dynamic = False, Default = \"ID integer NOT NULL PRIMARY KEY\x2C name VARCHAR\x2C eventNumber integer\x2C sceneNumber integer\x2C shotNumber integer\x2C matteNumber varchar\x2C note varchar\x2C date varchar\x2C userID INTEGER\x2C status integer\x2C published integer\x2C ImageID integer\x2C clientPO varchar\x2C billed boolean\x2C invoice varchar\x2C vendorInvoice varchar\x2C UMID varchar", Scope = Protected
	#tag EndConstant


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
