�
 TYGQTFORM 0�  TPF0	TYgqtFormYgqtFormLeftRTop� BorderStylebsDialogCaption   b��Qa�g��vQ�NClientHeight0ClientWidthMColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TLabellblRoomLeft�TopWidthHHeightCaption   品    名    Font.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFont  TLabel
lblSecNameLeft� TopWidthBHeightCaption   科    室   Font.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFont  TLabel
lblSpecNumLeftTopWidth<HeightCaption   标 本 号  FocusControldbe_SpecNumFont.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFont  TLabelLabel18Left� TopwWidth� HeightCaption5   小时后，分析无细菌生长                    FocusControl	dbe_hours  TLabelLabel14Left#Top� Width0HeightCaption   报告者      TLabelLabel12Left�Top� WidthBHeightCaption   报告日期      FocusControldbe_reportDate  TLabel
lblSdoctorLeft� TopJWidth6HeightCaption   Ǒ  7h  �  Font.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFont  TLabellblSDateLeft�TopJWidthNHeightCaption   采样日期     FocusControl
dbe_cydateFont.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFont  TShapeShape1LeftTopdWidth.Height  TLabelLabel20Left� Top� Width4HeightCaptionCFU/cm^2FocusControl	dbe_hours  TLabelLabel4Left� Top� Width*HeightCaption   �[8h�      TShapeShape2LeftTop� Width.Height  TLabelLabel5LeftTopJWidth<HeightCaption   �V�[h�Q    FocusControldbe_SpecNumFont.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFont  TLabelLabel6LeftLTopHWidthHeightCaption   d"Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFont  TDBComboBoxdbc_SectionLeftTopWidthdHeight	DataFieldsecName
DataSourcedmym.dsHospitalFont.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ItemHeight
ParentFontTabOrder
OnKeyPressdbc_SectionKeyPress  TButton
btnExtractLeft� TopWidth9HeightCaption   h,g{v��TabOrderOnClickbtnExtractClick  TDBEditdbe_SpecNumLeftNTopWidth9Height	DataFieldspecNum
DataSourcedmym.dsHospitalFont.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 	MaxLength

ParentFontParentShowHintShowHintTabOrder OnClickdbe_SpecNumClick
OnKeyPressdbe_SpecNumKeyPress  TDBComboBoxdbc_samplingManLeftTopFWidthPHeight	DataFieldcyys
DataSourcedmym.dsHospitalFont.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ItemHeight
ParentFontTabOrder
OnKeyPressdbc_samplingManKeyPress  TDBEdit
dbe_cydateLeft�TopFWidthfHeight	DataFieldcyDate
DataSourcedmym.dsHospitalFont.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ParentFontTabOrder  TRadioButtonRadioButton1LeftToptWidth9HeightCaption   �~�W{QChecked	TabOrderTabStop	  TDBEdit	dbe_hoursLeftXToprWidth� Height	DataFieldhhour
DataSourcedmym.dsHospitalTabOrder	  	TCheckBox	CheckBox1Left&Top� Width@HeightCaption   �~̃TTabOrder
OnKeyPressCheckBox1KeyPress  TDBEdit	dbe_gnameLeftfTop� Width� Height	DataFieldgermName
DataSourcedmym.dsHospitalTabOrder  TDBEditdbe_totalNumLeft|Top� WidthIHeight	DataFieldanum
DataSourcedmym.dsHospitalTabOrderOnChangedbe_totalNumChange  TDBEditdbe_totalNum2LeftTop� WidthIHeight	DataFieldanum
DataSourcedmym.dsHospitalTabOrderVisible  TRadioButtonRadioButton3Left�Top� WidthhHeightCaption   �~̃;`̃=�peTabOrderVisibleOnClickRadioButton3Click  TRadioButtonRadioButton2LeftTop� WidthgHeightCaption   �~̃;`̃=�peTabOrder
  TDBComboBoxdbcBGLeftSTop� WidthjHeight	DataFieldreporter
DataSourcedmym.dsHospital
ItemHeightItems.Strings   ؞��(u7b TabOrder
OnKeyPressdbcBGKeyPress  TBitBtnbtnPrintLeft�TopWidthRHeightCaption
   报表(&R)TabOrderOnClickbtnPrintClick  TDBEditdbe_reportDateLeft�Top� WidthpHeight	DataField
reportDate
DataSourcedmym.dsHospitalTabOrder  TBitBtnbtnSaveLeftMTopWidthKHeightCaption
   存盘(&S)TabOrderOnClickbtnSaveClick  TBitBtnbtnCloseLeft�TopWidthKHeightCaption
   退出(&C)TabOrderOnClickbtnCloseClick  TDBComboBoxdbc_pinmingLeft�TopWidthPHeight	DataFieldroom
DataSourcedmym.dsHospitalFont.CharsetGB2312_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name   �[SO
Font.Style 
ItemHeight
ParentFontTabOrder
OnKeyPressdbc_pinmingKeyPress  TDBComboBoxdbc_shysLeftTop� WidthJHeightStylecsDropDownList	DataFieldshys
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressdbc_shysKeyPress  TDBEditdbc_jcjgLeft� Top� Width8Height	DataFieldYgbbJC
DataSourcedmym.dsHospitalTabOrderVisible  TRadioButtonRadioButton4Left�Top� WidtheHeightCaption   �~̃;`̃=�peTabOrderVisibleOnClickRadioButton4Click  TDBEditdbe_totalNum3LeftTop� WidthIHeight	DataFieldanum
DataSourcedmym.dsHospitalTabOrderVisible  TRadioButtonRadioButton5LeftTop� WidthHeightCaptionRadioButton5TabOrder  TDBComboBox	ComboBox1Left&Top� WidthHeight	DataFieldmemo
DataSourcedmym.dsHospital
ItemHeightTabOrder
OnKeyPressComboBox1KeyPress  TDBEditDBEdit1Left� TopWidthyHeightTabOrderVisible  	TComboBox	ComboBox4Left� TopDWidth=Height
ItemHeightTabOrderOnChangeComboBox4ChangeItems.StringsCFU/cm^2CFU/100cm^2CFU/m^3CFU/ml   CFU/个   CFU/件   TDBComboBoxdbc_gjbzLeft\TopDWidthEHeight	DataFieldYgbbGB
DataSourcedmym.dsHospital
ItemHeightItems.Strings   �e�~̃u� TabOrderOnChangedbc_gjbzChangeOnExitdbc_gjbzExit  TButtonButton1Left� TopWidth!HeightCaption   xTabOrderVisibleOnClickButton1Click  	TRvSystem	RvSystem1
TitleSetupOutput OptionsTitleStatusReport StatusTitlePreviewReport PreviewSystemFiler.StatusFormatGenerating page %pSystemPreview.ZoomFactordSystemPrinter.ScaleXdSystemPrinter.ScaleYdSystemPrinter.StatusFormatPrinting page %pSystemPrinter.TitleReportPrinter ReportSystemPrinter.UnitsFactorLeft4Top�   
TRvProject
RvProject1Engine	RvSystem1Left\Top�   TRvDataSetConnectionrvYgQtRuntimeVisibilityrtDeveloperDataSetdmym.rsHospitalLeft� Top�   	TADOQueryZFX_QT
Connection	dmym.conn
Parameters LeftTopj  	TADOQueryZFX_YX
Connection	dmym.conn
Parameters Left�Topf   