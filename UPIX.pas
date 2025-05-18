unit UPIX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, frxClass,
  Data.DB, Datasnap.DBClient, frxDBSet, frxBarcode, frxSmartMemo, frCoreClasses;

type
  TForm1 = class(TForm)
    edtChave: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtBeneficiario: TEdit;
    Label3: TLabel;
    edtCidade: TEdit;
    Label4: TLabel;
    edtValor: TEdit;
    Button1: TButton;
    edtpayload: TEdit;
    Label5: TLabel;
    edtCodTrans: TEdit;
    LabelPayLoad: TLabel;
    ImgQrCodePIX: TImage;
    frxReport1: TfrxReport;
    frxQRCode: TfrxDBDataset;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1payload: TStringField;
    procedure Button1Click(Sender: TObject);
    function PayLoad(ChavePIX: String;Beneficiario: String;Cidade: String;CodTransferencia: String;Valor: Real): String;
    procedure GerarQRCode;
  private

  public

  end;

var
  Form1: TForm1;

implementation
   uses DelphiZXingQRCode;
{$R *.dfm}
function CRC16CCITT(texto: string): WORD;
 const
  polynomial = $1021;
 var
 crc: WORD;
 i, j: Integer;
 b: Byte;
 bit, c15: Boolean;
 begin
  crc := $FFFF;
   for i := 1 to length(texto) do
   begin
   b := Byte(texto[i]);
   for j := 0 to 7 do
    begin
    bit := (((b shr (7 - j)) and 1) = 1);
    c15 := (((crc shr 15) and 1) = 1);
    crc := crc shl 1;
    if (c15 xor bit) then
    crc := crc xor polynomial;
    end;
   end;
   Result := crc and $FFFF;
end;
//////////////////////////////////// Função para gerar o PayLoad //////////////////

procedure TForm1.GerarQRCode;
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  QRCodeBitmap: TBitmap;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := edtpayload.Text;
    QRCode.Encoding := TQRCodeEncoding.qrAuto;
    QRCode.QuietZone := 4;
    QRCodeBitmap := TBitmap.Create;
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
  finally
    QRCode.Free;
  end;
  ImgQRCodePix.Picture.Bitmap := QRCodeBitmap;
  ImgQRCodePix.Repaint;
end;



function TForm1.PayLoad(ChavePIX: String;Beneficiario: String;Cidade: String;CodTransferencia: String;Valor: Real): String;
const Payload_Format_Indicator: String = '000201';
const Merchant_Account_Information: String = '26';
const Merchant_Category_Code :  String = '52040000';
const Transaction_Currency  : String = '530398654';
const Country_Code : String = '5802BR';
const Merchant_Name : String = '59';
const Merchant_City : String = '60';
const Additional_Data_Field_Template : String = '62';
const CRC162 : String = '6304';
Var
 CODPayLoad,Merchant_Account_Information_String,Valor_Total,txid,CRC: String;
begin
  Merchant_Account_Information_String:= '0014BR.GOV.BCB.PIX01'+Length(ChavePIX).ToString+
  ChavePIX;
  Valor_Total:=FormatFloat('#####0.00;00.00',Valor);
  Valor_Total:=StringReplace(Valor_Total,',','.',[]);
  txid:='05'+FormatFloat('00',LengTh(CodTransferencia))+CodTransferencia;
  CODPayLoad:=Payload_Format_Indicator+
  Merchant_Account_Information+Length(Merchant_Account_Information_String).ToString+
  Merchant_Account_Information_String+Merchant_Category_Code+Transaction_Currency+
  FormatFloat('00',Length(Valor_Total))+Valor_Total+Country_Code+Merchant_Name+
  FormatFloat('00',LengTh(Beneficiario))+Beneficiario+Merchant_City+FormatFloat('00',Length(Cidade))+
  cidade+Additional_Data_Field_Template+FormatFloat('00',LengTh(txid))+txid+'6304';
  CRC:=inttohex(CRC16CCITT(CODPayLoad), 4);
  result:=CODPayLoad+CRC;
end;
procedure TForm1.Button1Click(Sender: TObject);

begin
 edtPayLoad.Clear;
 edtPayLoad.Text:=PayLoad(edtChave.Text,edtBeneficiario.Text,edtCidade.Text,edtCodTrans.Text,StrToFloat(edtValor.Text));
 GerarQrCode;


 if not ClientDataSet1.IsEmpty  then
     ClientDataSet1.EmptyDataSet;

 if not ClientDataSet1.Active then
       ClientDataSet1.CreateDataSet;

 ClientDataSet1.Append;
 ClientDataSet1payload.AsString := edtpayload.Text;
 ClientDataSet1.Post;
 frxReport1.ShowReport();
end;

end.
