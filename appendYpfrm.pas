unit appendYpfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls;

type
  TappendYpForm = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    useid: integer;
  public
    { Public declarations }
    procedure setUserId(id: integer);
    procedure WMCLOSE(var msg: TWMCLOSE); message WM_CLOSE;
  end;

var
  appendYpForm: TappendYpForm;

implementation

uses dbym, appendYpNewFrm;

{$R *.dfm}

procedure TappendYpForm.FormCreate(Sender: TObject);
begin
  dmym.rsAddTemp.Active := false;
  dmym.rsAddTemp.Active := true;
end;

procedure TappendYpForm.Button1Click(Sender: TObject);
var
  aform: tappendypnewform;
begin
  dmym.rsAddTemp.Append;
 // dmym.rsAdd['useid']:=useid;
  aform := tappendYpNewForm.Create(self);
  aform.setStatus(true);
  aform.ShowModal;
end;

procedure TappendYpForm.Button2Click(Sender: TObject);
var
  aform: tappendypnewform;
begin
  if not dmym.rsAddTemp.Eof then
  begin
    dmym.rsAddTemp.Edit;
    aform := tappendYpNewForm.Create(self);
    aform.setStatus(false);
    aform.ShowModal;
  end;

end;

procedure TappendYpForm.Button4Click(Sender: TObject);
begin
  dmym.rsaddTemp.Active := false;
  close;
end;

procedure TappendYpForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmym.rsAddTemp.Active := true;
  action := cafree;
end;

procedure TappendYpForm.Button3Click(Sender: TObject);
begin
  if not dmym.rsAddTemp.Eof then
    if MessageDlg('确定删除当前记录?', mtInformation, [mbOk, mbCancel], 0) = mrOk then
      dmym.rsAddTemp.Delete;
end;

procedure tAppendYpform.setUserId(id: integer);
begin
  useid := id;
end;

procedure TappendYpForm.WMCLOSE(var msg: TWMCLOSE);
begin
    //;
end;

end.
