�
 TYGSURFACEFORM 0�  TPF0TYgSurfaceFormYgSurfaceFormLeftTopBorderStylebsDialogCaption   b��Qa�gR�g��irSOh�b�ClientHeight4ClientWidth`Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style OldCreateOrderPositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TLabel
lblSpecNumLeftTopWidth0HeightCaption   h  ,g  �SFocusControldbe_SpecNum  TLabel
lblSecNameLeft� TopWidth0HeightCaption
   科    室  TLabellblRoomLeft�TopWidth0HeightCaption
   物    体FocusControldbe_room  TLabel
lblEnvironLeftTopBWidth0HeightCaption   �s�X{|+R  TLabellblGlassLeft� TopBWidth0HeightCaption   Ǒ7hb��y  TLabellblStimeLeft�TopBWidth0HeightCaption    zʑPpe  TLabel
lblGermNumLeftTopcWidthHHeightCaption   s^�v;`̃=�peFocusControldbe_gnum  TLabel
lblSdoctorLeft� TopbWidth0HeightCaption   Ǒ  7h  �  TLabellblSDateLeft�TopcWidth0HeightCaption   Ǒ7h�egFocusControl
dbe_cydate  TLabelLabel12Left�Top� Width0HeightCaption   �bJT�egFocusControldbe_reportDate  TLabelLabel14Left(Top� Width$HeightCaption   �bJT�  TLabelLabel18Left� Top� Width� HeightCaption   \�eT�R�g�e�~̃u�FocusControl	dbe_hours  TLabelLabel20Left� Top� Width$HeightCaptionCFU/cmFocusControl	dbe_hours  TShapeShape1LeftTop� Width.Height  TShapeShape2LeftTop� Width0Height  TLabellbl_cmLeft�TopBWidthHeightCaptioncmFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTransparent	  TLabellbl_cfuLeft� TopcWidthHeightCaptionCFU   TLabelLabel4Left� Top� Width$HeightCaption   �[8h�  TLabelLabel1Left� Top� WidthHeight	Caption2Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFont  TLabelLabel2Left�Top@WidthHeight	Caption2Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTransparent	  TDBEditdbe_SpecNumLeftXTopWidthCHeight	DataFieldspecNum
DataSourcedmym.dsHospital	MaxLength
ParentShowHintShowHintTabOrder OnClickdbe_SpecNumClick
OnKeyPressdbe_SpecNumKeyPress  TDBEditdbe_roomLeft�TopWidthgHeight	DataFieldroom
DataSourcedmym.dsHospitalTabOrder
OnKeyPressdbe_roomKeyPress  TDBEditdbe_gnumLeftXTop_WidthPHeight	DataFieldgermNum
DataSourcedmym.dsHospitalTabOrderOnChangedbe_gnumChange
OnKeyPressdbe_gnumKeyPress  TDBEdit
dbe_cydateLeft�Top\WidtheHeight	DataFieldcyDate
DataSourcedmym.dsHospitalTabOrder	  TDBEditdbe_reportDateLeft�Top� WidthgHeight	DataField
reportDate
DataSourcedmym.dsHospitalTabOrder  TBitBtnbtnCloseLeft�TopWidthKHeightCaption
   退出(&C)TabOrderOnClickbtnCloseClick  TBitBtnbtnPrintLeft�TopWidth\HeightCaption
   报表(&R)TabOrderOnClickbtnPrintClick  TDBComboBoxdbc_environLeftWTop>WidthPHeight	DataFieldhjlb
DataSourcedmym.dsHospital
ItemHeightItems.StringsIIIIIIIV TabOrderOnChangedbc_environChange
OnKeyPressdbc_environKeyPress  TDBComboBox
dbcSectionLeft3TopWidthPHeight	DataFieldsecName
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressdbcSectionKeyPress  TDBComboBoxdbcBGLeftTTop� WidthaHeight	DataFieldreporter
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressdbcBGKeyPress  TDBEdit	dbe_hoursLeftPTop� Width� Height	DataFieldhhour
DataSourcedmym.dsHospitalTabOrder  TDBEdit	dbe_gnameLeft>Top� Width� Height	DataFieldgermName
DataSourcedmym.dsHospitalTabOrder  TDBEditdbe_totalNumLeftpTop� WidthIHeight	DataFieldanum
DataSourcedmym.dsHospitalTabOrder  TRadioButtonRadioButton1LeftTop� Width9HeightCaption   �~�W{QChecked	TabOrder
TabStop	  TRadioButtonRadioButton2LeftTop� WidthaHeightCaption   �~̃;`̃=�peTabOrderOnClickRadioButton2Click  	TCheckBox	CheckBox1Left� Top� Width9HeightCaption   �~̃TTabOrder
OnKeyPressCheckBox1KeyPress  TBitBtnbtnSaveLeft9TopWidthKHeightCaption
   存盘(&S)TabOrderOnClickbtnSaveClick  TButton
btnExtractLeft� TopWidth9HeightCaption   h,g{v��TabOrderOnClickbtnExtractClick  TDBComboBoxdbc_samplingManLeft3Top\WidthPHeight	DataFieldcyys
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressdbc_samplingManKeyPress  TDBEditdbe_rateLeft�Top>WidthiHeight	DataFieldbs
DataSourcedmym.dsHospitalTabOrderOnChangedbe_rateChange
OnKeyPressdbe_rateKeyPress  TDBEditdbe_areaLeft3Top>WidthPHeight	DataFieldArea
DataSourcedmym.dsHospitalTabOrderOnChangedbe_areaChange
OnKeyPressdbe_areaKeyPress  TDBEditdbc_gjbzLeftTopWidthyHeight	DataFieldYgbbGB
DataSourcedmym.dsHospitalTabOrderVisible  TDBEditdbc_jcjgLeft� TopWidthyHeight	DataFieldYgbbJC
DataSourcedmym.dsHospitalTabOrderVisible  TDBComboBoxdbc_shysLeft-Top� WidthJHeightStylecsDropDownList	DataFieldshys
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressdbc_shysKeyPress  	TCheckBox	CheckBox2LeftTop� WidthHeightTabOrderVisibleOnClickCheckBox2Click  TRadioButtonRadioButton3LeftTop� WidthHeightCaptionRadioButton3TabOrder  TDBComboBox	ComboBox1Left Top� WidthHeight	DataFieldmemo
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressComboBox1KeyPress  TDBEditDBEdit1Left�Top� Width1HeightTabOrderVisible  TButtonButton1Left� TopWidth"HeightCaption   xTabOrderVisibleOnClickButton1Click  
TRvProject
RvProject1Engine	RvSystem1Left�Top�   TRvDataSetConnection	rvSurfaceRuntimeVisibilityrtDeveloperDataSetdmym.rsHospitalLeft�Top�   	TRvSystem	RvSystem1
TitleSetupOutput OptionsTitleStatusReport StatusTitlePreviewReport PreviewSystemFiler.StatusFormatGenerating page %pSystemPreview.ZoomFactordSystemPrinter.ScaleXdSystemPrinter.ScaleYdSystemPrinter.StatusFormatPrinting page %pSystemPrinter.TitleReportPrinter ReportSystemPrinter.UnitsFactorLeft�Top�   	TADOQueryZFX_YX
Connection	dmym.conn
Parameters Left�Topd   