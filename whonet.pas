unit whonet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, ValEdit,inifiles, DB, ADODB, ExcelXP,
  OleServer,comobj,strutils,DateUtils;

type
  Twhonetform = class(TForm)
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    SaveDialog1: TSaveDialog;
    OpenDialog2: TOpenDialog;
    GroupBox1: TGroupBox;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label23: TLabel;
    ListBox_Sec_W: TListBox;
    ListBox_Sec_Y: TListBox;
    BtnSec: TButton;
    ListBox_Sec_C: TListBox;
    BtnMarch_Sec: TButton;
    TabSheet3: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    ListBox_Type_W: TListBox;
    BtnType: TButton;
    Listbox_Type_Y: TListBox;
    Listbox_Type_C: TListBox;
    BtnMarch_Type: TButton;
    GroupBox2: TGroupBox;
    ProgressBar1: TProgressBar;
    BtnTrans: TButton;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    edt_labcode: TEdit;
    Button3: TButton;
    Button1: TButton;
    procedure btnshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSecClick(Sender: TObject);
    procedure BtnTypeClick(Sender: TObject);
    procedure BtnMarch_SecClick(Sender: TObject);
    procedure BtnMarch_TypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnTransClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    GlobalIni:Tinifile;
    myini:Tinifile;
    Txf:Textfile;
    DefaultFieldNo:integer;
    WhonetPath:string;
    whonetfile:string;
    medname:array of string; //ҩƷ��
    datafieldname:array of string;//�ֶ�������
    Departments:array of array of string;
    fields:array of string;//�ֶ���
    size:array of string; //�ֶδ�С
    Function Micintowhonet(str:string):string;

  public
    { Public declarations }
  end;

var
  whonetform: Twhonetform;

implementation

uses dbym, flash;

{$R *.dfm}

procedure Twhonetform.btnshClick(Sender: TObject);
begin

end;
{�����û�ѡ���WHONETʵ���������ļ�����ȡ����Ӧ���ֶΣ����ң�ҩ��걾����}


procedure Twhonetform.FormShow(Sender: TObject);
var strlist:Tstringlist;
begin
    //��ȡ���˿����ֶ��б�
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add('select secname from secname');
        open;
        listbox_sec_y.Items.Clear;
        while not eof do
        begin
            listbox_sec_y.Items.Add(fieldbyname('secname').AsString);
            next;
        end;
    end;

     //��ȡ���˱걾�����ֶ��б�
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add('select bbname from bb');
        open;

        listbox_Type_Y.Items.Clear;
        while not eof do
        begin
            listbox_Type_Y.Items.Add(fieldbyname('bbname').AsString);
            next;
        end;
    end;

    //��ȡWHONET�ֶΣ�Ҫ��Ϊ��ȡ�Ѷ����˵�WHONET�ֶ�
    listbox_sec_w.Items.Clear;
    myini.ReadSection('departments',listbox_sec_w.Items);
    //�����Ƿ�Ҫ����һ�����飬���ڵ����ʱ�������

    listbox_type_w.Items.Clear;
    myini.ReadSection('specimens',listbox_type_w.Items);
    //�����Ƿ�Ҫ����һ�����飬���ڵ����ʱ�������

    DateTimePicker1.DateTime:=now;
    DateTimePicker2.DateTime:=now;
end;

procedure Twhonetform.BtnSecClick(Sender: TObject);
var ymv2name,WhonetName:string;
    str:string;
    i,index:integer;
begin
    if (Listbox_Sec_Y.ItemIndex<>-1) and (Listbox_Sec_W.ItemIndex<>-1) then
    begin
        ymv2name:=Listbox_Sec_Y.Items.Strings[Listbox_Sec_Y.ItemIndex];
        WhonetName:=Listbox_Sec_W.Items.Strings[Listbox_Sec_W.ItemIndex];
        ListBox_Sec_C.Items.Add(ymv2name+'='+WhonetName);
        Listbox_Sec_Y.Items.Delete(Listbox_Sec_Y.ItemIndex);
        Listbox_Sec_W.Items.Delete(Listbox_Sec_W.ItemIndex);
        str:=myini.ReadString('departments',WhonetName,'');
        GlobalIni.WriteString('departments',ymv2name,str);
    end else
    messagedlg('��Ҫƥ���ymv2�ֶλ�WHONET�ֶ���δѡ��!',mtwarning,[mbok],0);
end;

procedure Twhonetform.BtnTypeClick(Sender: TObject);
var ymv2name,WhonetName:string;
    strlist:Tstringlist;
    str:string;
    i,index:integer;
begin
    strlist:=Tstringlist.Create;
    if(Listbox_Type_Y.ItemIndex<>-1) and (Listbox_Type_W.ItemIndex<>-1) then
    begin
        ymv2name:=Listbox_Type_Y.Items.Strings[Listbox_Type_Y.ItemIndex];
        WhonetName:=Listbox_Type_W.Items.Strings[Listbox_Type_W.ItemIndex];
        ListBox_Type_C.Items.Add(ymv2name+'='+WhonetName);
        Listbox_Type_Y.Items.Delete(Listbox_Type_Y.ItemIndex);
        Listbox_Type_W.Items.Delete(Listbox_Type_W.ItemIndex);
        str:=myini.ReadString('specimens',WhonetName,'');
        GlobalIni.WriteString('specimens',ymv2name,str);
    end else
    messagedlg('��Ҫƥ���ymv2�ֶλ�WHONET�ֶ���δѡ��!',mtwarning,[mbok],0);
end;
procedure Twhonetform.BtnMarch_SecClick(Sender: TObject);
var i:integer;
    str:string;
begin
    if not(ListBox_Sec_C.ItemIndex=-1) then
    begin
        str:=ListBox_Sec_C.Items.Strings[ListBox_Sec_C.itemindex];
        if messagedlg('�Ƿ�ɾ����ƥ���ֶ�:'+str,mtconfirmation,[mbok,mbcancel],0)=mrok then
        begin
            i:=pos('=',str);
            ListBox_Sec_Y.Items.Add(copy(str,0,i-1));
            ListBox_Sec_W.Items.Add(copy(str,i+1,length(str)-i));
            ListBox_Sec_C.Items.Delete(ListBox_Sec_C.ItemIndex);
            Globalini.DeleteKey('DepartMents',copy(str,0,i-1));
        end
    end else
    messagedlg('��ѡ����ƥ���ֶ�!',mtwarning,[mbok],0);
end;

procedure Twhonetform.BtnMarch_TypeClick(Sender: TObject);
var i:integer;
    str:string;
begin
    if not(ListBox_Type_C.ItemIndex=-1) then
    begin
        str:=ListBox_Type_C.Items.Strings[ListBox_Type_C.itemindex];
        if messagedlg('�Ƿ�ɾ����ƥ���ֶ�:'+str,mtconfirmation,[mbok,mbcancel],0)=mrok then
        begin
            i:=pos('=',str);
            ListBox_Type_Y.Items.Add(copy(str,0,i-1));
            ListBox_Type_W.Items.Add(copy(str,i+1,length(str)-i));
            ListBox_Type_C.Items.Delete(ListBox_Type_C.ItemIndex);
            Globalini.DeleteKey('Specimens',copy(str,0,i-1));
        end
    end else
    messagedlg('��ѡ����ƥ���ֶ�!',mtwarning,[mbok],0);
end;
procedure Twhonetform.FormCreate(Sender: TObject);
var str:string;
begin
    if fileexists(Extractfiledir(application.ExeName)+'\Whonet.ini') then
      deletefile(Extractfiledir(application.ExeName)+'\Whonet.ini');
    //filecreate(Extractfiledir(application.ExeName)+'\Whonet.ini');
    GlobalIni:=Tinifile.Create(Extractfiledir(application.ExeName)+'\Whonet.ini');//�洢ѡ�������ϵͳ�ֶζ�Ӧ��ϵ
    myini:=Tinifile.Create(Extractfiledir(application.ExeName)+'\config.ini');//whonet���������ƵĶ�Ӧ��ϵ
end;

procedure Twhonetform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action:=Cafree;
    Globalini.Free;
    myini.Free;
    (*if fileexists(Extractfiledir(application.ExeName)+'\whonet.ini') then
      deletefile(Extractfiledir(application.ExeName)+'\whonet.ini'); *)
end;

procedure Twhonetform.BtnTransClick(Sender: TObject);
var medslist,medscodelist:Tstringlist;
    SQLtext:string;
    i,j,p,old:integer;
    k:single;
    dataarr:array of array of string;
    germlist:Tstringlist;
    ageunit:string;
    xjname,xjcode:string;
    departmentcode,depttypecode:string;
    specimancode,jzcode,jztypecode:string;
    micstr:string;
    exl:variant;
    oldisint:boolean;
begin
    progressbar1.Position:=0;
    germlist:=Tstringlist.Create;
    myini.ReadSection('germ',germlist);

    SQLtext:='select * from base where repdate between #'+
                datetostr(datetimepicker1.time)+'# and #'+
                datetostr(datetimepicker2.time+1)+'# ';
    if  germlist.count>0 then
    begin
      SQLtext:=SQLtext+' and jzname in (';
      for i:=0 to germlist.Count-1 do
        SQLtext:=SQLtext+''''+germlist.Strings[i]+''',';
      SQLtext:=leftstr(SQLtext,length(SQLtext)-1)+')';
    end;
    germlist.free;

    SQLtext:=SQLtext+' order by repdate desc';

    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add(SQLtext);
        open;

        setlength(dataarr,recordcount+1);//��������+һ�б���
        medslist:=Tstringlist.Create; //����ҩ������
        medscodelist:=Tstringlist.Create; //WHONET��ҩ������
        medslist.Clear;medscodelist.Clear;
        myini.ReadSection('Meds',medslist);
        for i:=0 to medslist.Count-1 do
            medscodelist.Add(myini.ReadString('Meds',medslist[i],''));

        for i:=0 to length(dataarr)-1 do
          setlength(dataarr[i],25+medslist.Count);   //25�������ֶ�+����ҩ���ֶ�

        //�����ֶα���
        dataarr[0,0]:='COUNTRY_A'; //���Ҵ��룬Ĭ��CHN
        dataarr[0,1]:='LABORATORY'; //ʵ���Ҵ��룬������д
        dataarr[0,2]:='ORIGIN';  //�Զ�����h;
        dataarr[0,3]:='LAST_NAME'; // ���������Ժ������ݿ� ;Ϊ��������Ϊĳĳ
        dataarr[0,4]:='FULL_NAME'; // ͬLAST_NAME �ֶ�
        dataarr[0,5]:='PATIENT_ID'; //�걾�ţ����Ժ������ݿ⣬Ϊ�ջ������Ϊ��Ĭ��Ϊ�ͼ�����yyyymmdd��ʽ
        dataarr[0,6]:='SEX';//�Ա����Ժ������ݿ�;��->m Ů->f ;Ϊ��Ĭ��Ϊm
        dataarr[0,7]:='AGE';//���䣬���Ժ������ݿ⣻����+��λ����λy m w d,�磺88y;Ϊ����Ĭ��Ϊ99w
        dataarr[0,8]:='DEPARTMENT';//���Ҵ��룬���Ժ������ݿ⣬����whonet.ini�е�����ת����Ϊ��Ĭ��Ϊoth
        dataarr[0,9]:='WARD_TYPE';//���ҷ�����룬���Ժ������ݿ⣬����config.ini�е�����ת��
        dataarr[0,10]:='WARD';//���ң����Ժ������ݿ⣬ֱ�ӵ���
        dataarr[0,11]:='SPEC_NUM';//userid�����Ժ������ݿ⣬ֱ�ӵ���
        dataarr[0,12]:='SPEC_TYPE';//�걾���ͣ����Ժ������ݿ⣬����whonet.ini�е�����ת�� ,Ϊ����Ĭ��ot
        dataarr[0,13]:='SPEC_CODE';//�걾���ʹ��룬����config.ini�е����ú�SPEC_TYPEת��
        dataarr[0,14]:='ORGANISM';//ϸ�����ƣ����Ժ������ݿ⣬����config.ini�е�����ת��,�Ҳ�������Ϊ��Ĭ��oth
        dataarr[0,15]:='ORG_TYPE';//ϸ�������ԣ����ݸ���config.ini�е����ú�ORGANISMת��
        dataarr[0,16]:='BETA_LACT'; //��-������ø
        dataarr[0,17]:='ESBL'; //�����צ�-������ø
        dataarr[0,18]:='MRSA_SCRN'; //�ͼ���������������������
        dataarr[0,19]:='INDUC_CLI';  //�յ��Ϳ���ù����ҩ����
        dataarr[0,20]:='HODGE'; //��������
        dataarr[0,21]:='CARBAPENEM'; //̼��øϩø
        dataarr[0,22]:='SPEC_DATE';//�ͼ����ڣ����Ժ������ݿ⣬����Ĭ�ϵ�ǰ����
        dataarr[0,23]:='DATE_DATA';// �������ڣ����Ժ������ݿ⣬����Ĭ�ϵ�ǰ����
        dataarr[0,24]:='PAT_TYPE';//���䷶Χ������AGE�ֶ�����ת����
        //ҩ������
        for i:=25 to (25+medscodelist.Count-1) do
          dataarr[0,i]:=medscodelist.Strings[i-25];

        first;
        while not eof do
        begin
           i:=recno;
           progressbar1.Position:=trunc((i*100)/recordcount);
           application.ProcessMessages;

           dataarr[i,0]:='CHN';
           dataarr[i,1]:=trim(edt_labcode.Text);
           dataarr[i,2]:='h';
           if fieldbyname('name').asstring<>'' then
              dataarr[i,3]:=fieldbyname('name').AsString
           else
              dataarr[i,3]:='ĳĳ';

           dataarr[i,4]:=dataarr[i,3];

           if not varisnull(fieldvalues['bbh']) then
              dataarr[i,5]:=fieldbyname('bbh').AsString
           else
              dataarr[i,5]:=formatdatetime('yyyymmdd',today());

           if fieldbyname('sex').asstring='Ů' then
              dataarr[i,6]:='f'
           else
              dataarr[i,6]:='m';

           ageunit:='';
           if fieldbyname('age').asstring='��' then
              ageunit:='y';
           if fieldbyname('age').asstring='��' then
              ageunit:='m';
           if fieldbyname('age').asstring='��' then
              ageunit:='d';
           if fieldbyname('age').asstring='��' then
              ageunit:='w';

           if TryStrToInt(fieldbyname('old').AsString,old) then
              oldisint:=true
           else
              oldisint:=false;
              
           if oldisint and (ageunit<>'')then
              dataarr[i,7]:=fieldbyname('old').AsString+ageunit
           else
              dataarr[i,7]:='99w';

           if fieldbyname('kb').AsString<>'' then
              departmentcode:=Globalini.ReadString('departments',fieldbyname('kb').AsString,'oth')
           else
              departmentcode:='oth';

           dataarr[i,8]:=departmentcode;

           depttypecode:=myini.ReadString('departmenttype',departmentcode,'');
           dataarr[i,9]:=depttypecode;

           if fieldbyname('kb').AsString<>'' then
              dataarr[i,10]:=fieldbyname('kb').AsString
           else
              dataarr[i,10]:='����';

           dataarr[i,11]:= fieldbyname('useid').AsString;


           if fieldbyname('bb').AsString<>'' then
              specimancode:=Globalini.ReadString('specimens',fieldbyname('bb').AsString,'ot')
           else
              specimancode:='ot';

           dataarr[i,12]:=specimancode;
           dataarr[i,13]:=myini.ReadString('specimencode',specimancode,'');

           if fieldbyname('jzname').asstring<>'' then
           begin
              jzcode:=myini.ReadString('germ',fieldbyname('jzname').asstring,'oth');
              jztypecode:=myini.ReadString('germtype',fieldbyname('jzname').asstring,'-');
           end else
           begin
              jzcode:='oth';
              jztypecode:='-';
           end;

           dataarr[i,14]:=jzcode;
           dataarr[i,15]:=jztypecode;
           dataarr[i,16]:='';

           if not varisnull(fieldvalues['bc']) then
           begin
             if pos('ESBL',fieldbyname('bc').AsString) > 0 then
                dataarr[i,17]:='+'
             else
                dataarr[i,17]:='-';

             if pos('MRS',fieldbyname('bc').AsString) > 0 then
                dataarr[i,18]:='+'
             else
                dataarr[i,18]:='-';

             if pos('�յ�����ù',fieldbyname('bc').AsString) > 0 then
                dataarr[i,19]:='+'
             else
                dataarr[i,19]:='-';

             dataarr[i,20]:='';

             if pos('CR',fieldbyname('bc').AsString) > 0 then
                dataarr[i,21]:='+'
             else
                dataarr[i,21]:='-';
           end else
           begin
               dataarr[i,17]:='-';
               dataarr[i,18]:='-';
               dataarr[i,19]:='-';
               dataarr[i,20]:='';
               dataarr[i,21]:='-';
           end;

           if not varisnull(fieldvalues['cydate']) then
              dataarr[i,22]:=formatdatetime('yyyy-mm-dd',fieldbyname('cydate').AsDateTime)
           else
              dataarr[i,22]:=formatdatetime('yyyy-mm-dd',today());

           if not varisnull(fieldvalues['cydate']) then
              dataarr[i,23]:=formatdatetime('yyyy-mm-dd',fieldbyname('repdate').AsDateTime)
           else
              dataarr[i,23]:=formatdatetime('yyyy-mm-dd',today());

           if rightstr(dataarr[i,7],1)='d' then
           if strtoint(leftstr(dataarr[i,7],length(dataarr[i,7])-1))<=28 then
              dataarr[i,24]:='new'
           else
              dataarr[i,24]:='ped';

           if rightstr(dataarr[i,7],1)='w' then
           if strtoint(leftstr(dataarr[i,7],length(dataarr[i,7])-1))<=4 then
              dataarr[i,24]:='new'
           else
              dataarr[i,24]:='ped';

           if rightstr(dataarr[i,7],1)='m' then
              dataarr[i,24]:='ped';

           if rightstr(dataarr[i,7],1)='y' then
           begin
               if strtoint(leftstr(dataarr[i,7],length(dataarr[i,7])-1))<=14 then
                  dataarr[i,24]:='ped'
               else if strtoint(leftstr(dataarr[i,7],length(dataarr[i,7])-1))<=65 then
                  dataarr[i,24]:='adu'
               else dataarr[i,24]:='ger';
           end;

           if dataarr[i,7]='99w' then //�������
              dataarr[i,24]:='unk';

           with dmym.subQuery do
           begin
              dmym.subQuery.close;
              dmym.subQuery.sql.Clear;
              dmym.subQuery.sql.Add('select ypmc,mic from ypbase where useid='+inttostr(dmym.query1.FieldValues['useid']));
              dmym.subQuery.open;
              if dmym.subQuery.recordcount<>0 then
              while not dmym.subQuery.eof do
              begin
                  p:=-1;
                  for j:=0 to medslist.Count-1 do
                  if dmym.subQuery.fieldbyname('ypmc').AsString=medslist.Strings[j] then
                  begin
                    p:=j;
                    break;
                  end;
                  if p>=0 then
                  begin
                      if pos('��',dmym.subQuery.fieldbyname('mic').AsString)>0 then
                      begin
                          micstr:=rightstr(dmym.subQuery.fieldbyname('mic').AsString,length(dmym.subQuery.fieldbyname('mic').AsString)-2);
                          if pos ('/',micstr)>0 then
                            micstr:=leftstr(micstr,pos ('/',micstr)-1);
                          micstr:='<='+micstr;
                      end else
                      if pos('��',dmym.subQuery.fieldbyname('mic').AsString)>0 then
                      begin
                          micstr:=rightstr(dmym.subQuery.fieldbyname('mic').AsString,length(dmym.subQuery.fieldbyname('mic').AsString)-2);
                          if pos ('/',micstr)>0 then
                            micstr:=leftstr(micstr,pos ('/',micstr)-1);
                          micstr:='>='+micstr;
                      end else
                      begin
                          micstr:=dmym.subQuery.fieldbyname('mic').AsString;
                          if pos ('/',micstr)>0 then
                            micstr:=leftstr(micstr,pos ('/',micstr)-1);
                          if trystrtofloat(micstr,k) then
                          if strtofloat(micstr)<1 then
                            micstr:='1';
                      end;
                      dataarr[i,p+25]:=micstr;
                  end;
                  dmym.subQuery.next;
              end;
           end;
           next;
        end;
    end;

    with ExcelApplication1 do
    begin
      disconnect;
      visible[0]:=true;
      sheetsInNewWorkbook[0]:=1;
      workbooks.add(emptyparam,0);
      excelworkbook1.connectto(workbooks[workbooks.count] as _workbook);
    end;
    with ExcelWorksheet1 do
    begin
      connectTo(excelworkbook1.sheets[1] as _worksheet);
      name:='hx_whonet';
    end;
    ExcelWorksheet1.Range[ExcelWorksheet1.cells.Item[1,1],ExcelWorksheet1.cells.item[length(dataarr),length(dataarr[0])]].Value2:=dataarr;
    showmessage('���ݵ������!');
end;



function Twhonetform.Micintowhonet(str: string): string;
var i:integer;
begin
    result:='';
    for i:=1 to length(str) do
    if str[i] in ['0','1','2','3','4','5','6','7','8','9','.','/'] then
        result:=result+str[i];
    if pos('��',str)>0 then
        result:='<='+result;
    if pos('��',str)>0 then
        result:='>='+result;
    i:=pos('/',result);
    if i>0 then
      result:=copy(result,1,i-1);
end;

procedure Twhonetform.Button1Click(Sender: TObject);
var s1:Tstringlist;
    myfile:Textfile;
begin
    s1:=Tstringlist.Create;
    savedialog1.DefaultExt:='.ini';
    savedialog1.FileName:='Ĭ���ļ���';
    savedialog1.Title:='�������õ���ǰĿ¼';
    savedialog1.Execute;
    try
    s1.LoadFromFile(Extractfiledir(application.ExeName)+'\whonet.ini');
    Assignfile(myfile,savedialog1.FileName);
    rewrite(MyFile);
    Closefile(Myfile);
    s1.SaveToFile(savedialog1.FileName);


    ListBox_Sec_C.Items.Clear;
    ListBox_Sec_C.Items.Add('���浽�����ļ�:'+savedialog1.FileName);
    ListBox_Type_C.Items.Clear;
    ListBox_Type_C.Items.Add('���浽�����ļ�:'+savedialog1.FileName);
    except
    end;
end;

procedure Twhonetform.Button3Click(Sender: TObject);
var S1,S2:TstringList;
    str,str1:string;
    readtext:string;
    MyFile:Textfile;
    i,j:integer;
begin
    S1:=Tstringlist.Create;
    S2:=Tstringlist.Create;
    opendialog2.Title:='ѡ���ѱ���������ļ�';
    opendialog2.Filter:='���������ļ�(*.ini)|*.ini';
    opendialog2.Execute;

    if Opendialog2.filename<>'' then
    begin
        S1.LoadFromFile(opendialog2.FileName);
        str:=Extractfiledir(application.ExeName)+'\whonet.ini';
        assignfile(myfile,str);
        rewrite(myfile);
        closefile(myfile);
        S1.SaveToFile(str);

        ListBox_Sec_C.Items.Clear;
        ListBox_Type_C.Items.Clear;

        S1.Clear;
        s2.Clear;
        Str:='';Str1:='';
        Globalini.ReadSectionValues('Departments',S1);
        myini.ReadSectionValues('Departments',S2);
        for i:=0 to S1.Count-1 do
        begin
          str:=S1.Names[i];
          ListBox_Sec_Y.Items.Delete(ListBox_Sec_Y.Items.IndexOf(str));
          for j:=0 to S2.Count-1 do
          if S2.ValueFromIndex[j]=S1.ValueFromIndex[i] then
            Str1:=S2.Names[j];
          str:=str+'='+Str1;
          ListBox_Sec_W.Items.Delete(ListBox_Sec_W.Items.IndexOf(Str1));
          ListBox_Sec_C.Items.Add(str);
        end;

        S1.Clear;
        s2.Clear;
        Str:='';Str1:='';
        Globalini.ReadSectionValues('Specimens',S1);
        myini.ReadSectionValues('Specimens',S2);
        for i:=0 to S1.Count-1 do
        begin
          str:=S1.Names[i];
          ListBox_Type_Y.Items.Delete(ListBox_Type_Y.Items.IndexOf(Str));
          for j:=0 to S2.Count-1 do
          if S2.ValueFromIndex[j]=S1.ValueFromIndex[i] then
            Str1:=S2.Names[j];
          str:=str+'='+Str1;
          ListBox_Type_W.Items.Delete(ListBox_Type_w.Items.IndexOf(Str1));
          ListBox_Type_C.Items.Add(str);
        end;
    end;
end;


end.
