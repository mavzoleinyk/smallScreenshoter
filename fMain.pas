unit fMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, windows;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Screen1: TImage;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  BMP1: Graphics.TBitmap;
  DC1: HDC;
  image1: TImage;

implementation

{$R *.lfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  form1.Visible := false;
  Sleep(15);
  BMP1 := Graphics.TBitmap.Create;

  BMP1.Height := Screen.Height;
  BMP1.Width := Screen.Width;
  DC1 := getdc(0);

  BitBlt(BMP1.Canvas.Handle, 0,0, Screen.Width, Screen.Height, DC1, 0,0, SRCCOPY);
  form1.Visible := true;
  image1 := TImage.Create(nil);
  //BMP1.IgnorePalette := True;
  image1.Picture.Assign(BMP1);
  BMP1.SaveToFile('c:\1.bmp');
  end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Screen1.Show;
  if FileExists('c:\1.bmp') then
    Screen1.Picture.LoadFromFile('c:\1.bmp');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if FileExists('c:\1.bmp') then
    DeleteFile('c:\1.bmp');
    Screen1.Hide;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    BMP1.SaveToFile(SaveDialog1.FileName)
  else
    ShowMessage('Файл не был сохранен!');
end;

end.

