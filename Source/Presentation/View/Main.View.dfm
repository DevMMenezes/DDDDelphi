object vMain: TvMain
  Left = 0
  Top = 0
  Caption = 'DDD Example'
  ClientHeight = 347
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Visible = True
  TextHeight = 15
  object btnFindAll: TButton
    Left = 391
    Top = 8
    Width = 127
    Height = 61
    Caption = 'FindAll'
    TabOrder = 0
    OnClick = btnFindAllClick
  end
  object btnInsert: TButton
    Left = 391
    Top = 139
    Width = 127
    Height = 61
    Caption = 'Insert'
    TabOrder = 2
    OnClick = btnInsertClick
  end
  object btnUpdate: TButton
    Left = 391
    Top = 206
    Width = 127
    Height = 61
    Caption = 'Update'
    TabOrder = 3
    OnClick = btnUpdateClick
  end
  object btnDelete: TButton
    Left = 391
    Top = 269
    Width = 127
    Height = 61
    Caption = 'Delete'
    TabOrder = 4
    OnClick = btnDeleteClick
  end
  object btnFindByID: TButton
    Left = 391
    Top = 75
    Width = 127
    Height = 61
    Caption = 'FindByID'
    TabOrder = 1
    OnClick = btnFindByIDClick
  end
  object DBGridProd: TDBGrid
    Left = 0
    Top = 0
    Width = 385
    Height = 339
    DataSource = DS
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DS: TDataSource
    Left = 288
    Top = 152
  end
end
