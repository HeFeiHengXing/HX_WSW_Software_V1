�
 TYGMEDFORM 0�  TPF0
TYgMedForm	YgMedFormLeftFTop� BorderStylebsDialogCaption   4$:0(6.V2!&3#&ClientHeightZClientWidthSColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   +.,E
Font.Style OldCreateOrderPositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TLabel
lblSpecNumLeftTopWidth0HeightCaption   J    %FocusControldbe_SpecNum  TLabel
lblSecNameLeft� TopWidth0HeightCaption   &        *2  TLabellblRoomLeft�TopWidth0HeightCaption   &        #[  TLabel
lblEnvironLeftTop<Width0HeightCaption   ),        J  TLabellblGlassLeft� Top<Width0HeightCaption   %Z        %  TLabellblStimeLeft�Top<Width0HeightCaption   ),& @0-  TLabel
lblSdoctorLeftTop\WidthBHeightCaption   )  1Y  5?        TLabellblSDateLeft� Top\Width0HeightCaption   )1Y(5&:FocusControl
dbe_cydate  TLabelLabel12Left�TopWidth<HeightCaption
   F(5&:    FocusControldbe_reportDate  TLabelLabel14LeftTop Width6HeightCaption	   F5?        TLabelLabel18Left� Top� Width� HeightCaption   0*S6.V.��/Z)ZFocusControl	dbe_hours  TLabelLabel20Left� Top� WidthHeightCaptionCFU/gFocusControl	dbe_hours  TShapeShape1LeftTop� Width.Height  TShapeShape2LeftTopWidth0Height  TLabelLabel1Left� Top� WidthNHeightCaptionCFU/100cm    FocusControl	dbe_hours  TLabelLabel4Left� TopWidth$HeightCaption   )S+5?  TLabelLabel2Left� Top� WidthBHeightCaption   CFU/ผ     FocusControl	dbe_hours  TLabelLabel3Left� Top� WidthHeight	Caption2Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   +.,E
Font.Style 
ParentFont  TDBEditdbe_SpecNumLeftPTopWidth;Height	DataFieldspecNum
DataSourcedmym.dsHospital	MaxLength
ParentShowHintShowHintTabOrder OnClickdbe_SpecNumClick
OnKeyPressdbe_SpecNumKeyPress  TDBEdit
dbe_cydateLeftTopXWidthPHeight	DataFieldcyDate
DataSourcedmym.dsHospitalTabOrder  TDBEditdbe_reportDateLeft�TopWidthpHeight	DataField
reportDate
DataSourcedmym.dsHospitalTabOrder  TBitBtnbtnCloseLeft�Top7WidthKHeightCaption   -+V( & C ) TabOrderOnClickbtnCloseClick  TBitBtnbtnPrintLeft�Top7Width\HeightCaption   M( & R ) TabOrderOnClickbtnPrintClick  TDBComboBox
dbcSectionLeftTopWidthPHeight	DataFieldsecName
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressdbcSectionKeyPress  TDBComboBoxdbcBGLeftFTopWidthaHeight	DataFieldreporter
DataSourcedmym.dsHospital
ItemHeightItems.Strings   $(/3# TabOrder
OnKeyPressdbcBGKeyPress  TDBEdit	dbe_hoursLeftPTop� Width� Height	DataFieldhhour
DataSourcedmym.dsHospitalTabOrder
  TDBEdit	dbe_gnameLeft@Top� Width� Height	DataFieldgermName
DataSourcedmym.dsHospitalTabOrder  TDBEditdbe_totalNumLeftpTop� WidthIHeight	DataFieldanum
DataSourcedmym.dsHospitalTabOrder  TRadioButtonRadioButton1LeftTop� Width9HeightCaption   %@1XChecked	TabOrder	TabStop	  TRadioButtonRadioButton2LeftTop� WidthaHeightCaption   /Z7��Z"D*��TabOrderOnClickRadioButton2Click  	TCheckBox	CheckBox1Left Top� Width9HeightCaption   /Z#[TabOrder
OnKeyPressCheckBox1KeyPress  TBitBtnbtnSaveLeftATop7WidthKHeightCaption   F%,( & S ) TabOrderOnClickbtnSaveClick  TButton
btnExtractLeft� TopWidth6HeightCaption   J''TabOrderOnClickbtnExtractClick  TDBComboBoxdbc_samplingManLeftPTopXWidthPHeight	DataFieldcyys
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressdbc_samplingManKeyPress  TDBEditdbe_phLeftTop8WidthPHeight	DataFieldSpph
DataSourcedmym.dsHospitalTabOrder
OnKeyPressdbe_phKeyPress  TDBEdit	dbe_brandLeftPTop8WidthMHeight	DataFieldBrand
DataSourcedmym.dsHospitalTabOrder
OnKeyPressdbe_brandKeyPress  TDBComboBoxdbc_typeLeft�Top8WidthdHeight	DataFieldSptype
DataSourcedmym.dsHospital
ItemHeightItems.Strings
   ?(./504
   60(./504
   -(./504 TabOrderOnChangedbc_typeChange
OnKeyPressdbc_typeKeyPress  TDBEditdbe_totalNum2LeftpTop� WidthIHeight	DataFieldanum
DataSourcedmym.dsHospitalTabOrder  TRadioButtonRadioButton3LeftTop� WidthaHeightCaption   /Z7��Z"D*��TabOrderOnClickRadioButton3Click  TDBComboBoxdbc_shysLeft� TopWidthjHeightStylecsDropDownList	DataFieldshys
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressdbc_shysKeyPress  TDBEditdbc_jcjgLeftXTop� WidthAHeight	DataFieldYgbbJC
DataSourcedmym.dsHospitalTabOrderVisible  TDBEditdbc_gjbzLeft�Top� WidthyHeight	DataFieldYgbbGB
DataSourcedmym.dsHospitalTabOrderVisible  	TCheckBox	CheckBox2LeftTop;WidthHeightTabOrderVisibleOnClickCheckBox2Click  TDBEditdbe_totalNum3LeftoTop� WidthIHeight	DataFieldanum
DataSourcedmym.dsHospitalTabOrder  TRadioButtonRadioButton4LeftTop� Width]HeightCaption   /Z7��Z"D*��TabOrderOnClickRadioButton4Click  TRadioButtonRadioButton5LeftTop� WidthHeightCaptionRadioButton5TabOrder  TDBComboBox	ComboBox1Left Top� WidthHeight	DataFieldmemo
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressComboBox1KeyPress  TDBEditDBEdit1LefthTop� WidthyHeightTabOrderVisible  TDBComboBoxdbc_pinmingLeft�TopWidthcHeight	DataFieldroom
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressdbc_pinmingKeyPress  TButtonButton1Left� TopWidth!HeightCaption   @"KTabOrderVisibleOnClickButton1Click  	TRvSystem	RvSystem1
TitleSetupOutput OptionsTitleStatusReport StatusTitlePreviewReport PreviewSystemFiler.StatusFormatGenerating page %pSystemPreview.ZoomFactordSystemPrinter.ScaleXdSystemPrinter.ScaleYdSystemPrinter.StatusFormatPrinting page %pSystemPrinter.TitleReportPrinter ReportSystemPrinter.UnitsFactorLeft� Top=  
TRvProject
RvProject1Engine	RvSystem1Left� Top=  TRvDataSetConnectionrvMedRuntimeVisibilityrtDeveloperDataSetdmym.rsHospitalLeft Top=  	TADOQueryZFX_YX
Connection	dmym.conn
Parameters Left�TopR   