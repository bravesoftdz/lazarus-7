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
    Image1: TImage;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  i, smer:integer;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.FormCreate(Sender: TObject);
begin


   image1.canvas.brush.color:=clred;
   image1.canvas.ellipse(10,10,50,50);
   image1.canvas.brush.color:=clyellow;
   image1.canvas.ellipse(10,60,50,100);
   image1.canvas.brush.color:=clgreen;
   image1.canvas.ellipse(10,110,50,150);
   i:=1;
   smer:=0;


end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if i=1 then
     begin
       image1.canvas.brush.color:=clred;
       image1.canvas.ellipse(10,10,50,50);
       image1.canvas.brush.color:=clsilver;
       image1.canvas.ellipse(10,60,50,100);
       image1.canvas.ellipse(10,110,50,150);
       i:=i+1;
       timer1.interval:=1500;
     end
  else if i=3 then
     begin
       image1.canvas.brush.color:=clsilver;
       image1.canvas.ellipse(10,10,50,50);
       image1.canvas.ellipse(10,60,50,100);
       image1.canvas.brush.color:=clgreen;
       image1.canvas.ellipse(10,110,50,150);
       i:=2;
       timer1.interval:=1500;
     end
  else if i=2 then
     begin
       image1.canvas.brush.color:=clyellow;
       image1.canvas.ellipse(10,60,50,100);
       image1.canvas.brush.color:=clsilver;
       image1.canvas.ellipse(10,110,50,150);
       image1.canvas.ellipse(10,10,50,50);
       if smer=0 then
          begin
            i:=i+1;
            smer:=1;
          end
       else
          begin
            i:=i-1;
            smer:=0;
          end;
       timer1.interval:=500;

     end;
   if i=4 then
      begin
           image1.canvas.brush.color:=clyellow;
           image1.canvas.ellipse(10,60,50,100);
           image1.canvas.brush.color:=clsilver;
           image1.canvas.ellipse(10,110,50,150);
           image1.canvas.ellipse(10,10,50,50);
           i:=5;
      end
   else if i=5 then
       begin

           image1.canvas.brush.color:=clsilver;
           image1.canvas.ellipse(10,60,50,100);
           image1.canvas.ellipse(10,110,50,150);
           image1.canvas.ellipse(10,10,50,50);
           i:=4;
      end
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  timer1.enabled:=false;
  image1.canvas.brush.color:=clred;
   image1.canvas.ellipse(10,10,50,50);
   image1.canvas.brush.color:=clsilver;
   image1.canvas.ellipse(10,60,50,100);
   image1.canvas.ellipse(10,110,50,150);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  timer1.enabled:=false;
  image1.canvas.brush.color:=clyellow;
   image1.canvas.ellipse(10,60,50,100);
   image1.canvas.brush.color:=clsilver;
   image1.canvas.ellipse(10,110,50,150);
   image1.canvas.ellipse(10,10,50,50);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  timer1.enabled:=false;
  image1.canvas.brush.color:=clsilver;
   image1.canvas.ellipse(10,10,50,50);
   image1.canvas.ellipse(10,60,50,100);
   image1.canvas.brush.color:=clgreen;
   image1.canvas.ellipse(10,110,50,150);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   timer1.enabled:=true;
   i:=1;
  smer:=0;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
   timer1.enabled:=true;
   timer1.Interval:=500;
    i:=4;
end;

end.

