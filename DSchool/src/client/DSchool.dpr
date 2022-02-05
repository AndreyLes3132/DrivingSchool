program DSchool;

uses
  Vcl.Forms,
  ULogin in 'ULogin.pas' {FLog},
  UDataModule in '..\DataModule\UDataModule.pas' {DataModule1: TDataModule},
  UMain_User_form in 'UMain_User_form.pas' {FMUser},
  UTest in 'UTest.pas' {FTest},
  UResult in 'UResult.pas' {FResult},
  UReg in 'UReg.pas' {FReg},
  UAuthorise in 'UAuthorise.pas' {FAuthorise},
  UUsers in '..\Domain\UUsers.pas',
  UAccauntManager in '..\SComponents\UAccauntManager.pas',
  UChangeT in 'UChangeT.pas' {FChangeTicket},
  UTicket in '..\Domain\UTicket.pas',
  ULesson in 'ULesson.pas' {FLesson},
  UQuest in '..\SComponents\UQuest.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFLog, FLog);
  Application.CreateForm(TFTest, FTest);
  Application.CreateForm(TFMUser, FMUser);
  Application.CreateForm(TFResult, FResult);
  Application.CreateForm(TFReg, FReg);
  Application.CreateForm(TFAuthorise, FAuthorise);
  Application.CreateForm(TFChangeTicket, FChangeTicket);
  Application.CreateForm(TFLesson, FLesson);
  Application.Run;
end.
