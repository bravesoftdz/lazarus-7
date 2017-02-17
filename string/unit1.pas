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
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  veta, newVeta, matica, newMatica, userVeta: string;
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
    then
        begin
          newVeta:=newVeta+'?';
          matica:=matica+veta[i];
        end
    else newVeta:=newVeta+veta[i];
    Label1.caption:=newVeta;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var j,chyby:integer;
begin
  userVeta:=edit1.Text;
  chyby:=0;
  //label3.caption:='vase i/y: ';
  newMatica:='';
  for j:=1 to length(userVeta) do
  begin
    if (userVeta[j]='Y') or (userVeta[j]='I')
       then begin
          newMatica:=newMatica+userVeta[j];
       end;
  end;
  for j:=1 to length(matica) do begin
  if newMatica[j]<>matica[j] //nerovna sa
    then chyby:=chyby+1;
  end;
  j:=j+1;
  label2.caption:='pocet chyb: '+inttostr(chyby);
  label3.caption:='spravne i/y: '+matica;
  label4.caption:='vase i/y: '+newMatica;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

end.

