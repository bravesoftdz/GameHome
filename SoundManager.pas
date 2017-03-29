unit SoundManager;

interface

uses
  ResourcesManager, Bass;

type
  //���������� ������
  TSoundManager = class
  private
    Vol:single;
    last:eSound;
    mainStream,backgroundStream:HSTREAM;
    procedure setVol(v:single); overload;
    procedure setVol(v:byte); overload;
    procedure loadSound(s:eSound);
    function getVol:byte;
  public
    procedure play(s:eSound);
    property volume:byte read getVol write setVol;
    constructor Create;
  end;

implementation

uses
  System.SysUtils;

  {TSoundManager}

//�����������
constructor TSoundManager.Create;
begin
  try
    if not BASS_Init(-1, 44100, 0, 0, nil) then
      Raise Exception.create('������ ��� �������� BASS');
    BackgroundStream:=BASS_StreamCreateFile(false,pchar(getSound(sBackground)),0,0,BASS_UNICODE);
    BASS_ChannelFlags(BackgroundStream, BASS_SAMPLE_LOOP, BASS_SAMPLE_LOOP);
  finally
    SetVol(0.1);
    //BASS_ChannelPlay(BackgroundStream,true);
  end;
end;

//���������� ������� �����
procedure TSoundManager.SetVol(v:single);
begin
  Vol:=v;
  Bass_ChannelSetAttribute(MainStream, BASS_ATTRIB_VOL, Vol);
  Bass_ChannelSetAttribute(BackgroundStream, BASS_ATTRIB_VOL, Vol/2);
end;

//��������� ���� ����� � �����
procedure TSoundManager.LoadSound;
begin
  if MainStream <> 0 then Bass_StreamFree(MainStream);
  MainStream:=BASS_StreamCreateFile(false,pchar(getSound(s)),0,0,BASS_UNICODE);
  last:=s;
  SetVol(Vol);
end;

//��������� ���� �� ������
procedure TSoundManager.Play;
begin
  if s<>last then LoadSound(s);
  Bass_ChannelPlay(MainStream,true);
end;

procedure TSoundManager.SetVol(v:byte);
begin
  SetVol(v/50);
end;

function TSoundManager.GetVol;
begin
  result:=round(Vol*50);
end;

end.