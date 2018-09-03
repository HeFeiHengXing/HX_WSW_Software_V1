unit queryGenFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, DBCtrls, DB, ADODB;

type
  TqueryGenForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dblGerm: TDBLookupComboBox;
    cb1: TCheckBox;
    cb2: TCheckBox;
    startdate: TDateTimePicker;
    enddate: TDateTimePicker;
    cb3: TCheckBox;
    cbBB: TComboBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cb4: TCheckBox;
    cb5: TCheckBox;
    cb6: TCheckBox;
    Edit3: TEdit;
    cbSection: TComboBox;
    cbo2: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Bevel1: TBevel;
    Splitter1: TSplitter;
    rstemp: TADODataSet;
    cb7: TCheckBox;
    sjmd: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cb5KeyPress(Sender: TObject; var Key: Char);
    procedure cb2KeyPress(Sender: TObject; var Key: Char);
    procedure cb3KeyPress(Sender: TObject; var Key: Char);
    procedure cb7KeyPress(Sender: TObject; var Key: Char);
    procedure cb4KeyPress(Sender: TObject; var Key: Char);
    procedure cb6KeyPress(Sender: TObject; var Key: Char);
    procedure cb1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  queryGenForm: TqueryGenForm;

implementation

uses dbym, ymDataType;

{$R *.dfm}

procedure TqueryGenForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     rstemp.Active:=false;
end;

procedure TqueryGenForm.FormShow(Sender: TObject);
var
   slist:tstringlist;
   dh:dbhelper;
begin
   slist:=tstringlist.Create;
   dh.getSection(slist);
   cbSection.Items:=slist;

   slist.Clear;
   dh.getsjmd(slist);
   sjmd.Items:=slist;

   slist.Clear;
   dh.getBBType(slist);
   cbBB.Items:=slist;

   slist.Free;

   startdate.Date:=date;
   enddate.Date:=date;

  if dmym.rsGermType.Active=false then
     dmym.rsGermType.Active:=true;
end;

procedure TqueryGenForm.Button3Click(Sender: TObject);
begin
   close;
end;

procedure TqueryGenForm.Button2Click(Sender: TObject);
begin
  dmym.rsBase.Active:=false;
  if length(trim(memo1.text))>0 then
   dmym.rsBase.CommandText:='select * from base where '+ memo1.text
  else
   dmym.rsbase.CommandText:='select * from base';
  dmym.rsBase.CommandText:=dmym.rsBase.CommandText+' order by kb,repdate';
  dmym.rsBase.Active:=true;
end;

procedure TqueryGenForm.Button1Click(Sender: TObject);
var
  str:string;
begin
   
  str:=''; //Çå¿Õ
  if cb1.Checked then
    str:='js="'+dmym.rsGermType['germindex']+'"';
  if cb2.Checked then
    begin
    if length(str)>0 then
      str:=str+' and ';
    str:=str+ ' bb="'+cbbb.text+'"';
    end;
  if cb7.checked then
    begin
    if length(str)>0 then
      str:=str+'and ';
      str:=str+'sjmd="'+sjmd.text+'"';
    end;

  if cb3.Checked then
    begin
      if length(str)>0 then
        str:=str+' and ';
      str:=str+' repdate between #'+datetostr(startdate.datetime)+'# and #'+
            datetostr(enddate.datetime+1)+'#';
    end;
  if cb4.Checked then
    begin
    if length(str)>0 then
      str:=str+' and ';
    str:=str+ ' kb="'+cbSection.Text+'"';
    end;
  if cb5.Checked then
    begin
    if length(str)>0 then
      str:=str+' and ';
    str:=str+ ' sex="'+cbo2.text+'"';
    end;
  if cb6.Checked then
    begin
    if length(str)>0 then
      str:=str+' and ';
    str:=str+ ' jzname="'+edit3.text+'"';
    end;
  memo1.Text:=str;
end;

procedure TqueryGenForm.cb5KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not cb5.Checked then
            cb5.Checked:=true
        else
            cb5.Checked:=false;
    end;
end;

procedure TqueryGenForm.cb2KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not cb2.Checked then
            cb2.Checked:=true
        else
            cb2.Checked:=false;
    end;
end;

procedure TqueryGenForm.cb3KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not cb3.Checked then
            cb3.Checked:=true
        else
            cb3.Checked:=false;
    end;
end;

procedure TqueryGenForm.cb7KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not cb7.Checked then
            cb7.Checked:=true
        else
            cb7.Checked:=false;
    end;
end;

procedure TqueryGenForm.cb4KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not cb4.Checked then
            cb4.Checked:=true
        else
            cb4.Checked:=false;
    end;
end;

procedure TqueryGenForm.cb6KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not cb6.Checked then
            cb6.Checked:=true
        else
            cb6.Checked:=false;
    end;
end;

procedure TqueryGenForm.cb1KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
        if not cb1.Checked then
            cb1.Checked:=true
        else
            cb1.Checked:=false;
    end;
end;

end.
