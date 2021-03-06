unit UQuest;

interface
uses Windows,ADODB, DB, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, jpeg, ExtCtrls, UDataModule, System.Generics.Defaults,
  System.Generics.Collections, Math, UUsers, UTicket;
   type

 TQuestClass = class(TObject)
     procedure questionsBdToList();
    private
    public
    id_quest:Integer;
    question:string;
    help:string;
    img:TMemoryStream;
    answ_v:string;
    true_answ:integer;
    ques_category:string;
    nb_id:integer;

    end;
    var ListQuest:TList;

implementation



procedure TQuestClass.questionsBdToList();
var ticket: TTicket;  tmp:TQuestClass; tmpListWords:TList;
begin
  with DataModule1.ADOQuery1 do
      begin
        SQL.Clear;
        CLose;
        SQL.Text:='SELECT question.id, question.q_text  '+
        'question.q_help,  question.q_variants_answ, question.true_answ, question.img'+
        'FROM question'+
        'WHERE question.q_bilet_id= :qid';
        Parameters.ParamByName('qid').Value:=ticket.tid;
        Open;
        First;
        While not(eof)do
          begin
            tmp:=TQuestClass.Create();
            tmp.id_quest := Fields[0].AsInteger;
            tmp.question := Fields[1].AsString;
            tmp.help := Fields[2].AsString;
            tmp.answ_v := Fields[3].AsString;
            tmp.true_answ := Fields[4].AsInteger;
            tmp.img:=TADOBlobStream.Create(TBlobField(FieldByName('img')),bmRead);
            tmpListWords.Add(tmp);
            next;
          end;
      end;
      ListQuest.Add(tmpListWords[0]);
      tmpListWords.Clear;
end;

end.
