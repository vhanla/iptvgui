unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.ControlList,
  Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.TitleBarCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  uWVWinControl, uWVWindowParent, uWVBrowserBase, uWVBrowser, Vcl.ToolWin,
  UWP.Downloader, System.IOUtils, iptvgui.database;

type
  TmainForm = class(TForm)
    SplitView1: TSplitView;
    ControlList1: TControlList;
    CardPanel1: TCardPanel;
    TitleBarPanel1: TTitleBarPanel;
    Card1: TCard;
    StatusBar1: TStatusBar;
    SearchBox1: TSearchBox;
    pnlPlayer: TPanel;
    WVBrowser1: TWVBrowser;
    WVWindowParent1: TWVWindowParent;
    pnlPlayerControl: TPanel;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    UWPDownloader1: TUWPDownloader;
    procedure UWPDownloader1Click(Sender: TObject);
    procedure UWPDownloader1Downloaded(Sender: TObject; DownloadCode: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    DB: TDB;
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;

implementation

uses
  System.JSON;

{$R *.dfm}

procedure StoreJSONData(const AJSONStr: string);
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  I: Integer;
begin

end;

procedure TmainForm.FormCreate(Sender: TObject);
begin
  DB := TDB.Create;
end;

procedure TmainForm.FormDestroy(Sender: TObject);
begin
  DB.Free;
end;

procedure TmainForm.UWPDownloader1Click(Sender: TObject);
var
  path: string;
begin
  UWPDownloader1.URL := 'https://iptv-org.github.io/api/channels.json';
  path := ExtractFilePath(ParamStr(0)) + 'channels.json';

  if FileExists(path) then
  begin
    if MessageDlg('channels.json already exists, would you like to download again?',
      TMsgDlgType.mtConfirmation, mbYesNo, 0) = mrYes then
      begin
        with UWPDownloader1 do
        begin
          SavePath := path;
          DoStartDownload;
        end;
      end
      else
        UWPDownloader1Downloaded(Sender, 200);
  end
  else
    with UWPDownloader1 do
    begin
      SavePath := path;
      DoStartDownload;
    end;
end;

procedure TmainForm.UWPDownloader1Downloaded(Sender: TObject;
  DownloadCode: Integer);
var
  jsonfile: string;
//  str: TStringList;
begin
  if DownloadCode <> 200 then Exit;
  try
//    str := TStringList.Create;
    try
    jsonfile := TFile.ReadAllText(ExtractFilePath(ParamStr(0)) + 'channels.json', TEncoding.UTF8);
//      str.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'channels.json', TEncoding.UTF8);
      //storeJsonData(jsonfile);
      DB.ImportChannelsFromJSON(jsonfile);
    finally
//      str.Free;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Error loading channels.json: ' + E.Message);
    end;

  end;

end;

end.
