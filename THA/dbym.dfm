�
 TDMYM 0  TPF0TdmymdmymOldCreateOrderOnCreateDataModuleCreateLeft� TopdHeight�Widthy TADOConnectionconnLoginPromptModecmShareDenyNoneProviderMicrosoft.Jet.OLEDB.4.0LeftTop  TADODataSetrsYpPatient
Connectionconn
Parameters LeftTop:  	TADOQueryquery1
Connectionconn
Parameters LeftTopJ  	TADOQuerysubQuery
Connectionconn
Parameters Left� Top  TADODataSetrsBase
Connectionconn
CursorTypectStaticCommandTextselect * from base

Parameters LeftSTop:  TDataSourcedsBaseDataSetrsBaseLeft� Top:  TADODataSetrsRegBB
Connectionconn
CursorTypectStaticCommandText)select * from regBBlc  order by  cydate  
Parameters LeftTopn  TDataSourcedsRegBBDataSetrsRegBBLeftTTopn  TADODataSetrsCheck
Connectionconn
CursorTypectStatic	AfterOpenrsCheckAfterOpenCommandText(select name,gl from cgj where bm='00000'	FieldDefs 
Parameters 	StoreDefs	Left� Top�   TDataSourcedsCheckDataSetrsCheckLeft� Top�   TADODataSetrsRegYg
Connectionconn
CursorTypectStaticCommandTextselect * from regBByngr
Parameters LeftTop�   TDataSourcedsRegYgDataSetrsRegYgLeftWTop�   TADODataSetrsRegZk
Connectionconn
CursorTypectStaticCommandText&select * from regbbZk order by  cydate
Parameters Left� Top:  TDataSourcedsRegZkDataSetrsRegZkLeftTop:  TADODataSet
rsgermtype
ConnectionconnCommandText)select * from GermType order by germIndex
Parameters LeftUTop�   TDataSource
dsgermtypeDataSet
rsgermtypeLeft� Top�   TADODataSet
rsHospital
Connectionconn
CursorTypectStaticCommandText<select * from hospital  order by reportdate desc,Specnum ASC
Parameters Left� Top�   TDataSource
dsHospitalDataSet
rsHospitalLeftTop�   	TADOQueryexQuery
Connectionconn
Parameters LeftTop  TADODataSetrsYxCommandTextselect * from yx 
Parameters LeftTopn  TADODataSet
rsGermName
Connectionconn
CursorTypectStaticCommandTextselect * from xjname
Parameters Left� Topn  TDataSource
dsGermNameDataSet
rsGermNameLeft� Topn  TADODataSetrsBaseZk
Connectionconn
CursorTypectStaticCommandText*select * from baseZK order by repdate desc
Parameters Left� Top  TDataSourcedsBaseZkDataSetrsBaseZkLeftTop  TDataSource	dsaddTempDataSet	rsAddTempLeftTop  	TADOTablersAdd
Connectionconn	TableNameYpAddLeft� Top  	TADOTable	rsAddTemp
Connectionconn	TableNameYpAddTmpLeftWTop  	TADOQuery	loginName
Connectionconn
Parameters LeftTop�   	TADOQueryfuzhuqy
Connectionconn
Parameters LeftTop�   TADODataSetLSADODataSet1
Connectionconn
CursorTypectStaticCommandTextselect * from base

Parameters LeftPTop  TDataSourceLSDataSource1DataSetLSADODataSet1Left� Top  TDataSource	dssectionDataSet	rssectionLeft� TopH  TDataSourcedssampleDataSetrssampleLeftTopH  TADODataSet	rssection
ConnectionconnCommandText$select * from secname order by secid
Parameters LeftVTopJ  TADODataSetrssample
ConnectionconnCommandTextselect * from bb  order by  ID 
Parameters Left� TopH  TADODataSetrsbase1
Connectionconn
CursorTypectStaticCommandTextselect * from base

Parameters LeftTop�  TDataSourcedsbase1DataSetrsbase1LeftVTop�   