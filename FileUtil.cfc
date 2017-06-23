/*
	Filename: FileUtil.cfc
	Purpose: To Support Flat File specific functions
	Author: Joe Lechuga joe.lechuga@gmail.com

	Usage:  
         fileUtilObj = CreateObject("component","FileUtil");
         convertedQuery = fileUtilObj.convertToQuery(<Body of File>,<Delimiter>);
*/
component {
/*
Converts a Flatfile to a query
*/ 
	public query function convertToQuery(required String Text, required Delimiter text ) { 
		var ct = 1;
		columnArray = listToArray (Text,Delimiter);

		for( fieldName in columnArray ){
		    form[fieldName]  = qry[fieldName][1];
		    if ct eq 1
		    {
				columns = replace(i,'|',',','all');
				ConvertedQuery = QueryNew("#columns#"); 
				colArray = arrayNew(1);
				colArray = listToArray(columns);
			}
			else if ct gt 1
			{
				dataCol = replace(i,'#chr(34)#','','all');
				dataArray = arrayNew(1);
				dataArray = listToArray(dataCol,'|');
				queryAddRow(ConvertedQuery, 1);
			}
			for (j=1;j lte arrayLen(colArray);j++;) 
			{
					if(ArrayIsDefined(dataArray,j))
					{
						QuerySetCell(ConvertedQuery, "#colArray[j]#", "#dataArray[j]#" , (ct-1));
					} else { 
						QuerySetCell(ConvertedQuery, "#colArray[j]#", " " , (ct-1));
					}
			}

			ct = ct + 1;
				
		}
		return ConvertedQuery;
	} 


}