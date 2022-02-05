unit ULesson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFLesson = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    LQuest: TLabel;
    Button5: TButton;
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
  FLesson: TFLesson;

implementation
uses UQuest;
{$R *.dfm}

procedure TfLesson.ChangeWord(label1:tlabel);     //меняем текущее слово
begin
  label1.Caption:=TQuestClass(ListQuest[IndexQuest]).question;

end;

end.
