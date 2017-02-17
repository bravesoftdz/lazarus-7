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
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label8Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  storage: array [1..7] of integer;
  storage_history: array[1..7] of integer;
  value: array [1..7] of integer;
  withdraw: array [1..7] of integer;
  sum,rep,rep2: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i,j,pay: integer;
begin

  pay:=StrToInt(Edit1.Text);
  sum:=0;
  rep:=0;
  rep2:=0;

  for i:=1 to 7 do begin
                   sum:=sum+storage[i]*value[i];
                   storage_history[i]:=storage[i];
                   end;

  IF (StrToInt(Edit1.Text) <= sum)
     THEN
         IF (StrToInt(Edit1.Caption) mod 5 = 0)
            THEN
                begin
                     Image1.Canvas.FillRect(clientRect);
                     repeat
                           rep:=rep+1;
                           IF pay div value[rep] <= storage[rep]
                              THEN begin
                                   withdraw[rep]:=pay div value[rep];
                                   storage[rep]:=storage[rep]-withdraw[rep];
                                   pay:=pay-withdraw[rep]*value[rep];
                                   end
                                      ELSE IF storage[rep] > 0 THEN begin
                                           withdraw[rep]:=storage[rep];
                                           storage[rep]:=storage[rep]-storage[rep];
                                           pay:=pay-withdraw[rep]*value[rep];
                                           end;
                                              {ELSE begin
                                                   for j:=1 to 7 do
                                                       IF storage[j]>0 THEN
                                                       storage[j]:=storage[j]+withdraw[j];


                                              end;}
                                           until rep=7;
                     IF pay>0
                        THEN begin
                             for j:=1 to 7 do
                                 IF storage_history[j] <> storage[j]
                                    THEN begin
                                         storage[j]:=storage_history[j];
                                         end;
                             ShowMessage('ATM is unable to complete your withdrawal.');
                     end;


                        //repeat
                        //rep2:=rep2+1;
                        //Image1.Canvas.TextOut(20,20*rep2,IntToStr(withdraw[rep2]));
                        //until rep2=7;
                        ShowMessage('Your withdrawal contains following:'+#13#10+
               IntToStr(value[1])+'€ = '+IntToStr(withdraw[1])+#13#10+
               IntToStr(value[2])+'€ = '+IntToStr(withdraw[2])+#13#10+
               IntToStr(value[3])+'€ = '+IntToStr(withdraw[3])+#13#10+
               IntToStr(value[4])+'€ = '+IntToStr(withdraw[4])+#13#10+
               IntToStr(value[5])+'€ = '+IntToStr(withdraw[5])+#13#10+
               IntToStr(value[6])+'€ = '+IntToStr(withdraw[6])+#13#10+
               IntToStr(value[7])+'€ = '+IntToStr(withdraw[7]))
                end

                ELSE
                    ShowMessage('ATM does not support withdrawal of coins.')

                    ELSE
                        ShowMessage('ATM has insufficient funds to complete the withdrawal.');

  sum:=0;
  for i:=1 to 7 do
     sum:=sum+storage[i]*value[i];

  Label8.Caption:=IntToStr(sum);

end;

procedure TForm1.Button2Click(Sender: TObject);
var i: integer;
begin
  sum:=0;
  rep:=0;

  for i:=1 to 7 do
      begin
      storage[i]:=20;
      end;

  for i:=1 to 7 do
        sum:=sum+storage[i]*value[i];

  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.FillRect(clientRect);
  Label8.Caption:=IntToStr(sum);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i: integer;
begin

  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.FillRect(clientRect);

  //Image1.Canvas.Rectangle((Image1.Width div 2)-100,30,(Image1.Width div 2)+100,100);

  value[1]:=500;
  value[2]:=200;
  value[3]:=100;
  value[4]:=50;
  value[5]:=20;
  value[6]:=10;
  value[7]:=5;

  for i:=1 to 7 do
      begin
      storage[i]:=20;
      end;

end;

procedure TForm1.Label8Click(Sender: TObject);
begin
   ShowMessage('Funds in the ATM:'+#13#10+
               IntToStr(value[1])+'€ = '+IntToStr(storage[1])+#13#10+
               IntToStr(value[2])+'€ = '+IntToStr(storage[2])+#13#10+
               IntToStr(value[3])+'€ = '+IntToStr(storage[3])+#13#10+
               IntToStr(value[4])+'€ = '+IntToStr(storage[4])+#13#10+
               IntToStr(value[5])+'€ = '+IntToStr(storage[5])+#13#10+
               IntToStr(value[6])+'€ = '+IntToStr(storage[6])+#13#10+
               IntToStr(value[7])+'€ = '+IntToStr(storage[7]))
end;

end.

