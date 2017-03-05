unit SeazonUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  FMX.Ani, FMX.Effects, FMX.Filter.Effects, system.JSON, DataUnit, FMX.ImgList;

type
  TSeazonForm = class(TGForm)
    s0: TLayout;
    s1: TLayout;
    s2: TLayout;
    s3: TLayout;
    img0: TGlyph;
    img1: TGlyph;
    img2: TGlyph;
    img3: TGlyph;
    Main: TLayout;
    t0: TText;
    t1: TText;
    t2: TText;
    t3: TText;
    BG: TGlyph;
    procedure s0Click(Sender: TObject);
    procedure s0MouseEnter(Sender: TObject);
  protected
    procedure gShow; override;
  public
    procedure hideAnimation; override;
    procedure showAnimation; override;
  end;

implementation

{$R *.fmx}

const
  m =40;

var
  w:single;
  shw,lst:ShortInt;

procedure TSeazonForm.showAnimation;
begin
  TAnimator.AnimateFloatWait(Main, 'opacity', 1, 0.4);
end;

procedure TSeazonForm.hideAnimation;
begin
  TAnimator.AnimateFloatWait(Main, 'opacity', 0, 0.3);
end;

procedure TSeazonForm.gShow;
var
  img_w:single;
begin
  w:=Width/4;
  img_w:=Height/720*1082;

  s0.Width:=w;
  img0.Width:=img_w;

  s1.Width:=w;
  img1.Width:=img_w;

  s2.Width:=w;
  img2.Width:=img_w;

  s3.Width:=w;
  img3.Width:=img_w;
  shw:=-1;
end;

procedure TSeazonForm.s0Click(Sender: TObject);
begin
  if shw>=0 then
  begin
    TAnimator.AnimateFloat(Main.Children[shw], 'width', w);
    TAnimator.AnimateFloat(Main, 'Position.X', 0);
    TAnimator.AnimateInt(Main.Children[shw].Children[0].Children[0], 'TextSettings.Font.Size', 40);
    shw:=-1;
  end else begin
    shw:=Main.Children.IndexOf(TFmxObject(sender));
    self.setDescription(TFmxObject(sender).Children[0].tag, Bar.SubText);

    TAnimator.AnimateFloat(Main, 'Position.X', -(2*w*TFmxObject(sender).Tag/3));
    TAnimator.AnimateFloat(TFmxObject(sender), 'width', 3*w);
    TAnimator.AnimateInt(TFmxObject(sender).Children[0].Children[0], 'TextSettings.Font.Size', 80);

    if TFmxObject(sender).Tag=1 then win;
  end;
end;

procedure TSeazonForm.s0MouseEnter(Sender: TObject);
var
  id:shortint;
begin
  id:=main.Children.IndexOf(TFmxObject(sender));
  if (shw<0)and(id<>lst) then
  begin
    TAnimator.AnimateInt(Main.Children[lst].Children[0].Children[0], 'TextSettings.Font.Size', 40);
    TAnimator.AnimateFloat(Main.Children[lst], 'width', w);

    TAnimator.AnimateInt(TFmxObject(sender).Children[0].Children[0], 'TextSettings.Font.Size', 52);
    TAnimator.AnimateFloat(Main, 'Position.X', -(80*TFmxObject(sender).Tag/3));
    TAnimator.AnimateFloat(TFmxObject(sender), 'width', 80+w);
    lst:=id;
  end;
end;

end.
