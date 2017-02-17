unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Math, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Clear();
    procedure booking();
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  pole:array[1..40] of integer;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
    clear();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  clear();
end;

procedure TForm1.Button3Click(Sender: TObject);
var input,i,j,maxdva:integer;
begin
  input:=strtoint(edit1.text);
  maxdva:=0;
  if input=1 then begin
      for i:=1 to 40 do
      begin
         if pole[i]<>5 then
            begin
                 pole[i]:=5;
                 break;
            end;
      end;
      booking();
  end
  else if input=2 then begin
     for i:=1 to 40 do begin
        if (pole[i+1]<>5) and (pole[i]<>5) then begin //su dve volne miesta vedla seba
        if i mod 2 = 1 then begin //neparnych bookujes bez ulicky
         if pole[i]<>5 then
            if pole[i+1]<>5 then begin
               pole[i]:=5;
               pole[i+1]:=5;
               booking();
               break;
            end
            end;

        end       ///NEFUNGUJE LEBO NIKDY NEPRIDE DO ELSE IF
        else for j:=1 to 40 do begin
             if (pole[j]<>5) and (maxdva<2) then
                 begin
                     pole[j]:=5;
                     booking();
                     maxdva:=maxdva+1;
                 end;
           end;
        {if (i mod 4 = 2) and (pole[i]<>5) and (pole[i+1]<>5) then
           begin
              pole[i]:=5;
              pole[i+1]:=5;
              booking();
           end;}
     end;
     //booking();
  end

  else ShowMessage('Error: prilis vela zadanych listkov.');

end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  booking();
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i,sed,sedint,p:integer;
begin
   IF (x>=60) AND (x<=100)
      THEN sed:=1
   else IF (x>=110) AND (x<=150)
      THEN sed:=2
   else IF (x>=210) AND (x<=250)
      THEN sed:=3
   else IF (x>=260) AND (x<=300)
      THEN sed:=4;
   //else sedint:=0;

   for i:=0 to 10 do
   IF (y>=10+i*50) AND (y<=50+i*50)
      THEN begin
        sedint:=(sed+4*i)-4; //zisti cislo sedadla
        p:=i;
   end;
   label1.Caption:=inttostr(sedint);
   //if pole[sedint]<41 then  //zamedzi sa mimo hodnotam
      pole[sedint]:=5;   //nastav miesto sedadla v poli cislo 5
   image1.canvas.brush.color:=clyellow;
   if (sed=1) or (sed=2) then
   Image1.Canvas.Rectangle(0+sed*50+10,50*p+10,50+sed*50,50+50*p);
   if (sed=3) or (sed=4) then begin
     sed:=sed-2;  //posunutie
     Image1.Canvas.Rectangle(150+sed*50+10,50*p+10,200+sed*50,50+50*p);
   end;

end;

procedure Tform1.clear();
var x1,x2,y1,y2,i,sedL,sedR:integer;
begin

  image1.canvas.brush.color:=clwhite;
  Image1.Canvas.FillRect(clientRect);
  {i:=0;
  if not i mod 4=0 then
  begin
  image1.canvas.rectangle(x,y,x+20,y+20);

  end
  else
  y:=y+20;
  image1.canvas.rectangle(x,y,x+20,y+20);
  i:=i+1;
  x:=x+10;
  for i:=1 to 2 do
      for k:=1 to 10 do
          Image1.canvas.rectangle(-25+i*40,5+k*40,5+i*40,35+k*40);
  for i:=1 to 2 do
      for k:=1 to 10 do
          Image1.canvas.rectangle(80+i*40,5+k*40,110+i*40,35+k*40);
          }
   image1.canvas.brush.color:=clgreen;
   sedL:=1;

   for y1:=1 to 10 do             // rad L
   for x1:=1 to 2 do
   begin
        Image1.Canvas.Rectangle(0+x1*50+10,50*y1+10,50+x1*50,50+50*y1);
        image1.canvas.pen.color:=clblack;
        Image1.canvas.textout(0+x1*50+10,50*y1+10,inttostr(sedL));
        if sedL mod 2 = 0 then
           sedL:=sedL+2;
        sedL:=sedL+1;
   end;

   sedR:=3;
   for y2:=1 to 10 do             // rad R
   for x2:=1 to 2 do
   begin
        Image1.Canvas.Rectangle(150+x2*50+10,50*y2+10,200+x2*50,50+50*y2);
        image1.canvas.pen.color:=clblack;
        Image1.canvas.textout(150+x2*50+10,50*y2+10,inttostr(sedR));
        if sedR mod 2 = 0 then
           sedR:=sedR+2;
        sedR:=sedR+1;
   end;
   for i:=1 to 40 do begin
        pole[i]:=0;
   end;
end;

procedure Tform1.booking();
var i,x,y,io:integer;
begin
   for i:=1 to 40 do
   begin
    if pole[i]=5 then
       //nakresli sedadlo nacerveno
       begin
         io:=0;
         image1.canvas.brush.color:=clred;
            if i mod 4 = 1 then
               x:=60;
            if i mod 4 = 2 then
               x:=110;
            if i mod 4 = 3 then
               x:=210;
            if i mod 4 = 0 then
               x:=260;
         //for j:=0 to 10 do
            if i mod 4 <> 0 then
               io:=1;
         y:=i div 4 + io;
         Image1.Canvas.Rectangle(x,50*y+10,x+40,50*y+50);
       end;
    end;
end;
end.

