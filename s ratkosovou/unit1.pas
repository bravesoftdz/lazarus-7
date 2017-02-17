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
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure vypis;
  private
    { private declarations }
  public
    { public declarations }
  end;
const
  n=10;
var
  Form1: TForm1;
  i: integer;
  pole, pole2:array[1..n] of integer;
implementation
{$R *.lfm}
{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
   for i:=1 to n do
   begin
        pole[i]:=random(100);
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  for i:=1 to n do
  //image1.canvas.textout(i*30,20,inttostr(pole[i]));
  vypis;
end;

procedure TForm1.Button3Click(Sender: TObject);
var paza:integer;
begin
  paza:=pole[1]; //uvolnim prvu poziciu v poli
  for i:=1 to n do //2
      begin
          pole[i-1]:=pole[i];
          //image1.canvas.textout(i*30,20,inttostr(pole[i]));

      end;
  pole[n]:=paza;
  vypis;

end;

procedure TForm1.Button4Click(Sender: TObject);
var paza:integer;
begin
   paza:=pole[n]; //uvolnim poziciu v poli
  for i:=n downto 1 do //2
      begin
          pole[i+1]:=pole[i];
          //image1.canvas.textout(i*30,20,inttostr(pole[i]));

      end;
  pole[1]:=paza;
  vypis;
end;

procedure TForm1.Button5Click(Sender: TObject);
var paza:integer;
begin
    for i:=1 to n div 2 do
        begin
             paza:=pole[i];
             pole[i]:=pole[n-i+1];
             pole[n-i+1]:=paza;
        end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  for i:=1 to n do
  begin
      pole2[i]:=pole[i];
      pole[n+1]:=pole[i];
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var i:integer;
begin
    for i:=i to n*2 do
     image1.canvas.textout(i*30,40,inttostr(pole2[i]));
end;

procedure TForm1.Button8Click(Sender: TObject);
var i, sucet:integer;
begin
  for i:=1 to n do
   sucet:=pole[i]+sucet;
  //vypis
end;

procedure tform1.vypis;
var i:integer;
  begin
    for i:=1 to n do
     image1.canvas.textout(i*30,20,inttostr(pole[i]));
  end;

end.

