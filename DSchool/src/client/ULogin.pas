unit ULogin;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB, ExtCtrls, IniFiles, System.IOUtils, Vcl.Buttons, UUsers;

type
  TFLog = class(TForm)
    LSearch: TLabel;
    LHelp: TLabel;
    LUser: TListBox;
    TSearch: TEdit;
    BLog: TBitBtn;
    BReg: TBitBtn;
    BAbout: TBitBtn;
    BExit: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BRegClick(Sender: TObject);
    procedure BLogClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ListBoxRefresh(); overload;
    procedure ListBoxRefresh(expr: string); overload;
  end;

var
  FLog: TFLog;

implementation
uses UDataModule, UReg, UAuthorise;
{$R *.dfm}

procedure TFLog.BLogClick(Sender: TObject);
var uid:string; selectedUser:string;
begin
  if LUser.ItemIndex >= 0 then
  begin
    selectedUser:= LUser.Items.Strings[LUser.ItemIndex];
    uid:= copy(selectedUser,1,pos(^I,selectedUser)-1);
    FAuthorise := TFAuthorise.Create(self, uid);
    FLog.BReg.Enabled:=false;
    FLog.BLog.Enabled:=false;
    FAuthorise.Show;
  end;
end;

procedure TFLog.BRegClick(Sender: TObject);
begin
  FReg := TFReg.Create(nil);
  //FLog.BReg.Enabled:=false;
  //FLog.BLog.Enabled:=false;
  FReg.Show;
end;

procedure TFLog.FormCreate(Sender: TObject);
begin
  LUser.TabWidth:= 50;
  self.ListBoxRefresh();
end;

procedure TFLog.ListBoxRefresh();
begin
  LUser.Clear;
  with DataModule1.ADOQuery1 do
    begin
      close;
      SQL.Clear;
      SQL.Add('SELECT users.id, users.last_name, users.first_name, users.patronymic, groups_users.g_name FROM users INNER JOIN groups_users ON groups_users.id = users.group_id ORDER BY users.id ASC');
      Open;
      first;
      while not(eof) do
      begin
        LUser.Items.Add(Fields[0].AsString+^I+Fields[1].AsString+^I+Fields[2].AsString+^I+Fields[3].AsString+^I+Fields[4].AsString);
        Next;
      end;
    end;
end;

procedure TFLog.ListBoxRefresh(expr: string);
begin
  LUser.Clear;
  with DataModule1.ADOQuery1 do
    begin
      close;
      SQL.Clear;
     SQL.Add('SELECT users.id, last_name, first_name, patronymic, groups_users.g_name FROM users INNER JOIN groups_users ON groups_users.id = users.group_id WHERE last_name LIKE :expr1 OR first_name LIKE :expr2 OR patronymic LIKE :expr3 ORDER BY users.id ASC');
      Parameters.ParamByName('expr1').Value := '%'+expr+'%';
      Parameters.ParamByName('expr2').Value := '%'+expr+'%';
      Parameters.ParamByName('expr3').Value := '%'+expr+'%';
      Open;
      first;
      while not(eof) do
      begin
        LUser.Items.Add(Fields[0].AsString+^I+Fields[1].AsString+^I+Fields[2].AsString+^I+Fields[3].AsString+^I+Fields[4].AsString);
        Next;
      end;
    end;
end;


end.
