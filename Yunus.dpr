program Yunus;

{%File 'ModelSupport\Unit1\Unit1.txvpck'}
{%File 'ModelSupport\Unit6\Unit6.txvpck'}
{%File 'ModelSupport\Unit7\Unit7.txvpck'}
{%File 'ModelSupport\HRTimer\HRTimer.txvpck'}
{%File 'ModelSupport\Unit5\Unit5.txvpck'}
{%File 'ModelSupport\uSimpleIDEDebugger\uSimpleIDEDebugger.txvpck'}
{%File 'ModelSupport\Unit4\Unit4.txvpck'}
{%File 'ModelSupport\dlgReplaceText\dlgReplaceText.txvpck'}
{%File 'ModelSupport\Unit19\Unit19.txvpck'}
{%File 'ModelSupport\Unit18\Unit18.txvpck'}
{%File 'ModelSupport\DTestPrintPreview\DTestPrintPreview.txvpck'}
{%File 'ModelSupport\DPageSetup\DPageSetup.txvpck'}
{%File 'ModelSupport\dlgConfirmReplace\dlgConfirmReplace.txvpck'}
{%File 'ModelSupport\Unit13\Unit13.txvpck'}
{%File 'ModelSupport\Unit12\Unit12.txvpck'}
{%File 'ModelSupport\Unit11\Unit11.txvpck'}
{%File 'ModelSupport\Unit10\Unit10.txvpck'}
{%File 'ModelSupport\Unit17\Unit17.txvpck'}
{%File 'ModelSupport\Unit16\Unit16.txvpck'}
{%File 'ModelSupport\Unit15\Unit15.txvpck'}
{%File 'ModelSupport\Unit14\Unit14.txvpck'}
{%File 'ModelSupport\Unit8\Unit8.txvpck'}
{%File 'ModelSupport\Unit9\Unit9.txvpck'}
{%File 'ModelSupport\Unit2\Unit2.txvpck'}
{%File 'ModelSupport\Unit3\Unit3.txvpck'}
{%File 'ModelSupport\dlgSearchText\dlgSearchText.txvpck'}
{%File 'ModelSupport\default.txvpck'}

uses
  Forms,
  Unit1 in 'Source\Unit1.pas' {Form1},
  UNIT2 in 'Source\UNIT2.pas' {Form2},
  Unit3 in 'Source\Unit3.pas' {Form3},
  UNIT4 in 'Source\UNIT4.PAS' {Form4},
  Unit5 in 'Source\Unit5.pas' {Form5},
  UNIT8 in 'Source\UNIT8.PAS' {Form8},
  UNIT9 in 'Source\UNIT9.PAS' {Form9},
  UNIT10 in 'Source\UNIT10.PAS' {Form7},
  UNIT11 in 'Source\UNIT11.PAS' {Form11},
  UNIT12 in 'Source\UNIT12.PAS' {Form12},
  Unit13 in 'Source\Unit13.pas' {Form13},
  Unit14 in 'Source\Unit14.pas' {Form14},
  Unit15 in 'Source\Unit15.pas' {Form15},
  hrtimer in 'Source\hrtimer.pas',
  Unit16 in 'Source\Unit16.pas' {Form16},
  Unit17 in 'Source\Unit17.pas' {Form17},
  Unit18 in 'Source\Unit18.pas' {Form18},
  UNIT7 in 'Source\UNIT7.PAS',
  Unit19 in 'Source\Unit19.pas' {Form19},
  dlgConfirmReplace in 'Source\dlgConfirmReplace.pas' {ConfirmReplaceDialog},
  dlgReplaceText in 'Source\dlgReplaceText.pas',
  DTestPrintPreview in 'Source\DTestPrintPreview.pas' {TestPrintPreviewDlg},
  DPageSetup in 'Source\DPageSetup.pas' {PageSetupDlg},
  dlgSearchText in 'Source\dlgSearchText.pas' {TextSearchDialog},
  uSimpleIDEDebugger in 'Source\uSimpleIDEDebugger.pas',
  UNIT6 in 'Source\UNIT6.PAS' {Form6};

{$R *.RES}

begin

  form18:=TForm18.create(Application);
//  if GetKeyState(vk_shift) < 1 then  else form18.Hide; //shift ile splash'ý geçiþ
  form18.Show;
  form18.update;

  Application.Initialize;
  Application.Title := 'Yunus';
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TConfirmReplaceDialog, ConfirmReplaceDialog);
  Application.CreateForm(TTestPrintPreviewDlg, TestPrintPreviewDlg);
  Application.CreateForm(TPageSetupDlg, PageSetupDlg);
  Application.CreateForm(TForm6, Form6);
  form18.Close;

  Application.Run;
end.
