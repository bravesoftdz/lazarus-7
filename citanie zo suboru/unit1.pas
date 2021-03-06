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
    Image1: TImage;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  doc: TextFile;
  r,g,b: integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i,x,y,e: integer;
begin
  AssignFile(doc,'textfile.txt');
  Rewrite(doc);
  for i:=1 to 50 do
      begin
        e:=random(20);
        r:=random(255);
        g:=random(255);
        b:=random(255);
        x:=random(image1.width);
        y:=random(image1.height);
        image1.canvas.brush.color:=rgbtocolor(r,g,b);
        image1.canvas.rectangle(x,y,x+e,y+e);
        Writeln(doc,
                     inttostr(0)+' '
                    +inttostr(r)+' '
                    +inttostr(g)+' '
                    +inttostr(b)+' '
                    +inttostr(x)+' '
                    +inttostr(y)+' '
                    +inttostr(x+e)+' '
                    +inttostr(y+e));
      end;
  closefile(doc);
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,x,y,xx,yy: integer;
begin
   AssignFile(doc,'textfile.txt');
   //Rewrite(doc);
   //Writeln(doc, 'hello world');
   reset(doc); //kurzor na zaciatok
   while not eof(doc) do
     begin
       readln(doc,i,r,g,b,x,y,xx,yy);
       image2.canvas.brush.color:=rgbtocolor(r,g,b);
       image2.canvas.rectangle(x,y,xx,yy);
     end;
   closefile(doc);
end;

end.

