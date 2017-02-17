unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    btnvypis: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnvypisClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
  const n=5;
  const m=5;
var
  Form1: TForm1;

  pole:array[1..m,1..n]of integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i,j,sum,avg:integer;
begin
   sum:=0;
   for i:=1 to m do
      for j:=1 to n do begin
         pole[i,j]:=random(70)+40;

      end;
      label2.caption:=inttostr(avg);
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j,x:integer;
begin
   x:=0;
    for i:=1 to m do
      for j:=1 to n do begin
         x:=x+pole[i,j];
         label1.caption:=inttostr(x);
      end;
end;

procedure TForm1.btnvypisClick(Sender: TObject);
var i,j,sum:integer;
begin
     for i:=1 to m do
      for j:=1 to n do begin
         image1.canvas.textout(i*30,j*30,inttostr(pole[i,j]));
      end;
end;

end.

