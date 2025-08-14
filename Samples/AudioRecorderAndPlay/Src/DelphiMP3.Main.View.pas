unit DelphiMP3.Main.View;

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
  AudioRecorder, Vcl.ExtCtrls;

type
  TDelphiMP3MainView = class(TForm)
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
  DelphiMP3MainView: TDelphiMP3MainView;

implementation

{$R *.dfm}

procedure TDelphiMP3MainView.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FAudioRecorder := TAudioRecorder.Create;
  Self.ScreenRecordingOff;
end;

procedure TDelphiMP3MainView.FormDestroy(Sender: TObject);
begin
  FAudioRecorder.Free;
end;

procedure TDelphiMP3MainView.ScreenRecordingOn;
begin
  btnStartRecording.Enabled := False;
  btnStopRecording.Enabled := True;
  btnPlayRecording.Enabled := False;
end;

procedure TDelphiMP3MainView.ScreenRecordingOff;
begin
  btnStartRecording.Enabled := True;
  btnStopRecording.Enabled := False;
  btnPlayRecording.Enabled := True;
end;

procedure TDelphiMP3MainView.btnListDevicesClick(Sender: TObject);
begin
  cBoxDevice.Items.Assign(FAudioRecorder.GetDevices);
end;

procedure TDelphiMP3MainView.btnStartRecordingClick(Sender: TObject);
begin
  FAudioRecorder.ClearRecordedData;
  FAudioRecorder.StartRecording(cBoxDevice.ItemIndex);
  Self.ScreenRecordingOn;
end;

procedure TDelphiMP3MainView.btnStopRecordingClick(Sender: TObject);
begin
  Sleep(500);
  FAudioRecorder.StopRecording;
  Self.ScreenRecordingOff;
end;

procedure TDelphiMP3MainView.btnPlayRecordingClick(Sender: TObject);
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

procedure TDelphiMP3MainView.btnSaveRecordingClick(Sender: TObject);
begin
  if not SaveDialog1.Execute then
    Exit;

  FAudioRecorder.SaveToMP3(SaveDialog1.FileName);
end;

procedure TDelphiMP3MainView.btnPlayAudioMP3Click(Sender: TObject);
begin
  if not OpenDialog1.Execute then
    Exit;

  FAudioRecorder.PlayMP3FromFile(OpenDialog1.FileName);
end;

end.
