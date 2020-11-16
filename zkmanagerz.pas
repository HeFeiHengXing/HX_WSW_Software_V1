unit zkmanagerz;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  Tzkmanagez = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  zkmanagez: Tzkmanagez;

implementation
uses zkbrowsefrm,zkanalysisfrm; 
{$R *.dfm}

procedure Tzkmanagez.Button1Click(Sender: TObject);
var
   zfrm:tzkAnalysisForm;
begin
   zfrm:=tzkAnalysisForm.Create(self);
   self.Hide;
   zfrm.ShowModal;
end;

procedure Tzkmanagez.Button2Click(Sender: TObject);
var
   zfrm:tzkBrowseForm;
begin
   zfrm:=tzkBrowseForm.Create(self);
   zfrm.ShowModal;
end;

procedure Tzkmanagez.Button3Click(Sender: TObject);
begin
  close;
end;

end.
 
