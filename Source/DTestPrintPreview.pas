unit DTestPrintPreview;

{$I SynEdit.inc}

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ToolWin, ActnList, ImgList, Dialogs,
  SynEditPrintPreview, Menus, AppEvnts, Printers, SynEditPrint,
  SynExportRTF, SynEditExport, SynExportHTML;

type
  TTestPrintPreviewDlg = class(TForm)
    ImageList: TImageList;
    ActionList: TActionList;
    FirstCmd: TAction;
    PrevCmd: TAction;
    NextCmd: TAction;
    LastCmd: TAction;
    ZoomCmd: TAction;
    PrintCmd: TAction;
    CloseCmd: TAction;
    ToolBar1: TToolBar;
    FirstBtn: TToolButton;
    PrevBtn: TToolButton;
    NextBtn: TToolButton;
    LastBtn: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    PrintBtn: TToolButton;
    ToolButton4: TToolButton;
    CloseBtn: TToolButton;
    StatusBar: TStatusBar;
    PopupMenu1: TPopupMenu;
    Fitto1: TMenuItem;
    Pagewidth1: TMenuItem;
    N1: TMenuItem;
    N251: TMenuItem;
    N501: TMenuItem;
    N1001: TMenuItem;
    N2001: TMenuItem;
    N4001: TMenuItem;
    SynEditPrintPreview: TSynEditPrintPreview;
    PrinterSetupDialog: TPrinterSetupDialog;
    ToolButton2: TToolButton;
    Action1: TAction;
    ToolButton6: TToolButton;
    SynEditPrint: TSynEditPrint;
    PrintDialog1: TPrintDialog;
    Action2: TAction;
    ToolButton7: TToolButton;
    SynExporterHTML1: TSynExporterHTML;
    SynExporterRTF1: TSynExporterRTF;

    procedure FirstCmdExecute(Sender: TObject);
    procedure PrevCmdExecute(Sender: TObject);
    procedure NextCmdExecute(Sender: TObject);
    procedure LastCmdExecute(Sender: TObject);
    procedure ZoomCmdExecute(Sender: TObject);
    procedure PrintCmdExecute(Sender: TObject);
    procedure CloseCmdExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Fitto1Click(Sender: TObject);
    procedure SynEditPrintPreviewMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SynEditPrintPreviewPreviewPage(Sender: TObject;
      PageNumber: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton2Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestPrintPreviewDlg: TTestPrintPreviewDlg;

implementation

uses Unit2, DPageSetup, Unit4, Unit5;

{$R *.DFM}

procedure TTestPrintPreviewDlg.FormShow(Sender: TObject);
var
  AFont: TFont;
begin
  AFont := TFont.Create;
  if SynEditPrint.Header.Count=0 then begin
      SynEditPrint.Header.Clear;
      with SynEditPrint.Header do begin
//        Add(form2.Language1.TranslateUserMessage('printHeader1'), nil, taRightJustify, 1);
//        Add('$TITLE$', nil, taLeftJustify, 2);
        AFont.Assign(DefaultFont);
      end;
     end; 
  if SynEditPrint.footer.Count=0 then begin
      SynEditPrint.Footer.Clear;
      with SynEditPrint.Footer do begin
        AFont.Assign(DefaultFont);
        Add('$PAGENUM$/$PAGECOUNT$', afont, taRightJustify, 1);
      end;
     end; 
  AFont.Free;

  SynEditPrintPreview.FirstPage;
  if Printer.PrinterIndex >= 0 then    caption := 'Preview: '+Printer.Printers[Printer.PrinterIndex];
  if SynEditPrint.Colors=false then
    SynEditPrintPreview.SynEditPrint.Font.Color:=clBlack;
  SynEditPrintPreview.ScalePercent := 100;
  SynEditPrintPreview.UpdatePreview;
end;

procedure TTestPrintPreviewDlg.FirstCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.FirstPage;
end;

procedure TTestPrintPreviewDlg.PrevCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.PreviousPage;
end;

procedure TTestPrintPreviewDlg.NextCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.NextPage;
end;

procedure TTestPrintPreviewDlg.LastCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.LastPage;
end;

procedure TTestPrintPreviewDlg.ZoomCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.ScaleMode := pscWholePage;
end;

procedure TTestPrintPreviewDlg.PrintCmdExecute(Sender: TObject);
var i,j,k,start,stop :integer;
    oldpage,oldZoom:integer;
begin
PrintDialog1.Options := [poPageNums, poSelection,poPrintToFile];
PrintDialog1.FromPage := 1;
PrintDialog1.MinPage := 1;
PrintDialog1.ToPage := SynEditPrintPreview.PageCount;
PrintDialog1.MaxPage := SynEditPrintPreview.PageCount;
oldpage:=SynEditPrintPreview.PageNumber-1;
oldZoom:=SynEditPrintPreview.ScalePercent;
SynEditPrintPreview.FirstPage;
 if PrintDialog1.Execute then begin
    for i:=1 to PrintDialog1.Copies do
     begin
     if PrintDialog1.PrintRange=prAllPages then  //tumunu yaz
       SynEditPrintPreview.Print
     else
     if PrintDialog1.PrintRange=prSelection then begin //aktif sayfa seçimdir
       start:= oldpage;
       stop:= start;
       SynEditPrintPreview.ScalePercent:=300;
       SynEditPrintPreview.UpdatePreview;
            with Printer do
            begin
              BeginDoc;
              for j := Start to Stop do
              begin
                 for k:=1 to j do SynEditPrintPreview.NextPage;
                 SynEditPrintPreview.PaintTo(Handle, 10, 10);
                 if j<> Stop then  NewPage;
              end;
              EndDoc;
            end;   
     end else begin
       start:= PrintDialog1.FromPage-1;          //belli yerler
       stop:= PrintDialog1.ToPage-1;
       SynEditPrintPreview.ScalePercent:=300;
       SynEditPrintPreview.UpdatePreview;
            with Printer do
            begin
              BeginDoc;
              for j := Start to Stop do
              begin
                 for k:=1 to j do SynEditPrintPreview.NextPage;
                 SynEditPrintPreview.PaintTo(Handle, 10, 10);
                 if j<> Stop then  NewPage;
              end;
              EndDoc;
            end;
       end;
     end;
  end;
SynEditPrintPreview.FirstPage;
for k:=1 to oldpage do SynEditPrintPreview.NextPage;
SynEditPrintPreview.ScalePercent:=oldZoom;
SynEditPrintPreview.UpdatePreview;
end;

procedure TTestPrintPreviewDlg.CloseCmdExecute(Sender: TObject);
begin
  Close;
end;

procedure TTestPrintPreviewDlg.Fitto1Click(Sender: TObject);
begin
  case (Sender as TMenuItem).Tag of
    -1: SynEditPrintPreview.ScaleMode := pscWholePage;
    -2: SynEditPrintPreview.ScaleMode := pscPageWidth;
  else
    SynEditPrintPreview.ScalePercent := (Sender as TMenuItem).Tag;
  end;
end;

procedure TTestPrintPreviewDlg.SynEditPrintPreviewMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  FScale: Integer;
begin
  FScale := SynEditPrintPreview.ScalePercent;
  if Button = mbLeft then begin
    if SynEditPrintPreview.ScaleMode = pscWholePage then
      SynEditPrintPreview.ScalePercent := 100
    else begin
      FScale := FScale * 2;
      if FScale > 400 then
        FScale := 400;
      SynEditPrintPreview.ScalePercent := FScale;
    end;
  end
  else begin
    FScale := FScale div 2;
    if FScale < 25 then
      FScale := 25;
    SynEditPrintPreview.ScalePercent := FScale;
  end;
end;

procedure TTestPrintPreviewDlg.SynEditPrintPreviewPreviewPage(
  Sender: TObject; PageNumber: Integer);
begin
//  StatusBar.Panels[1].Text := form2.Language1.TranslateUserMessage('printPageNum') +                            IntToStr(SynEditPrintPreview.PageNumber);
end;

procedure TTestPrintPreviewDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=VK_ESCAPE then close
end;

procedure TTestPrintPreviewDlg.ToolButton2Click(Sender: TObject);
begin
 if PrinterSetupDialog.Execute then begin
  SynEditPrintPreview.UpdatePreview;
  SynEditPrintPreview.FirstPage;
  if Printer.PrinterIndex >= 0 then
   caption := 'Preview: '+Printer.Printers[Printer.PrinterIndex];
  end;
end;

procedure TTestPrintPreviewDlg.Action1Execute(Sender: TObject);
begin
  PageSetupDlg.SetValues(SynEditPrint);
  if PageSetupDlg.ShowModal = mrOk then
    PageSetupDlg.GetValues(SynEditPrint);
  if SynEditPrint.Colors=false then    SynEditPrintPreview.SynEditPrint.Font.Color:=clBlack;
  SynEditPrintPreview.UpdatePreview;
  SynEditPrintPreview.ScalePercent:=SynEditPrintPreview.ScalePercent+1; //to refresh ?
  SynEditPrintPreview.ScalePercent:=SynEditPrintPreview.ScalePercent-1;
end;

procedure TTestPrintPreviewDlg.Action2Execute(Sender: TObject);
var exte:string;
begin
 form2.SaveDialog1.Filter:=
    'HTML Document (*.htm)|*.htm|'+
    'Text File (*.rtf)|*.rtf';
if form2.SaveDialog1.Execute then
 begin
  exte:=uppercase(ExtractFileExt(form2.SaveDialog1.FileName));
  case form2.SaveDialog1.FilterIndex of
   1:
    begin
       if exte='.htm' then exte:='' else exte:='.htm';
       SynExporterHTML1.ExportAll(form5.RichEdit1.Lines);
       SynExporterHTML1.SaveToFile(form2.SaveDialog1.FileName);
    end;
   2:
    begin
       if exte='.rtf' then exte:='' else exte:='.rtf';
       synExporterRTF1.ExportAll(form5.RichEdit1.Lines);
       SynExporterRTF1.SaveToFile(form2.SaveDialog1.FileName);
    end;
 end;
end; 

end;

end.

