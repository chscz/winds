//********************************************************************************************************************************
//*                                                                                                                              *
//*     Image Recognition Library 1.0.14.23 © 3delite 2011-2017                                                                  *
//*     See Image Recognition Library Readme.txt for details                                                                     *
//*                                                                                                                              *
//* Two licenses are available if you use this library for commercial purpose:                                                   *
//* Shareware License: €50                                                                                                       *
//* Commercial License: €250                                                                                                     *
//*                                                                                                                              *
//*     http://www.shareit.com/product.html?productid=300486940                                                                  *
//*                                                                                                                              *
//*     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/ImageRecognitionLibrary.html                               *
//*                                                                                                                              *
//* If you have any questions or enquiries please mail: 3delite@3delite.hu                                                       *
//*                                                                                                                              *
//* Good coding! :)                                                                                                              *
//* 3delite                                                                                                                      *
//********************************************************************************************************************************

unit ImageRecognitionDefs;

interface

{$IFDEF MSWINDOWS}
Uses
    Windows;
{$ENDIF}

type
    Bool = LongBool;

const
    NAME_ImageRecognition_CreateObject                  = 'ImageRecognition_CreateObject';
    NAME_ImageRecognition_FreeObject                    = 'ImageRecognition_FreeObject';
    NAME_ImageRecognition_Compare                       = 'ImageRecognition_Compare';
    NAME_ImageRecognition_FreeResult                    = 'ImageRecognition_FreeResult';
    NAME_ImageRecognition_CreateObjectFromBitmapHandle  = 'ImageRecognition_CreateObjectFromBitmapHandle';

const
    {$IFDEF MSWINDOWS}
    ImageRecognitionLibraryName = 'ImageRecognition.dll';
    {$ENDIF}
    {$IFDEF MACOS}
    ImageRecognitionLibraryName = 'libImageRecognition.dylib';
    {$ENDIF}

const
    IR_OK                       = 0;
    IR_ERROR_UNKNOWN            = 1;
    IR_ERROR_NOT_ENOUGH_MEMORY  = 2;
    IR_ERROR_LOADING            = 3;
    IR_ERROR_OBJECT             = 4;
    IR_ERROR_DIMENSIONS         = 5;
    IR_ERROR_NOT_AVAILABLE      = 6;

const
    IR_STATUS_PROGRESS  = 1;

const
    IR_COMPARE_TYPE_EXACT               = 0;
    IR_COMPARE_TYPE_RELATIVE_ARGB       = 1;
    IR_COMPARE_TYPE_RELATIVE_AHSL       = 2;
    IR_COMPARE_TYPE_RELATIVE_ARGB_ALPHA = 3;
    IR_COMPARE_TYPE_RELATIVE_AHSL_ALPHA = 4;

const
    IR_PROCESS_TYPE_NONE        = 0;
    IR_PROCESS_TYPE_RESAMPLE    = 1;

const
    {
    IR_RESAMPLER_BOX         = 0;
    IR_RESAMPLER_LINEAR      = 1;
    IR_RESAMPLER_COSINE      = 2;
    IR_RESAMPLER_SPLINE      = 3;
    IR_RESAMPLER_CUBIC       = 4;
    IR_RESAMPLER_MITCHELL    = 5;
    IR_RESAMPLER_ALBRECHT    = 6;
    IR_RESAMPLER_LANCZOS     = 7;
    IR_RESAMPLER_GAUSSIAN    = 8;
    IR_RESAMPLER_BLACKMAN    = 9;
    IR_RESAMPLER_HANN        = 10;
    IR_RESAMPLER_HAMMING     = 11;
    IR_RESAMPLER_SINSH       = 12;
    IR_RESAMPLER_HERMITE     = 13;
    }
    IR_RESAMPLER_BOX        = 0; // Box, pulse, Fourier window, 1st order (constant) b-spline
    IR_RESAMPLER_BICUBIC    = 1; // Mitchell & Netravali's two-param cubic filter
    IR_RESAMPLER_BILINEAR   = 2; // Bilinear filter
    IR_RESAMPLER_BSPLINE    = 3; // 4th order (cubic) b-spline
    IR_RESAMPLER_CATMULLROM = 4; // Catmull-Rom spline, Overhauser spline
    IR_RESAMPLER_LANCZOS3   = 5; // Lanczos3 filter

type
    TIRStatusCallback = procedure (Progress: Double; StatusType: Integer; User: Pointer); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

type
    TIRDimensions = record
        Width: Integer;
        Height: Integer;
    end;

type
    TIRObject = record
        FileName: PChar;
        ImageObject: Pointer;
        OriginalDimensions: TIRDimensions;
        ProcessedDimensions: TIRDimensions;
        User: Pointer;
    end;

type
    TIRCreateObjectParameters = record
        ProcessType: Integer;
        Dimensions: TIRDimensions;
        Resampler: Integer;
    end;

type
    TIRProcessParameters = record
        CompareType: Integer;
        ARGBATolerance: Byte;
        ARGBRTolerance: Byte;
        ARGBGTolerance: Byte;
        ARGBBTolerance: Byte;
        AHSLATolerance: Double;
        AHSLHTolerance: Double;
        AHSLSTolerance: Double;
        AHSLLTolerance: Double;
        DifferenceTolerance: Integer;
        StretchCompare: Boolean;            //* Stretch compare is experimental and very slow!
        MinimalStretchSize: TIRDimensions;
        MaximalStretchSize: TIRDimensions;
        StretchResampler: Integer;
        MultipleMatches: Boolean;
        MultiThreadedProcessing: Bool;
        StatusCallback: TIRStatusCallback;
    end;

type
    PIRResultMatches = ^TIRResultMatches;
    TIRResultMatches = record
        Position: TPoint;
        Dimensions: TIRDimensions;
        Difference: Integer;
        MatchPercentage: Double;
    end;

type
    TIRResult = record
        Success: Bool;
        MatchCount: Integer;
        Matches: PIRResultMatches;
    end;

type
    t_ImageRecognition_CreateObject                 = function (var IRObject: TIRObject; Parameters: TIRCreateObjectParameters): Integer; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
    t_ImageRecognition_FreeObject                   = function (var IRObject: TIRObject): Integer; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
    t_ImageRecognition_Compare                      = function (IRObjectSearchIn: TIRObject; IRObjectSearchFor: TIRObject; Parameters: TIRProcessParameters; var CompareResult: TIRResult; User: Pointer): Integer; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
    t_ImageRecognition_FreeResult                   = function (var CompareResult: TIRResult): Bool; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
    t_ImageRecognition_CreateObjectFromBitmapHandle = function (var IRObject: TIRObject; Parameters: TIRCreateObjectParameters): Integer; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

var
    ImageRecognition_CreateObject: t_ImageRecognition_CreateObject;
    ImageRecognition_FreeObject: t_ImageRecognition_FreeObject;
    ImageRecognition_Compare: t_ImageRecognition_Compare;
    ImageRecognition_FreeResult: t_ImageRecognition_FreeResult;
    ImageRecognition_CreateObjectFromBitmapHandle: t_ImageRecognition_CreateObjectFromBitmapHandle;

var
    ImageRecognitionLibraryHandle: THandle = 0;
    ImageRecognitionLibraryLoaded: Boolean = False;

    function InitImageRecognitionLibrary: Boolean;
    function FreeImageRecognitionLibrary: Boolean;

implementation

Uses
    SysUtils;

function InitImageRecognitionLibrary: Boolean;
begin
    ImageRecognitionLibraryHandle := LoadLibrary(PChar(ImageRecognitionLibraryName));
    Result := ImageRecognitionLibraryHandle <> 0;
    if Result then begin
        ImageRecognition_CreateObject                   := GetProcAddress(ImageRecognitionLibraryHandle, PWideChar(NAME_ImageRecognition_CreateObject));
        ImageRecognition_FreeObject                     := GetProcAddress(ImageRecognitionLibraryHandle, PWideChar(NAME_ImageRecognition_FreeObject));
        ImageRecognition_Compare                        := GetProcAddress(ImageRecognitionLibraryHandle, PWideChar(NAME_ImageRecognition_Compare));
        ImageRecognition_FreeResult                     := GetProcAddress(ImageRecognitionLibraryHandle, PWideChar(NAME_ImageRecognition_FreeResult));
        ImageRecognition_CreateObjectFromBitmapHandle   := GetProcAddress(ImageRecognitionLibraryHandle, PWideChar(NAME_ImageRecognition_CreateObjectFromBitmapHandle));
    end;
    if (@ImageRecognition_CreateObject = nil)
    OR (@ImageRecognition_FreeObject = nil)
    OR (@ImageRecognition_Compare = nil)
    OR (@ImageRecognition_FreeResult = nil)
    OR (@ImageRecognition_CreateObjectFromBitmapHandle = nil)
    then begin
    	FreeLibrary(ImageRecognitionLibraryHandle);
    	Result := False;
    end;
    if Result
        then ImageRecognitionLibraryLoaded := True;
end;

function FreeImageRecognitionLibrary: Boolean;
begin
    Result := False;
    if ImageRecognitionLibraryHandle <> 0 then begin
        Result := FreeLibrary(ImageRecognitionLibraryHandle);
        if Result then begin
            ImageRecognitionLibraryHandle := 0;
            ImageRecognitionLibraryLoaded := False;
        end;
    end;
end;

Initialization

    InitImageRecognitionLibrary;

Finalization

    FreeImageRecognitionLibrary;

end.
