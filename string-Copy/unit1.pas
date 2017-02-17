unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  veta, newVeta, userVeta: string;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
//var veta, newVeta: string;
var i:integer;
begin
  veta:='IVAN ISIEL LOVIT RYBY SO SLOVENSKYMI POLNOHOSPODARMI.';
  newVeta:='';
  //Label1.caption:=veta[2];
  for i:=1 to length(veta) do
  begin
    if (veta[i]='Y') or (veta[i]='I')
    then newVeta:=newVeta+'?'
    else newVeta:=newVeta+veta[i];
    Label1.caption:=newVeta;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var j,chyby:integer;
begin
  userVeta:=edit1.Text;
  chyby:=0;
  for j:=1 to length(veta) do
  begin
    if userVeta[j]=veta[j]
    then
    else chyby:=chyby+1;
  end;
  j:=j+1;
  label2.caption:='pocet chyb: '+inttostr(chyby);
end;

end.

