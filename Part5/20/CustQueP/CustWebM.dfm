�
 TWEBMODULE1 0  TPF0TWebModule1
WebModule1OldCreateOrder	ActionsNameActionSearchPathInfo/searchProducerQueryTableProducer1 Default	Name
ActionFormPathInfo/formProducerPageProducer1 NameActionRecordPathInfo/recordOnActionRecordAction  BeforeDispatchWebModule1BeforeDispatchLeft�Top� Height�Width� TQueryTableProducerQueryTableProducer1Caption<b>Customers</b>Columns	FieldNameCompany 	FieldNameState 	FieldNameCountry  QueryQuery1TableAttributes.BorderTableAttributes.CellSpacingOnFormatCellQueryTableProducer1FormatCellLeft0Top  TQueryQuery1DatabaseNameDBDEMOSSQL.StringsSELECT Company, State,  CountryFROM CUSTOMER.DBWHERE &  State = :State OR Country = :Country LeftxTop	ParamDataDataTypeftStringNameState	ParamType	ptUnknown DataTypeftStringNameCountry	ParamType	ptUnknownValueUS   TStringFieldQuery1Company	FieldNameCompanySize  TStringFieldQuery1State	FieldNameState  TStringFieldQuery1Country	FieldNameCountry   TPageProducerPageProducer1HTMLDoc.Strings+<h4>Customer QueryProducer Search Form</h4>.<form action="<#script>/search" method="POST"><table>,<tr><td>State:</td><td><select name="State"><#State>	</select>
</td></tr>0<tr><td>Country:</td><td><select name="Country"><option> </option>
<#Country>	</select>
</td></tr>A<tr><td></td><td><center><input type="Submit"></center></td></tr></form> 	OnHTMLTagPageProducer1HTMLTagLeft0Top@  TQueryQuery2DatabaseNameDBDEMOSLeftxTop@   