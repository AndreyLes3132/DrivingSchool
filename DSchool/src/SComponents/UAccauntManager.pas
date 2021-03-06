unit UAccauntManager;

interface

uses  ADODB, System.SysUtils, System.Variants, System.Classes,
      Data.DB, System.IOUtils, System.Hash, UUsers;

 type
  TAccManager=class
    public
      class function GetHashPassword(password: string) : string;
      class function Registration(user: TUsers): boolean; overload;
      class function getGroupNameByCID(cid: integer): string;
      class function Login(user: TUsers): boolean; overload;
//      class function getClassNameByCID(cid: integer): string;
  end;
implementation

uses UDataModule;

class function TAccManager.GetHashPassword(password: string) : string;
begin
  Result:= THashSHA2.GetHashString(password, SHA256);
end;

class function TAccManager.Registration(user: TUsers): boolean;
  begin
  with DataModule1.ADOQuery1 do
    begin
      Close;
      sql.Clear;
      sql.Add('INSERT INTO users([last_name],[first_name],[patronymic],[group_id],[hash_password]) VALUES ');
      sql.Add('(:u_last_name,:u_first_name,:u_patronymic,:u_gid,:u_hash_password)');
      Parameters.ParamByName('u_last_name').Value := user.s_last_name;
      Parameters.ParamByName('u_first_name').Value := user.s_first_name;
      Parameters.ParamByName('u_patronymic').Value := user.s_patronymic;
      Parameters.ParamByName('u_gid').Value := user.s_gid;
      Parameters.ParamByName('u_hash_password').Value := GetHashPassword(user.s_password);
      if ExecSql > 0 then
        Result:= true
        else
        Result:= false;
    end;
  end;

  class function TAccManager.getGroupNameByCID(cid: integer): string;
begin
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT g_name FROM groups_users WHERE id = :cid');
    Parameters.ParamByName('cid').Value:=cid;
    Open;
    First;
    Result:= Fields[0].AsString;
  end;
end;

class function TAccManager.Login(user: TUsers) : boolean;
  begin
   with DataModule1.ADOQuery1 do
    begin
      close;
      SQL.Clear;
      SQL.Add('SELECT last_name, first_name, patronymic, group_id, hash_password FROM users WHERE id = :sid');
      Parameters.ParamByName('sid').Value := user.sid;
      Open;
      first;
      if Fields[4].AsString = GetHashPassword(user.s_password) then
      begin
        user.s_last_name:= Fields[0].AsString;
        user.s_first_name:= Fields[1].AsString;
        user.s_patronymic:= Fields[2].AsString;
        user.s_gid:= Fields[3].AsInteger;
        Result:= true;
      end
      else
        Result:= false;
    end;
  end;

end.
