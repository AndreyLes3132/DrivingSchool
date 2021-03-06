unit UAuthorise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UUsers;

type
  TFAuthorise = class(TForm)
    LabelPassword: TLabel;
    EditPassword: TEdit;
    btnLogin: TButton;
    constructor Create(AOwner: TComponent; uid: string);
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public

  uid: string;
    { Public declarations }
  end;

var
  FAuthorise: TFAuthorise;

implementation
uses ULogin, UAccauntManager, UMain_User_form;
{$R *.dfm}



procedure TFAuthorise.btnLoginClick(Sender: TObject);
var user: TUsers;
begin
  user:= TUsers.Create();
  user.sid:= StrToInt(self.uid);
  user.s_password:= EditPassword.Text;
  if TAccManager.Login(user) then
   begin
     self.Close;
     FLog.Hide;
     FMUser:= TFMUser.Create(self, user);
     FMUser.Show;
   end
   else
    ShowMessage('?????? ???????? ??????!');
end;

constructor TFAuthorise.Create(AOwner: TComponent; uid: string);
begin
  inherited Create(AOwner);
  self.uid:= uid;
end;

end.
