object vMain: TvMain
  Left = 0
  Top = 0
  Caption = 'DDD Example'
  ClientHeight = 406
  ClientWidth = 913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object btnFindAll: TButton
    Left = 778
    Top = 8
    Width = 127
    Height = 61
    Caption = 'FindAll'
    TabOrder = 0
    OnClick = btnFindAllClick
  end
  object btnInsert: TButton
    Left = 778
    Top = 203
    Width = 127
    Height = 63
    Caption = 'Insert'
    TabOrder = 3
    OnClick = btnInsertClick
  end
  object btnUpdate: TButton
    Left = 778
    Top = 270
    Width = 127
    Height = 61
    Caption = 'Update'
    TabOrder = 4
    OnClick = btnUpdateClick
  end
  object btnDelete: TButton
    Left = 778
    Top = 333
    Width = 127
    Height = 61
    Caption = 'Delete'
    TabOrder = 5
    OnClick = btnDeleteClick
  end
  object btnFindByID: TButton
    Left = 778
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
    Width = 772
    Height = 331
    BorderStyle = bsNone
    DataSource = DS
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnFindLike: TButton
    Left = 778
    Top = 141
    Width = 127
    Height = 61
    Caption = 'FindLike'
    TabOrder = 2
    OnClick = btnFindLikeClick
  end
  object edtPesquisa: TEdit
    Left = 8
    Top = 337
    Width = 764
    Height = 57
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object DS: TDataSource
    Left = 288
    Top = 152
  end
end
