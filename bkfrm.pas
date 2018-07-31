unit bkfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tbkform = class(TForm)
    Image1: TImage;
    lbtitle: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bkform: Tbkform;

implementation

uses common;

{$R *.dfm}

procedure Tbkform.FormResize(Sender: TObject);
var i:integer;
begin
  i:=self.ClientHeight div 2;
  lbtitle.Top:=i;
  i:=(self.ClientWidth-lbtitle.Width) div 2;
  if i>0 then
    lbtitle.Left:=i
  else
    lbtitle.Left:=0;

end;

procedure Tbkform.FormShow(Sender: TObject);
var str,str1:string;
i,j:integer;
begin
  str:=hospitalname;
  str1:='';
  i:=length(str);
  if i>14 then
    for j:=1 to (i-14) div 2 do
      str1:=str1+' '
  else
    for j:=1 to (i-14) div 2 do
      str:=' '+str;

  lbtitle.Caption:=str+chr(13)+str1+'微生物分析系统';
  image1.Picture.LoadFromFile('1.jpg');

end;

end.
