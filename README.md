# FlatFileToQueryConverter

	Filename: FileUtil.cfc
	Purpose: To Support Flat File specific functions
	Author: Joe Lechuga joe.lechuga@gmail.com
	Usage:  
         fileUtilObj = CreateObject("component","FileUtil");
         convertedQuery = fileUtilObj.convertToQuery(<Body of File>,<Delimiter>);
