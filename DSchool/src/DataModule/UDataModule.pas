unit UDataModule;

interface

uses
  System.SysUtils, System.IOUtils, System.Classes, Data.DB, Data.Win.ADODB,
  System.Generics.Defaults, System.Generics.Collections, Math;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSourceUser: TDataSource;
    ADOQueryUser: TADOQuery;
    ADODataSetUser: TADODataSet;
    procedure DataModuleCreate(Sender: TObject);
    function GetGroupList(): TList<String>;
    function GetTicketList(): TList<String>;
  private

  public
    HasErrors: boolean;
  end;

var
  DataModule1: TDataModule1;

implementation



{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var	str_connect: string;
begin
  //str_connect := TPath.Combine(ExtractFileDir(ExtractFileDir(ParamStr(0)))+'\DataModule','drivingschoolBD.mdb');
  str_connect := 'D:\Delphi\Del\DSchool\src\DataModule\drivingschoolBD.mdb';

  if(FileExists(str_connect))then
    begin
      ADOConnection1.ConnectionString:=
      'Provider=Microsoft.Jet.OLEDB.4.0;'+
      'User ID=Admin;' +
      'Data Source='+str_connect+';' +
      'Mode=Share Deny None;'  +
      'Persist Security Info=False;'   +
      'Jet OLEDB:System database="";' +
      'Jet OLEDB:Registry Path="";' +
      'Jet OLEDB:Database Password="";' +
      'Jet OLEDB:Engine Type=5;'        +
      'Jet OLEDB:Database Locking Mode=1;'  +
      'Jet OLEDB:Global Partial Bulk Ops=2;'  +
      'Jet OLEDB:Global Bulk Transactions=1;' +
      'Jet OLEDB:New Database Password="";'+
      'Jet OLEDB:Create System Database=False;'  +
      'Jet OLEDB:Encrypt Database=False;'       +
      'Jet OLEDB:Don'+'''t Copy Locale on Compact=False;'+
      'Jet OLEDB:Compact Without Replica Repair=False;'   +
      'Jet OLEDB:SFP=False';
      ADOConnection1.LoginPrompt:= false;
      ADOQuery1.Connection:= ADOConnection1;
      with ADODataSetUser do
      begin
        Connection:= ADOConnection1;
         CommandText:= 'SELECT users.id as '+QuotedStr('??? ????????????')+
        ',last_name as '+QuotedStr('???????')+', first_name as '+QuotedStr('???')+
        ',patronymic as '+QuotedStr('????????')+', group_id as '+QuotedStr('??? ??????')+ ', groups_users.g_name as '+QuotedStr('???????????? ??????');
        CommandText:= CommandText + 'FROM users INNER JOIN groups_users ON users.group_id = groups_users.id ORDER BY users.id ASC';
        Active:= true;
      end;
      DataSourceUser.DataSet:= ADODataSetUser;
    end
    else
    begin
      HasErrors:= true;
      raise Exception.Create('???? ?????? ?? ???????. ????????? ?? ??????? ? ????? ?????????.');
    end;
end;

function TDataModule1.GetGroupList(): TList<String>;
var classList: TList<String>;
begin
  classList:= TList<String>.Create;
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT g_name FROM groups_users');
    Open;
    First;
    while not(EOF) do
      begin
        classList.Add(Fields[0].AsString);
        next;
      end;
  end;
  Result:= classList;
end;

function TDataModule1.GetTicketList(): TList<String>;
var ticketList: TList<String>;
begin
  ticketList:= TList<String>.Create;
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT b_name FROM bilet');
    Open;
    First;
    while not(EOF) do
      begin
        ticketList.Add(Fields[0].AsString);
        next;
      end;
  end;
  Result:= ticketList;
end;

//function TDataModule1.GetQuestion() : TList<String>

end.
