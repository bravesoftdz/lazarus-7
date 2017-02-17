unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
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
  reklama:string;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
var pz:char;
var i:integer;
begin
    pz:=reklama[1];
    for i:=1 to (length(reklama)-1) do
    begin
      reklama[i]:=reklama[i+1];
    end;
    reklama[length(reklama)]:=pz;
    label1.caption:=reklama;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    reklama:='NAJVYKONNEJSI KOMBAJN ';
    label1.caption:=reklama;
    label1.font.color:=clred;
end;

end.

