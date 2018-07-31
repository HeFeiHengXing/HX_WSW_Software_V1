//�ڽ����ģ�ͣ����Լ������ࣩ֮��Ŀ���ģ��
unit helper;
                     
interface
uses
   bio,meds,common,inifiles,sysutils,extctrls,dialogs,expert,
      variants,windows,controls,dateutils,graphics,classes,forms,
      adodb,db;
 type
    zHelper=class
    private
//biarray:array of array of integer;
      bio:zBio;
      med:zMed;
      ex:zExpert;
      userid:integer;
      //inifile:tinifile;
      image1:timage;//ͼ���ļ���Ϊȫ�����ԡ�
      bNewPatient:boolean;
      dllPath:string;//
      originjs:string;
      rsBaseTable:tadodataset;
      yptable:string;
      parentWnd:tform;
      locx:array[1..12] of integer;
      locy:array[1..12] of integer;
      //ymColors:array[1..3,1..24] of tcolor; //��6�У���Ϊҩ����Ӧ��ɫ
      bioColors:array[1..30] of tcolor;//ǰ���У���Ϊ������Ӧ��ɫ,��6����������
      ofColors:array[1..3] of tcolor;
      inputResults:array[1..6] of boolean;

    public
      Expert:string;//ר��ϵͳ���;
      bc,tsnyID,tsnyIDM:string;
      bHandInput,bNoScanInput:boolean;
      jzname:string;
      bbid:integer;
      constructor create(js1,ytable:string;pWnd:tform;bHand,bscan:boolean;bPatient:boolean;id:integer);
      //constructor create(js1:string;pwnd:tform;bHand:boolean);override;
      procedure startCheck;
      procedure handInput;
      procedure startScan;
      procedure analyzeBio;
      function loadBmpfromScanner():boolean;
      procedure setDllPath(strPath:string);
      procedure setRs(rs1:tadodataset);
      procedure loadBmpfromDisk();
      procedure getColorsFromImage;
      procedure analyzeYm;
      procedure updateDatabase();
      procedure setNewPatient(newpatient:boolean);
      procedure InitOldPatient;
      procedure setInputResults;
      procedure setAllResults;
      procedure inputYmResults;//ҩ������˹�����
      procedure setImage(imgsrc:timage);
      procedure updatebz;
 end;
implementation

uses germAnalysisFrm, dbym, zkAnalysisfrm;


constructor zhelper.create(js1,ytable:string;pWnd:tform;bhand,bscan:boolean;bPatient:boolean;id:integer);
var
   i,j:integer;
begin
   userid:=id;
   yptable:=ytable;
   bHandinput:=bHand;
   bNoScanInput:=bscan;
   parentwnd:=pWnd;
   originjs:=js1;
   bio:=zBio.create(originjs);
   bnewPatient:=bPatient;
   if bnewPatient  then
      med:=zMed.create(js1)
   else
      med:=zMed.create(userid,js1,yptable);
   //bio.setGermIndex(originjs);
   inifile:=tinifile.Create(getcurrentdir+'\dw.ini');
   for i:=1 to high(ymcolors) do
      for j:=1 to high(ymcolors[1]) do
         ymcolors[i,j]:=0;
end;

procedure zHelper.setDllPath(strpath:string);
begin
    dllpath:=strpath;
end;

procedure zHelper.startScan;
var
   i:integer;
   aform:tForm;
   bForm:TgermAnalysisForm;
   bmppath:string;
   b1,b2:boolean;
begin
   if bNewPatient then
   begin
   // if bHandInput=false then
    //begin
      if bNoScanInput then  //��������������Ļ��Ӵ��̶�ȡͼƬ
        loadbmpfromDisk
      else
      begin
        //dllpath:=inifile.readString('dll','driver','0');
        dllpath:=Getcurrentdir+'\twaindrv.dll';
        if not fileexists(dllpath) then
        begin
           MessageDlg('ɨ������������ָ����Ŀ¼!',mtInformation,[mbOK],0);
           exit;
        end else
        for i:=1 to ScanCount do
           loadBmpFromScanner();
      end;
      inifile:=tinifile.Create(getcurrentdir+'\dw.ini');
      //bmppath:=inifile.ReadString('bmp','scan','0');
      bmppath:=getcurrentdir+'\pic.bmp';
      image1.picture.LoadFromFile(bmppath);
      getColorsFromImage(); //��ͼ���ж�ȡ����ɫֵ
      setInputResults;
      bio.setInput(inputResults);
      bio.setColor(bioColors);
      bio.setOfColor(ofColors);
      //compute these colors (biocolor and ofcolor
      bio.checkReaction(b1,b2);
      med.chk1:=b1; //��bioresults[1],bioresults[2]���ݸ�med��������������ж�;
      med.chk2:=b2;
      bio.checkOf;
       //update ym
      med.updateFy();
   end else//�ϲ�Ա
      //begin
         initOldPatient;
      //end;
       //end else-begin
      //parent.updateGUI;
      //end else
     // MessageDlg('����������ã�ȷ��ɨ�������������·����ȷ!',mtInformation,[mbOK],0);
end;

procedure zHelper.analyzeBio;
var
   aform:tForm;
begin
   bio.checkResult;
   originjs:=bio.getOriginJs;
   med.setJs(originjs);
   med.setjzname(bio.jzname);
  //���½���;
    if parentwnd is tzkAnalysisForm then
      begin
         aform:=parentWnd as tzkAnalysisForm;
         tzkAnalysisForm(aform).lblCode.Caption:=bio.stdCode;
         tzkAnalysisForm(aform).dbe_jzname.Text:=bio.jzname;
      end
      else
      begin
         aform:=parentwnd as tgermAnalysisForm;
         tgermAnalysisForm(aform).lblCode.Caption:=bio.stdCode;
         tgermAnalysisForm(aform).dbe_jzname.Text:=bio.jzname;
      end;
end;

function zhelper.loadBmpfromScanner():boolean;
var
  bmppath,bstr:string ;
  left,top,width,height:double;
  VALUE:integer;
  lpFarProc:FARPROC;
  aform:tgermAnalysisform;
  bform:tzkAnalysisForm;
  // source:ttwainSource;
  LibHandle:Thandle;
  GetImageFromDriver:TGetImageFromDriver ;
begin
 {
  if board=0 then
    bstr:='bigscan'
  else
    bstr:='smallscan';
  }
  bstr:='bigscan';
  inifile:=tinifile.Create(getcurrentdir+'\dw.ini');
  bmppath:=inifile.ReadString('bmp','scan','0');
  with inifile do
    begin
      left:=strtofloat(ReadString(bstr, 'left', '0'));
      top:=strtofloat(ReadString(bstr, 'top', '0'));
      width:=strtofloat(ReadString(bstr, 'width', '4.3'));
      height:=strtofloat(ReadString(bstr, 'height', '5.6'));
    end;

  libhandle:=loadlibrary(pchar(dllpath));
  lpFarProc:=getprocaddress(libhandle,'GetImageFromDriver');
  if not (lpFarProc=nil) then
      @GetImageFromDriver:=lpFarProc
  else
      exit;
  //changed----call getbmpfromini
  try
    //bmppath:=inifile.readstring('bmp','scan','0');
    value:=GetImageFromDriver(parentwnd.handle,'pic.bmp',
              left, top, width, height, 100, 2,1);
    if value<>0 then
     begin
      showMessage('failed to load the scanner');
     end;
    //edit
    //image1:=timage.Create(parentwnd);
  except

  end;
   freeLibrary(LibHandle);
   //}
     //are loaded
   {if parentwnd is tgermAnalysisForm then
   begin
     aform:=parentWnd as tgermAnalysisForm;
     with aform do
     begin
      DelphiTwain1.LibraryLoaded := TRUE;
     DelphiTwain1.SourceManagerLoaded := TRUE;
  //SelectSource method displays a common Twain dialog
  //to allow the user to select one of the avaliable
  //sources and returns it's index or -1 if either
  //the user pressed Cancel or if there were no sources
      SourceIndex := DelphiTwain1.SelectSource();
      if (SourceIndex <> -1) then
      begin
     //Now that we know the index of the source, we'll
     //get the object for this source
        Source := DelphiTwain1.Source[SourceIndex];

     //Load source and acquire image
        source.setImageLayoutFrame(left,top,width,height);
        source.TransferMode:=ttmfile;

        Source.Loaded := TRUE;
        Source.Enabled := TRUE;
     end;
    end;
  end; {if (SourceIndex <> -1)}
  {if parentwnd is tzkAnalysisForm then
   begin
     bform:=parentWnd as tzkAnalysisForm;
     with bform do
     begin
      DelphiTwain1.LibraryLoaded := TRUE;
      DelphiTwain1.SourceManagerLoaded := TRUE;
  //SelectSource method displays a common Twain dialog
  //to allow the user to select one of the avaliable
  //sources and returns it's index or -1 if either
  //the user pressed Cancel or if there were no sources
      SourceIndex := DelphiTwain1.SelectSource();
      if (SourceIndex <> -1) then
      begin
     //Now that we know the index of the source, we'll
     //get the object for this source
        Source := DelphiTwain1.Source[SourceIndex];

     //Load source and acquire image
        source.setImageLayoutFrame(left,top,width,height);
        source.TransferMode:=ttmfile;

        Source.Loaded := TRUE;
        Source.Enabled := TRUE;
     end;
    end;
  end {if (SourceIndex <> -1)}
end;

procedure zhelper.loadBmpfromDisk();
var
  bmppath:string;
begin
  bmppath:=getcurrentdir+'\pic.bmp';
  //bmppath:=inifile.readstring('bmp','scan','0');
  if not fileexists(bmppath) then
    begin
      MessageDlg('����ͼƬ�����ڣ�������ȷ���ã�',mtInformation,[mbOK],0);
      exit;
    end;
  //edit
  //image1:=timage.Create(parentwnd);
end;

procedure zHelper.getColorsFromImage;
var
   i,j:integer;
begin
   //��ȡbigline�ֶ� ,��ע�뵽locx,locy������ ,top--y���꣬left--x����
   with inifile do
   begin
      for i:=1 to length(locx) do
         locx[i]:=readInteger('bigline','left'+inttostr(i+12),0);
      for i:=1 to length(locy) do
         locy[i]:=readInteger('bigline','top'+inttostr(i),0);
   end;
   //��1��2�У���Ϊ������Ӧ��ɫ������bioColor����
   for i:=1 to 2 do
   for j:=1 to 12 do
   begin
      bioColors[j+(i-1)*12]:=calcColor(locx[i],locy[j],image1,'bio');
      //inifile.WriteFloat('biocolors','bio'+inttostr(j+(i-1)*12),bioColors[j+(i-1)*12]);
  end;
   // ��һ��ҩ����Ӧ����3�е���5��,ֻҪ��ɫֵ����ŵ�ymcolor��ǰ12�С�
   for  i:=3 to 5 do
   for j:=1 to 12 do
      ymColors[i-2,j]:=calcColor(locx[i],locy[j],image1,'drug');
   // �ڶ���ҩ����Ӧ����6�е���8��,ֻҪ��ɫֵ����ŵ�ymcolor�ĺ�12��
   for  i:=6 to 8 do
   for j:=1 to 12 do
      ymColors[i-5,j+12]:=calcColor(locx[i],locy[j],image1,'drug');
   //o-f ������ɫ����
   ofcolors[1]:=calccolor(locx[6],locy[12],image1,'bio');
   ofcolors[2]:=calccolor(locx[7],locy[12],image1,'bio');
   ofColors[3]:=calccolor(locx[8],locy[12],image1,'bio');
end;

procedure zHelper.analyzeYm;
var
   aform:tForm;
begin
      //���ݽ����˹��޸ĵ�ϸ�����ƣ����º�̨����!
      if parentwnd is tzkAnalysisForm then
      begin
          aform:=parentwnd as TzkAnalysisForm;
          jzname:=tzkAnalysisForm(aform).dbe_jzname.Text;
      end else
      begin
          aform:=parentwnd as tgermAnalysisForm;
          jzname:=tgermAnalysisForm(aform).dbe_jzname.Text;
      end;
          med.setjzname(jzname);
      //

      //�˹�����ģʽ�£����µ���������ݣ���������ʼ��鰴ťҲ�����������
      if bHandInput then
         inputYmResults;
      if OriginJs='09' then
          Med.AnalysisEpi
      else
          med.analysis;

      //���·�����Ϣ****************************************
      updatebz;

      //ר��ϵͳ���****************************************
      if parentwnd is tzkAnalysisForm then
      begin
          aform:=parentwnd as TzkAnalysisForm;
          ex:=zExpert.create(originjs,tzkAnalysisForm(aform).dbe_jzname.Text,true);
      end else
      begin
          aform:=parentwnd as tgermAnalysisForm;
          ex:=zExpert.create(originjs,tgermAnalysisForm(aform).dbe_jzname.Text,false);
      end;
      //***************************************************

      //���½���*******************************************
      expert:=ex.expert;
      if parentwnd is tzkAnalysisForm then
      begin
         aform:=parentWnd as tzkAnalysisForm;
         tzkAnalysisForm(aform).updateGrid;
      end
      else
      begin
         aform:=parentwnd as tgermAnalysisForm;
         tgermAnalysisForm(aform).updateGrid;
      end;
      //***************************************************
      //parent.updateGUI;
end;

procedure zHelper.updateDatabase();
var
    str:string;
    i:integer;
begin
    if parentwnd is tzkAnalysisForm then
       rsbasetable:=dmym.rsbasezk
    else
       rsbasetable:=dmym.rsBase;

    if (not (rsbasetable.State=dsedit)) and (not (rsbasetable.state=dsInsert)) then
      exit;
    rsBaseTable['o-f']:=bio.ofIsPositive;
    if  bnewPatient then
    begin
      rsBaseTable['orignjs']:=originjs;
      rsBaseTable['js']:=originjs;
    end else
      rsBaseTable['js']:=originjs;
    //rsBaseTable['jzname']:=bio.jzname;
    rsBaseTable['result']:=bio.cbcode;

    //�������
    if (rsBaseTable['orignjs']<>'04') or (rsBaseTable['orignjs']<>'06') then
      rsBaseTable['js']:=rsBaseTable['orignjs'];
    if (rsBaseTable['orignjs']='01') and (not rsBaseTable['o-f']) then
      rsBaseTable['js']:='01';
    //��¼24��������Ӧ��ɫֵ
    for i:=1 to 24 do
    begin
      str:='c'+inttostr(i);
      rsBaseTable[str]:=bioColors[i];
    end;
   //ר��ϵͳ�����
    bc:=ex.bc;
    tsnyID:=ex.tsnyID;
    tsnyIDM:=ex.tsnyIDM;
    rsbasetable['bc']:=ex.bc;
    rsbasetable['tsnyID']:=ex.tsnyID;
    rsbasetable['tsnyIDM']:=ex.tsnyIDM;
    //�ύBase������
    rsBaseTable.Post;
    //׷��ҩ����Ӧ��������Ա��,�����������ѯ������ɾ��������
    if bNewPatient then
    begin
      str:='update yp set useid='+inttostr(rsBaseTable['useid']);
      dmym.conn.Execute(str);
    end else
    begin
      str:='delete from '+yptable+' where useid='+inttostr(rsbasetable['useid']);
      dmym.conn.Execute(str);
    end;
    dmym.conn.Execute('insert into '+yptable+' select * from yp');
    //����ҩ����Ϣ����
    if bNewPatient then
    begin
      str:='update ypaddtmp set useid='+inttostr(rsbaseTable['useid']);
      dmym.conn.Execute(str);
      if parentwnd is Tzkanalysisform then
          dmym.conn.Execute('insert into ypaddzk select * from ypaddtmp')
      else
          dmym.conn.Execute('insert into ypadd select * from ypaddtmp' );
    end else
    begin
      str:='update ypadd set useid='+inttostr(rsbaseTable['useid'])+' where useid is null';
      dmym.conn.Execute(str);
    end;
    //ɾ���걾�ǼǵĶ�Ӧ��¼
    dmym.conn.Execute('delete from regbblc where id='+inttostr(bbid));
    //ˢ�±걾�Ǽ����ݿ�
    dmym.rsRegBB.Close;
    dmym.rsRegBB.Open;
    MessageDlg('���ݱ���ɹ���',mtInformation,[mbOk],0);
end;

procedure zHelper.setNewPatient(newpatient:boolean);
begin
   bnewPatient:=newPatient;
end;

procedure zHelper.setRs(rs1:tadodataset);
begin
   rsBaseTable:=rs1;
   //ypTable:=tb;
   //med.yptable:=tb;
end;

procedure zHelper.InitOldPatient;
var
   i,j:integer;
   aform:tform;
begin
      for i:=1 to 30 do
            if copy(rsbaseTable['result'],i,1)='1' then
               bio.bioResults[i]:=true
            else
               bio.bioResults[i]:=false;
      with dmym.query1 do
            begin
               close;
               sql.Clear;
               sql.add('select * from yp order by ypid');
               active:=true;
               i:=1 ;

               first;
               while (not eof) and (i<25) do
               begin
                  //j:=(i-1)*3;
                  case  fieldvalues['jl'] of
                  1:
                     ymResults[3,i]:=true;
                  2:
                     ymResults[2,i]:=true;
                  3:
                     begin
                     ymResults[3,i]:=true;
                     ymResults[2,i]:=true;
                     end;
                  4:
                     ymResults[1,i]:=true;
                  5:
                     begin
                     ymResults[1,i]:=true;
                     ymResults[3,i]:=true;
                      end;
                  6:
                     begin
                     ymResults[1,i]:=true;
                     ymResults[2,i]:=true;
                     end;
                  7:
                     begin
                     ymResults[1,i]:=true;
                     ymResults[2,i]:=true;
                     ymResults[3,i]:=true;
                     end;
                  end; //end case
               next;
               i:=i+1;
            end;//end while
          end;//end with
  //���ý���
  if parentwnd is tzkAnalysisForm then
   begin
     aform:=parentWnd as tzkAnalysisForm;
     tzkAnalysisForm(aform).cb_germtypeClick(parentwnd);
     tzkAnalysisForm(aform).setJs;
     tzkAnalysisForm(aform).updateBioCheckbox(bio.ofIsPositive,bio.bioResults);
     tzkAnalysisForm(aform).setYmCheckbox;
     tzkAnalysisForm(aform).updateGrid1(rsbasetable['useid']);
     //tzkAnalysisForm(aform).createContentLabel(originjs);
     // tzkAnalysisForm(aform).createComplementLabel(originjs);
     //tzkAnalysisForm(aform).updateBioCheckbox(bio.ofIsPositive,bio.bioResults);
     // tzkAnalysisForm(aform).setYmCheckbox;
   end else
   begin
     aform:=parentwnd as tgermAnalysisForm;
     tgermAnalysisForm(aform).cb_germtypeClick(parentwnd);
     tgermAnalysisForm(aform).setJs;
     tgermAnalysisForm(aform).updateBioCheckbox(bio.ofIsPositive,bio.bioResults);
     tgermAnalysisForm(aform).setYmCheckbox;
     tgermAnalysisForm(aform).updateGridFromYpBase(rsbasetable['useid']);
     
   end;
end;
//�����˹����루Сģ�飩�����뵽inputResults����
procedure zHelper.setInputResults;
var
  aform:tform;
  i:integer;
begin
    if parentwnd is tzkAnalysisForm then
      begin
         aform:=parentWnd as tzkAnalysisForm;
         with tzkAnalysisForm(aform) do
         begin
            for i:=1 to length(inputresults) do
            if chkboxes[24+i]<>nil then
            begin
              if chkboxes[24+i].checked then
                inputResults[i]:=true
              else
                 inputResults[i]:=false;
            end;
         end;
      end;
      if parentwnd is tgermAnalysisForm then
      begin
         aform:=parentWnd as tgermAnalysisForm;
         with tgermAnalysisForm(aform) do
         begin
            for i:=1 to length(inputresults) do
            if chkboxes[24+i]<>nil then
            begin
              if chkboxes[24+i].checked then
                inputResults[i]:=true
              else
                inputResults[i]:=false;
            end;
         end;
      end;
end;

procedure zHelper.inputYmResults;
var
  aform:tform;
  i,j:integer;
begin
    med.initYPtable;
    if parentwnd is tzkAnalysisForm then
      begin
         aform:=parentWnd as tzkAnalysisForm;
         with tzkAnalysisForm(aform) do
         begin
           for i:=1 to 3 do
            for j:=1 to length(ymresults[i]) do
              if ymchkboxes[i,j]<>nil then
              begin
                if ymchkboxes[i,j].checked then
                  ymResults[i,j]:=true
                else
                  ymResults[i,j]:=false;
              end;
         end;
      end;
      if parentwnd is tgermAnalysisForm then
      begin
         aform:=parentWnd as tgermAnalysisForm;
         with tgermAnalysisForm(aform) do
         begin
          for i:=1 to 3 do
            for j:=1 to length(ymresults[i]) do
              if ymchkboxes[i,j]<>nil then
              begin
                if ymchkboxes[i,j].checked then
                  ymResults[i,j]:=true
                else
                  ymResults[i,j]:=false;
              end;
         end;
      end;
end;

procedure zHelper.setAllResults;
var
  aform:tform;
  i,j:integer;
begin
    if parentwnd is tzkAnalysisForm then
      begin
         aform:=parentWnd as tzkAnalysisForm;
         with tzkAnalysisForm(aform) do
         begin
           for i:=1 to length(biocolors) do
            if chkboxes[i]<>nil then
            begin
              if chkboxes[i].checked then
                bio.bioResults[i]:=true
              else
                bio.bioResults[i]:=false;
            end;
           for i:=1 to 3 do
            for j:=1 to length(ymresults[i]) do
              if ymchkboxes[i,j]<>nil then
              begin
                if ymchkboxes[i,j].checked then
                  ymResults[i,j]:=true
                else
                  ymResults[i,j]:=false;
              end;

         end;
      end;
      if parentwnd is tgermAnalysisForm then
      begin
         aform:=parentWnd as tgermAnalysisForm;
         with tgermAnalysisForm(aform) do
         begin
          for i:=1 to length(biocolors) do
            if chkboxes[i]<>nil then
            begin
              if chkboxes[i].checked then
                bio.bioResults[i]:=true
              else
                bio.bioResults[i]:=false;
            end;
           for i:=1 to 3 do
            for j:=1 to length(ymresults[i]) do
              if ymchkboxes[i,j]<>nil then
              begin
                if ymchkboxes[i,j].checked then
                  ymResults[i,j]:=true
                else
                  ymResults[i,j]:=false;
              end;
         end;
      end;
end;

procedure zHelper.startCheck;
var
  i,j:integer;
  aform:tform;
begin
  for i:=1 to 3 do
    for j:=1 to length(ymResults[i]) do
      ymresults[i,j]:=false;
   dmym.rscheck.active:=false;
  if bHandInput then
    handInput
  else
    startScan;
  //���½���
  if parentwnd is tzkAnalysisForm then
   begin
     aform:=parentWnd as tzkAnalysisForm;
     tzkAnalysisForm(aform).updateBioCheckbox(bio.ofIsPositive,bio.bioResults);
     tzkAnalysisForm(aform).setYmCheckbox;
   end
   else
   begin
     aform:=parentwnd as tgermAnalysisForm;
     tgermAnalysisForm(aform).updateBioCheckbox(bio.ofIsPositive,bio.bioResults);
     tgermAnalysisForm(aform).setYmCheckbox;
   end;
end;

procedure zHelper.handInput;
begin
   setAllResults;
   //   med.updateFy;
end;
procedure zHelper.setImage(imgsrc:timage)  ;
begin
  image1:=imgsrc;
end;
procedure zHelper.updatebz;
var bztbname:string;
    i:integer;
    field,fieldnames:string;
begin
    bztbname:='';
    if originjs='01' then
      bztbname:='bzcgj';
    if originjs='04' then
      bztbname:='bzcqj';
    if originjs='02' then
      bztbname:='bzffxj';
    if originjs='05' then
      bztbname:='bzhj';
    if originjs='06' then
      bztbname:='bzlqj';
    if originjs='14' then
      bztbname:='bzyxqj';
    if bztbname<>'' then
    with dmym.query1 do
    begin
        close;
        sql.Clear;
        sql.Add('select * from '+bztbname+' order by ypid');
        open;
        field:='';
        fieldnames:='';
        for i:=0 to FieldCount-1 do
            fieldnames:=fieldnames+fields[i].DisplayName;
        try
        if pos(jzname,fieldnames)>0 then
           field:=jzname
        else
        if pos('bz',fieldnames)>0 then
           field:='bz';
        if  field<>'' then
        while not eof do
        begin
            dmym.conn.Execute('update yp set bz='''+fieldvalues[field]+''' where ypmc='''+fieldvalues['ypmc']+'''');
            next;
        end;
        except
        //
        end;
    end;
end;

end.