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
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure kreslit;
    procedure reserve;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  poleA: array[1..2,1..10] of integer;
  poleB: array[1..2,1..10] of integer;
  poleX: array[1..4,1..10] of integer;
  poleZ: array[1..4,1..10] of integer;
  stl,rad,a,b,q,t,m,n,s :integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
kreslit;

 end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  kreslit;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
reserve;
end;

procedure TForm1.Button3Click(Sender: TObject);
var input,c,k,i :integer;
begin
 input:=StrToInt(Edit1.Text);


 if input=1 then
  begin
    c:=1;

    for i:=1 to 10 do
      for k:=1 to 4 do
      if  c=1 then
        begin
          if (poleX[k,i]=0) then
             begin
              poleX[k,i]:=1;
              c:=0;
              reserve;
             end else
             c:=1;
        end;
  end;

 if input=2 then
    begin
    c:=1;
    if t<>10 then
       begin
          for i:=1 to 10 do
            for k:=1 to 4 do
            if  c<>2 then
              begin
              if (k mod 4 = 1) OR (k mod 4 =3) then
                if (poleX[k,i]=0) AND (poleX[k+1,i]=0) then
                   begin
                    poleX[k,i]:=1;
                    poleX[k+1,i]:=1;
                    c:=c+1;
                   end;
              end
       else if c=2 then
            reserve;

       end else if t=10 then
         s:=1;
         for m:=1 to 10 do
            for n:=1 to 4 do
            if s<>2 then
              begin
              if (n mod 4 = 2) then
              if (poleX[n,m]=0) AND (poleX[n+1,m]=0) then
                 begin
                  poleX[n,m]:=1;
                  poleX[n+1,m]:=1;
                  s:=s+1;
                 end;
              end
       else if s=2 then
            reserve;
  end;

 if input=3 then
  begin
    c:=1;

    for i:=1 to 10 do
      for k:=1 to 4 do
      if  c<>2 then
        begin
        if (k mod 4 = 1) OR (k mod 4 =2) then
          if (poleX[k,i]=0) AND
             (poleX[k+1,i]=0) AND
             (poleX[k+2,i]=0) then
             begin
              poleX[k,i]:=1;
              poleX[k+1,i]:=1;
              poleX[k+2,i]:=1;
              c:=c+1;
             end;
        end
 else if c=2 then
        reserve;
  end;

 if input=4 then
  begin
    c:=1;

    for i:=1 to 10 do
      for k:=1 to 4 do
      if  c<>2 then
        begin
        if (k mod 4 = 1) then
          if (poleX[k,i]=0) AND
             (poleX[k+1,i]=0) AND
             (poleX[k+2,i]=0) AND
             (poleX[k+2,i]=0)then
             begin
              poleX[k,i]:=1;
              poleX[k+1,i]:=1;
              poleX[k+2,i]:=1;
              poleX[k+3,i]:=1;
              c:=c+1;
             end;
        end
 else if c=2 then
        reserve;
  end;

 {if input=2 then
    begin
    k:=1;
    c:=0;
    a:=1;
    for i:=1 to 10 do
      if  c<>10 then
        begin
          if (poleX[k,i]<>0) AND (poleX[k+2,i]<>0) OR
             (poleX[k,i]<>0) AND (poleX[k+3,i]<>0) OR
             (poleX[k+1,i]<>0) AND (poleX[k+2,i]<>0) OR
             (poleX[k+1,i]<>0) AND (poleX[k+3,i]<>0)then
               t:=t+1;
           label3.Caption:=IntToStr(c);
        end
 else if t=10 then
      for k:=1 to 4 do
        begin
        if (k mod 4 = 2) then
          if (poleX[k,i]=0) AND (poleX[k+1,i]=0) then
             begin
              poleX[k,i]:=1;
              poleX[k+1,i]:=1;
              reserve;
              break;
             end;
        end

    end; }
    t:=0;
   k:=1;
   for i:=1 to 10 do
 if t<>10 then
  begin
  if (poleX[k,i]<>0) AND (poleX[k+2,i]<>0) OR
     (poleX[k,i]<>0) AND (poleX[k+3,i]<>0) OR
     (poleX[k+1,i]<>0) AND (poleX[k+2,i]<>0) OR
     (poleX[k+1,i]<>0) AND (poleX[k+3,i]<>0)then
        begin
       t:=t+1;
       label3.Caption:=IntToStr(t);
        end;
   end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var i,k,c :integer;
begin
    c:=1;
    for i:=1 to 10 do
      for k:=1 to 4 do
      if  c=1 then
        begin
        if (k mod 4 = 1) OR (k mod 4 = 0) then
          if (poleX[k,i]=0) then
             begin
              poleX[k,i]:=1;
              c:=0;
              reserve;
             end else
             c:=1;
        end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var i,k,c :integer;
begin
 c:=1;
    for i:=1 to 10 do
      for k:=1 to 4 do
      if  c=1 then
        begin
        if (k mod 4 = 2) OR (k mod 4 = 3) then
          if (poleX[k,i]=0) then
             begin
              poleX[k,i]:=1;
              c:=0;
              reserve;
             end else
             c:=1;
        end;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i :integer;
begin
 for i:=1 to 10 do
       begin
         if (Y>=40*i+10) AND (Y<=40*i+40) then
             rad:=i
         else
             stl:=0;

       end;

   if (X>=50) AND (X<=80) then
       stl:=1
   else
   if (X>=90) AND (X<=120) then
       stl:=2
   else
   if (X>=170) AND (X<=200) then
       stl:=3
    else
   if (X>=210) AND (X<=240) then
       stl:=4
   else
       rad:=0;

polex[stl,rad]:=1;

Label1.Caption:='Suradnice:'+' '+'['+IntToStr(stl)+','+IntToStr(rad)+']';
Label2.Caption:='Sedadlo: '+IntToStr(poleZ[stl,rad]);

Image1.Canvas.Brush.Color:=clYellow;
Image1.Canvas.Pen.Color:=clYellow;
 if (stl=1) AND (rad<>0) OR (stl=2) AND (rad<>0) then
     Image1.Canvas.Rectangle(40*stl+10,40*rad+10,40*stl+40,40*rad+40);
 if (stl=3) AND (rad<>0) OR (stl=4) AND (rad<>0) then
     begin
     stl:=stl-2;
     Image1.Canvas.Rectangle(40*stl+130,40*rad+10,40*stl+160,40*rad+40);
     end;


end;

procedure TForm1.kreslit;
var k,i,cislo,num :integer;
begin
stl:=0;
 Label1.Caption:='Suradnice:'+' '+'['+IntToStr(stl)+','+IntToStr(rad)+']';
 Label2.Caption:='Sedadlo: '+IntToStr(poleZ[stl,rad]);
Image1.Canvas.Brush.Color :=clWhite;
Image1.Canvas.Rectangle(ClientRect);
Image1.Canvas.Brush.Color := clWhite;
Image1.Canvas.Pen.Color := clGreen;
Image1.Canvas.Font.Color := clGreen;

  for k:=1 to 2 do  //sedadla
  for i:=1 to 10 do
     begin
       Image1.Canvas.Rectangle(40*k+10,40*i+10,40*k+40,40*i+40);
       Image1.Canvas.Rectangle(40*k+130,40*i+10,40*k+160,40*i+40);
     end;
 { cislo:=1;         // 2 2D polia
            for i:=1 to 10 do
            for k:=1 to 2 do
              if k mod 2 = 0 then
                begin
                  poleA[k,i]:=cislo;
                  Image1.Canvas.TextOut(100,40*i+20,IntToStr(poleA[k,i]));
                  cislo:=cislo+3;
                end else begin
                  poleA[k,i]:=cislo;
                  Image1.Canvas.TextOut(60,40*i+20,IntToStr(poleA[k,i]));
                  cislo:=cislo+1;
                end;

       cislo:=3;
            for i:=1 to 10 do
            for k:=1 to 2 do
              if k mod 2 = 0 then
                begin
                  poleB[k,i]:=cislo;
                  Image1.Canvas.TextOut(220,40*i+20,IntToStr(poleB[k,i]));
                  cislo:=cislo+3;
                end else begin
                  poleB[k,i]:=cislo;
                  Image1.Canvas.TextOut(180,40*i+20,IntToStr(poleB[k,i]));
                  cislo:=cislo+1;
                end;    }

  num:=1;         //napln
  for i:=1 to 10 do
  for k:=1 to 4 do
       begin
         poleZ[k,i]:=num;
         num:=num+1;
         polex[k,i]:=0;
       end;

  for i:=1 to 10 do       //vykreslenie
  for k:=1 to 4 do
      begin
    if k mod 4 = 0 then
        Image1.Canvas.TextOut(220,40*i+20,IntToStr(poleZ[k,i]))
       else
    if k mod 4 = 3 then
        Image1.Canvas.TextOut(180,40*i+20,IntToStr(poleZ[k,i]))
       else
    if k mod 4 = 2 then
        Image1.Canvas.TextOut(100,40*i+20,IntToStr(poleZ[k,i]))
       else
    if k mod 4 = 1 then
        Image1.Canvas.TextOut(60,40*i+20,IntToStr(poleZ[k,i]))
       end;
end;

procedure TForm1.reserve;
 var i,k,p :integer;
begin
  Image1.Canvas.Brush.Color := clred;
  Image1.Canvas.Pen.Color := clred;
  for i:=1 to 10 do
    for k:=1 to 4 do
      begin
        if polex[k,i]=1 then
           if (k mod 4 = 3) OR (k mod 4 = 0) then
           begin
             p:=k-2;

             Image1.Canvas.Rectangle(40*p+130,40*i+10,40*p+160,40*i+40);
        end else
        if (k mod 4 = 1) OR (k mod 4 = 2) then
           begin
             Image1.Canvas.Rectangle(40*k+10,40*i+10,40*k+40,40*i+40);
           end;
        end;
  stl:=0;
  rad:=0;
 Label1.Caption:='Suradnice:'+' '+'['+IntToStr(stl)+','+IntToStr(rad)+']';
 Label2.Caption:='Sedadlo: '+IntToStr(polex[stl,rad]);
end;

end.

