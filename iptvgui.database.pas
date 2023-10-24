unit iptvgui.database;

interface

uses
  System.IOUtils, System.SysUtils,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDB = class (TObject)
  private
    FDConnection: TFDConnection;
    procedure InitializeDatabase;
  public
    constructor Create;
    destructor Destroy; override;
    function ImportChannelsFromJSON(const json: string): Boolean;
    property Connection: TFDConnection read FDConnection write FDConnection;
  end;

implementation

{ TDB }

constructor TDB.Create;
begin

end;

destructor TDB.Destroy;
begin

  inherited;
end;

function TDB.ImportChannelsFromJSON(const json: string): Boolean;
begin
  Result := False;
end;

procedure TDB.InitializeDatabase;
var
  DatabasePath: string;
  FDQuery: TFDQuery;
begin
  DatabasePath := ExtractFilePath(ParamStr(0)) + 'channels.db';

  if not TFile.Exists(DatabasePath) then
  begin
    FDConnection := TFDConnection.Create(nil);
    try
      FDConnection.Params.DriverID := 'SQLite';
      FDConnection.Params.Database := DatabasePath;
      FDConnection.Open();

      FDQuery := TFDQuery.Create(nil);
      try
        FDQuery.Connection := FDConnection;
        FDQuery.SQL.Text :=
        'CREATE TABLE IF NOT EXISTS channels (';
        FDQuery.ExecSQL;
      finally
        FDQuery.Free;
      end;
    finally

    end;
  end;


end;

end.
