//********************************************************************************************************************************
//*                                                                                                                              *
//*     3delite's Helper functions V1.4 ?3delite 2006-2011                                                                      *
//*                                                                                                                              *
//* 3delite's Helper functions is free (a mention in the credits would be cool if you use it!).                                  *
//*                                                                                                                              *
//*     http://www.3delite.hu/                                                                                                   *
//*                                                                                                                              *
//* If you have any of the aforementioned please email: 3delite@3delite.hu                                                       *
//*                                                                                                                              *
//********************************************************************************************************************************

unit Helper3delite;

interface

Uses
    SysUtils,
    Windows;

  function PrivateExtractIcons(lpszFile: LPCTSTR; nIconIndex, cxIcon, cyIcon: Integer; phIcon : HICON; piconid, nIcons, flags: UINT): UINT; stdcall;

    //* Helper functions
    function IncludeTrailingPathDelimiterHTTP(const S: string): string;
    function DriveSerialNumber(DriveID:Byte): string;
    function URLEncode(const S: String; const InQueryString: Boolean): String;
    function GetZMem(var Variable: Pointer; Size: Int64): Boolean;
    function CreateUnicodeFile(FileName: String): Boolean;
    procedure ProcessMessages;
    function IsNewerVersion(CurrentVersion, NewVersion: String): Boolean;
    function FileExistsOnVideoDVD(const FileName: String): Boolean;
    function FileExistsEx(const FileName: String): Boolean;
    //function Str2Real(S: String): Real;
    function IntToStrW(const Value: Int64; const Digits: Word): String;
    function WindowsXPThemeActive: Boolean;
    function AltDown: Boolean;
    function CtrlDown: Boolean;
    function ShiftDown: Boolean;
    function MatchFileType(const FileName: String; Extensions: String): Boolean;
    function ExtractFileNameWithoutExt(const FileName: String): String;
    function ExtractURL(const URLFileName: string): String;
    function LastPos(SubStr: Char; S: string): Integer; overload;
    function LastPosLong(SubStr, S: string): Integer; overload;
    function LastPosEx(SubStr, S: string): Integer; overload;
    function LastPos(SubStr: array of Char; S: string): Integer; overload;
    function PToStr(Address: Pointer): String;
    function GetLogFileName(FileNameStart, Folder: String): String;
    function MIMEDecodeStr(MIMEStr: String): String;
    function GetHTMLTitle(FileName: String): String;
    function CreateDumbFile(FileName: String): Boolean;
    function EjectTray(Drive: Char): Boolean;
    function InsertTray(Drive: Char): Boolean;
    function GetProcMemUsage(Proc: Cardinal): Int64;
    //function CreatePath(Path: String): Boolean;
    function GetTimeZoneBias: TDateTime;
    function LocalDateTimeToUTC(D: TDateTime): TDateTime;
    function UTCToLocalDateTime(D: TDateTime): TDateTime;
    function BlockSize(Data: Pointer): Integer; register;
    function StrConvertToFileName(StrFileName: String): String;
    function StrConvertToSQLName(Text: String): String;
    function ExecProcessHandle(ProgramName: String): THandle;
    function ExecAndWaitForIt(const s: string): Cardinal;
    function HexToInt(HexStr: String): Integer;
    function RenameDir(DirFrom, DirTo: string; Silent: Boolean): Boolean;
    function FileDelete(FileName: String; Silent: Boolean): Boolean;
    function FileTime2DateTime(FileTime: TFileTime): TDateTime;
    function GetPathFreeSpace(Path: String): Int64;
    function GetPathDiskSize(Path: String): Int64;
    function SetDelimitedText(const Value: string; Delimiter, QuoteChar: Char): String;
    function GetFileVersionStr(ExeFilename: String): String; overload;
    function GetFileVersionStrEx(ExeFilename: String; Silent: Boolean): String; overload;
    function GetFileDescriptionStr(ExeFilename: String): String;
    function GetFileAuthorStr(ExeFilename: String): String;
    function GetFileCopyrightStr(ExeFilename: String): String;
    function MakeInt64(LowDWord, HiDWord: DWord): Int64;
    function StrXOR(Text: String; Key: Byte): String;
    function GetWinTempFileName(Beggining, Extension: String): String; stdcall; export;
    function BitSet(Value: Cardinal; BitNo: Byte; On: Boolean): Cardinal;
    function GetLoginName: string;
    function GetComputerNameStr: String;
    function WriteText2File(FileName, Text: String): Boolean;
    procedure LogStrings(FileName, Text: String);
    function BGR2RGB(BGRValue: Cardinal): Cardinal;
    function Bytes2MB(Bytes: Int64): String; overload;
    function Bytes2MB(Bytes: Extended): String; overload;
    function Secs2Time(Secs: Cardinal): String; overload;
    function Secs2TimeFast(Seconds: Double): String; overload;
    function Secs2Time(Secs: Double): String; overload;
    function mSec2Time(mSec: Int64): String;
    function Sec2Time(Sec: Int64): String;
    function mSec2TimeEx(mSec: Int64; Format: Integer): String;
    function NGetFileSize(FileName: String): Int64; overload;
    function NGetFileSizeFrom(SearchRec: TSearchRec): Int64; overload;
    function EncodeUnicode(UniString: String): String;
    function DecodeUnicode(UnicodeString: String): String;
    //function UTF8Encode(const WS: WideString): UTF8String;
    //function UTF8Decode(const sSource: string): string;
    function IntToBin1(Value: Longint; Digits: Integer): string;
    function IntToBin2(d: Longint): string;
    function GetFileModDate(FileName: String): TDateTime;
    function ExtractFileNameFromURL(const FileName: string): string;

    function HTTPDecode(const AStr: AnsiString): AnsiString;
    function HTTPEncode(const AStr: AnsiString): AnsiString;

    function DateTimeDiff(Start, Stop: TDateTime): Int64;

const
  VK_ENTER    = 13;
  VK_ESC      = 27;

  LVS_EX_LABELTIP = $00004000;

{ from winioctl.h }

  FILE_DEVICE_DISK  = $00000007;
  FILE_DEVICE_FILE_SYSTEM = $00000009;
  METHOD_BUFFERED   = 0;
  IOCTL_DISK_BASE   = FILE_DEVICE_DISK;
  FILE_READ_ACCESS  = 1; // file & pipe
  FILE_ANY_ACCESS   = 0;
  FILE_DEVICE_MASS_STORAGE = $2D;
  FILE_WRITE_ACCESS = 2;

  IOCTL_DISK_EJECT_MEDIA = (IOCTL_DISK_BASE shl 16) OR ($0202 shl 14) OR (METHOD_BUFFERED shl 2) OR FILE_READ_ACCESS;
  FSCTL_LOCK_VOLUME = (FILE_DEVICE_FILE_SYSTEM shl 16) OR (6 shl 14) OR (METHOD_BUFFERED shl 2) OR FILE_ANY_ACCESS;
  FSCTL_UNLOCK_VOLUME = (FILE_DEVICE_FILE_SYSTEM shl 16) OR (7 shl 14) OR (METHOD_BUFFERED shl 2) OR FILE_ANY_ACCESS;

  IOCTL_STORAGE_MEDIA_REMOVAL : DWORD = ($2D shl 16) OR (1 shl 14) OR ($201 shl 2);
  //IOCTL_STORAGE_EJECT_MEDIA   : DWORD = ($2D shl 16) OR (1 shl 14) OR ($202 shl 2);
  //FSCTL_LOCK_VOLUME           : DWORD = ( $9 shl 16) OR (0 shl 14) OR (  $6 shl 2);
  //FSCTL_UNLOCK_VOLUME         : DWORD = ( $9 shl 16) OR (0 shl 14) OR (  $7 shl 2);

  IOCTL_STORAGE_EJECT_MEDIA = (FILE_DEVICE_MASS_STORAGE shl 16) OR (FILE_READ_ACCESS shl 14) OR ($202 shl 2) OR (METHOD_BUFFERED);
  IOCTL_STORAGE_LOAD_MEDIA = (FILE_DEVICE_MASS_STORAGE shl 16) OR (FILE_READ_ACCESS shl 14) OR ($203 shl 2) OR (METHOD_BUFFERED);

const
  BELOW_NORMAL_PRIORITY_CLASS     = $00004000;
  {$EXTERNALSYM BELOW_NORMAL_PRIORITY_CLASS}
  ABOVE_NORMAL_PRIORITY_CLASS     = $00008000;
  {$EXTERNALSYM ABOVE_NORMAL_PRIORITY_CLASS}

type
    STORAGE_PROPERTY_QUERY = packed record
        PropertyId: DWORD;
        QueryType: DWORD;
        AdditionalParameters: Array[0..3] of Byte;
    end;

type
    STORAGE_BUS_TYPE = DWORD;

type
    STORAGE_DEVICE_DESCRIPTOR = packed record
        Version: DWORD;
        Size: DWORD;
        DeviceType: Byte;
        DeviceTypeModifier: Byte;
        RemovableMedia: Bool;
        CommandQueueing: Bool;
        VendorIdOffset: DWORD;
        ProductIdOffset: DWORD;
        ProductRevisionOffset: DWORD;
        SerialNumberOffset: DWORD;
        BusType: STORAGE_BUS_TYPE;
        RawPropertiesLength: DWORD;
        RawDeviceProperties: Array[0..1] of Byte;
    end;

const
    MAX_IDE_DRIVES = 16;

type
    _STORAGE_PROPERTY_ID = (StorageDeviceProperty, StorageAdapterProperty);

type
    _STORAGE_QUERY_TYPE = (PropertyStandardQuery, PropertyExistsQuery, PropertyMaskQuery, PropertyQueryMaxDefined);

const
    IOCTL_STORAGE_QUERY_PROPERTY = 2954240;

implementation

Uses
    PSApi,
    Controls,
    Classes,
    ShellApi,
    //Dialogs,
    Registry,
    StrUtils,
    SpecialFolders;

 function PrivateExtractIcons; external user32 name 'PrivateExtractIcons';

function DriveSerialNumber(DriveID:Byte): string;
  var
    hPhysicalDriveIOCTL    :THandle;
    query                  :STORAGE_PROPERTY_QUERY;
    buffer                 :array [0..10000] of byte;
    descrip                :STORAGE_DEVICE_DESCRIPTOR absolute buffer;
    cbBytesReturned        :DWORD;
    serial                 :PChar;
    s                      :string;
    i                      :Integer;
    ModelNumber            :string;
    SerialNumber           :string;
  begin
    Result:=EmptyStr;
    if DriveID>=MAX_IDE_DRIVES then
      begin
        SetLastError(ERROR_INVALID_DRIVE);
        Exit;
      end;
    if Win32Platform<>VER_PLATFORM_WIN32_NT then
      begin
        SetLastError(ERROR_APP_WRONG_OS);
        Exit;
      end;
    hPhysicalDriveIOCTL:=CreateFile(PChar('\\.\PhysicalDrive'+IntToStr(DriveID)),
                                    0,
                                    FILE_SHARE_READ or FILE_SHARE_WRITE,
                                    NIL,
                                    OPEN_EXISTING,
                                    0,
                                    0);
    if hPhysicalDriveIOCTL=INVALID_HANDLE_VALUE then Exit;
    try
      FillChar(query,SizeOf(query),0);
      query.PropertyID:=DWORD(StorageDeviceProperty);
      query.QueryType:=DWORD(PropertyStandardQuery);
      FillChar(buffer,SizeOf(buffer),0);
      cbBytesReturned:=0;
      if not DeviceIoControl(hPhysicalDriveIOCTL,
                             IOCTL_STORAGE_QUERY_PROPERTY,
                             @query,
                             SizeOf(query),
                             @buffer,
                             SizeOf(buffer),
                             cbBytesReturned,
                             NIL) then Exit;
      SerialNumber:=EmptyStr;
      if descrip.SerialNumberOffset<>0 then
        begin
          serial:=@buffer[descrip.SerialNumberOffset];
          i:=0;
          while Cardinal(i+3)<StrLen(serial) do
            begin
              SetString(s,PChar(Integer(serial)+i+2),2);
              Insert('$',s,1);
              SerialNumber:=SerialNumber+chr(StrToInt(s));
              SetString(s,PChar(Integer(serial)+i),2);
              Insert('$',s,1);
              SerialNumber:=SerialNumber+chr(StrToInt(s));
              Inc(i,4);
            end;
        end;
      ModelNumber:=EmptyStr;
      if descrip.ProductIDOffset<>0 then
        begin
          serial:=@buffer[descrip.ProductIDOffset];
          ModelNumber:=string(serial);
        end;
      Result:=Format('Model Number=%s     Serial Number=%s',[Trim(ModelNumber),Trim(SerialNumber)]);
    finally
      CloseHandle(hPhysicalDriveIOCTL);
    end;
    SetLastError(NO_ERROR);
end;

function GetZMem(var Variable: Pointer; Size: Int64): Boolean;
begin
    Result := False;
    if (NOT Assigned(Variable))
    OR (Size < 1)
    then begin
        Exit;
    end;
    try
        GetMem(Variable, Size);
        ZeroMemory(Variable, Size);
        Result := True;
    except
        Result := False;
    end;
end;

function CreateUnicodeFile(FileName: String): Boolean;
var
    UnicodeStringList: TStrings;
    Enc: TEncoding;
begin
    Result := False;
    if FileExists(FileName) then begin
        Exit;
    end;
    UnicodeStringList := tStringList.Create;
    UnicodeStringList.Clear;
    Enc := TUnicodeEncoding.Create;
    try
        UnicodeStringList.SaveToFile(FileName, Enc.Unicode);
        Result := True;
    finally
        Enc.Free;
        UnicodeStringList.Free;
    end;
end;

procedure ProcessMessages;
var
  Msg : tMsg;
begin
    while PeekMessage(Msg,0,0,0,PM_REMOVE) do begin
        TranslateMessage(Msg);
        DispatchMessage(Msg);
    end;
end;

procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
begin
    //Assert(Assigned(Strings));
    Strings.Clear;
    Strings.Delimiter := Delimiter;
    Strings.DelimitedText := Input;
end;

function IsNewerVersion(CurrentVersion, NewVersion: String): Boolean;
var
  Tmp, Tmp2: String;
  CurrentMajorVersion, CurrentMinorVersion, CurrentReleaseVersion, CurrentBuildVersion: Integer;
  NewMajorVersion, NewMinorVersion, NewReleaseVersion, NewBuildVersion: Integer;
  Exploded: TStringList;
begin

    CurrentMajorVersion := 0;
    CurrentMinorVersion := 0;
    CurrentReleaseVersion := 0;
    CurrentBuildVersion := 0;
    NewMajorVersion := 0;
    NewMinorVersion := 0;
    NewReleaseVersion := 0;
    NewBuildVersion := 0;

    Exploded := TStringList.Create;
    try
        Split('.', CurrentVersion, Exploded);
        if Exploded.Count > 0 then begin
            CurrentMajorVersion := StrToIntDef(Exploded[0], 0);
        end;
        if Exploded.Count > 1 then begin
            CurrentMinorVersion := StrToIntDef(Exploded[1], 0);
        end;
        if Exploded.Count > 2 then begin
            CurrentReleaseVersion := StrToIntDef(Exploded[2], 0);
        end;
        if Exploded.Count > 3 then begin
            CurrentBuildVersion := StrToIntDef(Exploded[3], 0);
        end;
    finally
        Exploded.Free;
    end;

    Exploded := TStringList.Create;
    try
        Split('.', NewVersion, Exploded);
        if Exploded.Count > 0 then begin
            NewMajorVersion := StrToIntDef(Exploded[0], 0);
        end;
        if Exploded.Count > 1 then begin
            NewMinorVersion := StrToIntDef(Exploded[1], 0);
        end;
        if Exploded.Count > 2 then begin
            NewReleaseVersion := StrToIntDef(Exploded[2], 0);
        end;
        if Exploded.Count > 3 then begin
            NewBuildVersion := StrToIntDef(Exploded[3], 0);
        end;
    finally
        Exploded.Free;
    end;

    try
        if NewMajorVersion = CurrentMajorVersion then begin
            if NewMinorVersion = CurrentMinorVersion then begin
                if NewReleaseVersion = CurrentReleaseVersion then begin
                    if NewBuildVersion = CurrentBuildVersion then begin
                        Result := False;
                        Exit;
                    end;
                end;
            end;
        end;

        if NewMajorVersion > CurrentMajorVersion then begin
            Result := True;
            Exit;
        end else begin
            if NewMinorVersion > CurrentMinorVersion then begin
                Result := True;
                Exit;
            end else begin
                if NewReleaseVersion > CurrentReleaseVersion then begin
                    Result := True;
                    Exit;
                end else begin
                    if NewBuildVersion > CurrentBuildVersion then begin
                        Result := True;
                        Exit;
                    end;
                end;
            end;
        end;

        Result := False;

    except
        Result := False;
    end;
end;

function FileExistsEx(const FileName: String): Boolean;
begin
    Result := FileExists(FileName);
    if NOT Result
        then Result := FileExistsOnVideoDVD(FileName);
end;

function FileExistsOnVideoDVD(const FileName: String): Boolean;
var
  Handle: THandle;
  FindData: TWin32FindData;
begin
    Result := False;
    Handle := FindFirstFile(PChar(FileName), FindData);
    if Handle <> INVALID_HANDLE_VALUE then begin
        Windows.FindClose(Handle);
        if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0
            then Result := True;
    end;
end;

function IntToStrW(const Value: Int64; const Digits: Word): String;
var
  Res: String;
begin
    try
        Res := IntToStr(Value);
        while Length(Res) < Digits
            do Res := '0' + Res;
        Result := Res;
    except
        //*
    end;
end;



function WindowsXPThemeActive: Boolean;
var
  Reg: TRegistry;
  ThemeActive: String;
begin
    Result := False;
    Reg := TRegistry.Create;
    try
        try
            Reg.RootKey := HKEY_CURRENT_USER;
            Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\ThemeManager\', False);
            if Reg.ValueExists('ThemeActive')
                then ThemeActive := Reg.ReadString('ThemeActive')
                else ThemeActive := '0';
            Result := ThemeActive <> '0';
        except
            //*
        end;
    finally
        Reg.CloseKey;
        FreeAndNil(Reg);
    end;
end;

function CtrlDown: Boolean;
var
  State: TKeyboardState;
begin
    GetKeyboardState(State);
    Result := ((State[VK_CONTROL] AND 128) <> 0);
end;

function ShiftDown: Boolean;
var
  State: TKeyboardState;
begin
    GetKeyboardState(State);
    Result := ((State[VK_SHIFT] AND 128) <> 0);
end;

function AltDown: Boolean;
var
  State: TKeyboardState;
begin
    GetKeyboardState(State);
    Result := ((State[VK_MENU] AND 128) <> 0);
end;

//* Extensions expects #13#10 delimited list of file extensions without the dot
function MatchFileType(const FileName: String; Extensions: String): Boolean;
var
  Fext: String;
  Exts: TStrings;
  i: Integer;
begin
    Result := False;
    try
        try
            Fext := ExtractFileExt(FileName);
            Fext := WideUpperCase(Copy(Fext, 2, Length(Fext)));
            Exts := TStringList.Create;
            Exts.Text := WideUpperCase(Extensions);
            for i := 0 to Exts.Count - 1 do begin
                if Exts[i] = Fext then begin
                    Result := True;
                    Break;
                end;
            end;
        except
            //*
        end;
    finally
        if Assigned(Exts)
            then FreeAndNil(Exts);
    end;
end;

function ExtractFileNameWithoutExt(const FileName: String): String;
var
  I: Integer;
  PlainFileName: String;
begin
    PlainFileName := ExtractFileName(FileName);
    I := LastDelimiter('.' + PathDelim + DriveDelim, PlainFileName);
    if (I = 0)
    OR (PlainFileName[I] <> '.')
        then I := MaxInt;
    Result := Copy(PlainFileName, 1, I - 1);
end;

function ExtractURL(const URLFileName: string): String;
var
  URLFile: TStrings;
begin
    Result := '';
    if NOT FileExists(URLFileName)
        then Exit;
    URLFile := TStringList.Create;
    try
        try
            URLFile.LoadFromFile(URLFileName);
            if Copy(URLFile[3], 1, 3) = 'URL'
                then Result := Copy(URLFile[3], 5, Length(URLFile[3]));
        except
            //*
        end;
    finally
        URLFile.Free;
    end;
end;

{
SIZE s;
HDC hdc = CreateCompatibleDC(NULL);
SelectObject( hdc, 'ide j? a HFONT' );
GetTextExtentPoint32( hdc, "blabla", 6, &s );
ReleaseDC( NULL, hdc );
}
{
function Str2Real(S: String): Real;
var
  Round1, Fract1, Sint: String;
  RNum, FNum: ShortInt;
  RealFract: Real;
  // el?el jelz?
  Sign: Boolean;
begin
    Sign := False;
    if S[1]= '-'
        then Sign := True;
    Round1 := StrPick(S, '.', False);
    Fract1 := StrPick(S, '.', True);
    // ha nincs tizedes pont
    if Round1 = '' then begin
        // ha m?usz el?elu
        if Sign = True then begin
            Sint := '-' + Fract1 + '.0';
            Round1 := StrPick(Sint, '.', False);
            Fract1 :='0';
        end else begin
            Sint := Fract1 + '.0';
            Round1 := StrPick(Sint, '.', False);
            Fract1 := '0';
        end;
    end;
    RNum:= StrToInt(Round1);
    FNum:= StrToInt(Fract1);
    RealFract := FNum / 10;
    if RNum > 0
        then Result := RNum + RealFract;
    if RNum < 0 then begin
        if FNum > 0
            // csak 0.5 v?z??re!
            then Result := (RNum - 1) + RealFract
            else Result:= RNum;
        end;
    if RNum = 0 then begin
        if Round1[1] = '-'
            then Result := (RNum - 1) + RealFract
            else Result := RNum + RealFract;
    end;
end;
}

function LastPos(SubStr: Char; S: string): Integer; overload;
var
  Found, Pos: integer;
begin
    Found := 0;
    try
        try
            Pos := Length(S);
            while (Pos > 0)
            AND (Found = 0)
            do begin
                if Copy(S, Pos, 1) = SubStr
                    then Found := Pos;
                Dec(Pos);
            end;
        except
            //*
        end;
    finally
        Result := Found;
    end;
end;

function LastPosLong(SubStr, S: string): Integer; overload;
var
  Found, Len, Pos: integer;
begin
    Found := 0;
    try
        try
            Pos := Length(S);
            Len := Length(SubStr);
            while (Pos > 0)
            AND (Found = 0)
            do begin
                if Copy(S, Pos, Len) = SubStr then begin
                    Found := Pos;
                    Exit;
                end;
                Dec(Pos);
            end;
        except
            //*
        end;
    finally
        Result := Found;
    end;
end;

function LastPosEx(SubStr, S: string): Integer; overload;
var
  Found, Pos, i: Integer;
  //Len: Integer;
begin
    Found := 0;
    try
        try
            Pos := Length(S);
            //Len := Length(SubStr);
            while (Pos > 0)
            AND (Found = 0)
            do begin
                for i := 1 to Length(SubStr) do begin
                    if Copy(S, Pos, 1) = SubStr[i] then begin
                        Found := Pos;
                        Exit;
                    end;
                end;
                Dec(Pos);
            end;
        except
            //*
        end;
    finally
        Result := Found;
    end;
end;

function LastPos(SubStr: array of Char; S: string): Integer; overload;
var
  Found, Pos, i: Integer;
  //Len: Integer;
begin
    Found := 0;
    try
        try
            Pos := Length(S);
            //Len := Length(SubStr);
            while (Pos > 0)
            AND (Found = 0)
            do begin
                for i := 0 to Length(SubStr) do begin
                    if Copy(S, Pos, 1) = SubStr[i] then begin
                        Found := Pos;
                        Exit;
                    end;
                end;
                Dec(Pos);
            end;
        except
            //*
        end;
    finally
        Result := Found;
    end;
end;

function PToStr(Address: Pointer): String;
begin
    if Address = nil then begin
        Result := 'nil';
        Exit;
    end;
    try
        Result := '$' + IntToHex(DWord(Address), 8);
    except
        Result := 'unknown';
    end;

end;

function GetLogFileName(FileNameStart, Folder: String): String;
var
  LogFileName: String;
begin
    Result := '';
    try
        LogFileName := DateToStr(Now) + TimeToStr(Now);
        LogFileName := FileNameStart + StrConvertToFileName(LogFileName);
        Result := IncludeTrailingPathDelimiter(Folder) + LogFileName + '.log';
    except
        //*
    end;
end;

function MIMEDecodeStr(MIMEStr: String): String;
var
  Buffer: String;
  Botu: Char;
  i: Integer;
  StartPos, Offset: Int64;
begin

    //* '=?Windows-1252?Q?Message-ben_str=FAkt=FAra_-_Tud=E1st=E1r_-_Prog.Hu?='

    try
        Result := MIMEStr;

        StartPos := Pos('Q?', Result) + 2;

        if StartPos > 2 then begin

            Result := Copy(Result, StartPos, Length(Result));

            Buffer := '';
            Offset := 0;
            for i := 1 to Length(Result) - 2  do begin

                Botu := Result [i + Offset];

                if Botu = '=' then begin
                    Buffer := Buffer + Chr(HexToInt(Result [i + 1 + Offset] + Result [i + 2 + Offset]));
                    Inc(Offset, 2);
                    //Inc(i, 2);
                end else Buffer := Buffer + Result [i + Offset];

                if i + Offset >= Length(Result) - 2
                    then Break;
            end;

            Result := ANSIReplaceStr(Buffer, '_', ' ');

        end;
    except
        //*
    end;
end;


function GetHTMLTitle(FileName: String): String;
var
  Dok: TStrings;
  Fext, Text: String;
  i, k: Integer;
  StartPos, EndPos: Int64;
begin

    Result := '';
    if NOT FileExists(FileName)
        then Exit;

    Fext :=  AnsiUpperCase(ExtractFileExt(FileName));

    try
        Dok := TStringList.Create;
        try
            Dok.LoadFromFile(FileName);

            if (Fext = '.HTM')
            OR (Fext = '.HTML')
            then begin
                //* <title>Title</title>
                //* Limit to 20KB
                Text := AnsiUpperCase(Copy(Dok.Text, 1, 1024 * 20));
                StartPos := Pos('<TITLE>', Text) + 7;
                EndPos := Pos('</TITLE>', Text);
                if i > 0 then begin
                    Result := Copy(Dok.Text, StartPos, EndPos - StartPos);
                    Result := ANSIReplaceStr(Result, (#13#10), ' ');
                end;
            end;

            if (Fext = '.MHT')
            then begin
                //* Subject: Title
                //* Search is limited to only the first 16 lines
                k := 1;
                for i := 0 to 15 do begin
                    if i >= Dok.Count
                        then Break;
                    if UpperCase(Copy(Dok[i], 1, 8)) = 'SUBJECT:' then begin
                        Result := MIMEDecodeStr(Trim(Copy(Dok[i], 10, Length(Dok[i]))));
                        while (UpperCase(Copy(Dok[i + k], 1, 5)) <> 'DATE:')
                        AND (i <= Dok.Count)
                        do begin
                            Result := Result + MIMEDecodeStr(Trim(Copy(Dok[i + k], 1, Length(Dok[i + k]))));
                            Inc(k);
                        end;
                        Break;
                    end;
                end;
            end;

            if Result <> '' then begin
                Result := DecodeUnicode(Result);
                //Result := UTF8Decode(Result);
            //    Result := HTTPDecode(Result);
            //    Result := HTMLDecode(Result);
            end;

        except
            //*
        end;
    finally
        FreeAndNil(Dok);
    end;
end;

function CreateDumbFile(FileName: String): Boolean;
var
    Dumb: TStrings;
begin
    try
        Result := False;
        if FileExists(FileName)
            then Exit;
        Dumb := TStringList.Create;
        try
            Dumb.SaveToFile(FileName);
            Result := True;
        finally
            if Assigned(Dumb)
                then FreeAndNil(Dumb);
        end;
    except
        Result := False;
    end;
end;

function EjectTray(Drive: Char): Boolean;
var
  hDevice: THandle;
  cb: DWORD;
  lpFileName: PChar;
begin
    Result := False;
    lpFileName := PChar('\\\\\\\\\\\?\\\\\.\\\\\\\\' + UpperCase(Drive) + ':');
    hDevice := CreateFile(lpFileName, GENERIC_READ, FILE_SHARE_READ OR FILE_SHARE_WRITE, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    if hDevice = INVALID_HANDLE_VALUE
        then Exit;
    Result := DeviceIoControl(hDevice, IOCTL_STORAGE_EJECT_MEDIA, nil, 0, nil, 0, cb, nil);
    CloseHandle(hDevice);
end;

function InsertTray(Drive: Char): Boolean;
var
  hDevice: THandle;
  cb: DWORD;
  lpFileName: PChar;
begin
    Result := False;
    lpFileName := PChar('\\\\\\\\\\\?\\\\\.\\\\\\\\' + UpperCase(Drive) + ':');
    hDevice := CreateFile(lpFileName, GENERIC_READ, FILE_SHARE_READ OR FILE_SHARE_WRITE, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    if hDevice = INVALID_HANDLE_VALUE
        then Exit;
    Result := DeviceIoControl(hDevice, IOCTL_STORAGE_LOAD_MEDIA , nil, 0, nil, 0, cb, nil) = False;
    CloseHandle(hDevice);
end;

function GetProcMemUsage(Proc: Cardinal): Int64;
var
  PMEMC: _PROCESS_MEMORY_COUNTERS;
begin
    Result := 0;
    PMEMC.cb := SizeOf(_PROCESS_MEMORY_COUNTERS);
    if GetProcessMemoryInfo(Proc, @PMEMC, SizeOf(_PROCESS_MEMORY_COUNTERS))
        then Result:= PMEMC.WorkingSetSize;
end;

function GetTimeZoneBias: TDateTime;
var
  TZI: TTimeZoneInformation;
begin
    Result := 0;
    case GetTimeZoneInformation(TZI) of
        TIME_ZONE_ID_STANDARD: Result := (TZI.Bias + TZI.StandardBias) / 1440;
        TIME_ZONE_ID_DAYLIGHT: Result := (TZI.Bias + TZI.DaylightBias) / 1440;
        TIME_ZONE_ID_UNKNOWN: Result := TZI.Bias / 1440;
    else
        //RaiseLastWin32Error;
    end;
end;

function LocalDateTimeToUTC(D: TDateTime): TDateTime;
begin
    Result := D + GetTimeZoneBias;
end;

function UTCToLocalDateTime(D: TDateTime): TDateTime;
begin
    Result := D - GetTimeZoneBias;
end;

function BlockSize(Data: Pointer): Integer; register;
asm
    MOV     EAX, [EAX-04h]
    AND     EAX, 7FFFFFFCh
    SUB     EAX, 04h
end;

function StrConvertToFileName(StrFileName: String): String;
begin
	Result := StrFileName;
    Result := StringReplace(Result, '*', '_', [rfReplaceAll]);
	Result := StringReplace(Result, '<', '_', [rfReplaceAll]);
	Result := StringReplace(Result, '>', '_', [rfReplaceAll]);
	Result := StringReplace(Result, '"', '_', [rfReplaceAll]);
	Result := StringReplace(Result, '\', '_', [rfReplaceAll]);
	Result := StringReplace(Result, '/', '_', [rfReplaceAll]);
    Result := StringReplace(Result, ':', '_', [rfReplaceAll]);
	Result := StringReplace(Result, '|', '_', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '_', [rfReplaceAll]);
end;

function StrConvertToSQLName(Text: String): String;
begin
	Result := Text;
    Result := ANSIReplaceStr(Result, '*', '_');
	Result := ANSIReplaceStr(Result, '<', '_');
	Result := ANSIReplaceStr(Result, '>', '_');
	Result := ANSIReplaceStr(Result, '"', '_');
	Result := ANSIReplaceStr(Result, '\', '_');
	Result := ANSIReplaceStr(Result, '/', '_');
    Result := ANSIReplaceStr(Result, ':', '_');
	Result := ANSIReplaceStr(Result, '|', '_');
    Result := ANSIReplaceStr(Result, '?', '_');
    Result := ANSIReplaceStr(Result, '&', '_');
    Result := ANSIReplaceStr(Result, '=', '_');
    Result := ANSIReplaceStr(Result, ' ', '');

end;

function ExecProcessHandle(ProgramName: String): THandle;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
begin
    FillChar(SI, SizeOf(TStartupInfo), 0);
    FillChar(PI, SizeOf(TProcessInformation), 0);
    SI.cb := SizeOf(TStartupInfo);
    CreateProcess(nil, PChar(ProgramName), nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil, SI, PI);
    Result := PI.hProcess;
end;

function ExecAndWaitForIt(const s: string): Cardinal;
var
  StartUpInfo: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  Command: array[0..255] of Char;
begin
    FillChar(StartUpInfo, SizeOf(StartUpInfo), #0);
    StartUpInfo.cb := sizeof(Startupinfo);
    StartUpInfo.dwFlags := STARTF_USESHOWWINDOW;
    StartUpInfo.wShowWindow := sw_Show;
    StrPCopy(Command,s);
    if CreateProcess(nil,
        Command,
        nil,
        nil,
        False,
        CREATE_NEW_CONSOLE OR NORMAL_PRIORITY_CLASS,
        nil,
        nil,
        StartUpInfo,
        ProcessInfo)
    then begin
        WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
        GetExitCodeProcess(ProcessInfo.hProcess, Result);
        CloseHandle(ProcessInfo.hThread);
        CloseHandle(ProcessInfo.hProcess);
    end;
end;

function HexToInt(HexStr: String): Integer;
begin
    Result := StrToInt('$' + HexStr);
end;

function RenameDir(DirFrom, DirTo: string; Silent: Boolean): Boolean;
var
  ShellInfo: TSHFileOpStruct;
begin
    if UpperCase(DirFrom) = UpperCase(DirTo) then begin
        Result := True;
        Exit;
    end;
    with ShellInfo do begin
        Wnd    := 0;
        wFunc  := FO_RENAME;
        pFrom  := PChar(DirFrom + #0);
        pTo    := PChar(DirTo + #0);
        if Silent    //OR FOF_SILENT
            then fFlags := FOF_ALLOWUNDO OR FOF_NOCONFIRMATION
            else fFlags := FOF_ALLOWUNDO;
    end;
    if SHFileOperation(ShellInfo) = 0
        then Result := True
        else Result := False;
end;

function FileDelete(FileName: String; Silent: Boolean): Boolean;
var
  DelStruct: TSHFileOpStruct;
  ReturnValue: Integer;
begin
    //* Directory
    if DirectoryExists(FileName) then begin
        ZeroMemory(@DelStruct, SizeOf(DelStruct));
        with DelStruct do begin
            Wnd    := 0;
            wFunc  := FO_DELETE;
            pFrom  := PWideChar(FileName + #0);
            fFlags := FOF_ALLOWUNDO
                OR FOF_NOCONFIRMMKDIR;
            if Silent
                then fFlags := fFlags OR FOF_SILENT;
        end;
        ReturnValue := SHFileOperation(DelStruct);
        if DirectoryExists(FileName)
            then Result := False
            else Result := True;
        Exit;
    end;
    //* File
    ZeroMemory(@DelStruct, SizeOf(DelStruct));
    with DelStruct do begin
        Wnd    := 0;
        wFunc  := FO_DELETE;
        pFrom  := PWideChar(FileName + #0);
        fFlags := FOF_ALLOWUNDO
            OR FOF_NOCONFIRMMKDIR;
        if Silent
            then fFlags := fFlags OR FOF_SILENT;
    end;
    ReturnValue := SHFileOperation(DelStruct);
    if FileExists(FileName)
        then Result := False
        else Result := True;
end;

function FileTime2DateTime(FileTime: TFileTime): TDateTime;
var
  LocalFileTime: TFileTime;
  SystemTime: TSystemTime;
begin
    FileTimeToLocalFileTime(FileTime, LocalFileTime);
    FileTimeToSystemTime(LocalFileTime, SystemTime);
    Result := SystemTimeToDateTime(SystemTime);
end;

function GetPathDiskSize(Path: String): Int64;
var
  Letter: String;
begin
    try
        Result := 0;
        if NOT DirectoryExists(Path) then begin
            Exit;
        end;
        Letter := ExtractFileDrive(Path);
        Result := DiskSize(Ord(Letter[1]) - $40);
        if Result < 0
            then Result := 0;        
    except
        Result := 0;
    end;
end;

function GetPathFreeSpace(Path: String): Int64;
var
  Letter: String;
begin
    try
        Result := 0;
        if NOT DirectoryExists(Path) then begin
            Exit;
        end;
        Letter := ExtractFileDrive(Path);
        Result := DiskFree(Ord(Letter[1]) - $40);
        if Result < 0
            then Result := 0;
    except
        Result := 0;
    end;
end;

function SetDelimitedText(const Value: string; Delimiter, QuoteChar: Char): String;
var
  P, P1: PChar;
  S: string;
begin
    Result := '';
    try
        P := PChar(Value);
        while P^ in [#1..' ']
            do P := CharNext(P);
        while P^ <> #0 do begin
            if P^ = QuoteChar
                then S := AnsiExtractQuotedStr(P, QuoteChar)
                else begin
                    P1 := P;
                    while (P^ <> '') AND (P^ <> Delimiter)
                        do P := CharNext(P);
                    SetString(S, P1, P - P1);
                end;
            Result := Result + (#13#10) + S;
            //Add(S);
            while P^ in [#1..' ']
                do P := CharNext(P);
            if P^ = Delimiter then begin
                P1 := P;
                if CharNext(P1)^ = #0
                    then Result := Result + #1010 + '';
                repeat
                    P := CharNext(P);
                until not (P^ in [#1..' ']);
            end;
        end;
    finally
        try
            Result := Copy(Result, 3, Length(Result));
        except
            //*
        end;
    end;
end;

{
function WB_SaveHTMLCode(WebBrowser: TWebBrowser; const FileName: TFileName): Boolean;
var
  ps: IPersistStreamInit;
  fs: TFileStream;
  sa: IStream;
begin
  ps := WebBrowser.Document as IPersistStreamInit;
  fs := TFileStream.Create(FileName, fmCreate);
  try
    sa := TStreamAdapter.Create(fs, soReference) as IStream;
    Result := Succeeded(ps.Save(sa, True));
  finally
    fs.Free;
  end;
end;
}

function GetFileVersionStr(ExeFilename: String): String;
const
  InfoNum = 10;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');
var
  S: string;
  n, Len, i: DWORD;
  Buf: PChar;
  Value: PChar;
begin
    Result := 'Unknown version';
    S := ExeFilename;
    n := GetFileVersionInfoSize(PChar(S), n);
    if n > 0 then begin
        Buf := AllocMem(n);
        GetFileVersionInfo(PChar(S), 0, n, Buf);
        for i := 1 to InfoNum
            do if VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + InfoStr[i]), Pointer(Value), Len)
                then if InfoStr[i] = 'FileVersion' then begin
                    Result := Value;
                    Break;
                end;
        FreeMem(Buf, n);
    end;
end;

function GetFileVersionStrEx(ExeFilename: String; Silent: Boolean): String; overload;
const
  InfoNum = 10;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');
var
  S: string;
  n, Len, i: DWORD;
  Buf: PChar;
  Value: PChar;
begin
    if NOT Silent
        then Result := 'unknown version';
    S := ExeFilename;
    n := GetFileVersionInfoSize(PChar(S), n);
    if n > 0 then begin
        Buf := AllocMem(n);
        GetFileVersionInfo(PChar(S), 0, n, Buf);
        for i := 1 to InfoNum
            do if VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + InfoStr[i]), Pointer(Value), Len)
                then if InfoStr[i] = 'FileVersion' then begin
                    Result := Value;
                    Break;
                end;
        FreeMem(Buf, n);
    end;
end;

function GetFileDescriptionStr(ExeFilename: String): String;
const
  InfoNum = 10;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');
var
  S: string;
  n, Len, i: DWORD;
  Buf: PChar;
  Value: PChar;
begin
    Result := ExtractFileName(ExeFilename);
    S := ExeFilename;
    n := GetFileVersionInfoSize(PChar(S), n);
    if n > 0 then begin
        Buf := AllocMem(n);
        GetFileVersionInfo(PChar(S), 0, n, Buf);
        for i := 1 to InfoNum
            do if VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + InfoStr[i]), Pointer(Value), Len)
                then if InfoStr[i] = 'FileDescription' then begin
                    Result := Value;
                    Break;
                end;
        FreeMem(Buf, n);
    end;
    if Trim(Result) = ''
        then Result := ExtractFileName(ExeFilename);
end;

function GetFileAuthorStr(ExeFilename: String): String;
const
  InfoNum = 10;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');
var
  S: string;
  n, Len, i: DWORD;
  Buf: PChar;
  Value: PChar;
begin
    Result := '';
    S := ExeFilename;
    n := GetFileVersionInfoSize(PChar(S), n);
    if n > 0 then begin
        Buf := AllocMem(n);
        GetFileVersionInfo(PChar(S), 0, n, Buf);
        for i := 1 to InfoNum
            do if VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + InfoStr[i]), Pointer(Value), Len)
                then if InfoStr[i] = 'CompanyName' then begin
                    Result := Value;
                    Break;
                end;
        FreeMem(Buf, n);
    end;
    if Trim(Result) = ''
        then Result := '';
end;

function GetFileCopyrightStr(ExeFilename: String): String;
const
  InfoNum = 10;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');
var
  S: string;
  n, Len, i: DWORD;
  Buf: PChar;
  Value: PChar;
begin
    Result := '';
    S := ExeFilename;
    n := GetFileVersionInfoSize(PChar(S), n);
    if n > 0 then begin
        Buf := AllocMem(n);
        GetFileVersionInfo(PChar(S), 0, n, Buf);
        for i := 1 to InfoNum
            do if VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + InfoStr[i]), Pointer(Value), Len)
                then if InfoStr[i] = 'LegalCopyright' then begin
                    Result := Value;
                    Break;
                end;
        FreeMem(Buf, n);
    end;
    if Trim(Result) = ''
        then Result := '';
end;

function MakeInt64(LowDWORD, HiDWORD: DWord): Int64;
begin
    Result := LowDWORD OR HiDWORD SHL 32;
end;

function StrXOR(Text: String; Key: Byte): String;
var
  i: Cardinal;
begin
    Result := '';
    if Length(Text) < 1
        then Exit;
    for i := 1 to Length(Text)
        do Result := Result + Chr(Byte(Ord(Text[i])) XOR Key);
end;

function GetWinTempFileName(Beggining, Extension: String): String; stdcall; export;
var
  TmpDir: array [0..MAX_PATH-1] of Char;
begin
    GetTempPath(MAX_PATH, TmpDir);
	Randomize;
    repeat
    	Result := IncludeTrailingPathDelimiter(TmpDir) + Beggining + IntToStr(Random(1000000)) + '.' + Extension;
    until NOT FileExists(Result);
end;

function BitSet(Value: Cardinal; BitNo: Byte; On: Boolean): Cardinal;
var
  bMask: Cardinal;
begin
    if On then begin
        // Bit be?l??
        bMask := 1;
        bMask := bMask SHL BitNo;
        Result := Value OR bMask;
    end else begin
        // Bit t?l?
        bMask := 1;
        bMask := $FFFFFFFF - (bMask SHL BitNo);
        Result := Value AND bMask;
    end;
end;

function GetLoginName: String;
var
  Buffer: Array[0..255] of Char;
  Size: dword;
begin
    Size := High(Buffer) + 1;
    if GetUserName(Buffer, Size)
        then Result := Buffer
        else Result := '';
end;

function GetComputerNameStr: String;
var
  Buffer: Array[0..255] of Char;
  Size: dword;
begin
    Size := High(Buffer) + 1;
    if GetComputerName(Buffer, Size)
        then Result := Buffer
        else Result := '';
end;

function WriteText2File(FileName, Text: String): Boolean;
var
  sText: TStrings;
begin
    Result := False;
    sText := TStringList.Create;
    try
        try
            if FileExists(FileName)
                then sText.LoadFromFile(FileName);
            sText.Append(Text);
            sText.SaveToFile(FileName);
            Result := True;
        except
            //*
        end;
    finally
        sText.Free;
    end;
end;

procedure LogStrings(FileName, Text: String);
var
    FileStream: TFileStream;
    LogString: String;
    BOM: Integer;
begin
    try
        if FileExists(FileName) then begin
            FileStream := TFileStream.Create(FileName, fmOpenReadWrite OR fmShareDenyWrite)
        end else begin
            FileStream := TFileStream.Create(FileName, fmCreate OR fmShareDenyWrite);
            BOM := $FF;
            FileStream.Write(BOM, 1);
            BOM := $FE;
            FileStream.Write(BOM, 1);
        end;
        try
            FileStream.Seek(0, soFromEnd);
            LogString := Text + (#13#10);
            FileStream.Write(Pointer(LogString)^, Length(LogString) * 2);
        finally
            FileStream.Free;
        end;
    except
        //*
    end;
end;

function BGR2RGB(BGRValue: Cardinal): Cardinal;
begin
    BGRValue := (BGRValue shl 8) shr 8;
   	Result := (BGRValue shr 16) + (((BGRValue shl 16) shr 24) shl 8) + (BGRValue shl 16);
end;

function Bytes2MB(Bytes: Int64): String;
var
    KB: Extended;
    MB: Extended;
    GB: Extended;
    TB: Extended;
    PB: Extended;
    EB: Extended;
    ZB: Extended;
    YB: Extended;
    KBD: Extended;
    MBD: Extended;
    GBD: Extended;
    TBD: Extended;
    PBD: Extended;
    EBD: Extended;
    ZBD: Extended;
    YBD: Extended;
begin
    {
    if Bytes > 1048576 then begin
        if Bytes > 1073741824
            then Result := FloatToStrF((Bytes / 1073741824), ffFixed, 4, 2) + ' GB'
            else Result := FloatToStrF((Bytes / 1048576), ffFixed, 4, 2) + ' MB';
    end else Result := FloatToStrF((Bytes / 1024), ffFixed, 4, 2) + ' KB';
    if Bytes < 1024
 	    then Result := IntToStr(Bytes) + ' Byte';
    }

    KB := 1024.0 * 1024.0;
    MB := 1024.0 * 1024.0 * 1024.0;
    GB := 1024.0 * 1024.0 * 1024.0 * 1024.0;
    TB := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    PB := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    EB := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    ZB := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    YB := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;

    KBD := 1024.0;
    MBD := 1024.0 * 1024.0;
    GBD := 1024.0 * 1024.0 * 1024.0;
    TBD := 1024.0 * 1024.0 * 1024.0 * 1024.0;
    PBD := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    EBD := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    ZBD := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    YBD := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;

    if Bytes < 1024 then begin
        Result := IntToStr(Bytes) + ' Byte';
    end else begin
        if Bytes < KB then begin
            Result := FloatToStrF((Bytes / KBD), ffFixed, 4, 2) + ' KB';
        end else begin
            if Bytes < MB then begin
                Result := FloatToStrF((Bytes / MBD), ffFixed, 4, 2) + ' MB';
            end else begin
                if Bytes < GB then begin
                    Result := FloatToStrF((Bytes / GBD), ffFixed, 4, 2) + ' GB'
                end else begin
                    if Bytes < TB then begin
                        Result := FloatToStrF((Bytes / TBD), ffFixed, 4, 2) + ' TB'
                    end else begin
                        if Bytes < PB then begin
                            Result := FloatToStrF((Bytes / PBD), ffFixed, 4, 2) + ' PB'
                        end else begin
                            if Bytes < EB then begin
                                Result := FloatToStrF((Bytes / EBD), ffFixed, 4, 2) + ' EB'
                            end else begin
                                if Bytes < ZB then begin
                                    Result := FloatToStrF((Bytes / ZBD), ffFixed, 4, 2) + ' ZB'
                                end else begin
                                    if Bytes < YB then begin
                                        Result := FloatToStrF((Bytes / YBD), ffFixed, 4, 2) + ' YB'
                                    end else begin
                                        Result := FloatToStrF((Bytes / YBD), ffFixed, 4, 2) + ' YB'
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;

function Bytes2MB(Bytes: Extended): String;
var
    KB: Extended;
    MB: Extended;
    GB: Extended;
    TB: Extended;
    PB: Extended;
    EB: Extended;
    ZB: Extended;
    YB: Extended;
    KBD: Extended;
    MBD: Extended;
    GBD: Extended;
    TBD: Extended;
    PBD: Extended;
    EBD: Extended;
    ZBD: Extended;
    YBD: Extended;
begin

    KB := 1024.0 * 1024.0;
    MB := 1024.0 * 1024.0 * 1024.0;
    GB := 1024.0 * 1024.0 * 1024.0 * 1024.0;
    TB := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    PB := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    EB := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    ZB := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    YB := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;

    KBD := 1024.0;
    MBD := 1024.0 * 1024.0;
    GBD := 1024.0 * 1024.0 * 1024.0;
    TBD := 1024.0 * 1024.0 * 1024.0 * 1024.0;
    PBD := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    EBD := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    ZBD := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;
    YBD := 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0 * 1024.0;

    if Bytes < 1024 then begin
        Result := IntToStr(Round(Bytes)) + ' Byte';
    end else begin
        if Bytes < KB then begin
            Result := FloatToStrF((Bytes / KBD), ffFixed, 4, 2) + ' KB';
        end else begin
            if Bytes < MB then begin
                Result := FloatToStrF((Bytes / MBD), ffFixed, 4, 2) + ' MB';
            end else begin
                if Bytes < GB then begin
                    Result := FloatToStrF((Bytes / GBD), ffFixed, 4, 2) + ' GB'
                end else begin
                    if Bytes < TB then begin
                        Result := FloatToStrF((Bytes / TBD), ffFixed, 4, 2) + ' TB'
                    end else begin
                        if Bytes < PB then begin
                            Result := FloatToStrF((Bytes / PBD), ffFixed, 4, 2) + ' PB'
                        end else begin
                            if Bytes < EB then begin
                                Result := FloatToStrF((Bytes / EBD), ffFixed, 4, 2) + ' EB'
                            end else begin
                                if Bytes < ZB then begin
                                    Result := FloatToStrF((Bytes / ZBD), ffFixed, 4, 2) + ' ZB'
                                end else begin
                                    if Bytes < YB then begin
                                        Result := FloatToStrF((Bytes / YBD), ffFixed, 4, 2) + ' YB'
                                    end else begin
                                        Result := FloatToStrF((Bytes / YBD), ffFixed, 4, 2) + ' YB'
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;

function Secs2Time(Secs: Cardinal): String;
var
  tHours: String;
  tMinutes: String;
  tSecs: String;
begin
    tHours := IntToStr(Secs div 3600);
    if Length(tHours) = 1
        then tHours := '0' + tHours;
    tMinutes := IntToStr(((Secs - (StrToInt(tHours) * 3600)) div 60));
    if Length(tMinutes) = 1
        then tMinutes := '0' + tMinutes;
    tSecs := IntToStr(Secs - (StrToInt(tHours) * 3600 + StrToInt(tMinutes) * 60));
    if Length(tSecs) = 1
        then tSecs := '0' + tSecs;
    Result := tHours + ':' + tMinutes + ':' + tSecs;
end;

function Secs2TimeFast(Seconds: Double): String;
var
  tHours: String;
  tMinutes: String;
  tSecs: String;
  tmSecs: String;
  Hours: Double;
  Minutes: Double;
  Secs: Double;
  mSecs: Double;
begin
    Hours := Seconds / 3600;
    tHours := IntToStr(Trunc(Hours));
    if Length(tHours) = 1
        then tHours := '0' + tHours;
    Minutes := (Seconds - (Hours * 3600)) / 60;
    tMinutes := IntToStr(Trunc(Minutes));
    if Length(tMinutes) = 1
        then tMinutes := '0' + tMinutes;
    Secs := Seconds - (Hours * 3600 + Minutes * 60);
    tSecs := IntToStr(Trunc(Secs));
    if Length(tSecs) = 1
        then tSecs := '0' + tSecs;
    mSecs := (Seconds * 1000) - ((Hours * 3600 + Minutes * 60) + Secs) * 1000;
    tmSecs := IntToStr(Trunc(mSecs));
    case Length(tmSecs) of
        1: tmSecs := '00' + tmSecs;
        2: tmSecs := '0' + tmSecs;
    end;
    tmSecs := Copy(tmSecs, 1, 2);
    Result := tHours + ':' + tMinutes + ':' + tSecs + '.' + tmSecs;
end;

function Secs2Time(Secs: Double): String;
var
  tHours: String;
  tMinutes: String;
  tSecs: String;
  tmSecs: String;
begin
    if Secs = 4294967295
        then Secs := 0;
    tHours := IntToStr(Trunc(Secs / 3600));
    if Length(tHours) = 1
        then tHours := '0' + tHours;
    tMinutes := IntToStr(Trunc(((Secs - (StrToInt(tHours) * 3600)) / 60)));
    if Length(tMinutes) = 1
        then tMinutes := '0' + tMinutes;
    tSecs := IntToStr(Trunc(Secs - (StrToInt(tHours) * 3600 + StrToInt(tMinutes) * 60)));
    if Length(tSecs) = 1
        then tSecs := '0' + tSecs;
    tmSecs := IntToStr(Trunc((Secs * 1000) - ((StrToInt(tHours) * 3600 + StrToInt(tMinutes) * 60) + StrToInt(tSecs)) * 1000));
    case Length(tmSecs) of
        1: tmSecs := '00' + tmSecs;
        2: tmSecs := '0' + tmSecs;
    end;
    tmSecs := Copy(tmSecs, 1, 2);
    Result := tHours + ':' + tMinutes + ':' + tSecs + '.' + tmSecs;
end;

function mSec2Time(mSec: Int64): String;
var
  tHours: String;
  tMinutes: String;
  tSecs: String;
  tmSecs: String;
  Seconds: Int64;
begin
    if mSec = 4294967295
        then mSec := 0;
    Seconds := mSec div 1000;
    tHours := IntToStr(Seconds div 3600);
    if Length(tHours) = 1
        then tHours := '0' + tHours;
    tMinutes := IntToStr(((Seconds - (StrToInt(tHours) * 3600)) div 60));
    if Length(tMinutes) = 1
        then tMinutes := '0' + tMinutes;
    tSecs := IntToStr(Seconds - (StrToInt(tHours) * 3600 + StrToInt(tMinutes) * 60));
    if Length(tSecs) = 1
        then tSecs := '0' + tSecs;
    tmSecs := IntToStr(mSec - ((StrToInt(tHours) * 3600 + StrToInt(tMinutes) * 60) + StrToInt(tSecs)) * 1000);
    case Length(tmSecs) of
        1: tmSecs := '00' + tmSecs;
        2: tmSecs := '0' + tmSecs;
    end;
    tmSecs := Copy(tmSecs, 1, 2);
    Result := tHours + ':' + tMinutes + ':' + tSecs + '.' + tmSecs;
end;

function Sec2Time(Sec: Int64): String;
var
  tHours: String;
  tMinutes: String;
  tSecs: String;
  tmSecs: String;
  Seconds: Int64;
  mSec: Int64;
begin
    mSec := Sec * 1000;
    if mSec = 4294967295
        then mSec := 0;
    Seconds := mSec div 1000;
    tHours := IntToStr(Seconds div 3600);
    if Length(tHours) = 1
        then tHours := '0' + tHours;
    tMinutes := IntToStr(((Seconds - (StrToInt(tHours) * 3600)) div 60));
    if Length(tMinutes) = 1
        then tMinutes := '0' + tMinutes;
    tSecs := IntToStr(Seconds - (StrToInt(tHours) * 3600 + StrToInt(tMinutes) * 60));
    if Length(tSecs) = 1
        then tSecs := '0' + tSecs;
    tmSecs := IntToStr(mSec - ((StrToInt(tHours) * 3600 + StrToInt(tMinutes) * 60) + StrToInt(tSecs)) * 1000);
    case Length(tmSecs) of
        1: tmSecs := '00' + tmSecs;
        2: tmSecs := '0' + tmSecs;
    end;
    tmSecs := Copy(tmSecs, 1, 2);
    Result := tHours + ':' + tMinutes + ':' + tSecs{ + '.' + tmSecs};
end;

function mSec2TimeEx(mSec: Int64; Format: Integer): String;
var
  tHours: String;
  tMinutes: String;
  tSecs: String;
  tmSecs: String;
  Seconds: Int64;
begin
    if mSec = 4294967295
        then mSec := 0;
    Seconds := mSec div 1000;
    tHours := IntToStr(Seconds div 3600);
    if Length(tHours) = 1
        then tHours := '0' + tHours;
    tMinutes := IntToStr(((Seconds - (StrToInt(tHours) * 3600)) div 60));
    if Length(tMinutes) = 1
        then tMinutes := '0' + tMinutes;
    tSecs := IntToStr(Seconds - (StrToInt(tHours) * 3600 + StrToInt(tMinutes) * 60));
    if Length(tSecs) = 1
        then tSecs := '0' + tSecs;
    tmSecs := IntToStr(mSec - ((StrToInt(tHours) * 3600 + StrToInt(tMinutes) * 60) + StrToInt(tSecs)) * 1000);
    case Length(tmSecs) of
        1: tmSecs := '00' + tmSecs;
        2: tmSecs := '0' + tmSecs;
    end;
    tmSecs := Copy(tmSecs, 1, 2);
    case Format of
        0: Result := tHours + '.' + tMinutes + ':' + tSecs;
        1: Result := tHours + '.' + tMinutes + ':' + tSecs + '.' + tmSecs;
        2: Result := tMinutes + ':' + tSecs;
        3: Result := tMinutes + ':' + tSecs + '.' + tmSecs;
    else Result := tHours + ':' + tMinutes + ':' + tSecs + '.' + tmSecs;
    end;
end;

function NGetFileSize(FileName: String): Int64;
var
  f: TSearchRec;
  FileSizeTemp: Int64;
begin
    Result := -1;
    FileSizeTemp := 0;
 	if FileExists(FileName) then begin
    	try
        	if FindFirst(FileName, faAnyFile, f) = 0 then begin
                if f.FindData.nFileSizeHigh > 0 then begin
                    FileSizeTemp := High(Longword);
                    FileSizeTemp := FileSizeTemp * f.FindData.nFileSizeHigh;
                end;
                FileSizeTemp := FileSizeTemp + Int64(f.FindData.nFileSizeLow);
            end;
            Result := FileSizeTemp;
        finally
          	SysUtils.FindClose(f);
        end;
	end;
end;

function NGetFileSizeFrom(SearchRec: TSearchRec): Int64;
var
  FileSizeTemp: Int64;
begin
    Result := -1;
    FileSizeTemp := 0;
 	if SearchRec.Name <> '' then begin
    	try
            if SearchRec.FindData.nFileSizeHigh > 0 then begin
                FileSizeTemp := High(Longword);
                FileSizeTemp := FileSizeTemp * SearchRec.FindData.nFileSizeHigh;
            end;
            FileSizeTemp := FileSizeTemp + Int64(SearchRec.FindData.nFileSizeLow);
            Result := FileSizeTemp;
        except
          	//*
        end;
	end;
end;

function EncodeUnicode(UniString: String): String;
begin
    Result := StringReplace(UniString, '&', '&amp;', [rfReplaceAll]);
    Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
    Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
    Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#162;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#163;', [rfReplaceAll]);
    Result := StringReplace(Result, '|', '&#166;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#167;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&copy;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#171;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#187;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&reg;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#177;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#180;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#181;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#164;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#165;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#182;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#183;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#189;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Aacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Atilde;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Auml;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&AElig;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Ccedil;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Eacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Ecirc;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Euml;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Iacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Icirc;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&ETH;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Ntilde;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Ograve;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Oacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Ocirc;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Otilde;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Ouml;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#215;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Oslash;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Ugrave;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Uacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Ucirc;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Uuml;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Uuml;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&Yacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&szlig;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&aacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&acirc;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&atilde;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&auml;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&aring;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&aelig;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&ccedil;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&egrave;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&eacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&ecirc;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&euml;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&igrave;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&iacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&icirc;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&iuml;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&icirc;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&eth;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&ntilde;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&ograve;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&oacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&ocirc;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&otilde;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&ouml;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&#247;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&oslash;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&ugrave;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&uacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&ucirc;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&uuml;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&yacute;', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '&thorn;', [rfReplaceAll]);
    Result := StringReplace(Result, 'ÿ', '&yuml;', [rfReplaceAll]);
end;

function DecodeUnicode(UnicodeString: String): String;
begin
    Result := StringReplace(UnicodeString, '&amp;', '&', [rfReplaceAll]);
    Result := StringReplace(Result, '&#32;', ' ', [rfReplaceAll]);
    Result := StringReplace(Result, '&lt;', '<', [rfReplaceAll]);
    Result := StringReplace(Result, '&gt;', '>', [rfReplaceAll]);
    Result := StringReplace(Result, '&quot;', '"', [rfReplaceAll]);
    Result := StringReplace(Result, '&nbsp;', ' ', [rfReplaceAll]);
    Result := StringReplace(Result, '&#162;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#163;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#166;', '|', [rfReplaceAll]);
    Result := StringReplace(Result, '&#167;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&copy;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#171;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#187;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&reg;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#177;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#180;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#181;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#164;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#165;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#182;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#183;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#189;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Aacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Atilde;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Auml;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&AElig;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Ccedil;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Eacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Ecirc;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Euml;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Iacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Icirc;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&ETH;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Ntilde;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Ograve;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Oacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Ocirc;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Otilde;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Ouml;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#215;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Oslash;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Ugrave;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Uacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Ucirc;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Uuml;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Uuml;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&Yacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&szlig;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&aacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&acirc;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&atilde;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&auml;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&aring;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&aelig;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&ccedil;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&egrave;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&eacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&ecirc;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&euml;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&igrave;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&iacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&icirc;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&iuml;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&icirc;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&eth;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&ntilde;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&ograve;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&oacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&ocirc;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&otilde;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&ouml;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&#247;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&oslash;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&ugrave;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&uacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&ucirc;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&uuml;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&yacute;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&thorn;', '?', [rfReplaceAll]);
    Result := StringReplace(Result, '&yuml;', 'ÿ', [rfReplaceAll]);
end;

(*
function UTF8Encode(const WS: WideString): UTF8String;
var
  L: Integer;
  Temp: UTF8String;
begin
    Result := '';
    if WS = ''
        then Exit;
    // SetLength includes space for null terminator
    SetLength(Temp, Length(WS) * 3);
    L := UnicodeToUtf8(PANSIChar(Temp), Length(Temp)+1, PWideChar(WS), Length(WS));
    if L > 0
        then SetLength(Temp, L-1)
        else Temp := '';
    Result := Temp;
end;

function UTF8Decode(const sSource: string): string;
var
  Iterator, SourceLength, FChar, NChar: Cardinal;
  Source: String;
begin
    { Convert UTF-8 string to ANSI string }
    Result := '';
    Iterator := 0;
    SourceLength := Length(Source);
    while Iterator < SourceLength do begin
        Inc(Iterator);
        FChar := Ord(Source[Iterator]);
        if FChar >= $80 then begin
            Inc(Iterator);
            if Iterator > SourceLength
                then exit;
            FChar := FChar AND $3F;
            if (FChar AND $20) <> 0 then begin
                NChar := Ord(Source[Iterator]);
                if (NChar AND $C0) <> $80
                    then  exit;
                FChar := (FChar shl 6) OR (NChar AND $3F);
                Inc(Iterator);
                if Iterator > SourceLength
                    then exit;
            end;
            NChar := Ord(Source[Iterator]);
            if (NChar AND $C0) <> $80
                then exit;
            Result := Result + WideChar((FChar shl 6) OR (NChar AND $3F));
        end else Result := Result + WideChar(FChar);
    end;
end;
*)
{
procedure FreeAndNil(var Obj);
var
  Temp: TObject;
begin
    try
        if NOT Assigned(Obj)
            then Exit;
        Temp := TObject(Obj);
        Pointer(Obj) := nil;
        Temp.Free;
    except
        //*
    end;
end;
}

function IntToBin1(Value: Longint; Digits: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := Digits - 1 downto 0 do
    if Value and (1 shl i) <> 0 then
      Result := Result + '1'
  else
    Result := Result + '0';
end;

function IntToBin2(d: Longint): string;
var
  x: Integer;
  bin: string;
begin
  bin := '';
  for x := 1 to 8 * SizeOf(d) do
  begin
    if Odd(d) then bin := '1' + bin
    else
      bin := '0' + bin;
    d := d shr 1;
  end;
  Delete(bin, 1, 8 * ((Pos('1', bin) - 1) div 8));
  Result := bin;
end;

function URLEncode(const S: String; const InQueryString: Boolean): String;
var
  Idx: Integer; // loops thru characters in string
begin
  Result := '';
  for Idx := 1 to Length(S) do
  begin
    case S[Idx] of
      'A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.':
        Result := Result + S[Idx];
      ' ':
        if InQueryString then
          Result := Result + '+'
        else
          Result := Result + '%20';
      else
        Result := Result + '%' + SysUtils.IntToHex(Ord(S[Idx]), 2);
    end;
  end;
end;

function GetFileModDate(FileName: String): TDateTime;
var
    F: TSearchRec;
begin
    FindFirst(FileName, faAnyFile, F);
    //Result := F.Time;
    //if you wanted a TDateTime, change the return type and use this line:
    Result := FileDateToDatetime(F.Time);
    SysUtils.FindClose(F);
end;

function ExtractFileNameFromURL(const FileName: string): string;
var
    I: Integer;
begin
    I := LastDelimiter(PathDelim + DriveDelim + '/', FileName);
    Result := Copy(FileName, I + 1, MaxInt);
end;

function IncludeTrailingPathDelimiterHTTP(const S: string): string;
begin
  Result := S;
  if not IsDelimiter('/', Result, Length(Result)) then
    Result := Result + '/';
end;

function HTTPDecode(const AStr: AnsiString): AnsiString;
var
  Sp, Rp, Cp: PAnsiChar;
  S: AnsiString;
begin
  SetLength(Result, Length(AStr));
  Sp := PAnsiChar(AStr);
  Rp := PAnsiChar(Result);
  Cp := Sp;
  try
    while Sp^ <> #0 do
    begin
      case Sp^ of
        //'%20': Rp^ := ' ';
        '%': begin
               // Look for an escaped % (%%) or %<hex> encoded character
               Inc(Sp);
               if Sp^ = '%' then
                 Rp^ := '%'
               else
               begin
                 Cp := Sp;
                 Inc(Sp);
                 if (Cp^ <> #0) and (Sp^ <> #0) then
                 begin
                   S := AnsiChar('$') + Cp^ + Sp^;
                   Rp^ := AnsiChar(StrToInt(string(S)));
                 end
                 else
                   raise Exception.CreateFmt('ErrorDecodingURLText', [Cp - PAnsiChar(AStr)]);
               end;
             end;
      else
        Rp^ := Sp^;
      end;
      Inc(Rp);
      Inc(Sp);
    end;
  except
    on E:EConvertError do
      raise EConvertError.CreateFmt('sInvalidURLEncodedChar',
        [AnsiChar('%') + Cp^ + Sp^, Cp - PAnsiChar(AStr)])
  end;
  SetLength(Result, Rp - PAnsiChar(Result));
end;

function HTTPEncode(const AStr: AnsiString): AnsiString;
// The NoConversion set contains characters as specificed in RFC 1738 and
// should not be modified unless the standard changes.
//* Modified by 3delite to support already encoded characters (do not encode them again)
const
    NoConversion = ['A'..'Z','a'..'z','*','@','.','_','-',
                    '0'..'9','$','!','''','(',')', '/', ':'];
var
    Sp, Rp: PAnsiChar;
begin
    SetLength(Result, Length(AStr) * 3);
    Sp := PAnsiChar(AStr);
    Rp := PAnsiChar(Result);
    while Sp^ <> #0 do begin
        if Sp^ = '%' then begin
            Rp^ := Sp^;
            Inc(Rp);
            Inc(Sp);
            Rp^ := Sp^;
            Inc(Rp);
            Inc(Sp);
            Rp^ := Sp^;
            Inc(Rp);
            Inc(Sp);
        end else begin
            if Sp^ in NoConversion then begin
              Rp^ := Sp^
            end else begin
                FormatBuf(Rp^, 3, AnsiString('%%%.2x'), 6, [Ord(Sp^)]);
                Inc(Rp,2);
            end;
            Inc(Rp);
            Inc(Sp);
        end;
    end;
    SetLength(Result, Rp - PAnsiChar(Result));
end;

function DateTimeDiff(Start, Stop: TDateTime): Int64;
var
    TimeStamp : TTimeStamp;
begin
    TimeStamp := DateTimeToTimeStamp(Stop - Start);
    Dec(TimeStamp.Date, TTimeStamp(DateTimeToTimeStamp(0)).Date);
    Result := (TimeStamp.Date*24*60*60)+(TimeStamp.Time div 1000);
end;

end.
