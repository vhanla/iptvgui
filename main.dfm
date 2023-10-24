object mainForm: TmainForm
  Left = 0
  Top = 0
  Caption = 'IPTV-GUI'
  ClientHeight = 694
  ClientWidth = 904
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 45
  CustomTitleBar.SystemColors = False
  CustomTitleBar.SystemButtons = False
  CustomTitleBar.BackgroundColor = 3684408
  CustomTitleBar.ForegroundColor = clSilver
  CustomTitleBar.InactiveBackgroundColor = 2829099
  CustomTitleBar.InactiveForegroundColor = clGray
  CustomTitleBar.ButtonForegroundColor = clWhite
  CustomTitleBar.ButtonBackgroundColor = 3684408
  CustomTitleBar.ButtonHoverForegroundColor = 65793
  CustomTitleBar.ButtonHoverBackgroundColor = 5460819
  CustomTitleBar.ButtonPressedForegroundColor = 65793
  CustomTitleBar.ButtonPressedBackgroundColor = 15395562
  CustomTitleBar.ButtonInactiveForegroundColor = 10066329
  CustomTitleBar.ButtonInactiveBackgroundColor = 2829099
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Top = 45
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object SplitView1: TSplitView
    Left = 0
    Top = 44
    Width = 200
    Height = 531
    OpenedWidth = 200
    Placement = svpLeft
    TabOrder = 0
    object ControlList1: TControlList
      Left = 0
      Top = 0
      Width = 200
      Height = 531
      Align = alClient
      ItemMargins.Left = 0
      ItemMargins.Top = 0
      ItemMargins.Right = 0
      ItemMargins.Bottom = 0
      ParentColor = False
      TabOrder = 0
    end
  end
  object CardPanel1: TCardPanel
    Left = 200
    Top = 44
    Width = 704
    Height = 531
    Align = alClient
    ActiveCard = Card1
    BevelOuter = bvNone
    Caption = 'CardPanel1'
    TabOrder = 1
    object Card1: TCard
      Left = 0
      Top = 0
      Width = 704
      Height = 531
      Caption = 'Card1'
      CardIndex = 0
      TabOrder = 0
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 44
    CustomButtons = <>
    DesignSize = (
      904
      44)
    object SearchBox1: TSearchBox
      Left = 273
      Top = 3
      Width = 327
      Height = 23
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clBtnFace
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      Text = 'anime'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 675
    Width = 904
    Height = 19
    Panels = <>
  end
  object pnlPlayer: TPanel
    Left = 200
    Top = 168
    Width = 585
    Height = 401
    TabOrder = 4
    object WVWindowParent1: TWVWindowParent
      Left = 1
      Top = 1
      Width = 583
      Height = 399
      Align = alClient
      Color = clBackground
      TabOrder = 0
      Browser = WVBrowser1
    end
  end
  object pnlPlayerControl: TPanel
    Left = 0
    Top = 575
    Width = 904
    Height = 100
    Align = alBottom
    TabOrder = 5
    object Panel1: TPanel
      Left = 273
      Top = 24
      Width = 456
      Height = 41
      Caption = 'Panel1'
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 1
        Top = 1
        Width = 454
        Height = 29
        Caption = 'ToolBar1'
        TabOrder = 0
      end
    end
    object UWPDownloader1: TUWPDownloader
      Left = 1
      Top = 57
      Width = 902
      Height = 42
      Align = alBottom
      Caption = 'Update Channels List'
      TabOrder = 1
      OnClick = UWPDownloader1Click
      AniSet.AniKind = akOut
      AniSet.AniFunctionKind = afkQuartic
      AniSet.DelayStartTime = 0
      AniSet.Duration = 250
      AniSet.Step = 25
      OnDownloaded = UWPDownloader1Downloaded
      URL = ''
      Header = ''
      UserAgent = ''
      SavePath = ''
      IconFont.Charset = DEFAULT_CHARSET
      IconFont.Color = clWindowText
      IconFont.Height = -32
      IconFont.Name = 'Segoe MDL2 Assets'
      IconFont.Style = []
      CustomBackColor.Enabled = False
      CustomBackColor.LightNone = 15132390
      CustomBackColor.LightHover = 13619151
      CustomBackColor.LightPress = 8947848
      CustomBackColor.LightSelectedNone = 127
      CustomBackColor.LightSelectedHover = 103
      CustomBackColor.LightSelectedPress = 89
      CustomBackColor.DarkNone = 2039583
      CustomBackColor.DarkHover = 3487029
      CustomBackColor.DarkPress = 5000268
      CustomBackColor.DarkSelectedNone = 89
      CustomBackColor.DarkSelectedHover = 103
      CustomBackColor.DarkSelectedPress = 127
      FontIcon = #59219
      DownloadStartIcon = #57624
      DownloadPauseIcon = #57603
      DownloadCancelIcon = #57610
      DownloadRestartIcon = #57673
      Detail = 'Detail'
      ExtraDetail = 'Extra Detail'
      Status = 'Status'
      ProgressTop = 'Message 1'
      ProgressBottom = '0kb/s'
    end
  end
  object WVBrowser1: TWVBrowser
    TargetCompatibleBrowserVersion = '118.0.2088.41'
    AllowSingleSignOnUsingOSPrimaryAccount = False
    Left = 472
    Top = 280
  end
end
