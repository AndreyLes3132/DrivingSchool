unit UTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, ULesson;

type
  TFTest = class(TForm)
    StatusBar1: TStatusBar;
    BLog: TBitBtn;
    BReg: TBitBtn;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    LQuest: TLabel;

    procedure FormCreate(Sender: TObject);
  private
  IndexQuest, i, min, sec:integer;
  procedure ChangeWord(label1:tlabel);
    { Private declarations }
  public
  idTopic:Integer;
  topicName:String;
    { Public declarations }
  end;

var
  FTest: TFTest;

implementation
 uses UQuest;



{$R *.dfm}

procedure TFTest.FormCreate(Sender: TObject);

begin
 // UQuest.questionsBdToList();
 // IndexQuest:= 1;
 // ChangeWord(LQuest);
end;

procedure TFTest.ChangeWord(label1:tlabel);     //меняем текущее слово
begin
//  IndexQuest:= 1;
//  label1.Caption:=TQuestClass(ListQuest[IndexQuest]).question;
end;

end.
