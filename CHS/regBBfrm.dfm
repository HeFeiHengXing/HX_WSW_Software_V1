�
 TREGBBFORM 0�  TPF0
TregBBForm	regBBFormLeftTop� BorderStylebsDialogCaption   4N�^h,g{v��ClientHeight�ClientWidth]Color	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style OldCreateOrderPositionpoScreenCenterOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel13LeftTop�Width*HeightCaptionLabel13  	TGroupBox	GroupBox1LeftTopWidth>Height� Color	clBtnFaceParentColorTabOrder  TLabelLabel1LeftTopWidthBHeightCaption   标 本 号   Color	clBtnFaceParentColorTransparent	  TLabelLabel2LeftTop;WidthBHeightCaption   姓    名   Color	clBtnFaceParentColorTransparent	  TLabelLabel3Left� TopWidthBHeightCaption   住 院 号   Color	clBtnFaceParentColorTransparent	  TLabelLabel4Left� Top;Width<HeightCaption   性    别  Color	clBtnFaceParentColorTransparent	  TLabelLabel5Left|TopWidthHHeightCaption   科    别    Color	clBtnFaceParentColorTransparent	  TLabelLabel6Left|Top;WidthBHeightCaption   年    龄   Color	clBtnFaceParentColorTransparent	  TLabelLabel7LeftTop[WidthHHeightCaption   h,g{|�W        Color	clBtnFaceParentColorTransparent	  TLabelLabel8Left� Top[WidthBHeightCaption   床    号   Color	clBtnFaceParentColorTransparent	  TLabelLabel9LeftTopyWidthHHeightCaption   4N�^ʋ�e        Color	clBtnFaceParentColorTransparent	  TLabelLabel10Left|Top[WidthHHeightCaption   ��h�v�v        Color	clBtnFaceParentColorTransparent	  TLabelLabel11LeftTop� WidthBHeightCaption   送 检 者   Color	clBtnFaceParentColorTransparent	  TLabelLabel12Left{TopyWidthHHeightCaption   ��h�eg        Color	clBtnFaceParentColorTransparent	  TDBEditdbe_specNumberLeft`TopWidthQHeight	DataFieldbbh
DataSourcedmym.dsRegBB	MaxLength
TabOrder 
OnKeyPressdbe_specNumberKeyPress  TDBEditdbe_patientNameLeft`Top7WidthQHeight	DataFieldname
DataSourcedmym.dsRegBBTabOrder
OnKeyPressdbe_patientNameKeyPress  TDBComboBoxdbc_sexLeftTop8WidthHHeight	DataFieldsex
DataSourcedmym.dsRegBB
ItemHeightTabOrder
OnKeyPressdbc_sexKeyPress  TDBEditdbe_caseNumberLeftTopWidthFHeight	DataFieldzyh
DataSourcedmym.dsRegBBTabOrder
OnKeyPressdbe_caseNumberKeyPress  TDBComboBoxdbc_sectionNameLeft�TopWidthmHeight	DataFieldkb
DataSourcedmym.dsRegBB
ItemHeightTabOrderOnExitdbc_sectionNameExit
OnKeyPressdbc_sectionNameKeyPress  TDBEditdbe_ageLeft�Top8Width5Height	DataFieldold
DataSourcedmym.dsRegBBTabOrder
OnKeyPressdbe_ageKeyPress  TDBComboBoxdbc_specTypeLeft`TopXWidthQHeight	DataFieldbb
DataSourcedmym.dsRegBB
ItemHeightTabOrder
OnKeyPressdbc_specTypeKeyPress  TDBEdit
dbe_bedNumLeftTopXWidthDHeight	DataFieldbed
DataSourcedmym.dsRegBBTabOrder
OnKeyPressdbe_bedNumKeyPress  TDBComboBoxdbc_checkPurposeLeft�TopXWidthkHeight	DataFieldsjmd
DataSourcedmym.dsRegBB
ItemHeightItems.Strings   �~̃�W{Q�o�Oe   �~̃�W{Q   �mGr�g�~̃   �bx��gr�	   L �W�~̃�W{Q�o�Oe   w̃�W{Q   w̃�W{Q�o�Oe   �mGr�gw̃ TabOrder	
OnKeyPressdbc_checkPurposeKeyPress  TDBComboBoxdbc_checkDoctorLeft_Top� Width}Height	DataFieldsj
DataSourcedmym.dsRegBB
ItemHeightTabOrder
OnKeyPressdbc_checkDoctorKeyPress  TDBEditdbe_checkDateLeft�TopuWidthjHeight	DataFieldcydate
DataSourcedmym.dsRegBBTabOrder  TDBComboBoxdbe_diagnoseLeft_TopuWidth� Height	DataFieldlczd
DataSourcedmym.dsRegBB
ItemHeightTabOrder

OnKeyPressdbe_diagnoseKeyPress  TDBComboBoxDBCageLeft�Top8Width6Height	DataFieldage
DataSourcedmym.dsRegBB
ItemHeightItems.Strings   �\   g   )Y   \�e   R�� TabOrder
OnKeyPressDBCageKeyPress  TButtonButton1Left� TopWidth HeightCaption   xTabOrderVisibleOnClickButton1Click   TDBGridDBGrid1LeftTopWidthAHeight� TabStop
DataSourcedmym.dsRegBBOptions	dgEditingdgAlwaysShowEditordgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit TabOrderTitleFont.CharsetANSI_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.Name   �[SOTitleFont.Style ColumnsExpanded	FieldNamebbhTitle.Caption   h,g�SWidth:Visible	 Expanded	FieldNamenameTitle.Caption   �YTWidth2Visible	 Expanded	FieldNamekbTitle.Caption   �y+RWidth*Visible	 Expanded	FieldNamelczdTitle.Caption   4N�^ʋ�eWidth5Visible	 Expanded	FieldNamesexTitle.Caption   '`+RWidthVisible	 Expanded	FieldNamezyhTitle.Caption   OOb��SWidth+Visible	 Expanded	FieldNamebbTitle.Caption   h,gWidth(Visible	 Expanded	FieldNameoldTitle.Caption   t^��Width%Visible	 Expanded	FieldNamebedTitle.Caption   �^�SWidthVisible	 Expanded	FieldNamesjTitle.Caption   ��h�NXTWidth5Visible	 Expanded	FieldNamecydateTitle.Caption   ��h�egWidth9Visible	 Expanded	FieldNamesjmdTitle.Caption   ��h�v�vWidthIVisible	    	TGroupBox	GroupBox2LeftTop� Width@HeightIColor	clBtnFaceParentColorTabOrder TButtonbtnAddLeftTopWidthAHeight!Caption	   新   增TabOrder OnClickbtnAddClick  TButtonbtnDelLeft� TopWidthAHeight!Caption    R    d�TabOrderOnClickbtnDelClick  TButtonbtnExitLeft�TopWidthAHeight!Caption    �    �QTabOrderOnClickbtnExitClick  TButtonbtnSaveLeftxTopWidthAHeight!Caption   �OX[TabOrderOnClickbtnSaveClick  TButton
btnExtractLeftWTopWidthAHeight!Caption   �c�SEnabledTabOrderOnClickbtnExtractClick   TDBEdit	bbdj_bbxbLeft�TopHWidthyHeight	DataFieldsex
DataSource	zfx_bbxbsTabOrderVisible  TDBEdit	bbdj_bblxLeft�Top`WidthyHeight	DataFieldbbName
DataSource	zfx_bblxsTabOrderVisible  TDBEdit	bbdj_bbkbLeft�Top0WidthyHeight	DataFieldsecname
DataSource	zfx_bbkbsTabOrderVisible  TDBEdit	bbdj_sjmdLeft�TopxWidthyHeight	DataFieldZT_sjmd
DataSource	zfx_sjmdsTabOrderVisible  TDBEdit	bbdj_sjysLeft�Top�WidthyHeight	DataFieldName
DataSource	zfx_sjyssTabOrderVisible  	TADOQueryzfx_bblx
Connection	dmym.conn
Parameters LeftHTop@  TDataSource	zfx_bblxsDataSetzfx_bblxLeftHTop`  	TADOQueryzfx_bbxb
Connection	dmym.conn
Parameters Left(Top@  TDataSource	zfx_bbxbsDataSetzfx_bbxbLeft(Top`  	TADOQueryzfx_bbkb
Connection	dmym.conn
Parameters LeftTop@  	TADOQueryzfx_sjys
Connection	dmym.conn
Parameters Left�Top@  	TADOQueryzfx_sjmd
Connection	dmym.conn
Parameters LefthTop@  TDataSource	zfx_bbkbsDataSetzfx_bbkbLeftTop`  TDataSource	zfx_sjmdsDataSetzfx_sjmdLefthTop`  TDataSource	zfx_sjyssDataSetzfx_sjysLeft�Top`  	TADOQuery	ADOQuery1
Connection	dmym.conn
Parameters Left� TopB  	TADOQuery	ADOQuery2
Connection	dmym.conn
Parameters Left� TopB  	TADOQuery	ADOQuery3
Connection	dmym.conn
Parameters Left� TopB  	TADOQueryZFX_YX
Connection	dmym.conn
Parameters LeftzTopB   