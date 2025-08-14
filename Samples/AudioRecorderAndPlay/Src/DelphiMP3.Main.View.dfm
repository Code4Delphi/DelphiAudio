object DelphiMP3MainView: TDelphiMP3MainView
  Left = 0
  Top = 0
  Caption = 'Delphi MP3'
  ClientHeight = 143
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 41
    Align = alTop
    BevelEdges = [beLeft, beTop, beRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    ExplicitWidth = 716
    object btnListDevices: TButton
      Left = 7
      Top = 7
      Width = 124
      Height = 27
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Get list devices'
      TabOrder = 0
      OnClick = btnListDevicesClick
      ExplicitLeft = 4
      ExplicitTop = 8
    end
    object cBoxDevice: TComboBox
      AlignWithMargins = True
      Left = 134
      Top = 10
      Width = 557
      Height = 23
      Cursor = crHandPoint
      Align = alLeft
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      ExplicitLeft = 132
      ExplicitTop = 8
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 713
    Height = 48
    Align = alTop
    Caption = ' Recording '
    Padding.Left = 5
    Padding.Bottom = 2
    TabOrder = 1
    ExplicitTop = 40
    ExplicitWidth = 716
    object btnStartRecording: TButton
      AlignWithMargins = True
      Left = 10
      Top = 17
      Width = 124
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Start recording'
      TabOrder = 0
      OnClick = btnStartRecordingClick
      ExplicitLeft = 7
    end
    object btnStopRecording: TButton
      AlignWithMargins = True
      Left = 137
      Top = 17
      Width = 124
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Stop recording'
      TabOrder = 1
      OnClick = btnStopRecordingClick
      ExplicitLeft = 134
    end
    object btnPlayRecording: TButton
      AlignWithMargins = True
      Left = 264
      Top = 17
      Width = 124
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Play recording'
      TabOrder = 2
      OnClick = btnPlayRecordingClick
      ExplicitLeft = 261
    end
    object btnSaveRecording: TButton
      AlignWithMargins = True
      Left = 391
      Top = 17
      Width = 124
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Save recording'
      TabOrder = 3
      OnClick = btnSaveRecordingClick
      ExplicitLeft = 534
      ExplicitTop = 19
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 89
    Width = 713
    Height = 48
    Align = alTop
    Caption = ' Play external audio '
    Padding.Left = 5
    Padding.Bottom = 2
    TabOrder = 2
    ExplicitTop = 88
    ExplicitWidth = 716
    object btnPlayAudioMP3: TButton
      AlignWithMargins = True
      Left = 10
      Top = 17
      Width = 124
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Play audio MP3'
      TabOrder = 0
      OnClick = btnPlayAudioMP3Click
      ExplicitLeft = 7
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'mp3'
    Filter = 'Arquivos MP3 (*.mp3)|*.mp3|Todos os arquivos (*.*)|*.*'
    Left = 624
    Top = 16
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'mp3'
    Filter = 'Arquivos MP3 (*.mp3)|*.mp3|Todos os arquivos (*.*)|*.*'
    Left = 624
    Top = 72
  end
end
