unit UChangeT;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Data.Win.ADODB, ExtCtrls, IniFiles, System.IOUtils, UUsers, System.Generics.Defaults, System.Generics.Collections;

type
  TFChangeTicket = class(TForm)
    LabelClass: TLabel;
    ComboBoxTicket: TComboBox;
    BEnt: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BEntClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FChangeTicket: TFChangeTicket;

implementation
uses UDataModule, UTicket, UAccauntManager, UTest;

{$R *.dfm}

procedure TFChangeTicket.BEntClick(Sender: TObject);
var ticket: TTicket;
begin
if ComboBoxTicket.Text='' then Showmessage('Ќе выбран билет!')
else
  begin
    ticket:= TTicket.Create();
    ticket.t_b_name:= ComboBoxTicket.Text;
    with DataModule1.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT id FROM bilet WHERE b_name = :cname');
      Parameters.ParamByName('cname').Value:=ComboBoxTicket.Text;
      Open;
      First;
      ticket.tid:= Fields[0].AsInteger;
    end;

    FTest := TFTest.Create(nil);
    FTest.idTopic:=ticket.tid;
    FTest.topicName:=ticket.t_b_name;
    FTest.Show;
    self.Close;
   end;
end;

//begin
// if (FrameTopics.ListBox1.ItemIndex <>-1) or (FrameRegime.regime = 1) then
//  begin
//
//    FTests.Mode:=mode;                       //1 -- изучение, 2 -- самоконтроль, 3 -- тест
//    FTests.ASSIMILATION:=ASSIMILATION;
//    if FrameRegime.regime <> 1 then
//    begin
//      FTests.idTopic:=TopicList[FrameTopics.ListBox1.ItemIndex].id;
//      FTests.topicName:=TopicList[FrameTopics.Listbox1.ItemIndex].name;
//    end;
//    FTests.Show;
//    FTopicAndRegimeChange.Hide;
//    FrameTopicsBtnCloseregimeClick(nil);
//   end;
//end;


procedure TFChangeTicket.FormCreate(Sender: TObject);
var ticketList: TList<String>; i: integer;
begin
  ticketList:= DataModule1.GetTicketList();
  for i := 0 to ticketList.Count-1 do
    ComboBoxTicket.Items.Add(ticketList[i]);
end;

end.
