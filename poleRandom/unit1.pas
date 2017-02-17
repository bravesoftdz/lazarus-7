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
    Button3: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  pole:array[1..20] of integer;
  novePole:array[1..20] of integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
    for i:=1 to 20 do
    begin
      pole[i]:=random(101);
      image1.canvas.textout(i*20,10,inttostr(pole[i]));
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var min,j,pozicia,i,k:integer;
begin
  //chyba prechodne pole, po 2 kliku to bude padat
  for j:=1 to 20 do
  begin
      min:=999;
      //pozicia:=1;
      for i:=1 to 20 do //pole[i]:=
      begin
           if pole[i]<min then
           begin
                min:=pole[i];
                pozicia:=i;
           end;

      end;
      novePole[j]:=min;

      pole[pozicia]:=999;

  end;
  for k:=1 to 20 do
  begin
      image1.canvas.textout(k*20,30,inttostr(novepole[k]));

  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var zoradenie, vymena, i, kontrola, w:integer;
begin
  //cele zle
  for w:=1 to 20 do
      pole[w]:=novepole[w];

  zoradenie:=0;
  while zoradenie=0 do
  begin
       kontrola:=0;
       for i:=1 to 20 do
       begin
            if novepole[i]>novepole[i+1] then
            begin
                 vymena:=novepole[i];
                 novepole[i]:=novepole[i+1];
                 novepole[i+1]:=vymena;
            end
            else
                kontrola:=kontrola+1;
       end;
       if kontrola=20 then zoradenie:=1;
  end;
  for w:=1 to 20 do
  begin
      image1.canvas.textout(w*20,50,inttostr(novepole[w]));
  end;
end;

end.

