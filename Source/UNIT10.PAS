unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Registry, StdCtrls, ExtCtrls, Buttons;

type
  TForm7 = class(TForm)
    Button1: TButton;
    ScrollBox2: TScrollBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    FLabel: TLabel;
    MLabel: TLabel;
    PLabel: TLabel;
    SLabel: TLabel;
    PValue: TLabel;
    FValue: TLabel;
    MValue: TLabel;
    SValue: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    L1: TLabel;
    L2: TLabel;
    L3: TLabel;
    L4: TLabel;
    L5: TLabel;
    L6: TLabel;
    L7: TLabel;
    L8: TLabel;
    L9: TLabel;
    L10: TLabel;
    L11: TLabel;
    L12: TLabel;
    L13: TLabel;
    L14: TLabel;
    L15: TLabel;
    L16: TLabel;
    L17: TLabel;
    L18: TLabel;
    L19: TLabel;
    L20: TLabel;
    L21: TLabel;
    L22: TLabel;
    L23: TLabel;
    L24: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure L1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit2;

{$R *.dfm}

var
  OSVerInfo: TOSVersionInfo;
const
	ID_BIT	=	$200000;
type
	TCPUID	= array[1..4] of Longint;
	TVendor	= array [0..11] of char;

Function GetCPUSpeed: Double;
Const
  DelayTime = 500;
Var
  TimerHi, TimerLo: DWORD;
  PriorityClass, Priority: Integer;
Begin
  PriorityClass := GetPriorityClass(GetCurrentProcess);
  Priority := GetThreadPriority(GetCurrentThread);

  SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
  SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);

  Sleep(10);
  Asm
    dw 310Fh // rdtsc
    mov TimerLo, eax
    mov TimerHi, edx
  End;
  Sleep(DelayTime);
  Asm
    dw 310Fh // rdtsc
    sub eax, TimerLo
    sbb edx, TimerHi
    mov TimerLo, eax
    mov TimerHi, edx
  End;

  SetThreadPriority(GetCurrentThread, Priority);
  SetPriorityClass(GetCurrentProcess, PriorityClass);

  Result := TimerLo / (1000.0 * DelayTime);
End;

function IsCPUID_Available : Boolean; register;
asm
	PUSHFD
  POP     EAX
  MOV     EDX,EAX
  XOR     EAX,ID_BIT
  PUSH    EAX
  POPFD
  PUSHFD
  POP     EAX
  XOR     EAX,EDX
  JZ      @exit
  MOV     AL,True
@exit:
end;

function GetCPUID : TCPUID; assembler; register;
asm
  PUSH    EBX
  PUSH    EDI
  MOV     EDI,EAX
  MOV     EAX,1
  DW      $A20F
  STOSD
  MOV     EAX,EBX
  STOSD
  MOV     EAX,ECX
  STOSD
  MOV     EAX,EDX
  STOSD
  POP     EDI
  POP     EBX
end;

function GetCPUVendor : TVendor; assembler; register;
asm
  PUSH    EBX
  PUSH    EDI
  MOV     EDI,EAX
  MOV     EAX,0
  DW      $A20F
  MOV     EAX,EBX
  XCHG		EBX,ECX
  MOV			ECX,4
@1:
  STOSB
  SHR     EAX,8
  LOOP    @1
  MOV     EAX,EDX
  MOV			ECX,4
@2:
  STOSB
  SHR     EAX,8
  LOOP    @2
  MOV     EAX,EBX
  MOV			ECX,4
@3:
  STOSB
  SHR     EAX,8
  LOOP    @3
  POP     EDI
  POP     EBX
end;

function GetRegistryStringValue(Key, Statement: string): string;

begin
    with TRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;

      if OpenKey(Key, False) then

         result := ReadString(Statement);

    finally

      Free;

    end;
end;


function GetOSID(Plattform: DWORD): string;

  begin

    case Plattform of

      VER_PLATFORM_WIN32s:        result := 'Windows 3.x';
      VER_PLATFORM_WIN32_WINDOWS: result := 'Windows 9x';
      VER_PLATFORM_WIN32_NT:      result := 'Windows NT/2000';

      else

      result := 'Unknown';

    end;
  end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
timer1.Enabled :=false;
timer2.Enabled :=false;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
close
end;

procedure TForm7.FormShow(Sender: TObject);
var
  CurrentVersionKey : PChar;
   lp_Buffer : PChar;
   n_Size    : DWORD;
   lp_RootPathName           : PChar;
   lp_VolumeNameBuffer       : PChar;
   n_VolumeNameSize          : DWORD;
   lp_VolumeSerialNumber     : DWORD;
   lp_MaximumComponentLength : DWORD;
   lp_FileSystemFlags        : DWORD;
   lp_FileSystemNameBuffer   : PChar;
   n_FileSystemNameSize      : DWORD;
   Drv2   : integer;
   Drv1   : set of 0..25;
   SInfo : TSystemInfo;
   MemoryStat: TMemoryStatus;
   CPUID : TCPUID;
   I     : Integer;
   S	 : TVendor;
   ararakam: integer;
    FVolumeName              : ShortString;
    FVolumeSerialNo          : ShortString;
    FFileSystemName          : ShortString;
    FDrives                  : ShortString;
    FCPUType                 : ShortString;
    FOperatingSystemVersion  : ShortString;
    FOperatingSystemName     : ShortString;
    FOperatingSystemID       : DWORD;
    FMachineName             : ShortString;
    FFloatingPointProcessor  : ShortString;
    FUserName                : ShortString;
    FCompanyName             : ShortString;
    FWin95SerialNo           : ShortString;
    FTotalPhysicalMemory     : DWORD;
    FAvailablePhysicalMemory : DWORD;
    FTotalVirtualMemory      : DWORD;
    FAvailableVirtualMemory  : DWORD;
    FMemoryLoadValue         : DWORD;
    FBIOSDate                : ShortString;
    FBIOSName                : ShortString;
    FBIOSVersion             : ShortString;
    FBusType                 : ShortString;
    FCPU                     : ShortString;
    FMachineType             : ShortString;

const
   PROCESSOR_INTEL_386     = 386;
   PROCESSOR_INTEL_486     = 486;
   PROCESSOR_INTEL_PENTIUM = 586;
   PROCESSOR_MIPS_R4000    = 4000;
   PROCESSOR_ALPHA_21064   = 21064;

begin
screen.Cursor:=crHourGlass;
if form2.rke1.Checked then ararakam:=0 else ararakam:=1000;
form7.Caption:=loadstr(ararakam+130);
form7.Button1.Caption:=loadstr(ararakam+88);

  MemoryStat.dwLength := SizeOf(MemoryStat);

  GlobalMemoryStatus(MemoryStat);

  FTotalPhysicalMemory     := MemoryStat.dwTotalPhys DIV 1024;
  FTotalVirtualMemory      := MemoryStat.dwTotalVirtual DIV 1024;
  FAvailablePhysicalMemory := MemoryStat.dwAvailPhys DIV 1024;
  FAvailableVirtualMemory  := MemoryStat.dwAvailVirtual DIV 1024;
  FMemoryLoadValue         := MemoryStat.dwMemoryLoad;

  with OSVerInfo do

   begin

    case dwPlatformID of

    VER_PLATFORM_WIN32_WINDOWS : CurrentVersionKey := '\SOFTWARE\Microsoft\Windows\CurrentVersion';
    VER_PLATFORM_WIN32_NT : CurrentVersionKey := '\SOFTWARE\Microsoft\Windows NT\CurrentVersion';

    else

    CurrentVersionKey := nil;

    end;

    with TRegistry.Create do

    try
       RootKey := HKEY_LOCAL_MACHINE;

       if OpenKey('\hardware\DESCRIPTION\System\FloatingPointProcessor', False) then

           FFloatingPointProcessor   :=  'Yes'
       else
           FFloatingPointProcessor :=  'No';

    finally
     Free;
    end;

  end;

    FBIOSDate    := GetRegistryStringValue('Enum\Root\*PNP0C01\0000','BIOSDate');
    FBIOSName    := GetRegistryStringValue('Enum\Root\*PNP0C01\0000','BIOSName');
    FBIOSVersion := GetRegistryStringValue('Enum\Root\*PNP0C01\0000','BIOSVersion');
    FBusType     := GetRegistryStringValue('Enum\Root\*PNP0C01\0000','BusType');
    fCPU         := GetRegistryStringValue('Enum\Root\*PNP0C01\0000','CPU');
    FMachineType := GetRegistryStringValue('Enum\Root\*PNP0C01\0000','MachineType');

   n_Size := MAX_COMPUTERNAME_LENGTH + 1;
   lp_Buffer:='';
   try

      GetMem( lp_Buffer, n_Size );

         if Windows.GetComputerName( lp_Buffer, n_Size ) then

         FMachineName := lp_Buffer;
   finally

      FreeMem( lp_Buffer );

   end;
      lp_VolumeNameBuffer:='';
      lp_FileSystemNameBuffer:='';
   try

      GetMem( lp_VolumeNameBuffer, MAX_PATH + 1 );
      GetMem( lp_FileSystemNameBuffer, MAX_PATH + 1 );
      n_VolumeNameSize     := MAX_PATH + 1;
      n_FileSystemNameSize := MAX_PATH + 1;
      lp_RootPathName := PChar( 'C:\' );

      if Windows.GetVolumeInformation( lp_RootPathName,
                                       lp_VolumeNameBuffer,
                                       n_VolumeNameSize,
                                       @lp_VolumeSerialNumber,
                                       lp_MaximumComponentLength,
                                       lp_FileSystemFlags,
                                       lp_FileSystemNameBuffer,
                                       n_FileSystemNameSize ) then

      begin
          FVolumeName         := lp_VolumeNameBuffer;
          FVolumeSerialNo     := IntToHex(HiWord(lp_VolumeSerialNumber), 4) + '-' +
                  	         IntToHex(LoWord(lp_VolumeSerialNumber), 4);
          FFileSystemName     := lp_FileSystemNameBuffer;
      end;

   finally
      FreeMem( lp_VolumeNameBuffer );
      FreeMem( lp_FileSystemNameBuffer );
   end;
  with OSVerInfo do

    begin

    dwOSVersionInfoSize := SizeOf(OSVerInfo);

    if GetVersionEx(OSVerInfo) then;
    FOperatingSystemVersion := Format('%d.%d (%d.%s)',[dwMajorVersion, dwMinorVersion,
                                      (dwBuildNumber and $FFFF), szCSDVersion]);
    FOperatingSystemName := GetOSID(dwPlatformId);
    FOperatingSystemID   := dwPlatformId;

   end;

   DWORD( Drv1 ) := Windows.GetLogicalDrives;
   FDrives := '';

    for Drv2 := 0 to 25 do

        if Drv2 in Drv1 then

           FDrives := FDrives + Chr( Drv2 + Ord( 'A' )) + ': ';
  Windows.GetSystemInfo(SInfo);

  with SInfo do begin
    case dwProcessorType of
       PROCESSOR_INTEL_386      : FCPUType := '386';
       PROCESSOR_INTEL_486      : FCPUType := '486';
       PROCESSOR_INTEL_PENTIUM  : FCPUType := 'Pentium';
       PROCESSOR_MIPS_R4000     : FCPUType := 'MIPS';
       PROCESSOR_ALPHA_21064    : FCPUType := 'ALPHA';
    end;
  end;
    FUserName    := GetRegistryStringValue(CurrentVersionKey,'RegisteredOwner');
    FCompanyName := GetRegistryStringValue(CurrentVersionKey,'RegisteredOrganization');

    if OSVerInfo.dwPlatformID = VER_PLATFORM_WIN32_WINDOWS then

    FWin95SerialNo :=  GetRegistryStringValue(CurrentVersionKey,'ProductID');


l1.caption := FVolumeName;
l2.caption := fVolumeSerialNo;
l3.caption := fFileSystemName;
l4.caption := fDrives;
l5.caption := fCPUType;
l6.caption := fOperatingSystemVersion;
l7.caption := fOperatingSystemName;
l8.caption := fMachineName;
l9.caption := FfloatingPointProcessor;
l10.caption := FUserName;
l11.caption := fCompanyName;
l12.caption := fWin95SerialNo;
l13.caption := fBiosDate;
l14.caption := fBiosName;
l15.caption := fBiosVersion;
l16.caption := fbustype;
l17.caption := fCPU;
l18.caption := fMachineType;
l19.caption := InttoStr(fOperatingSystemId);
l20.caption := FormatFloat('#," KB"', fTotalPhysicalMemory);
l21.caption := FormatFloat('#," KB"',fAvailablePhysicalMemory);
l22.caption := FormatFloat('#," KB"',fTotalVirtualMemory);
l23.caption := FormatFloat('#," KB"',fAvailableVirtualMemory);
l24.caption := IntToStr(fMemoryLoadValue)+'%';


for I := Low(CPUID) to High(CPUID)  do CPUID[I] := -1;
  if IsCPUID_Available then begin
	  CPUID	:= GetCPUID;
          Label25.Caption := 'CPUID[1] = ' + IntToHex(CPUID[1],8);
          Label26.Caption := 'CPUID[2] = ' + IntToHex(CPUID[2],8);
	  Label27.Caption := 'CPUID[3] = ' + IntToHex(CPUID[3],8);
  	  Label28.Caption := 'CPUID[4] = ' + IntToHex(CPUID[4],8);
  	  PValue.Caption := IntToStr(CPUID[1] shr 12 and 3);
	  FValue.Caption := IntToStr(CPUID[1] shr 8 and $f);
  	  MValue.Caption := IntToStr(CPUID[1] shr 4 and $f);
	  SValue.Caption := IntToStr(CPUID[1] and $f);
	  S := GetCPUVendor;
  	  Label29.Caption := trim(S);

  	  Label35.Caption :=trim(GetRegistryStringValue(
                         'hardware\DESCRIPTION\System\CentralProcessor\0','Identifier'));
          end
  else begin
          Label29.Caption := 'NO CPUID';
  end;
screen.Cursor:=crDefault;
end;

procedure TForm7.Timer2Timer(Sender: TObject);
begin
 Label33.Caption := Format('%f', [GetCPUSpeed]);
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  Label33.Caption := Format('%f', [GetCPUSpeed]);
end;

procedure TForm7.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then close
end;

procedure TForm7.Timer1Timer(Sender: TObject);
begin
FormShow(self);
end;

procedure TForm7.L1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  (sender as TLabel).Hint:=(sender as TLabel).Caption;
end;

end.
