�
 TREGZKFORM 0|  TPF0
TregZkform	regZkformLeft<Top� BorderStylebsDialogCaption   (��ch,g{v��ClientHeight�ClientWidthWColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoScreenCenterOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel6LeftTop�Width*HeightCaptionLabel6Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFont  TDBGridDBGrid1LeftTopWidthHeight� TabStop
DataSourcedmym.dsRegZkOptions	dgEditingdgAlwaysShowEditordgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNamebbhTitle.Caption   h,g�SWidth=Visible	 Expanded	FieldNamelczdTitle.Caption           4N�^ʋ�eWidthSVisible	 Expanded	FieldNamesexTitle.Caption   '`+RWidth#Visible	 Expanded	FieldNamebbTitle.Caption   h,g{|�WWidth5Visible	 Expanded	FieldNameoldTitle.Caption       t^��Width*Visible	 Expanded	FieldNamesjTitle.Caption   ��hUSMOWidth6Visible	 Expanded	FieldNamecydateTitle.Caption   ��h�egVisible	 Expanded	FieldNameCyslTitle.Caption   Ǒ7hpeϑWidth%Visible	 Expanded	FieldNameAreaTitle.Caption   Ǒ7hb��yWidth/Visible	 Expanded	FieldNamecyysTitle.Caption   Ǒ7h;S^Visible	 Expanded	FieldNamecydateTitle.Caption   Ǒ7h�egWidthXVisible	 Expanded	FieldNameBrandTitle.CaptionbrandVisible	    	TGroupBox	GroupBox1LeftTopWidthHeight� Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTabOrder  TLabelLabel1LeftTopWidthBHeightCaption   标 本 号   Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTransparent	  TLabelLabel2LeftTop<WidthNHeightCaption   标本类型     Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTransparent	  TLabelLabel3Left� TopWidthBHeightCaption   性    别   Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTransparent	  TLabelLabel4Left� Top<WidthNHeightCaption   临床诊断     Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTransparent	  TLabelLabel5Left^TopWidth<HeightCaption   年   龄   Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTransparent	  TLabelLabel7LeftTop\WidthHHeightCaption   ��hUSMO        Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTransparent	  TLabelLabel9LeftTop~WidthBHeightCaption   ��h�eg      Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTransparent	  TLabelLabel8Left� Top~Width6HeightCaption   {v���NXT  Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTransparent	Visible  TLabelLabel10Left� Top\Width0HeightCaption   ��h�v�vFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTransparent	  TDBEditdbe_specNumberLeft`TopWidthEHeight	DataFieldbbh
DataSourcedmym.dsRegZk	MaxLength
TabOrder 
OnKeyPressdbe_specNumberKeyPress  TDBComboBox	dbc_btypeLeft`Top8WidthiHeight	DataFieldbb
DataSourcedmym.dsRegZk
ItemHeightItems.StringsIIIIIIIV TabOrder
OnKeyPressdbc_btypeKeyPress  TDBComboBoxdbc_regDoctorLeftTopzWidthQHeight	DataFielddjys
DataSourcedmym.dsRegZk
ItemHeightTabOrder	Visible
OnKeyPressdbc_regDoctorKeyPress  TDBEdit	dbe_cDateLeft`TopzWidthiHeight	DataFieldcyDate
DataSourcedmym.dsRegZkTabOrder  TDBComboBoxdbc_sexLeftTopWidthAHeight	DataFieldsex
DataSourcedmym.dsRegZk
ItemHeightTabOrder
OnKeyPressdbc_sexKeyPress  TDBEditdbe_sjLeft`TopXWidthiHeight	DataFieldsj
DataSourcedmym.dsRegZkTabOrder
OnKeyPressdbe_sjKeyPress  TDBEditdbe_ageLeft�TopWidth9Height	DataFieldold
DataSourcedmym.dsRegZkTabOrder
OnKeyPressdbe_ageKeyPress  TDBComboBoxDBC_ageLeft�TopWidth+Height	DataFieldage
DataSourcedmym.dsRegZk
ItemHeightItems.Strings   �\   g   )Y   \�e   R�� TabOrder
OnKeyPressDBC_ageKeyPress  TDBComboBoxdbc_lczdLeftTop8Width� Height	DataFieldlczd
DataSourcedmym.dsRegZk
ItemHeightTabOrder
OnKeyPressdbc_lczdKeyPress  TDBComboBoxdbc_sjmdLeftTopXWidth� Height	DataFieldsjmd
DataSourcedmym.dsRegZk
ItemHeightTabOrder
OnKeyPressdbc_sjmdKeyPress  TButtonButton1Left� TopWidth%HeightCaption   xTabOrder
VisibleOnClickButton1Click   	TGroupBox	GroupBox2LeftTop� WidthHeightITabOrder TButtonbtnAddLeftTopWidthIHeight!Caption	   新   增TabOrder OnClickbtnAddClick  TButtonbtnDelLeft� TopWidthIHeight!Caption    R    d�TabOrderOnClickbtnDelClick  TButtonbtnExitLeft�TopWidthIHeight!Caption    �    �QTabOrderOnClickbtnExitClick  TButtonbtnSaveLeftpTopWidthIHeight!Caption   �OX[TabOrderOnClickbtnSaveClick  TButton
btnExtractLeft6TopWidthAHeight!Caption   �c�SEnabledTabOrderOnClickbtnExtractClick   	TADOQuery	ADOQuery3
Connection	dmym.conn
Parameters Left�Top�   	TADOQueryzfx_zkbb
Connection	dmym.conn
Parameters Left�Top�    