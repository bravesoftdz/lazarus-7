unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Math, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure output;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  grid :array [0..4,0..4] of integer;
  newGrid :array [0..4,0..4] of integer;
  avg :integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var a,b:integer;
begin
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.Rectangle(ClientRect);

  Image1.Canvas.Brush.Color:=ClWhite;
  Image1.Canvas.Pen.Color:=ClBlack;
 for a:=0 to 4 do
 for b:=0 to 4 do
        begin
          Image1.Canvas.Rectangle(40*a+10,40*b+10,40*a+50,40*b+50);
        end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   output;
end;

procedure TForm1.Button2Click(Sender: TObject);
var a,b :integer;
begin
 for a:=0 to 4 do
 for b:=0 to 4 do
     begin
       newGrid[a,b]:=(avg-grid[a,b]);
       if (newGrid[a,b]>0) then
          Image1.Canvas.TextOut(40*a+10,40*b+20,'+'+IntToStr(newGrid[a,b]))
       else
           Image1.Canvas.TextOut(40*a+13,40*b+20,IntToStr(newGrid[a,b]));
     end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var a,b,sum :integer;
begin
 sum:=0;
  for a:=0 to 4 do
  for b:=0 to 4 do
        if (newGrid[a,b]<0) then
           sum:=sum+newGrid[a,b];

  sum:=sum*(-1);

 Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.TextOut(50,240,'Prenesená pôda: '+IntToStr(sum));

end;

procedure TForm1.output;
var a,b,sum :integer;
begin
 Image1.Canvas.Brush.Color:=clWhite;
 Image1.Canvas.Rectangle(ClientRect);

 randomize;
  for a:=0 to 4 do
  for b:=0 to 4 do
      begin
        grid[a,b]:=random(53)+20;
      end;

 Image1.Canvas.Brush.Color:=ClWhite;
 Image1.Canvas.Pen.Color:=ClBlack;
 for a:=0 to 4 do
 for b:=0 to 4 do
        begin
         Image1.Canvas.Rectangle(40*a+10,40*b+10,40*a+50,40*b+50);
        end;

  for a:=0 to 4 do
  for b:=0 to 4 do
      begin
        Image1.Canvas.TextOut(40*a+7,40*b+7,IntToStr(grid[a,b]));
      end;
  sum:=0;
  for a:=0 to 4 do
  for b:=0 to 4 do
      begin
        sum:=sum+grid[a,b];
      end;

  avg:=Round(sum div 25);
  Label2.Caption:='Priemer: '+IntTostr(avg);

end;

end.

