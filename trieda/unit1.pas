unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  //n,m: integer;
  names: array [1..5] of string;
  notes: array [1..5,1..5] of integer;
  doc: TextFile;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i,j,max:integer;
var avg:double;
begin
    AssignFile(doc,'trieda.txt');
    reset(doc);
    //max:=strtoint(eof(doc));
    i:=1;
    while not eof(doc) do begin
       readln(doc,names[i]);
       readln(doc,notes[i,1],notes[i,2],notes[i,3],notes[i,4],notes[i,5]);
       i:=i+1;
    end;
    closefile(doc);

    for i:=1 to 5 do begin
       avg:=0;
       for j:=1 to 5 do begin
           avg:=avg+notes[i,j];
       end;
       avg:=avg/5;
       memo1.append(names[i]+' '+floattostrf(avg,ffgeneral,3,3));
       memo2.append(names[i]+' '+inttostr(notes[i,1])+' '+inttostr(notes[i,2])+' '+inttostr(notes[i,3])+' '+inttostr(notes[i,4])+' '+inttostr(notes[i,5]));
    end;



end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.clear;
  Memo2.clear;
end;

end.

