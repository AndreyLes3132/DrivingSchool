unit UReg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Data.Win.ADODB, ExtCtrls, IniFiles, System.IOUtils, UUsers, System.Generics.Defaults, System.Generics.Collections;

type
  TFReg = class(TForm)
    LabelLastName: TLabel;
    LabelFirstName: TLabel;
    LabelMiddleName: TLabel;
    LabelClass: TLabel;
    LabelPassword: TLabel;
    LabelTitle: TLabel;
    EditLastName: TEdit;
    EditFirstName: TEdit;
    EditMiddleName: TEdit;
    ComboBoxClass: TComboBox;
    EditPassword: TEdit;
    BEnt: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BEntClick(Sender: TObject);
  private
    { Private declarations }
  public
    function InsertNewGroup(group_name: string): integer;
    { Public declarations }
  end;

var
  FReg: TFReg;

implementation
 uses UDataModule, ULogin, UAccauntManager;
{$R *.dfm}


function TFReg.InsertNewGroup(group_name: string): integer;
begin
  with DataModule1.ADOQuery1 do
  begin
    Close;
    sql.Clear;
    SQl.Add('INSERT INTO users_gpoups([g_name]) VALUES( :cname )');
    Parameters.ParamByName('cname').Value := group_name;
    ExecSQL;
  end;
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT id FROM groups_users WHERE g_name = :cname');
    Parameters.ParamByName('cname').Value := group_name;
    Open;
    First;
    Result:= Fields[0].AsInteger;
  end;
end;


procedure TFReg.BEntClick(Sender: TObject);
var users: TUsers;
begin
if EditLastName.Text='' then Showmessage('Фамилия не введена!')
else
if EditFirstName.Text='' then Showmessage('Имя не введено!')
else
if ComboBoxClass.Text='' then Showmessage('Не выбран класс!')
else
  begin
    users:= TUsers.Create();
    users.s_last_name:= EditLastName.Text;
    users.s_first_name:= EditFirstName.Text;
    users.s_patronymic:= EditMiddleName.Text;
    with DataModule1.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT id FROM groups_users WHERE g_name = :cname');
      Parameters.ParamByName('cname').Value:=ComboBoxClass.Text;
      Open;
      First;
      if Fields[0].IsNull then
        begin
          users.s_gid:= InsertNewGroup(ComboBoxClass.Text);
        end
      else
        users.s_gid:= Fields[0].AsInteger;
    end;
    users.s_password:= EditPassword.Text;
    TAccManager.Registration(users);
    self.Close;
    FLog.ListBoxRefresh();
   end;
end;

procedure TFReg.FormCreate(Sender: TObject);
var groupList: TList<String>; i: integer;
begin
  groupList:= DataModule1.GetGroupList();
  for i := 0 to groupList.Count-1 do
    ComboBoxClass.Items.Add(groupList[i]);
end;

end.
