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
    Button4: TButton;
    Image1: TImage;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  pole:array[1..20] of integer;
  pole2:array[1..20] of integer;
  reklama:string;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
    for i:=1 to 20 do begin
      pole[i]:=random(100);
      image1.canvas.TextOut(20*i,10,inttostr(pole[i]));
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j,temp, test:integer;
var exit:boolean;
begin

    for j:=1 to 20 do
      pole2[j]:=pole[j];

    exit:=false;
    while exit=false do
    begin test:=0;
      for i:=1 to 20 do begin
      if pole2[i]>pole2[i+1] then
      begin
         temp:=pole2[i];
         pole2[i]:=pole2[i+1];
         pole2[i+1]:=temp;
      end
      else test:=test+1;
    end;
       if test=20 then exit:=true

    end;
    for j:=1 to 20 do image1.canvas.TextOut(20*j,30,inttostr(pole2[j]));
end;

procedure TForm1.Button3Click(Sender: TObject);
var i,r:integer;
//var temppole:array[1..10] of integer;
begin
    i:=0;
    while i<20 do
    begin
         //pole[i]:=tempPole[i];
         r:=r+pole[i];
         i:=i+2;
         //j:=j+1;

    end;
    image1.canvas.TextOut(20,50,inttostr(r));
end;

procedure TForm1.Button4Click(Sender: TObject);
var i,r:integer;
begin
    i:=0;
    for i:=i to 20 do
    begin
      if not pole[i] mod 2=0 then r:=r+pole[i];
    end;
    image1.canvas.TextOut(20,70,inttostr(r));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  reklama:='Lacny kombajn';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i:integer;
var c:char;
begin
     c:=reklama[1];
    for i:=1 to (length(reklama)-1) do
    begin
       reklama[i]:=reklama[i+1];
    end;
      reklama[length(reklama)]:=c;

    image1.canvas.TextOut(20,90,reklama);
end;

end.

