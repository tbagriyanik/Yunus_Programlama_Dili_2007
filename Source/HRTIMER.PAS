{
   Var
    HRT : THRTimer

   HRT := THRTimer.Create;
   HRT.StartTimer;  Resets the timer to zero
   HRT.ReadTimer;   Returns the elapsed time in milliseconds
                     since the time start

   HRT.Free;
}

Unit HRTimer;

interface

Uses Windows;

Type
   THRTimer = Class(TObject)
     Constructor Create;
     Function StartTimer : Boolean;
     Function ReadTimer : Double;

   private
     StartTime : Double;
     ClockRate : Double;

   public
     Exists    : Boolean;

   End;

implementation

Constructor THRTimer.Create;

Var
  QW : Large_Integer;

BEGIN
   Inherited Create;
   Exists := QueryPerformanceFrequency(QW.QuadPart);
   ClockRate := QW.QuadPart;
END;

Function THRTimer.StartTimer : Boolean;
Var
   QW : Large_Integer;

BEGIN
   Result := QueryPerformanceCounter(QW.QuadPart);
   StartTime := QW.QuadPart;
END;

Function THRTimer.ReadTimer : Double;
Var
   ET : Large_Integer;
BEGIN
   QueryPerformanceCounter(ET.QuadPart);
   Result := 1000.0*(ET.QuadPart - StartTime)/ClockRate;
END;

end.
