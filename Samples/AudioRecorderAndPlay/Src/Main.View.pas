unit Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  AudioRecorder,
  Vcl.ExtCtrls;

type
  TMainView = class(TForm)
    Panel1: TPanel;
    btnListDevices: TButton;
    cBoxDevice: TComboBox;
    GroupBox1: TGroupBox;
    btnStartRecording: TButton;
    btnStopRecording: TButton;
    btnPlayRecording: TButton;
    btnSaveRecording: TButton;
    SaveDialog1: TSaveDialog;
    GroupBox2: TGroupBox;
    btnPlayAudioMP3: TButton;
    OpenDialog1: TOpenDialog;
    procedure btnStartRecordingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnStopRecordingClick(Sender: TObject);
    procedure btnListDevicesClick(Sender: TObject);
    procedure btnPlayRecordingClick(Sender: TObject);
    procedure btnSaveRecordingClick(Sender: TObject);
    procedure btnPlayAudioMP3Click(Sender: TObject);
  private
    FAudioRecorder: TAudioRecorder;
    procedure ScreenRecordingOn;
    procedure ScreenRecordingOff;
  public

  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

procedure TMainView.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FAudioRecorder := TAudioRecorder.Create;
  Self.ScreenRecordingOff;
end;

procedure TMainView.FormDestroy(Sender: TObject);
begin
  FAudioRecorder.Free;
end;

procedure TMainView.ScreenRecordingOn;
begin
  btnStartRecording.Enabled := False;
  btnStopRecording.Enabled := True;
  btnPlayRecording.Enabled := False;
  btnSaveRecording.Enabled := False;
  btnPlayAudioMP3.Enabled := False;
  btnListDevices.Enabled := False;
end;

procedure TMainView.ScreenRecordingOff;
begin
  btnStartRecording.Enabled := True;
  btnStopRecording.Enabled := False;
  btnPlayRecording.Enabled := True;
  btnSaveRecording.Enabled := True;
  btnPlayAudioMP3.Enabled := True;
  btnListDevices.Enabled := True;
end;

procedure TMainView.btnListDevicesClick(Sender: TObject);
begin
  cBoxDevice.Items.Assign(FAudioRecorder.GetDevices);
end;

procedure TMainView.btnStartRecordingClick(Sender: TObject);
begin
  FAudioRecorder.ClearRecordedData;
  FAudioRecorder.StartRecording(cBoxDevice.ItemIndex);
  Self.ScreenRecordingOn;
end;

procedure TMainView.btnStopRecordingClick(Sender: TObject);
begin
  Sleep(500);
  FAudioRecorder.StopRecording;
  Self.ScreenRecordingOff;
end;

procedure TMainView.btnPlayRecordingClick(Sender: TObject);
var
  LAudioStream: TMemoryStream;
begin
  LAudioStream := FAudioRecorder.GetMP3Stream(20500);
  try
    LAudioStream.Position := 0;
    FAudioRecorder.PlayMP3FromStream(LAudioStream);
  finally
    LAudioStream.Free;
  end;
end;

procedure TMainView.btnSaveRecordingClick(Sender: TObject);
begin
  if not SaveDialog1.Execute then
    Exit;

  FAudioRecorder.SaveToMP3(SaveDialog1.FileName);
end;

procedure TMainView.btnPlayAudioMP3Click(Sender: TObject);
begin
  if not OpenDialog1.Execute then
    Exit;

  FAudioRecorder.PlayMP3FromFile(OpenDialog1.FileName);
end;

end.
