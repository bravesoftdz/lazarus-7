unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  x,y,i: integer;
  vysky: array [1..50] of integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
   x:=0;
   for y:=1 to 50 do
       begin
           vysky[y]:=random(200)+100;
           image1.canvas.brush.color:=clnavy;
           image1.canvas.rectangle(x,image1.height,x+50,vysky[y]);
           x:=x+50;
       end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   Image1.CAnvas.Brush.Color :=clblack;
   Image1.Canvas.Rectangle (clientrect);
      Image1.CAnvas.Brush.Color :=clnavy;
      x:=0;
           for y:=1 to  49 do
           begin
               vysky[y]:=vysky[y+1];
                image1.canvas.rectangle(x,image1.height,x+50,vysky[y]);
                x:=x+50;
           end;
           vysky[y]:=random(200)+100;
           image1.canvas.rectangle(x,image1.height,x+50,vysky[50]);

end;

end.

