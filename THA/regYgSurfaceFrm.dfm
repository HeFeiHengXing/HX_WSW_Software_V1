�
 TREGYGSURFACEFORM 0�  TPF0TregYgSurfaceFormregYgSurfaceFormLeftnTop� BorderStylebsDialogCaption   4$:0(J''- - - .O,EM#FClientHeightuClientWidthColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   +.,E
Font.Style OldCreateOrderPositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel6Left Top^Width$HeightCaptionLabel6  TLabelLabel7Left�Top@WidthHeight	Caption2Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   +.,E
Font.Style 
ParentFont  TDBGridDBGrid1Left Top� WidthHeight� TabStop
DataSourcedmym.dsRegYgOptions	dgEditingdgAlwaysShowEditordgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.Name   +.,ETitleFont.Style ColumnsExpanded	FieldNamespecNumTitle.Caption   J%Width<Visible	 Expanded	FieldNamesecNameTitle.Caption       &*2Width1Visible	 Expanded	FieldNameroomTitle.Caption   J 4Width8Visible	 Expanded	FieldNameCYlbTitle.Caption   )1Y @PWidth8Visible	 Expanded	FieldNamehjlbTitle.Caption    @PWidth8Visible	 Expanded	FieldNameglassTitle.Caption   &#S0-%Width6Visible	 Expanded	FieldNameCtimeTitle.Caption   )1Y*DVisible	 Expanded	FieldNameCyslTitle.Caption   )1Y*��!Width%Visible	 Expanded	FieldNameAreaTitle.Caption   )1Y#F��Width/Visible	 Expanded	FieldNamecyysTitle.Caption   )1Y2*Visible	 Expanded	FieldNamecydateTitle.Caption   )1Y(5&:WidthXVisible	 Expanded	FieldNameBrandTitle.CaptionbrandVisible	    	TGroupBox	GroupBox1LeftTopWidthHeight� TabOrder  TLabelLabel1LeftTopWidthBHeightCaption   J    %      Transparent	  TLabelLabel2LeftTop8Width0HeightCaption   .O        ,ETransparent	  TLabelLabel3Left� Top^WidthHHeightCaption   )1Y @P        Transparent	Visible  TLabelLabel4Left� TopWidthHHeightCaption    @P        Transparent	  TLabelLabel5LeftsTopWidth0HeightCaption   &        *2Transparent	  TLabelLabel9LeftTop^Width0HeightCaption   )1Y(5&:Transparent	  TLabelLabel8LeftsTop8Width<HeightCaption
   )  1Y  5?    Transparent	  TLabellblGlassLeft� Top8Width0HeightCaption   )1Y#F��Transparent	  TLabelLabel10LeftPTop8WidthHeightCaptioncm  TLabelLabel11Left\Top4WidthHeightCaption2  TDBEditdbe_specNumberLeftLTopWidthQHeight	DataFieldspecNum
DataSourcedmym.dsRegYg	MaxLength
TabOrder 
OnKeyPressdbe_specNumberKeyPress  TDBEditdbe_roomLeftLTop4WidthPHeight	DataFieldroom
DataSourcedmym.dsRegYgTabOrder
OnKeyPressdbe_roomKeyPress  TDBComboBox	dbc_etypeLeft TopWidthPHeight	DataFieldhjlb
DataSourcedmym.dsRegYg
ItemHeightItems.StringsIIIIIIIV TabOrder
OnKeyPressdbc_etypeKeyPress  TDBComboBoxdbc_sectionNameLeft�TopWidthPHeight	DataFieldsecName
DataSourcedmym.dsRegYg
ItemHeightTabOrder
OnKeyPressdbc_sectionNameKeyPress  TDBComboBoxdbc_sampleDoctorLeft�Top4WidthPHeight	DataFieldcyys
DataSourcedmym.dsRegYg
ItemHeightTabOrder
OnKeyPressdbc_sampleDoctorKeyPress  TDBEdit	dbe_cDateLeftLTopZWidthPHeight	DataFieldcyDate
DataSourcedmym.dsRegYgTabOrder  TDBComboBoxDBComboBox1Left TopZWidthPHeight	DataFieldCYlb
DataSourcedmym.dsRegYg
ItemHeightItems.Strings   5&X   .O,EM#F
   2(+4*6   2!&3#&   /[23KF2 TabOrderVisible
OnKeyPressDBComboBox1KeyPress  TDBEditdbe_areaLeft� Top4WidthPHeight	DataFieldArea
DataSourcedmym.dsHospitalTabOrder
OnKeyPressdbe_areaKeyPress  TButtonButton1Left� TopWidth!HeightCaption   @"KTabOrderVisibleOnClickButton1Click   	TGroupBox	GroupBox2Left Top� WidthHeightITabOrder TButtonbtnAddLeftTopWidthQHeight!Caption   0"    4VTabOrder OnClickbtnAddClick  TButtonbtnDelLeft� TopWidthIHeight!Caption   )    ��TabOrderOnClickbtnDelClick  TButtonbtnExitLeft�TopWidthQHeight!Caption   -+    VTabOrderOnClickbtnExitClick  TButtonbtnSaveLeft� TopWidthIHeight!Caption       FTabOrderOnClickbtnSaveClick  TButton
btnExtractLeftPTopWidthIHeight!Caption   ,A    (TabOrderOnClickbtnExtractClick   	TADOQuery	ADOQuery1
Connection	dmym.conn
Parameters LeftTopx   