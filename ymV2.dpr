program ymV2;

uses
  Forms,
  common in 'common.pas',
  dbym in 'dbym.pas' {dmym: TDataModule},
  ymDataType in 'ymDataType.pas',
  expert in 'expert.pas',
  exsystem in 'exsystem.pas',
  germAnalysisFrm in 'germAnalysisFrm.pas' {germAnalysisForm},
  ym2mainfrm in 'ym2mainfrm.pas' {ym2MainForm},
  regBBfrm in 'regBBfrm.pas' {regBBForm},
  Meds in 'Meds.pas',
  Bio in 'Bio.pas',
  helper in 'helper.pas',
  regYgfrm in 'regYgfrm.pas' {regYgform},
  regZkfrm in 'regZkfrm.pas' {regZkform},
  statfrm in 'statfrm.pas' {statform},
  distributeFrm in 'distributeFrm.pas' {bbDistributeForm},
  antibioFrm in 'antibioFrm.pas' {antibioForm},
  totalfrm in 'totalfrm.pas' {totalForm},
  detailfrm in 'detailfrm.pas' {detailform},
  queryGenFrm in 'queryGenFrm.pas' {queryGenForm},
  specDistfrm in 'specDistfrm.pas' {SpecDistForm},
  queryPatientFrm in 'queryPatientFrm.pas' {queryPatientForm},
  YgAirFrm in 'YgAirFrm.pas' {YgAirForm},
  YgSurfaceFrm in 'YgSurfaceFrm.pas' {YgSurfaceForm},
  YgQueryFrm in 'YgQueryFrm.pas' {YgQueryForm},
  YgHandFrm in 'YgHandFrm.pas' {YgHandForm},
  YgMedFrm in 'YgMedFrm.pas' {YgMedForm},
  YgLiqFrm in 'YgLiqFrm.pas' {YgLiqForm},
  NegativeFrm in 'NegativeFrm.pas' {NegativeForm},
  positiveFrm in 'positiveFrm.pas' {PositiveForm},
  germListFrm in 'germListFrm.pas' {germListForm},
  aboutFrm in 'aboutFrm.pas' {aboutForm},
  loginfrm in 'loginfrm.pas' {loginForm},
  zkBrowseFrm in 'zkBrowseFrm.pas' {zkBrowseForm},
  zkAnalysisfrm in 'zkAnalysisfrm.pas' {zkAnalysisForm},
  appendYpfrm in 'appendYpfrm.pas' {appendYpForm},
  appendYpNewFrm in 'appendYpNewFrm.pas' {AppendYpNewForm},
  reportConfirmFrm in 'reportConfirmFrm.pas' {reportConfirmForm},
  regYgHandfrm in 'regYgHandfrm.pas' {regYgHandForm},
  regYgSurfaceFrm in 'regYgSurfaceFrm.pas' {regYgSurfaceForm},
  regYgMedFrm in 'regYgMedFrm.pas' {regYgMedForm},
  regYgLiqFrm in 'regYgLiqFrm.pas' {regYgLiqForm},
  Ygchaxun in 'Ygchaxun.pas' {YgFrm},
  ZFX_XiTong in 'ZFX_XiTong.pas' {ZFX_YPDY},
  YYRepoFrm in 'YYRepoFrm.pas' {YYRepoForm},
  ygqtFrm in 'ygqtFrm.pas' {YgqtForm},
  regYgqt in 'regYgqt.pas' {regYgqtForm},
  ZFX_YMTJ in 'ZFX_YMTJ.pas' {ZFX_YMTJFrm},
  fenxiFrm in 'fenxiFrm.pas' {fenxiForm},
  Tjchaxun in 'Tjchaxun.pas' {aboutbox},
  zkmanagerz in 'zkmanagerz.pas' {zkmanagez},
  system2 in 'system2.pas' {system},
  LSDZFrm in 'LSDZFrm.pas' {LSDZForm},
  samplerecord in 'samplerecord.pas' {Form1},
  Ygtxyfrm in 'Ygtxyfrm.pas' {Ygtxy},
  RegYgtxyfrm in 'RegYgtxyfrm.pas' {RegYgtxyform},
  colorfrm in 'colorfrm.pas' {colorform},
  flash in 'flash.pas' {flashform},
  whonet in 'whonet.pas' {whonetform},
  DISet in 'DISet.pas' {DISetform},
  MedReport in 'MedReport.pas' {MedReportForm},
  sreport in 'sreport.pas' {sreportform},
  YgSurgeryFrm in 'YgSurgeryFrm.pas' {YgSurgeryForm},
  regYgSurgeryfrm in 'regYgSurgeryfrm.pas' {RegSurgeryform},
  backup in 'backup.pas' {backupForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ºãÐÇÏ¸¾ú¼ø¶¨Ò©Ãô·ÖÎöÏµÍ³';
  Application.CreateForm(TloginForm, loginForm);
  Application.CreateForm(Tdmym, dmym);
  //  Application.CreateForm(Tsystem, system);
  Application.Run;
end.

