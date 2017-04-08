program GHome;


uses
  System.StartUpCopy,
  System.SysUtils,
  FMX.Forms,
  windows,
  Messages,
  MainUnit in 'MainUnit.pas' {MainForm},
  SettingsUnit in 'SettingsUnit.pas' {SettingsForm},
  DataUnit in 'DataUnit.pas' {DataForm: TDataModule},
  MuseumUnit in 'MuseumUnit.pas' {MuseumForm},
  AboutUnit in 'AboutUnit.pas' {AboutForm},
  GameUnit in 'GameUnit.pas' {GameForm},
  SeazonUnit in 'SeazonUnit.pas' {SeazonForm},
  BarUnit in 'BarUnit.pas' {Bar: TFrame},
  PlaceUnit in 'PlaceUnit.pas' {PlaceForm},
  ToolsUnit in 'ToolsUnit.pas' {ToolsForm},
  MaterialsUnit in 'MaterialsUnit.pas' {MaterialsForm},
  TaskUnit in 'TaskUnit.pas' {TaskForm},
  FoundationUnit in 'FoundationUnit.pas' {FoundationForm},
  MapUnit in 'MapUnit.pas' {MapForm},
  OmenUnit in 'OmenUnit.pas' {OmenForm},
  WarmingUnit in 'WarmingUnit.pas' {WarmingForm},
  Forms in 'Forms.pas',
  TextManager in 'TextManager.pas',
  ResourcesManager in 'ResourcesManager.pas',
  ImageManager in 'ImageManager.pas',
  GameData in 'GameData.pas',
  SoundManager in 'SoundManager.pas',
  FullScreenTabs in 'FullScreenTabs.pas',
  GameForms in 'GameForms.pas',
  DesignManager in 'DesignManager.pas',
  MatrixUnit in 'MatrixUnit.pas' {MatrixForm},
  WindowsUnit in 'WindowsUnit.pas' {WindowsForm},
  RoofUnit in 'RoofUnit.pas' {RoofForm},
  RidgeUnit in 'RidgeUnit.pas' {RidgeForm},
  MovingUnit in 'MovingUnit.pas' {MovingForm};

{$R *.res}

begin
  if AddFontResource('t/font.ttf')>0 then SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0)
    else Raise Exception.create('������ ��� �������� �������');
  Application.Initialize;
  Application.CreateForm(TDataForm, DataForm);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMatrixForm, MatrixForm);
  Application.CreateForm(TWindowsForm, WindowsForm);
  Application.CreateForm(TRoofForm, RoofForm);
  Application.CreateForm(TRidgeForm, RidgeForm);
  Application.CreateForm(TMovingForm, MovingForm);
  Application.RegisterFormFamily('MainForm', [TMainForm]);
  Application.Run;
end.
