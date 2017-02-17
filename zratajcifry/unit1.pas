unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  cislo: integer;
  zvysok: integer;
  input: integer;
implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.Button1Click(Sender: TObject);
begin
  zvysok:=0;
     input:=strtoint(edit1.Text);
  repeat
      begin
      zvysok:= zvysok + input mod 10;
      input:= input div 10;
      end;
   until input=0;
   Label1.Caption:='Sucet cifier: ' + inttostr(zvysok);
end;

end.

