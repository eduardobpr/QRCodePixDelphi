program Pix;

uses
  Vcl.Forms,
  UPIX in 'UPIX.pas' {Form1},
  DelphiZXIngQRCode in '..\PROTOTIPOS\PROJETO QRCODE PIX\DelphiZXIngQRCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
