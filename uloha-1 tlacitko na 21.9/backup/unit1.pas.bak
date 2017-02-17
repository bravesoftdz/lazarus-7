unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Math, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  rTrue,r, score,percenta, pokus:float;
  f, postup:integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
var a,b,i:integer;
begin
   postup:=postup+1;
   if(postup mod 4 = 1) or (postup mod 4 = 3) then
   begin
   Button2.Caption:='vymyslaj';
   r := strtoint(edit2.text);
   pokus:=pokus+1;
   if r=rTrue then
   begin
      score:=score+1;
      Image1.Canvas.textout(40,30, 'spravne                                         ');

   end
   else
     begin
     Image1.Canvas.textout(40,30, 'nespravne. spravny vysledok je '+floattostr(rTrue));
     //score:=score-1;
     end;


   percenta:=score / pokus*100;

   Image1.Canvas.textout(10,100, 'skore:'+floattostr(score)+'.   percentualna uspesnost: '+floattostr(percenta)+'%                          ');

   end;
   if(postup mod 4 = 2) or (postup mod 4 = 0) then
   begin
   Button2.Caption:='kontroluj';
   i := strtoint(edit1.text);

   a:=random(i+1);
   b:=random(i-a);
   randomize;

   rTrue:=a+b;

   Image1.Canvas.textout(10,10, inttostr(a)+'   + ');
   Image1.Canvas.textout(50,10, inttostr(b)+'    ');
   end;
end;
procedure TForm1.FormCreate(Sender: TObject);
var a,b,i:integer;
begin
  f:=0;
  percenta:=0;
  score:=0;
  postup:=0;

  i := strtoint(edit1.text);

   a:=random(i+1);
   b:=random(i-a);
   randomize;

   rTrue:=a+b;

   Image1.Canvas.textout(10,10, inttostr(a)+'   + ');
   Image1.Canvas.textout(50,10, inttostr(b)+'    ');
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
      //loading spin
begin
     f:=f+1;

     if(f mod 4 = 1) then Image1.Canvas.textout(300,100, '-');
     if(f mod 4 = 2) then Image1.Canvas.textout(300,100, '\');
     if(f mod 4 = 3) then Image1.Canvas.textout(300,100, '|');
     if(f mod 4 = 0) then Image1.Canvas.textout(300,100, '/');

end;

end.

