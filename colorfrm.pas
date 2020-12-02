unit colorfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WinSkinData, DB, ADODB;

type
  Tcolorform = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label7: TLabel;
    Shape5: TShape;
    Label8: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    Label9: TLabel;
    Shape8: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Shape9: TShape;
    Shape10: TShape;
    Label12: TLabel;
    Shape11: TShape;
    Label13: TLabel;
    Shape12: TShape;
    Label14: TLabel;
    Shape13: TShape;
    Label15: TLabel;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Shape27: TShape;
    Shape28: TShape;
    Shape29: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Shape39: TShape;
    Shape40: TShape;
    Shape41: TShape;
    Shape42: TShape;
    Shape43: TShape;
    Shape44: TShape;
    Shape45: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Shape48: TShape;
    Shape49: TShape;
    Shape50: TShape;
    ADOQuery1: TADOQuery;
    Label6: TLabel;
    Label17: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    GroupBox2: TGroupBox;
    Shape26: TShape;
    Shape51: TShape;
    Shape52: TShape;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Shape53: TShape;
    Shape54: TShape;
    Shape55: TShape;
    Label36: TLabel;
    Label37: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    germtype: string;
    germleft, germtop: integer;
  end;

var
  colorform: Tcolorform;

implementation

uses loginfrm, dbym, germanalysisfrm;

{$R *.dfm}

procedure Tcolorform.FormShow(Sender: TObject);
var index, i, j, k: integer;
  js: string;
  shapearray: array[1..48] of Tshape;
begin
  left := germleft;
  top := germtop + 200 - self.height;

  shapearray[1] := shape2;
  shapearray[2] := shape3;
  shapearray[3] := shape4;
  shapearray[4] := shape5;
  shapearray[5] := shape6;
  shapearray[6] := shape7;
  shapearray[7] := shape8;
  shapearray[8] := shape9;
  shapearray[9] := shape10;
  shapearray[10] := shape11;
  shapearray[11] := shape12;
  shapearray[12] := shape13;
  shapearray[13] := shape14;
  shapearray[14] := shape15;
  shapearray[15] := shape16;
  shapearray[16] := shape17;
  shapearray[17] := shape18;
  shapearray[18] := shape19;
  shapearray[19] := shape20;
  shapearray[20] := shape21;
  shapearray[21] := shape22;
  shapearray[22] := shape23;
  shapearray[23] := shape24;
  shapearray[24] := shape25;

  shapearray[25] := shape27;
  shapearray[26] := shape28;
  shapearray[27] := shape29;
  shapearray[28] := shape30;
  shapearray[29] := shape31;
  shapearray[30] := shape32;
  shapearray[31] := shape33;
  shapearray[32] := shape34;
  shapearray[33] := shape35;
  shapearray[34] := shape36;
  shapearray[35] := shape37;
  shapearray[36] := shape38;
  shapearray[37] := shape39;
  shapearray[38] := shape40;
  shapearray[39] := shape41;
  shapearray[40] := shape42;
  shapearray[41] := shape43;
  shapearray[42] := shape44;
  shapearray[43] := shape45;
  shapearray[44] := shape46;
  shapearray[45] := shape47;
  shapearray[46] := shape48;
  shapearray[47] := shape49;
  shapearray[48] := shape50;
  with ADOquery1 do
  begin
    close;
    sql.Clear;
    sql.add('select GermIndex from GermType where GermType=:germ');
    parameters.ParamByName('germ').Value := germtype;
    open;
  end;
  if ADOQuery1.recordcount <> 0 then
    js := ADOQuery1.FieldValues['GermIndex'];

  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from board where js=:pramjs and btype=5');
    parameters.ParamByName('pramjs').Value := js;
    open;

    j := 0;
    index := fieldbyname('b24').FieldNo - 1;
    for i := 3 to index do
    begin
      shapearray[i - 2].Brush.color := stringtocolor(fields[i].Value);
    end;
  end;

  with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.add('select * from board where js=:pramjs and btype=6');
    parameters.ParamByName('pramjs').Value := js;
    open;

    j := 0;
    index := fieldbyname('b24').FieldNo - 1;
    for i := 3 to index do
    begin
      shapearray[i + 22].Brush.color := stringtocolor(fields[i].Value);
    end;
  end;

  if js = '01' then
  begin
    with ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from board where js=:pramjs and btype=5');
      parameters.ParamByName('pramjs').Value := js;
      open;

      shape26.Brush.Color := stringtocolor(FieldByName('b26').AsString);
      shape52.Brush.Color := stringtocolor(FieldByName('b27').AsString);
      shape54.Brush.Color := stringtocolor(FieldByName('b28').AsString);
    end;
    with ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from board where js=:pramjs and btype=6');
      parameters.ParamByName('pramjs').Value := js;
      open;

      shape51.Brush.Color := stringtocolor(FieldByName('b26').AsString);
      shape53.Brush.Color := stringtocolor(FieldByName('b27').AsString);
      shape55.Brush.Color := stringtocolor(FieldByName('b28').AsString);
    end;
  end;
end;

end.
