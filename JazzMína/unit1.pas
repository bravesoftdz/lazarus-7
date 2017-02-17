unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
//    procedure drawMine();
  private
    { private declarations }
  public
    { public declarations }
  end;
const
  n=20;

var
  Form1: TForm1;
  mineGrid:array[1..n, 1..2]of integer;
  boomCount:integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var a:integer;
begin
   for a:=1 to n do begin
       mineGrid[a,1]:=random(image1.Width);
       mineGrid[a,2]:=random(image1.height);
       image1.canvas.ellipse(mineGrid[a,1],mineGrid[a,2],mineGrid[a,1]+10,mineGrid[a,2]+10);
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  boomCount:=0;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var a,tol:integer;
begin
  tol:=10;

   //FE colors
  image1.canvas.Brush.color:=clred;
  image1.canvas.pen.color:=clred;

  image1.canvas.Ellipse(x-10,y-10,x+10,y+10);

  for a:=1 to n do
      if (mineGrid[a,1]>x-tol) and (mineGrid[a,1]<x+tol) and (mineGrid[a,2]>y-tol) and (mineGrid[a,2]<y+tol) then begin
         image1.canvas.font.size:=25;
         image1.canvas.font.color:=clyellow;
         image1.canvas.textout(x,y,'BOOOM');

         image1.canvas.Brush.color:=clyellow;
         image1.canvas.pen.color:=clyellow;
         image1.canvas.Ellipse(x-10,y-10,x+10,y+10);
         mineGrid[a,1]:=image1.width;
         mineGrid[a,2]:=image1.height;
         boomCount:=boomCount+1;
         Label1.caption:='Zomrel si: '+ IntToStr(boomCount) +' krat.';
      end;
end;

end.

