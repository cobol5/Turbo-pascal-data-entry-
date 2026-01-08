 
uses Crt;
 
 
type
 
  KayitTipi = record
 
    TCNo: string[11];
 
    AdSoyad: string[30];
 
    AnaAdi: string[20];
 
    BabaAdi: string[20];
 
    DogumYeri: string[30];
 
    DogumTarihi: string[10];
 
    Cinsiyet: char;
 
  end;
 
 
var
 
  Kayit: KayitTipi;
 
  AktifAlan: integer;
 
  Tus: char;
 
  Cikis: boolean;
 
  DosyaAdi: string;
 
 
procedure EkraniHazirla;
 
begin
 
  ClrScr;
 
  TextColor(Yellow);
 
  GotoXY(30, 2);
 
  WriteLn('*** VERİ GİRİŞ FORMU ***');
 
  TextColor(White);
 
  GotoXY(5, 5); Write('TC Kimlik No    : ');
 
  GotoXY(5, 7); Write('Ad Soyad        : ');
 
  GotoXY(5, 9); Write('Ana Adi         : ');
 
  GotoXY(5, 11); Write('Baba Adi        : ');
 
  GotoXY(5, 13); Write('Dogum Yeri      : ');
 
  GotoXY(5, 15); Write('Dogum Tarihi    : ');
 
  GotoXY(5, 17); Write('Cinsiyet (E/K)  : ');
 
  TextColor(LightGray);
 
  GotoXY(5, 22);
 
  Write('Yon Tuslari: Alan degistir | F10: Kaydet | ESC: Cikis');
 
end;
 
 
procedure AlanRenklendir(AlanNo: integer; Aktif: boolean);
 
var
 
  X, Y, Uzunluk, i: integer;
 
  Metin: string;
 
begin
 
  case AlanNo of
 
    1: begin X := 25; Y := 5; Metin := Kayit.TCNo; Uzunluk := 11; end;
 
    2: begin X := 25; Y := 7; Metin := Kayit.AdSoyad; Uzunluk := 30; end;
 
    3: begin X := 25; Y := 9; Metin := Kayit.AnaAdi; Uzunluk := 20; end;
 
    4: begin X := 25; Y := 11; Metin := Kayit.BabaAdi; Uzunluk := 20; end;
 
    5: begin X := 25; Y := 13; Metin := Kayit.DogumYeri; Uzunluk := 30; end;
 
    6: begin X := 25; Y := 15; Metin := Kayit.DogumTarihi; Uzunluk := 10; end;
 
    7: begin X := 25; Y := 17; Metin := Kayit.Cinsiyet; Uzunluk := 1; end;
 
  else
 
    Exit;
 
  end;
 
 
  if Aktif then
 
  begin
 
    TextBackground(Blue);
 
    TextColor(Yellow);
 
  end
 
  else
 
  begin
 
    TextBackground(Black);
 
    TextColor(White);
 
  end;
 
 
  GotoXY(X, Y);
 
  Write(Metin);
 
  for i := Length(Metin) + 1 to Uzunluk do
 
    Write(' ');
 
end;
 
 
function TCNoGecerliMi(TC: string): boolean;
 
var
 
  i: integer;
 
  Gecerli: boolean;
 
begin
 
  Gecerli := True;
 
  if Length(TC) <> 11 then
 
    Gecerli := False
 
  else
 
    for i := 1 to 11 do
 
      if not (TC[i] in ['0'..'9']) then
 
        Gecerli := False;
 
  TCNoGecerliMi := Gecerli;
 
end;
 
 
procedure VeriGir(AlanNo: integer);
 
var
 
  Girdi: string;
 
  X, Y: integer;
 
  Ch: char;
 
  Pos: integer;
 
  MaxUzunluk: integer;
 
  CikisVeriGir: boolean;
 
  i: integer;
 
 
  procedure KaydetVeCikis(Yon: integer);
 
  begin
 
    case AlanNo of
 
      1: Kayit.TCNo := Girdi;
 
      2: Kayit.AdSoyad := Girdi;
 
      3: Kayit.AnaAdi := Girdi;
 
      4: Kayit.BabaAdi := Girdi;
 
      5: Kayit.DogumYeri := Girdi;
 
      6: Kayit.DogumTarihi := Girdi;
 
      7: if Length(Girdi) > 0 then Kayit.Cinsiyet := Girdi[1]
 
         else Kayit.Cinsiyet := ' ';
 
    end;
 
 
    AlanRenklendir(AktifAlan, False);
 
    AktifAlan := AktifAlan + Yon;
 
    if AktifAlan > 7 then AktifAlan := 1;
 
    if AktifAlan < 1 then AktifAlan := 7;
 
    AlanRenklendir(AktifAlan, True);
 
    CikisVeriGir := True;
 
  end;
 
 
begin
 
  case AlanNo of
 
    1: begin X := 25; Y := 5; Girdi := Kayit.TCNo; MaxUzunluk := 11; end;
 
    2: begin X := 25; Y := 7; Girdi := Kayit.AdSoyad; MaxUzunluk := 30; end;
 
    3: begin X := 25; Y := 9; Girdi := Kayit.AnaAdi; MaxUzunluk := 20; end;
 
    4: begin X := 25; Y := 11; Girdi := Kayit.BabaAdi; MaxUzunluk := 20; end;
 
    5: begin X := 25; Y := 13; Girdi := Kayit.DogumYeri; MaxUzunluk := 30; end;
 
    6: begin X := 25; Y := 15; Girdi := Kayit.DogumTarihi; MaxUzunluk := 10; end;
 
    7: begin X := 25; Y := 17; Girdi := Kayit.Cinsiyet; MaxUzunluk := 1; end;
 
  else
 
    Exit;
 
  end;
 
 
  { DÜZELTME: Pos başlangıç değeri doğru ayarlandı }
 
  Pos := Length(Girdi) + 1;
 
  CikisVeriGir := False;
 
 
  repeat
 
    TextBackground(Blue);
 
    TextColor(Yellow);
 
    GotoXY(X, Y);
 
    Write(Girdi);
 
    for i := Length(Girdi) + 1 to MaxUzunluk do
 
      Write(' ');
 
 
    { İmleci doğru konuma getir }
 
    GotoXY(X + Pos - 1, Y);
 
 
    Ch := ReadKey;
 
 
    if Ch = #0 then
 
    begin
 
      Ch := ReadKey;
 
      case Ch of
 
        #72: KaydetVeCikis(-1); { Yukarı }
 
        #80: KaydetVeCikis(1);  { Aşağı }
 
        #75: begin { Sol }
 
          if Pos > 1 then Dec(Pos);
 
        end;
 
        #77: begin { Sağ }
 
          if Pos <= Length(Girdi) then Inc(Pos);
 
          if Pos > Length(Girdi) + 1 then Pos := Length(Girdi) + 1;
 
        end;
 
        #68: begin { F10 }
 
          case AlanNo of
 
            1: Kayit.TCNo := Girdi;
 
            2: Kayit.AdSoyad := Girdi;
 
            3: Kayit.AnaAdi := Girdi;
 
            4: Kayit.BabaAdi := Girdi;
 
            5: Kayit.DogumYeri := Girdi;
 
            6: Kayit.DogumTarihi := Girdi;
 
            7: if Length(Girdi) > 0 then Kayit.Cinsiyet := Girdi[1]
 
               else Kayit.Cinsiyet := ' ';
 
          end;
 
          AlanRenklendir(AktifAlan, False);
 
          CikisVeriGir := True;
 
        end;
 
      end;
 
    end
 
    else if Ch = #27 then { ESC }
 
    begin
 
      case AlanNo of
 
        1: Kayit.TCNo := Girdi;
 
        2: Kayit.AdSoyad := Girdi;
 
        3: Kayit.AnaAdi := Girdi;
 
        4: Kayit.BabaAdi := Girdi;
 
        5: Kayit.DogumYeri := Girdi;
 
        6: Kayit.DogumTarihi := Girdi;
 
        7: if Length(Girdi) > 0 then Kayit.Cinsiyet := Girdi[1]
 
           else Kayit.Cinsiyet := ' ';
 
      end;
 
      AlanRenklendir(AktifAlan, False);
 
      CikisVeriGir := True;
 
    end
 
    else if Ch = #13 then { Enter }
 
    begin
 
      KaydetVeCikis(1);
 
    end
 
    else if Ch = #8 then { Backspace - DÜZELTME }
 
    begin
 
      if Pos > 1 then
 
      begin
 
        Delete(Girdi, Pos - 1, 1);
 
        Dec(Pos);
 
      end;
 
    end
 
    else if (AlanNo = 1) and (Ch in ['0'..'9']) and (Length(Girdi) < MaxUzunluk) then
 
    begin
 
      Insert(Ch, Girdi, Pos);
 
      Inc(Pos);
 
    end
 
    else if (AlanNo in [2, 3, 4, 5, 6]) and (Length(Girdi) < MaxUzunluk) then
 
    begin
 
      Insert(Ch, Girdi, Pos);
 
      Inc(Pos);
 
    end
 
    else if (AlanNo = 7) and (UpCase(Ch) in ['E', 'K']) then
 
    begin
 
      Girdi := UpCase(Ch);
 
      Pos := 2;
 
    end;
 
  until CikisVeriGir;
 
end;
 
 
procedure KayitYap;
 
var
 
  F: Text;
 
begin
 
  if not TCNoGecerliMi(Kayit.TCNo) then
 
  begin
 
    GotoXY(5, 20);
 
    TextColor(LightRed);
 
    Write('HATA: TC Kimlik No 11 haneli rakam olmalidir! ');
 
    TextColor(White);
 
    Delay(2000);
 
    GotoXY(5, 20);
 
    ClrEol;
 
    Exit;
 
  end;
 
 
  DosyaAdi := 'kayitlar.txt';
 
  Assign(F, DosyaAdi);
 
  {$I-}
 
  Append(F);
 
  {$I+}
 
  if IOResult <> 0 then
 
    Rewrite(F);
 
 
  WriteLn(F, '----------------------------');
 
  WriteLn(F, 'TC No        : ', Kayit.TCNo);
 
  WriteLn(F, 'Ad Soyad     : ', Kayit.AdSoyad);
 
  WriteLn(F, 'Ana Adi      : ', Kayit.AnaAdi);
 
  WriteLn(F, 'Baba Adi     : ', Kayit.BabaAdi);
 
  WriteLn(F, 'Dogum Yeri   : ', Kayit.DogumYeri);
 
  WriteLn(F, 'Dogum Tarihi : ', Kayit.DogumTarihi);
 
  WriteLn(F, 'Cinsiyet     : ', Kayit.Cinsiyet);
 
  WriteLn(F, '');
 
  Close(F);
 
 
  GotoXY(5, 20);
 
  TextColor(LightGreen);
 
  Write('Kayit basariyla kaydedildi! ');
 
  TextColor(White);
 
  Delay(1500);
 
  GotoXY(5, 20);
 
  ClrEol;
 
 
  { Kayıtları temizle }
 
  FillChar(Kayit, SizeOf(Kayit), 0);
 
  Kayit.TCNo := '';
 
  Kayit.AdSoyad := '';
 
  Kayit.AnaAdi := '';
 
  Kayit.BabaAdi := '';
 
  Kayit.DogumYeri := '';
 
  Kayit.DogumTarihi := '';
 
  Kayit.Cinsiyet := ' ';
 
 
  AktifAlan := 1;
 
  EkraniHazirla;
 
  AlanRenklendir(1, True);
 
end;
 
 
begin
 
  FillChar(Kayit, SizeOf(Kayit), 0);
 
  Kayit.TCNo := '';
 
  Kayit.AdSoyad := '';
 
  Kayit.AnaAdi := '';
 
  Kayit.BabaAdi := '';
 
  Kayit.DogumYeri := '';
 
  Kayit.DogumTarihi := '';
 
  Kayit.Cinsiyet := ' ';
 
 
  AktifAlan := 1;
 
  Cikis := False;
 
 
  EkraniHazirla;
 
  AlanRenklendir(AktifAlan, True);
 
 
  repeat
 
    Tus := ReadKey;
 
 
    if Tus = #0 then
 
    begin
 
      Tus := ReadKey;
 
      case Tus of
 
        #72: begin { Yukarı Ok }
 
          AlanRenklendir(AktifAlan, False);
 
          Dec(AktifAlan);
 
          if AktifAlan < 1 then AktifAlan := 7;
 
          AlanRenklendir(AktifAlan, True);
 
        end;
 
        #80: begin { Aşağı Ok }
 
          AlanRenklendir(AktifAlan, False);
 
          Inc(AktifAlan);
 
          if AktifAlan > 7 then AktifAlan := 1;
 
          AlanRenklendir(AktifAlan, True);
 
        end;
 
        #68: KayitYap; { F10 }
 
      end;
 
    end
 
    else if Tus = #27 then { ESC }
 
      Cikis := True
 
    else
 
    begin
 
      VeriGir(AktifAlan);
 
    end;
 
  until Cikis;
 
 
  ClrScr;
 
  TextColor(LightGreen);
 
  WriteLn('Program sonlandirildi. Iyi gunler!');
 
  TextColor(White);
 
end.
