unit UMain_User_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, pngimage, jpeg, ExtCtrls, DB, ADODB, IniFiles, System.IOUtils, UUsers;

type
  TFMUser = class(TForm)
    BLog: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    constructor Create(AOwner: TComponent; userInfo: TUsers);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    userInfo: TUsers;

  end;

var
  FMUser: TFMUser;

implementation
uses UAccauntManager, ULogin, UChangeT;
{$R *.dfm}

procedure TFMUser.BitBtn1Click(Sender: TObject);
begin
  FChangeTicket := TFChangeTicket.Create(nil);
  FChangeTicket.Show;
end;

constructor TFMUser.Create(AOwner: TComponent; userInfo: TUsers);
begin
  inherited Create(AOwner);
  self.userInfo:= userInfo;
  self.Caption:= '?????????. ????????????: ' + userInfo.s_last_name + ' ' + userInfo.s_first_name + ' ' + userInfo.s_patronymic + ' ' + TAccManager.getGroupNameByCID(userInfo.s_gid);
end;

end.
