unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainInterface, StdCtrls;

type
  TMainForm = class(TForm)
    Button1: TButton;
  private
    procedure InitUI;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TMainFormPlugin_noDLL = class(TObject, IMainFormPlugin)
  private
    FMainForm: TMainForm;
  protected
    function  QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function  _AddRef: Integer; stdcall;
    function  _Release: Integer; stdcall;
  public
    constructor Create(AMainForm: TMainForm); overload;
    procedure AddButton;
  end;

  TPluginHandler = class(TObject)
  private
    IPlugin: IMainFormPlugin;
    FMainForm: TMainForm;
  public
    constructor Create(AMainForm: TMainForm); overload;
    procedure LoadPlugin;
    procedure DoPlugin;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TMainForm }

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;
  InitUI;
end;

procedure TMainForm.InitUI;
var
  OMainPlugin: TMainFormPlugin_noDLL;
  oPluginHandler: TPluginHandler;
begin
//  OMainPlugin := TMainFormPlugin_noDLL.Create(Self);
//  OMainPlugin.AddButton;

  oPluginHandler := TPluginHandler.Create(Self);
  oPluginHandler.LoadPlugin;
  oPluginHandler.DoPlugin;
end;

{ TMainFormPlugin_noDLL }

procedure TMainFormPlugin_noDLL.AddButton;
var
  iBtn: TButton;
begin
  iBtn := TButton.Create(FMainForm);
  iBtn.Name := 'btnPlugin';
  iBtn.Caption := 'À©Õ¹';
  iBtn.Parent := FMainForm;
end;

constructor TMainFormPlugin_noDLL.Create(AMainForm: TMainForm);
begin
  FMainForm := AMainForm;
end;

function TMainFormPlugin_noDLL.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := -1;
end;

function TMainFormPlugin_noDLL._AddRef: Integer;
begin
  Result := -1;
end;

function TMainFormPlugin_noDLL._Release: Integer;
begin
  Result := -1;
end;

{ TPluginHandler }

constructor TPluginHandler.Create(AMainForm: TMainForm);
begin
  FMainForm := AMainForm;
end;

procedure TPluginHandler.DoPlugin;
begin
  IPlugin.AddButton;
end;

procedure TPluginHandler.LoadPlugin;
var
  pMainFormPlugin: TMainFormPlugin;
begin
  @pMainFormPlugin := GetProcAddress(LoadLibrary(PChar('E:\WorkCode\PluginDemo\bin\Plugin.dll')), 'CreatePlugin');
  IPlugin := pMainFormPlugin(FMainForm);
end;

end.
