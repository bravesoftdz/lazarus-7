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
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  db : textfile;
  slova:array [1..9,1..9] of string;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var userinput: string;
 var i: integer;
   var k: boolean;
begin
  k:=false;
  Assignfile(db,'SLOVKA.TXT');
  reset(db);
  userinput:=ansiuppercase(edit1.Text);
  {for i:=1 to 9 do begin
    memo1.append(slova[i,1]);
    memo1.append(slova[i,2]);
  end;}
  for i:=1 to 9 do begin
     if userinput=slova[i,1] then begin
        memo1.append(slova[i,2]);
        k:=true;
        break;
     end
  end;
  for i:=1 to 9 do begin
     if userinput=slova[i,2] then begin
        memo1.append(slova[i,1]);
        k:=true;
        break;
     end
  end;
  if k=false then showmessage('Slovo nemam v databaze.');
end;

procedure TForm1.FormCreate(Sender: TObject);
 var i: integer;
begin
  i:=1;
  Assignfile(db,'SLOVKA.TXT');
  reset(db);
  while not eof(db) do begin
    readln(db,slova[i,1]);
    readln(db,slova[i,2]);
    inc(i);
  end;
  memo1.clear;
end;

end.

