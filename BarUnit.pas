unit BarUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.Ani,
  FMX.ScrollBox, FMX.Memo, FMX.TabControl, FMX.ImgList, System.ImageList;

type
  TBar = class(TFrame)
    SPanel: TPanel;
    NextBtn: TSpeedButton;
    BackBtn: TSpeedButton;
    SubName: TText;
    SubText: TMemo;
    logoLayout: TLayout;
    Logo: TGlyph;
    tools: TGlyph;
    woods: TGlyph;
    adws: TGridLayout;
    m0: TGlyph;
    m1: TGlyph;
    m2: TGlyph;
    m3: TGlyph;
    m4: TGlyph;
    m5: TGlyph;
    body: TGlyph;
    wh1: TGlyph;
    wh2: TGlyph;
    st1: TGlyph;
    st2: TGlyph;
    RBonus: TLayout;
    bonusBG: TRectangle;
    telega: TLayout;
    nextLayout: TLayout;
    SubLogo: TGlyph;
    backLayout: TLayout;
    Glyph1: TGlyph;
    progress: TLayout;
    Glyph2: TGlyph;
    Glyph3: TGlyph;
    Glyph4: TGlyph;
    Glyph5: TGlyph;
    Glyph6: TGlyph;
    Glyph7: TGlyph;
    Glyph8: TGlyph;
    Glyph9: TGlyph;
    Glyph10: TGlyph;
    Glyph11: TGlyph;
    Glyph12: TGlyph;
    Glyph13: TGlyph;
    Glyph14: TGlyph;
    Glyph15: TGlyph;
    ImageList1: TImageList;
    procedure RBonusMouseLeave(Sender: TObject);
    procedure logoLayoutClick(Sender: TObject);
  protected
    procedure showBonus(Sender: TObject);
  public
    procedure setShowBonus;
    procedure showNext;
    procedure hideNext;
    procedure update;
    procedure upProgress;
  end;

implementation

{$R *.fmx}

uses GameUnit, DataUnit;

const
  w = 360;

var
  open:boolean = false;

procedure TBar.setShowBonus;
begin
  NextBtn.OnClick:=showBonus;
  showBonus(self);
end;

procedure TBar.showBonus(Sender: TObject);
begin
  if open then
  begin
    TAnimator.AnimateFloat(Rbonus, 'Position.X', (parent as TBarForm).Width);
    TAnimator.AnimateFloat(NextBtn, 'RotationAngle', 0);
  end else begin
    TAnimator.AnimateFloat(Rbonus, 'Position.X', (parent as TBarForm).Width-w);
    TAnimator.AnimateFloat(NextBtn, 'RotationAngle', 180);
  end;
  open:=not open;
end;

procedure TBar.logoLayoutClick(Sender: TObject);
begin
  if Assigned(parent) then
    (parent as TForm).close;
end;

procedure TBar.RBonusMouseLeave(Sender: TObject);
begin
  TAnimator.AnimateFloat(Rbonus, 'Position.X', (parent as TBarForm).Width);
  open:=false;
end;

procedure TBar.showNext;
begin
  NextBtn.Visible:=true;
  TAnimator.AnimateFloat(NextLayout, 'opacity', 1);
end;

procedure TBar.hideNext;
begin
  TAnimator.AnimateFloat(NextLayout, 'opacity', 0);
  NextBtn.Visible:=false;
end;

procedure TBar.update;
begin
  TM.LoadText(parent.Name);
  (parent as TBarForm).setText;
  BackBtn.OnClick:=(parent as TBarForm).closeByClick;
  RBonus.Position.X:=(parent as TBarForm).Width;
  open:=false;
  if parent is TGForm then
  begin
    NextBtn.Visible:=true;
    progress.Visible:=true;
    NextBtn.OnClick:=(parent as TGForm).Next;
    BackBtn.OnClick:=(parent as TGForm).Back;
    if (parent as TGForm).state<2 then hideNext
      else if NextBtn.Opacity=0 then showNext;
  end else begin
    NextBtn.Visible:=false;
    progress.Visible:=false;
  end;
end;

procedure TBar.upProgress;
var
  f:TGlyph;
  i:byte;
begin
  for i:=0 to progress.Children.Count-1 do
  begin
    f:=progress.Children[i] as TGlyph;
    f.ImageIndex:=TGForm.getState(f.Tag);
  end;
end;

end.
