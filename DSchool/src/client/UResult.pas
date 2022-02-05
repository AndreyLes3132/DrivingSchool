unit UResult;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons;

type
  TFResult = class(TForm)
    StringGrid1: TStringGrid;
    BReg: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FResult: TFResult;

implementation

{$R *.dfm}

end.
