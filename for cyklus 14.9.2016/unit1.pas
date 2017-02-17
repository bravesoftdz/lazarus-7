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
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var strana, pocet, x,y,r:integer;
begin
  //strana:=10;
  //miesto:=10;
  y:=10;
  x:=10;
  r:=100;
  for pocet:=0 to 19
      do begin
        if x+strana<=image1.width
        then begin
        //image1.canvas.rectangle(miesto,10,miesto+10,strana+10);

        image1.canvas.brush.color:=rgbtocolor(r,100,100);
        r:=r+5;
        image1.canvas.rectangle(x,y,x+strana,y+strana);

        //y:=y+10;
        x:=x+strana;
        strana:=strana+10;

        end;
      end;
end;

end.

