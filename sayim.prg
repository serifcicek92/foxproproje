SET EXCLUSIVE OFF
**set classlib to myclasslib,_utility
DEFINE CLASS sayim AS Custom OLEPUBLIC
	HIDDEN _KayitNo
	HIDDEN _Reyon
	HIDDEN _Raf
	HIDDEN _Tanim
	HIDDEN _SayanKisi
	HIDDEN _Giren
	HIDDEN _Gzaman
	HIDDEN _IlacKodu
	HIDDEN _GSeriNo
	HIDDEN _GFiyati
	HIDDEN _GKutuTipi
	HIDDEN _GMiad
	HIDDEN _GMiktar
	HIDDEN _KDegisti
	HIDDEN _SayimDosyasi
	HIDDEN _BoyutPath
	HIDDEN _BoyutDrive
	HIDDEN subeKod
	HIDDEN cepKod
	
	FUNCTION init
		this._Reyon =""
		this._Tanim =""
		this._BoyutPath=""
		this.subeKod=""
		this.cepKod=""
		SET EXCLUSIVE off
		
		**this._BoyutPath="\\192.168.0.12\data\selcep\data\"
	ENDFUNC
	
	PROCEDURE wlogon
		PARAMETERS xuser,xdomain,xpassword
		*!*	BOOL LogonUser(
		*!*	  _In_      LPTSTR lpszUsername,
		*!*	  _In_opt_  LPTSTR lpszDomain,
		*!*	  _In_opt_  LPTSTR lpszPassword,
		*!*	  _In_      DWORD dwLogonType,
		*!*	  _In_      DWORD dwLogonProvider,
		*!*	  _Out_     PHANDLE phToken
		*!*	);


		#define LOGON32_PROVIDER_DEFAULT 0
		#define LOGON32_LOGON_INTERACTIVE       2
		#define LOGON32_LOGON_NETWORK           3
		#define LOGON32_LOGON_BATCH             4
		#define LOGON32_LOGON_SERVICE           5
		#define LOGON32_LOGON_UNLOCK            7
		DECLARE integer LogonUser IN AdvApi32.DLL;
		string szUsername,;
		string lpszDomain,;
		string lpszPassword,;
		integer dwLogonType,;
		integer dwLogonProvider,;
		integer @phToken
		DECLARE integer ImpersonateLoggedOnUser IN AdvApi32.DLL integer hToken
		DECLARE integer CloseHandle IN kernel32.DLL integer hToken
		local nToken
		nToken = 0
		=LogonUser(xuser,xdomain,xpassword,LOGON32_LOGON_INTERACTIVE, LOGON32_PROVIDER_DEFAULT, @nToken)
		IF ntoken=0
		   RETURN .f.
		else   
		   =ImpersonateLoggedOnUser(nToken)
		   =closehandle(nToken)  && 28-01-2015
		   RETURN .t.
		endif   
		*
		*
	ENDPROC
	
	
	PROCEDURE wlogout
		DECLARE integer RevertToSelf IN AdvApi32.DLL
		= RevertToSelf()
		RETURN
	
	ENDPROC
	
	PROCEDURE getBoyutDrive
		RETURN this._BoyutDrive
	ENDPROC 
	
	PROCEDURE getBoyutPath
		RETURN this._BoyutPath
	ENDPROC 
	
	
	Procedure getPath
		**a = this.wlogon("serif","\\srv2003","123456")
		**a = this.wlogon("serif","\\192.168.0.217","19921992")
		**a = this.wlogon("um1","\\BSERVER","123456")
		**ANKARA
		**a = this.wlogon("um1","\\192.168.3.19","123456")
		**this._BoyutPath="\\192.168.3.19\BOYUT\DATA\"
		**this._BoyutDrive="\\192.168.3.19\BOYUT\"
**SEL?UK		
		a = this.wlogon("um1","\\BSERVER","123456")
		this._BoyutPath="\\BSERVER\BOYUT\DATA\"
		this._BoyutDrive="\\BSERVER\BOYUT\"
		
		
		
		IF DIRECTORY("\\BSERVER\BOYUTC\SELDATA") then
			this._BoyutDrive="\\BSERVER\BOYUTC\"
			this._BoyutPath="\\BSERVER\BOYUTC\SELDATA\"
			return "oldu"
		ENDIF
		
		**this._BoyutPath="\\192.168.3.19\Boyut\seldata\"
		**this._BoyutDrive="\\192.168.3.19\Boyut\"
		**a = this.wlogon("um1","\\192.168.3.19","123456")
		
		
			
	
**SAMSUN ?ORUM
		**this._BoyutPath="\\10.10.204.8\Boyut\seldata\"
		**this._BoyutDrive="\\10.10.204.8\Boyut\"
		**a = this.wlogon("um1","\\10.10.204.8","123456")

		**IF DIRECTORY("\\10.10.204.8\BOYUTC\SELDATA") then
		**	this._BoyutDrive="\\10.10.204.8\BOYUTC\"
		**	this._BoyutPath="\\10.10.204.8\BOYUTC\SELDATA\"
		**	return "oldu"
		**ENDIF
		
**Altunizade
		**a = this.wlogon("um1","\\10.28.3.9","123456")
		**this._BoyutDrive="\\10.28.3.9\BOYUTC\"
		**this._BoyutPath="\\10.28.3.9\BOYUTC\SELDATA\"
		**return "oldu"

		

**LOCAL
		**this._BoyutPath="\\192.168.3.148\Boyut\data\"
		**this._BoyutDrive="\\192.168.3.148\Boyut\"
		**a = this.wlogon("um1","\\192.168.3.148","123456")
		
		**this._BoyutPath="\\192.168.239.128\Boyut\data\"
		**this._BoyutDrive="\\192.168.239.128\Boyut\"
		**a = this.wlogon("um1","\\192.168.239.128","123456")
		
		**IF .not. FILE(this._BoyutPath+"barkod.dbf") then
		
		**endif
		
		**this._BoyutDrive="\\192.168.0.217\SanalBoyut\"
		
		
		
		**			**this.wlogout()
		**return "olmady"
		
		
		**IF directory("G:") = .T. then
			
			**mtn = "net use k: /delete"
			**RUN &mtn
		
			**this._BoyutPath="G:\data\"
			**this._BoyutDrive ="G:\"
		**ELSE
			**oNet = CREATEOBJECT('WScript.Network')
			**IF DIRECTORY("K:")=.T. then
				**oNet.RemoveNetworkDrive("G:",.T.)
			**ENDIF
			**IF !DIRECTORY("G:") then
				**oNet.MapNetworkDrive('G:','\\srv2003\data\selcep',.T.,'serif','123456')
				**rstxt = "net use K: \\BSERVER\boyut /user:um1 123456 /persistent:Yes"
				**RUN &rstxt
				
				**oNet = CREATEOBJECT('WScript.Network')
				**oNet.MapNetworkDrive('G:','\\BSERVER\boyut',.T.,'UM1','123456')
				
				&&IF !DIRECTORY("G:") then
					**oNet.MapNetworkDrive('G:','\\srv2003\data\selcep',.T.,'serif','123456')
					**oNet.MapNetworkDrive('G:','\\BSERVER\boyutc',.T.,'um1','123456')
					&&IF !DIRECTORY("G:") then
						&&oNet.MapNetworkDrive('G:','\\srv2003\data\selcep',.T.,'serif','123456')
					&&endif
				&&endif
			**endif
			**this._BoyutPath="G:\data\"
			**this._BoyutDrive ="G:\"
		**endif
		
	endproc
	**HIDDEN PROCEDURE SAYIMBILGILERI(Reyon,Tanim)
	**	this._Reyon = Reyon
		**this._Tanim = Tanim		
	**ENDPROC
**SAYIM GYR	
	PROCEDURE Sayimbilgilerigir(Reyon,Raf,Tanim,SayanKisi,Giren,GZaman,IlacKodu,GFiyati,GKutuTipi,GMiad,GSeriNo,GMiktar,KDegisti,SayimDosyasi)
			**this._KayitNo = KayitNo
			this._Reyon = Reyon
			this._Raf = Raf
			this._Tanim = Tanim
			this._SayanKisi = SayanKisi
			this._Giren = Giren
			this._Gzaman = Gzaman
			this._IlacKodu = IlacKodu
			this._GFiyati = GFiyati
			this._GKutuTipi = GKutuTipi
			this._GMiad = GMiad
			this._GSeriNo = GSeriNo
			this._GMiktar = GMiktar
			this._KDegisti = KDegisti
			this._SayimDosyasi = SayimDosyasi
			
			RETURN this.VeriOlustur(SayimDosyasi)		
	ENDPROC
	
	PROCEDURE VeriOlustur(tabloAdi)
		**CD "c:\net\sevkiyatkod\sayim\foxproproje\"
		**CD "k:\data"
		**log
		**this.writeLog("VeriOlustur - " + tabloAdi)
		
		subesi = SUBSTR(tabloAdi,AT('.d',tabloAdi)+2,LEN(tabloAdi)-AT('.d',tabloAdi)+1)
		sayimD = SUBSTR(tabloAdi,4,AT('.d',tabloAdi)-4)
		
		INDEXADI = "sy"+sayimD+"1.i"+subesi
		
		**log
		**this.writeLog("Verileri Olu?tur - INDEXADI - " + INDEXADI)
		
		**RETURN "sayimd-"+sayimD+"+INDEXADI-"+INDEXADI+"+subesi-"+subesi+"+Tablo ady-"+tabloAdi 
		this.getPath()
		
		**log
		**this.writeLog("getPath() tetiklendi")
		
		vAdi=""
		**BPATH = "K:\data\"
		BPATH = this._BoyutPath
		
		**IF !FILE(&BPATH.&INDEXADI) then
		IF !FILE(BPATH+INDEXADI) then
			**log
			**this.writeLog("index yok dbyi felan kapataca??z ve yeniden getpat tet,klencek")
			USE &BPATH.&tabloAdi SHARED
			INDEX ON REYON+TANIM+SAYANKISI TO &BPATH.&INDEXADI
			CLOSE DATABASES
			this.wlogout()
			this.getPath()
			**log
			**this.writeLog("getPath() IF !FILE(BPATH+INDEXADI) then i?inde tetiklendi")
		ENDIF
		
		tarih = DATE()
		zaman = TIME()
		
		**log
		**this.writeLog("zaman sayi hesaplamasi ?ncesi")
		zamansayisi = this.ZamanSayi(tarih,zaman)
		zamansayisi = STR(zamansayisi)
		**this.writeLog("zaman sayi hesaplamasi sonras?")
		
		use &BPATH.&tabloAdi index &BPATH.&INDEXADI SHARED ALIAS sym
		SELECT KayitNo FROM &BPATH.&tabloAdi INTO CURSOR crs
		SELECT crs
		**this._KayitNo = RECCOUNT()+1
		**iiiiii
		**iiiiii
		
		INDEXADIIKI = "sy"+sayimD+"2.i"+subesi
		SELECT sym
		IF FILE(BPATH+INDEXADIIKI) then
			SET INDEX TO &BPATH.&INDEXADI,&BPATH.&INDEXADIIKI
		ELSE
			SET INDEX TO &BPATH.&INDEXADI
		ENDIF	
		**this.writeLog("set order to go bottom")
		SET ORDER TO "sy"+sayimD+"1"
		GO BOTTOM 
		**this.writeLog("Append Blank ?ncesi")
		APPEND BLANK
		**this.writeLog("Append Blank Sonras?")
		replace KayitNo WITH recno(),Reyon WITH this._Reyon,Graf WITH this._Raf,Tanim WITH this._Tanim,SayanKisi WITH this._SayanKisi,Giren WITH this._Giren,GZaman WITH INT(VAL(zamansayisi)),IlacKodu WITH INT(VAL(this._IlacKodu)),GFiyati WITH INT(VAL(this._GFiyati)),GKutuTipi WITH this._GKutuTipi,GMiad WITH this._GMiad,GSeriNo WITH this._GSeriNo,GMiktar WITH INT(VAL(this._GMiktar)),KDegisti WITH INT(VAL(this._KDegisti)) NEXT 1
		**int ler gzaman, ilackodu, gfiyati, gmiktar,d fiyati, dmiktar, bmiktar, sfiyati, smiktar, kdegisti
		**INSERT INTO &BPATH.&tabloAdi(KayitNo,Reyon,Graf,Tanim,SayanKisi,Giren,GZaman,IlacKodu,GFiyati,GKutuTipi,GMiad,GSeriNo,GMiktar,KDegisti) VALUES (this._KayitNo,this._Reyon,this._Raf,this._Tanim,this._SayanKisi,this._Giren,INT(VAL(zamansayisi)),INT(VAL(this._IlacKodu)),INT(VAL(this._GFiyati)),this._GKutuTipi,this._GMiad,this._GSeriNo,INT(VAL(this._GMiktar)),INT(VAL(this._KDegisti)))
		**this.writeLog("veriler olu?turuldu")
		CLOSE DATABASES
		this.wlogout()
		**RELEASE ALL
		RETURN BPATH
	endproc
	
	PROCEDURE VeriSil(kayitNo,tabloAdi)
		**CD "c:\net\sevkiyatkod\sayim\foxproproje\"
		CD "k:\data"
		use tabloAdi exclusive
		DELETE For Kayitno = kayitNo
		pack
		CLOSE DATABASES
		RELEASE ALL
	endproc
	
	FUNCTION getReyon
	
		RETURN this._Reyon + SPACE(1) + this._Tanim
		
		**CD "c:\net\sevkiyatkod\sayim\foxproproje\"
		**use say10930.d01 share
		**SELECT * FROM say10930.d01 INTO CURSOR crs
		**SELECT crs
		**	RETURN RECCOUNT()
		
	ENDFUNC
	
	PROCEDURE sifreKontrol(sifre)
		this.getPath()
		vAdi=""
		**BPATH = "K:\data\"
		BPATH = this._BoyutPath
		**USE &BPATH.kontkull SHARED
		**PT = this._BoyutPath
		USE &BPATH.kontkull SHARED
		SELECT Adi,Ksifre,Kontrolno FROM kontkull WHERE Ksifre = ALLTRIM(sifre) INTO CURSOR crs
		SELECT crs
		IF RECCOUNT() < 1 OR LEN(ALLTRIM(sifre))<2 then
			
			CLOSE DATABASES
			this.wlogout()
			RETURN "0"
			
			RELEASE ALL
		ELSE 
			vAdi = Adi
			CLOSE DATABASES
			this.wlogout()
			RETURN vAdi
			RELEASE ALL
			
		ENDIF
		CLOSE DATABASES
	ENDPROC
	
**SAYIM DOSYASI SORGULAMA
	PROCEDURE sayimDosyasiVarmi(dosyaAdi)
		this.getPath()
		IF FILE(this._BoyutPath+dosyaAdi) = .T. THEN
			dosya = this._BoyutPath+dosyaAdi
			USE &dosya SHARED
			GO top
			LOCATE FOR !DELETED()
			
			IF kdegisti==3 OR kdegisti==9 OR kdegisti==10 THEN 
				RELEASE ALL
				CLOSE DATABASES
				this.wlogout()
				RETURN "0"
			ENDIF 
			CLOSE DATABASES
			RELEASE ALL
			this.wlogout()
			RETURN "1"
		ELSE
			CLOSE DATABASES
			RELEASE ALL
			this.wlogout()
			RETURN "0"
		ENDIF
	endproc
	
	
	
	PROCEDURE getBarkoddanGetir(barkd)
		
		this.getPath()
		jsonString=""
		BPATH = this._BoyutPath
		
		USE &BPATH.ILACLAR SHARED
		IF EMPTY(CDX(1))
			SET INDEX TO &BPATH.ibkodu
		ENDIF 
		SET ORDER TO 1
		SEEK barkd
		**FIND barkd
		IF ISNULL(barkodu) = .T. THEN
			this.wlogout()
			RETURN "null"
		ELSE
			
			**FIND barkd
			jsonString = jsonString + "{'ilacadi':'"+STRTRAN(STRTRAN(ALLTRIM(ilacadi),"'"," "),"\"," ")+"',"
			jsonString = jsonString + "'barkodu':'"+ALLTRIM(barkodu)+"',"
			jsonString = jsonString + "'ilackodu':'"+ALLTRIM(STR(Ilackodu))+"',"
			jsonString = jsonString + "'kututipi':'"+ALLTRIM(kututipi)+"',"
			jsonString = jsonString + "'fiyati':'"+ALLTRIM(STR(Fiyati))+"',"
			jsonString = jsonString + "'raf':'"+ALLTRIM(raf)+"',"
			jsonString = jsonString + "'reyon':'"+ALLTRIM(reyon)+"'}"
			
			CLOSE DATABASES
			this.wlogout()
			RETURN jsonString
			use 
			RELEASE ALL
		ENDIF
	
	ENDPROC
	
	
	PROCEDURE getIlacBilgileri(barkod, cno, lmiadi)
		this.getPath()
		jsonString = ""
		txtilacadi=""
		txtbarkodu=""
		txtilackodu=""
		txtkututipi=""
		txtfiyati=""
		txtraf=""
		txtreyon=""
		txtHatalar=""
		lmiadtakip=""
		

		idx = "ibkodu.idx"
		**BPATH = SUBSTR(this._BoyutPath,1,3)
		BPATH = this._BoyutPath
		
		**USE &BPATH		
		
		**REGYON BARKOD.DBF
		IlackoduToBarkod=""
		ikodukod="0"
		
		IF LEN(cno)==0 OR LEN(barkod)<5 then
			CLOSE DATABASES
			this.wlogout()
			RETURN null
		endif
		
		**this.writeLog("Barkot Okutma ::" + barkod)
		
		**USE &BPATH.ILACLAR INDEX &BPATH.ibkodu SHARED ALIAS ilc
		USE &BPATH.ILACLAR SHARED ALIAS ilc
		IF EMPTY(CDX(1))
			**TEST ET ?ST
			SET INDEX TO &BPATH.ibkodu
		ENDIF 
		**SET INDEX TO &BPATH.ibkodu
		SET ORDER TO IBKODU   && BARKODU
		SEEK barkod
		
		txtHatalar = txtHatalar + "ila?lar ilk found " +IIF(FOUND() = .T. ,"TRUE","FALSE")+"---"
		
		IF NOT FOUND()
			txtHatalar = txtHatalar + "Barkod Ylaclar Dosyasynda Bulunamady"
			
			USE &BPATH.BARKOD INDEX &BPATH.BARKOD.CDX SHARED ALIAS BKOD
			SET ORDER TO BARKODU   && BARKODU
			SEEK barkod
			LOCATE FOR BARKODU=barkod
			**USE &BPATH.BARKOD SHARED IN 0 ALIAS BKOD
		    
		    DO WHILE FOUND()
		    **SCAN FOR FOUND()
		    	IF DELETED() THEN 
		    		txtHatalar = txtHatalar + "--Deleted Record--"
		    		CONTINUE
		    	ELSE
		    		txtHatalar = txtHatalar + "--IlackoduToBarkod " +IlackoduToBarkod  +"--"
			    	IlackoduToBarkod = ALLTRIM(STR(ILACKODU))
					exit
				ENDIF
			**ENDSCAN
			ENDDO
			**IlackoduToBarkod = ALLTRIM(STR(ILACKODU))
		
		    **USE &BPATH.ILACLAR INDEX &BPATH.IIKODU.IDX SHARED ALIAS ilc
		    USE &BPATH.ILACLAR SHARED ALIAS ilc
		    IF EMPTY(CDX(1))
		    	SET INDEX TO &BPATH.IIKODU.IDX
		    ENDIF 
			**SET INDEX TO &BPATH.IIKODU.IDX
			SET ORDER TO IIKODU   && ILACKODU
			**SET ORDER TO 1
			SEEK IlackoduToBarkod
			
			ikodukod = ALLTRIM(STR(ilc.ILACKODU))
			txtHatalar = txtHatalar + "--ikodu.kod : "+ ikodukod + "--"
			
			lmiadtakip = ALLTRIM(ilc.MIADTAKIP)
			
			**ENDDO 
		endif    
		
		IF FOUND() .and. !DELETED()
		
			ikodukod = ALLTRIM(STR(ilc.ILACKODU))
			txtHatalar = txtHatalar + "--Found ikodu.kod : "+ ikodukod + "--"
			**RETURN ilc.ilacadi
			lmiadtakip = ALLTRIM(ilc.MIADTAKIP)
		
		endif
		
		**USE &BPATH.ILACLAR IN 0 SHARED ALIAS ilc
		**SELECT * FROM ilc WHERE ilc.barkodu = '"'+ALLTRIM(barkod)+'"'
		**SELECT crs
		
		IF ikodukod=="0" then
			txtHatalar = txtHatalar + "--ikodu.kod : 0--"
			CLOSE DATABASES
			this.wlogout()
			RETURN "0"
			
			RELEASE ALL
		ELSE
								
				**ikd = ilc.ilackodu
				ikd = ikodukod
				?ikd
				
				USE &BPATH.ilaccep INDEX &BPATH.ILACCEP.CDX IN 0 SHARED ALIAS cpdpilclar				
				SELECT cpdpilclar
				SET INDEX TO &BPATH.ILACCEP
				SET ORDER TO ILACCEP1
				SEEK STR(VAL(ikodukod),6)+cno
				**SEEK STR(ilc.ilackodu,6)+cno
				LOCATE WHILE ilackodu=INT(VAL(ikodukod)) .and. cepno=ALLTRIM(cno)
				BESLEMERAF = cpdpilclar.beslemeyer
				
				BESLEMERAF = STRTRAN(BESLEMERAF,"\","\\")
				**alttaki eklendi
				AMBARRAFF =  STRTRAN(AMBARYERI,"\","\\")
				
				txtHatalar = txtHatalar + "--BESLEMERAF  : "+ BESLEMERAF + "--"
				
				
				**USE &BPATH.ilacprt INDEX &BPATH.ilacprt1.idx IN 0 SHARED ALIAS prt
				USE &BPATH.ilacprt IN 0 SHARED ALIAS prt
				**a?a??dakini ekledim
				SET DELETED ON
				
				SELECT prt
				IF EMPTY(CDX(1))
					IF FILE(BPATH+"ilacprt3.idx")
						SET INDEX TO &BPATH.ilacprt1, &BPATH.ilacprt2, &BPATH.ilacprt3
					ELSE
						SET INDEX TO &BPATH.ilacprt1, &BPATH.ilacprt2
					ENDIF
				ENDIF
			
				
				**SET ORDER TO ILACPRT1 &&DESCENDING   && STR(ILACKODU,6)+CEPNO+STR(CFIYATI,12)+KUTUTIPI+MIAD
				SET ORDER TO 1
				
				SEEK STR(INT(VAL(ikodukod)),6)+cno
				IF lmiadtakip = "E" AND EMPTY(ALLTRIM(lmiadi))=.f. THEN
					LOCATE WHILE ilackodu=INT(VAL(ikodukod)) .and. cepno=ALLTRIM(cno) FOR (miktari>0 .or. satismik>0 .or. cfiyati>=ilc.fiyati) .and. !ISNULL(tarih) .and. (kilitli='H' .or. kilitli='') .and. miad=lmiadi
				ELSE
					LOCATE WHILE ilackodu=INT(VAL(ikodukod)) .and. cepno=ALLTRIM(cno) FOR (miktari>0 .or. satismik>0 .or. cfiyati>=ilc.fiyati) .and. !ISNULL(tarih) .and. (kilitli='H' .or. kilitli='')
				ENDIF  
				test = ALLTRIM(STR(prt.ilackodu))
				
				txtHatalar = txtHatalar + "use ilacprt de ila? kodu  : " + test + "--"
				**ileridegeri=0
				**gidilecekdeger=0
				**varsayilanfiyat = prt.cfiyati
				**DO WHILE prt.ilackodu = ikd
					**SKIP
					**ileridegeri= ileridegeri+1
					**IF prt.cfiyati>varsayilanfiyat then
						**varsayilanfiyat = prt.cfiyati
						**gidilecekdeger=ileridegeri
					**endif
				**ENDDO
				
				**SEEK STR(ilc.ilackodu,6)+cno
				**LOCATE WHILE ilackodu=ilc.ilackodu .and. cepno=ALLTRIM(cno) FOR miktari>0 .or. cfiyati=ilc.fiyati
				**SKIP gidilecekdeger
				
				IF !FOUND() THEN 
					CLOSE DATABASES
					this.wlogout()
					RETURN null
				ENDIF 		
				
				
				SELECT prt
				
				**a?a??dakini ekledim 
				IF LEN(ALLTRIM(prt.raf))<6 then
					AMBARRAFF = ALLTRIM(prt.raf)+" "+AMBARRAFF
				ELSE LEN(ALLTRIM(prt.raf))>5
					AMBARRAFF = ALLTRIM(prt.raf)
				ENDIF
				
		
				
				jsonString = jsonString + "{'ilacadi':'"+STRTRAN(STRTRAN(ALLTRIM(ilc.ilacadi),"'"," "),"\"," ")+"',"
				jsonString = jsonString + "'barkodu':'"+ALLTRIM(ilc.barkodu)+"',"
				jsonString = jsonString + "'ilackodu':'"+ALLTRIM(STR(ilc.ilackodu))+"',"
				jsonString = jsonString + "'kututipi':'"+ALLTRIM(prt.kututipi)+"',"
				jsonString = jsonString + "'fiyati':'"+ALLTRIM(STR(prt.CFiyati,15))+"',"
				**a?a??daki d?zenlendi
				**jsonString = jsonString + "'raf':'"+ALLTRIM(prt.raf)+"',"
				jsonString = jsonString + "'raf':'"+ALLTRIM(AMBARRAFF)+"',"
				jsonString = jsonString + "'miktari':'"+ALLTRIM(STR(prt.miktari))+"',"
				jsonString = jsonString + "'beslemeyer':'"+ALLTRIM(BESLEMERAF)+"',"
				jsonString = jsonString + "'reyon':'"+ALLTRIM(prt.reyon)+"'"
				
				CONTINUE
				
				IF prt.ilackodu == ilc.ilackodu AND prt.cepno==ALLTRIM(cno) AND FOUND()  THEN
				
					jsonString = jsonString + ","
					jsonString = jsonString + "'fiyati2':'"+ALLTRIM(STR(prt.CFiyati,15))+"',"
					jsonString = jsonString + "'reyon2':'"+ALLTRIM(prt.reyon)+"',"
					jsonString = jsonString + "'raf2':'"+ALLTRIM(prt.raf)+"',"
					jsonString = jsonString + "'miktari2':'"+ALLTRIM(STR(prt.miktari))+"',"
					jsonString = jsonString + "'kututipi2':'"+ALLTRIM(prt.kututipi)+"',"
					jsonString = jsonString + "'hatalar':'"+txtHatalar+"'"
				ELSE
					jsonString = jsonString + ","
					jsonString = jsonString + "'fiyati2':'',"
					jsonString = jsonString + "'reyon2':'',"
					jsonString = jsonString + "'raf2':'',"
					jsonString = jsonString + "'miktari2':'',"
					jsonString = jsonString + "'kututipi2':'',"
					jsonString = jsonString + "'hatalar':'"+txtHatalar+"'"
				endif
				
				
				
				jsonString = jsonString +"}"				
				
				test = test + "-sonrasy"+ALLTRIM(STR(ilc.ilackodu))
				SELECT ilc
				USE
				** ctod(tarih)
			CLOSE DATABASES
			this.wlogout()
			
			RETURN jsonString	
					
			**RETURN TEST  + "-GELEN JSON STRYNG:"+jsonString
			RELEASE ALL
			
		ENDIF
		CLOSE DATABASES	
		this.wlogout()
		
		
	ENDPROC
**YLA? PARTYDEN SORGULAMA
	PROCEDURE getIlacPrt(Kodu,Cno)
		this.getPath()
		jsonString = ""
		BPATH = this._BoyutPath
		
		
		USE &BPATH.ilaclar SHARED
		**eklendi alt taraf
		IF EMPTY(CDX(1))
			SET INDEX TO &BPATH.ibkodu
		ENDIF 
		SET ORDER TO IBKODU   && BARKODU
		**eklendi ?st taraf
		SELECT Miktari,Reyon,Raf,fiyati,Kututipi FROM ilaclar WHERE ILACKODU = INT(VAL(ALLTRIM(Kodu))) INTO CURSOR crs
		**SELECT Miktari,Reyon,Raf,Cfiyati,Kututipi FROM ilacprt WHERE ILACKODU = INT(VAL(ALLTRIM(Kodu))) AND Cepno=Cno INTO CURSOR crs
		SELECT crs
		IF RECCOUNT() < 1 then
			
			CLOSE DATABASES
			this.wlogout()
			RETURN "0"
			
			RELEASE ALL
		ELSE 
			GOTO bott
			mktr = 0
			**GO bott
			ryn = Reyon
		    rf = Raf
		    cfyt = fiyati
		    ktip = Kututipi
			GOTO top
			DO WHILE !EOF()
				mktr = mktr+Miktari
				skip
			ENDDO
			
			**scan all
     		**(blah blah)
 			**endscan
			jsonString = "{'Miktari':'"+ALLTRIM(STR(mktr))+"','Reyon':'"+ryn+"','Raf':'"+ALLTRIM(rf)+"','Cfiyati':'"+ALLTRIM(STR(cfyt))+"','Kututipi':'"+ALLTRIM(ktip)+"'}"

			CLOSE DATABASES
			this.wlogout()
			RETURN jsonString 
			RELEASE ALL
			
		ENDIF
		CLOSE DATABASES
	ENDPROC
	
**?UBE NO SORGULAMA
	PROCEDURE getSubeNo()
		this.getPath()
		drv = this._BoyutDrive
		RESTORE FROM &drv.subeno.mem
		this.subeKod=SUBENO
		
		this.wlogout()
		IF VARTYPE(_CEPNO)=="C" then
			this.cepKod=_CEPNO
			RETURN SUBENO+"-"+_CEPNO
		else
			RETURN SUBENO+"-"+"01"
		endif		 
	ENDPROC
	
	
	PROCEDURE getTumIlaclar()
		**INDEX ON fieldAdy TAG olu?acakindexadi ** index olu?tur
		**SET ORDER TO YNDEXADI **YNDDEX SE?
		**FIND aranacakindex
		**SKIP **sonraki kayyda ge?er bulunanlardan
		this.getPath()
		jsonString = ""
		BPATH = this._BoyutPath
		?BPATH
		USE &BPATH.ILACLAR SHARED
		SELECT ilacadi,barkodu,ilackodu,kututipi,fiyati,raf,reyon FROM ILACLAR INTO CURSOR crs
		SELECT crs
		IF RECCOUNT() < 1 then
			CLOSE DATABASES
			this.wlogout()
			RETURN "0"
			
			RELEASE ALL
		ELSE
			say = 0
			jsonString = "[" 
			GOTO top
			DO WHILE !EOF()
				**jsonString = jsonString + "{'ilacadi':'"+ilacadi+"','barkodu':'"+barkodu+"','ilackodu':'"+ilackodu+"','kututipi':'"+kututipi+"','fiyati':'"+fiyati+"','raf':'"+raf+"','reyon':'"+reyon+"'}"
				jsonString = jsonString + "{'ilacadi':'"+STRTRAN(STRTRAN(ALLTRIM(ilacadi),"'"," "),"\"," ")+"',"
				jsonString = jsonString + "'barkodu':'"+ALLTRIM(barkodu)+"',"
				jsonString = jsonString + "'ilackodu':'"+ALLTRIM(STR(Ilackodu))+"',"
				jsonString = jsonString + "'kututipi':'"+ALLTRIM(kututipi)+"',"
				jsonString = jsonString + "'fiyati':'"+ALLTRIM(STR(Fiyati))+"',"
				jsonString = jsonString + "'raf':'"+ALLTRIM(raf)+"',"
				jsonString = jsonString + "'reyon':'"+ALLTRIM(reyon)+"'}"
				
				say = say + 1 
				IF say < RECCOUNT() then
					jsonString = jsonString + ","
				ENDIF	
				skip
			ENDDO
			jsonString = jsonString + "]"
			**scan all
	 		**(blah blah)
	 			**endscan
			
			
			**jsonString = "{'ID':0,'Reyon':'"+ryn+"','Raf':'"+ALLTRIM(rf)+"','Cfiyati':'"+ALLTRIM(STR(cfyt))+"','Kututipi':'"+ALLTRIM(ktip)+"'}"

			CLOSE DATABASES
			this.wlogout()
			RETURN jsonString 
			RELEASE ALL
			
		ENDIF
		CLOSE DATABASES
		
	ENDPROC 
	
	
**RAF DE?Y?TYR--------------------------------------------------------------------------------------------
	PROCEDURE rafDegistir(ikkodu,cno,iffiyat,draf,byer,miktr,dreyon)
		this.getPath()
		gilackodu = INT(VAL(ikkodu))	
			
		BPATH = this._BoyutPath
		
		
		
		**USE &BPATH.ilacprt INDEX &BPATH.ilacprt1.idx IN 0 SHARED ALIAS prt
		**SET ORDER TO ILACPRT1
		
		**alttakini ekledim
        SET DELETED ON
		
		USE &BPATH.ilacprt IN 0 SHARED ALIAS prt
		SELECT prt
		IF EMPTY(CDX(1))
			IF FILE(BPATH+"ilacprt3.idx")
				SET INDEX TO &BPATH.ilacprt1, &BPATH.ilacprt2, &BPATH.ilacprt3
			ELSE
				SET INDEX TO &BPATH.ilacprt1, &BPATH.ilacprt2
			ENDIF
		ENDIF		
		**SET ORDER TO ILACPRT1 &&DESCENDING   && STR(ILACKODU,6)+CEPNO+STR(CFIYATI,12)+KUTUTIPI+MIAD
		SET ORDER TO 1
		SEEK STR(gilackodu,6)+cno
		
		LOCATE WHILE ilackodu=gilackodu .and. cepno=cno FOR miktari=INT(VAL(TRIM(miktr))) .and. cfiyati=INT(VAL(iffiyat)) .and. !ISNULL(tarih)
		
		
		
		IF ilackodu != gilackodu then
			CLOSE DATABASES
			this.wlogout()
			RETURN "deger eslesmedi"
		ENDIF 
		
		metin = 'Kodu=' + str(prt.ilackodu) + 'CEP = ' + prt.cepno + 'Fiyat = ' + str(prt.cfiyati)
		
		
		REPLACE prt.raf WITH draf NEXT 1
		**, prt.reyon WITH dreyon	
		degisenraf = prt.raf	
		USE
		
		IF LEN(byer)>0 then
			USE &BPATH.ilaccep INDEX &BPATH.ILACCEP.CDX IN 0 SHARED ALIAS cpdpilclar				
			SELECT cpdpilclar
			SET INDEX TO &BPATH.ILACCEP
			SET ORDER TO ILACCEP1
			SEEK STR(gilackodu,6)+cno
			LOCATE WHILE ilackodu=gilackodu .and. cepno=ALLTRIM(cno)
			replace cpdpilclar.beslemeyer WITH byer NEXT 1
		ENDIF 
		
		
		CLOSE DATABASES
		this.wlogout()	
		
		RETURN degisenraf 
		RELEASE ALL 				
	ENDPROC
	
**END RAF DE?Y?TYR--------------------------------------------------------------------------------------------	

**SEPET GYRY? --------------------------------------------------------------------------------------------
	PROCEDURE sepetGiris(sptNo,cno, sptDrm)
		CLOSE DATABASES

		sbno = this.getSubeNo()
 		this.getPath()	
	
		BPATH = this._BoyutPath
		**STKPATH = this.STKPATH
		
		**sepetler i?in hangi tablo varsa onu al
    	IF FILE(BPATH+"sepet.dbf")
		   USE &BPATH.sepet SHARED
		ELSE
		   USE &BPATH.sepetler ALIAS sepet SHARED
		endif   
			SELECT 0
			
		USE &BPATH.irsrpr SHARED
		SET ORDER to 0
		SELECT 0
		
		USE &BPATH.ftrrpr SHARED
		IF EMPTY(CDX(1))
		   SET INDEX TO &BPATH.iftrrpr, &BPATH.iftrrprk, &BPATH.iftrrprt
		endif
		SET ORDER TO 1 desc
		SELECT 0
		
		SELECT sepet
		LOCATE FOR SEPETNO = ALLTRIM(sptNo)
		
		**a?a??dakini ekledim
		 IF !FOUND() THEN
			RETURN ""
         ENDIF
		
		sepetkodu=sepet.sepetkodu
     	takipno=sepet.takipno 		 
     	sepettarih=sepet.tarih
     	sepetirsrecno = sepet.irsrecno
     	sepeteczanekodu = sepet.eczanekodu
     	sepettakipno = sepet.takipno
     	sepetidosya = sepet.idosya
     	KAPAK = sepet.kapak
        SEPETDURUM = sepet.sepetdurum	
        JSONdon = ""
        IF right(sepet.idosya,1)="."	
			SELECT ftrrpr
			ftnovar=(TYPE("ftrrpr->faturano")="C")
			ftno=IIF(ftnovar,LEFT(sepetidosya,7),VAL(sepetidosya))
       		SEEK ftno
       		IF FOUND() 
       			**.and.ftrrpr.eczanekodu=sepeteczanekodu .and.ftrrpr.takipno<>sepettakipno
                takipno=ftrrpr.takipno 
	            bolgeNo = ftrrpr.bolge
				JSONdon = "{'subeno':'" + this.subeKod+ "','sepetno':'" + sepetkodu+ "','kapak':'" + KAPAK + "','sepetdurum':'" + SEPETDURUM + "','eczanekodu':'" + sepeteczanekodu+"','takipno':'"+sepettakipno+"'"
				JSONdon = JSONdon + ",'faturano':'" + this.Fatnocoz(ftrrpr.faturano)+"'"
				JSONdon = JSONdon + ",'faturano2':''"
				**alttakini d?zenledim
				**JSONdon = JSONdon + ",'tarih':'" + TRANSFORM(ftrrpr.tarih)+"'"
				JSONdon = JSONdon + ",'tarih':'" + TTOC(ftrrpr.tarih)+"'"
				JSONdon = JSONdon + ",'cepno':'" + ftrrpr.cepno+"'"
				JSONdon = JSONdon + "}"
				
            ENDIF 
            SELECT sepet
			REPLACE KAPAK WITH "D", SEPETDURUM WITH sptDrm NEXT 1
			**FOR SEPETNO=ALLTRIM(sptNo)
            CLOSE DATABASES
			
			this.wlogout()
           RETURN JSONdon
        ELSE 
        	SET DELETED off
        		SELECT irsrpr					
				if sepetirsrecno>recc().or.sepetirsrecno=0
				   go bott
				   on error *
				   skip iif(eof(),0,1)
				   **on error do hata with lineno()
				else
				   go sepetirsrecno 
				endif
				**IF eczanekodu=sepet.eczanekodu.and.cepno=_cepno
	              ** =LOGYAZ("FORM1.KEYPRESS:"+ALLTRIM(STR(LINENO())))
	              SELECT sepet
	              SELECT irsrpr
               IF sepet.tarih=DATE() .and. sepet.bitzaman > this.zamansayi(DATE(),TIME())-120    
               **sepet.tarih=date .and. sorguda vardy
                  tkpno=irsrpr.takipno
                  JSONdon = "{'subeno':'" + this.subeKod + "','sepetno':'" + sepetkodu+ "','kapak':'" + KAPAK + "','sepetdurum':'" + SEPETDURUM + "','eczanekodu':'" + sepeteczanekodu+"','takipno':'"+sepettakipno+"'"
         		  **JSONdon = JSONdon+",'faturano':"+this.Fatnocoz(irsrpr.fatseri)+",'tarih':"+irsrpr.tarih+",'cepno':"+irsrpr.cepno+"}"
         		  	JSONdon = JSONdon + ",'faturano':'" + this.Fatnocoz(irsrpr.fatseri)+"'"
					JSONdon = JSONdon + ",'faturano2':''"
					SONdon = JSONdon + ",'tarih':'" + TTOC(irsrpr.tarih)+"'"
					**JSONdon = JSONdon + ",'tarih':'" + TRANSFORM(irsrpr.tarih)+"'"
					JSONdon = JSONdon + ",'cepno':'" + irsrpr.cepno+"'"
					JSONdon = JSONdon + "}"
               	  SET DELETED on
               	  SELECT sepet
				  REPLACE KAPAK WITH "D", SEPETDURUM WITH "" NEXT 1
				  **FOR SEPETNO=ALLTRIM(sptNo)
               	  CLOSE DATABASES
               	  this.wlogout()
               	  RETURN JSONdon
               ELSE
                  trhbak=irsrpr.tarih
               endif  
        	SET DELETED on	
        	SELECT sepet
			REPLACE KAPAK WITH "D", SEPETDURUM WITH sptDrm NEXT 1
			**FOR SEPETNO=ALLTRIM(sptNo)
        	CLOSE DATABASES
        	this.wlogout()
        	RETURN ""
        ENDIF 
        
		 
		**USE &BPATH.SEPETLER SHARED
		**REPLACE KAPAK WITH "D", SEPETDURUM WITH "" FOR SEPETNO=ALLTRIM(sptNo)
		
		CLOSE DATABASES
		this.wlogout()	
		
		RELEASE ALL	
		RETURN metin
	ENDPROC
	
**END SEPET GYRY? --------------------------------------------------------------------------------------------

**ZAMANSAL Y?LEM -------------------------------------------------------------------------------------------
	Procedure ZamanSayi
	parameter ptrh,psaat
	private zmnsy
	**if type("ptrh")<>"D"
	  **ptrh  = boyutdate()  
	  **psaat = boyutzaman()  
	**endif
	zmnsy=(ptrh-ctod("01/01/2001"))*1440+val(left(psaat,2))*60+val(subs(psaat,4,2))
	?zmnsy
	return zmnsy

	**------------------------------------------------------------------------------
	procedure ZamanText
	param pzmn, ptype
	priv gunblm, saatblm, dkblm, dondgr
	if pzmn<1000000
	   pzmn=pzmn+10000000
	endif
	gunblm=ctod("01/01/2001")+int(pzmn/1440)
	saatblm=int(mod(pzmn,1440)/60)
	dkblm=mod(mod(pzmn,1440),60)
	do case
	   case ptype="T"
	       **dondgr=sifir(saatblm,2)+":"+sifir(dkblm,2)
	   case ptype="DT"
	       **dondgr=Dtoc(gunblm)+" "+sifir(saatblm,2)+":"+sifir(dkblm,2)
	   case ptype="D"
	       dondgr=gunblm
	endcase   
	return dondgr
**END ZAMANSAL Y?LEM -------------------------------------------------------------------------------------------

	PROCEDURE DBKAPAT
		CLOSE DATABASES
		RELEASE ALL
		this.wlogout()	
	ENDPROC

	PROCEDURE getDrivePath
		this.getPath()
		drv = this._BoyutDrive
		RETURN drv
	ENDPROC
	
	
	*----------------------------------------------------------------------------------------------
	Procedure TexttoLong
		para hexs
		PRIVATE K, SS, NUMS
		nums=0
		if hexs=space(4)
		   return nums
		endif

		for k=iif(nums<0,2,1) to 4
		    ss=asc(subs(hexs,k,1))-33
		    if ss<210 .and. ss>=0
		       nums=nums+ss*(210**(4-k))
		    endif
		endfor
		NUMS=nums*iif(subs(hexs,1,1)=chr(31),-1,1)
		return nums
	ENDPROC 
	*----------------------------------------------------------------------------------------------
	
	Procedure FatnoCoz
		Param pfno
		Private dondgr,kk, nmrc
		nmrc=.t.
		do case
		case pfno="CF".and.val(subs(pfno,3))<>0
		  if nmrc
		     dondgr=val(subs(pfno,3))
		  else
		     dondgr=pfno
		  endif   

		otherwise
		  for kk=1 to len(pfno)
		   if .not. subs(pfno,kk,1)$" 0123456789-"
		      nmrc=.f.
		      exit
		   endif
		  next
		  if nmrc
		     dondgr=pfno
		  else
		     dondgr=substr(pfno,5,3)+str(this.TexttoLong(pfno),7)
		  endif   
		endcase
		return dondgr
	ENDPROC
*---------------------------------------------------------
	proc terscevir
	para prmstr
	private kk,gecstr
	gecstr=""
	for kk=1 to len(prmstr)
	    gecstr=gecstr+subs(prmstr,len(prmstr)-kk+1,1)
	next
	retu gecstr
	ENDPROC 
*--------------------------------------------------------
	proc strsfryap
		para prmstr
		private donstr,gecstr,kk
		gecstr=this.terscevir(prmstr)
		donstr=""
		for kk=1 to len(gecstr)
		    donstr=donstr+ chr(mod( asc(subs(gecstr,kk,1))+ (49-mod(kk,48)) , 256))
		next
	retu donstr
	ENDPROC 
	*--------------------------------------------------------
	proc strsfrcoz
		para prmstr
		private donstr,kk
		donstr=""
		for kk=1 to len(prmstr)
		    if asc(subs(prmstr,kk,1)) >= (49-mod(kk,48))
		       donstr=donstr+chr(asc(subs(prmstr,kk,1))- (49-mod(kk,48)))
		    else
		       donstr=donstr+chr(asc(subs(prmstr,kk,1))+256 - (49-mod(kk,48)) )
		    endif      
		next
		donstr=this.terscevir(donstr)
	retu donstr 
	ENDPROC 
*--------------------------------------------------------

	PROCEDURE writeLog(txt)
		dosya = "C:\NET\foxlog.txt"
		metin = TTOC(DATE()) + "  "+TIME()+"===="+txt
		
		STRTOFILE(metin+CHR(13) + CHR(10),dosya,.T.)
		
		**IF FILE(dosya) then
			**APPEND FROM (metin) to (dosya)
**		ELSE
	**		STRTOFILE(metin,dosya)
		**ENDIF 		
	ENDPROC 	
	


*------------------------------------------------------
*------------------------------------------------------
*------------------------------------------------------
*-- public setter
   PROCEDURE SetSayimDosyasi(cDosya)
      THIS._SayimDosyasi = cDosya
   ENDPROC
   
*====================================================
PROCEDURE jsonParse(cJson)
*====================================================
    LOCAL oRet, i, cPairs, aPairs[1], nCount
    LOCAL cPair, nColon, cKey, cVal
    
    *--- Temizlik
    cJson = STRTRAN(cJson, CHR(13), "")
    cJson = STRTRAN(cJson, CHR(10), "")
    cJson = STRTRAN(cJson, CHR(9), "")
    cJson = ALLTRIM(cJson)
    
    *--- Dýþ { } kaldýr
    IF LEFT(cJson, 1) = "{"
        cJson = SUBSTR(cJson, 2)
    ENDIF
    IF RIGHT(cJson, 1) = "}"
        cJson = LEFT(cJson, LEN(cJson) - 1)
    ENDIF
    
    *--- Obje oluþtur
    oRet = CREATEOBJECT("Empty")
    
    *--- Basit split: "Key":"Value", þeklinde ayýr
    LOCAL cBuffer, lInString, nLen, cChar, cPrevChar
    cBuffer = ""
    lInString = .F.
    nLen = LEN(cJson)
    
    DIMENSION aPairs[1]
    LOCAL nPairCount
    nPairCount = 0
    
    FOR i = 1 TO nLen
        cChar = SUBSTR(cJson, i, 1)
        cPrevChar = IIF(i > 1, SUBSTR(cJson, i - 1, 1), "")
        
        *--- String içinde mi kontrol et
        IF cChar = '"' AND cPrevChar != "\"
            lInString = !lInString
        ENDIF
        
        *--- Virgül bulunca ayýr (ama string içinde deðilse)
        IF cChar = "," AND !lInString
            nPairCount = nPairCount + 1
            DIMENSION aPairs[nPairCount]
            aPairs[nPairCount] = cBuffer
            cBuffer = ""
        ELSE
            cBuffer = cBuffer + cChar
        ENDIF
    ENDFOR
    
    *--- Son pair'i ekle
    IF !EMPTY(cBuffer)
        nPairCount = nPairCount + 1
        DIMENSION aPairs[nPairCount]
        aPairs[nPairCount] = cBuffer
    ENDIF
    
    *--- Her pair'i iþle
    FOR i = 1 TO nPairCount
        cPair = ALLTRIM(aPairs[i])
        
        *--- Ýlk : karakterini bul (value içinde : olabilir)
        nColon = AT(":", cPair)
        
        IF nColon > 0
            *--- Key
            cKey = ALLTRIM(LEFT(cPair, nColon - 1))
            cKey = STRTRAN(cKey, '"', "")
            
            *--- Value
            cVal = ALLTRIM(SUBSTR(cPair, nColon + 1))
            cVal = STRTRAN(cVal, '"', "")
            
            *--- null kontrolü
            IF UPPER(cVal) == "NULL"
                cVal = ""
            ENDIF
            
            *--- Boolean kontrolü
            IF UPPER(cVal) == "TRUE"
                cVal = .T.
            ENDIF
            IF UPPER(cVal) == "FALSE"
                cVal = .F.
            ENDIF
            
            *--- Sayý kontrolü (sadece rakamsa)
            **IF ISDIGIT(ALLTRIM(cVal)) OR (LEFT(ALLTRIM(cVal), 1) = "-" AND ISDIGIT(SUBSTR(ALLTRIM(cVal), 2)))
                **cVal = VAL(cVal)
            **ENDIF
            
            *--- Property ekle
            TRY
                ADDPROPERTY(oRet, cKey, cVal)
            CATCH
                *--- Hatalý key varsa atla
            ENDTRY
        ENDIF
    ENDFOR
    
    RETURN oRet
ENDPROC



	*====================================================
	PROCEDURE SayimKayitEkle(cJson)
	*====================================================
		LOCAL oJson, bPath, tablo, index1, lnRecNo
		oJson = this.jsonParse(cJson)
		
		IF ISNULL(oJson)    
			MESSAGEBOX("JSON parse edilemedi!")    
			RETURN .F.
		ENDIF
		
		*DISPLAY MEMORY LIKE oJson.* TO FILE c:\net\jsonProps.txt
		
		THIS.getPath()
		bPath  = THIS._BoyutPath
		tablo  = THIS._SayimDosyasi
		
		subesi = SUBSTR(tablo,AT('.d',tablo)+2,LEN(tablo)-AT('.d',tablo)+1)
		sayimD = SUBSTR(tablo,4,AT('.d',tablo)-4)
		
		*index1 = "sy" + SUBSTR(tablo,4,AT(".d",tablo)-4) + "1.i" + SUBSTR(tablo,AT(".d",tablo)+2)
		index1 = "sy"+sayimD+"1.i"+subesi

		IF !FILE(bPath + index1)
		   USE (bPath + tablo) SHARED
		   INDEX ON Reyon + Tanim + Sayankisi TO (bPath + index1)
		   CLOSE DATABASES
		   this.wlogout()
		   this.getPath()
		   USE
		ENDIF

		USE (bPath + tablo) INDEX (bPath + index1) SHARED AGAIN ALIAS sym
		SELECT sym
		APPEND BLANK
		lnRecNo = RECNO("sym")

		tarih = DATE()
		zaman = TIME()		
		**log
		**this.writeLog("zaman sayi hesaplamasi ?ncesi")
		zamansayisi = this.ZamanSayi(tarih,zaman)
		zamansayisi = STR(zamansayisi)
		
		REPLACE ;
		   KayitNo    WITH lnRecNo,					 ; 
		   Reyon      WITH PADR(oJson.Reyon,2),      ;
		   Tanim      WITH PADR(oJson.Tanim,5),      ;
		   Reyontip   WITH PADR(oJson.Reyontip,1),   ;
		   Sayankisi  WITH PADR(oJson.Sayankisi,10), ;
		   Giren      WITH PADR(oJson.Giren,8),      ;
		   L2dvar     WITH PADR(oJson.L2dvar,1),     ;
		   Gzaman     WITH VAL(zamansayisi),         ;
		   Ilackodu   WITH VAL(oJson.Ilackodu),      ;
		   Gfiyati    WITH VAL(oJson.Gfiyati),       ;
		   Gkututipi  WITH PADR(oJson.Gkututipi,1),  ;
		   Gmiad      WITH PADR(oJson.Gmiad,4),      ;
		   Gserino    WITH PADR(oJson.Gserino,10),   ;
		   Gmiktar    WITH VAL(oJson.Gmiktar),       ;
		   Graf       WITH PADR(oJson.Graf,5),       ;
		   Dfiyati    WITH VAL(oJson.Dfiyati),       ;
		   Dkututipi  WITH PADR(oJson.Dkututipi,1),  ;
		   Dmiad      WITH PADR(oJson.Dmiad,4),      ;
		   Dmiktar    WITH VAL(oJson.Dmiktar),       ;
		   Duzelten   WITH PADR(oJson.Duzelten,10),  ;
		   Daciklama  WITH PADR(oJson.Daciklama,25), ;
		   Bmiktar    WITH VAL(oJson.Bmiktar),       ;
		   Bfisno     WITH PADR(oJson.Bfisno,6),     ;
		   Bfissirano WITH PADR(oJson.Bfissirano,2), ;
		   Breyon     WITH PADR(oJson.Breyon,2),     ;
		   Braf       WITH PADR(oJson.Braf,5),       ;
		   Sfiyati    WITH VAL(oJson.Sfiyati),       ;
		   Skututipi  WITH PADR(oJson.Skututipi,1),  ;
		   Smiad      WITH PADR(oJson.Smiad,4),      ;
		   Smiktar    WITH VAL(oJson.Smiktar),       ;
		   Saciklama  WITH PADR(oJson.Saciklama,25), ;
		   Sduzelten  WITH PADR(oJson.Sduzelten,10), ;
		   Kdegisti   WITH VAL(oJson.Kdegisti),      ;
		   Kayitb     WITH PADR(oJson.Kayitb,10),    ;
		   Bduzelt    WITH VAL(oJson.Bduzelt),       ;
		   Baciklama  WITH PADR(oJson.Baciklama,25), ;
		   Bduzelten  WITH PADR(oJson.Bduzelten,10)
		CLOSE DATABASES
		RETURN "OK:"+TRANSFORM(lnRecNo)
	ENDPROC

	*====================================================
	PROCEDURE SayimKayitGuncelle(cJson)
	*====================================================        && {"KayitNo":123,"Reyon":"AA", ... 37 alan }
		LOCAL oJson, cPath, cTable, returnVal, lnRecNo

		oJson = this.jsonParse(cJson)   && jsonParse.prg yukarýdaki gibi
		THIS.getPath()
		cPath  = THIS._BoyutPath
		cTable = THIS._SayimDosyasi
		
		lnKayitNo = VAL(oJson.KayitNo)

		USE (cPath + cTable) SHARED AGAIN ALIAS sym
		LOCATE FOR kayitno = lnKayitNo
		*SELECT sym

		*lnRecNo = VAL(oJson.KayitNo)
		returnVal = ""
		*IF RECCOUNT() >= lnRecNo AND lnRecNo > 0
		IF found() >= lnRecNo AND lnRecNo > 0
		   *GOTO lnRecNo
		   IF !DELETED()
		      *----- 3) güncelle (eski REPLACE bloklarý) -----
		      REPLACE ;
		         Graf      WITH PADR(oJson.Graf,5),       ;
		         Gzaman    WITH VAL(oJson.Gzaman),        ;
		         Gfiyati   WITH VAL(oJson.Gfiyati),       ;
		         Gkututipi WITH PADR(oJson.Gkututipi,1),  ;
		         Gmiktar   WITH VAL(oJson.Gmiktar),       ;
		         Dfiyati   WITH VAL(oJson.Dfiyati),       ;
		         Dkututipi WITH PADR(oJson.Dkututipi,1),  ;
		         Dmiad     WITH PADR(oJson.Dmiad,4),      ;
		         Dmiktar   WITH VAL(oJson.Dmiktar),       ;
		         Duzelten  WITH PADR(oJson.Duzelten,10),  ;
		         Daciklama WITH PADR(oJson.Daciklama,25), ;
		         Bmiktar   WITH VAL(oJson.Bmiktar),       ;
		         Bfisno    WITH PADR(oJson.Bfisno,6),     ;
		         Bfissirano WITH PADR(oJson.Bfissirano,2),;
		         Breyon    WITH PADR(oJson.Breyon,2),     ;
		         Braf      WITH PADR(oJson.Braf,5),       ;
		         Sfiyati   WITH VAL(oJson.Sfiyati),       ;
		         Skututipi WITH PADR(oJson.Skututipi,1),  ;
		         Smiad     WITH PADR(oJson.Smiad,4),      ;
		         Smiktar   WITH VAL(oJson.Smiktar),       ;
		         Saciklama WITH PADR(oJson.Saciklama,25), ;
		         Sduzelten WITH PADR(oJson.Sduzelten,10), ;
		         Kdegisti  WITH VAL(oJson.Kdegisti),      ;
		         Kayitb    WITH PADR(oJson.Kayitb,10),    ;
		         Bduzelt   WITH VAL(oJson.Bduzelt),       ;
		         Baciklama WITH PADR(oJson.Baciklama,25), ;
		         Bduzelten WITH PADR(oJson.Bduzelten,10)
		      returnVal = "OK"
		   ELSE
		      returnVal = THIS.SayimKayitEkle(cJson)   && tek JSON gonder
		   ENDIF
		ELSE
		   returnVal = THIS.SayimKayitEkle(cJson)
		ENDIF

		USE          && sadece bu dosyayý kapat
		CLOSE DATABASES
		RETURN returnVal
	ENDPROC
	*====================================================
	PROCEDURE SayimKayitSil(cJson)
	*====================================================
	LOCAL oJson, cPath, cTable, lnRecNo

	oJson   = this.jsonParse(cJson)   && jsonParse.prg yukarýdaki gibi
	*lnRecNo = VAL(oJson.KayitNo)
	lnKayitNo = VAL(oJson.KayitNo)
	THIS.getPath()
	cPath  = THIS._BoyutPath
	cTable = THIS._SayimDosyasi

	USE (cPath + cTable) SHARED AGAIN ALIAS sym
	LOCATE FOR kayitno= lnKayitNo
	*SELECT sym
	*IF RECCOUNT() >= lnRecNo AND lnRecNo > 0
	IF FOUND()
	   *GOTO lnRecNo
	   IF !DELETED()
	      DELETE           && sadece bayrak
	      *PACK            && toplu saatlerde çalýþtýr
	   ENDIF
	ENDIF

	CLOSE DATABASES
	RETURN "OK"
	ENDPROC	
	
	
	*====================================================
	PROCEDURE GetSayimListesi(tcTanim, tcSayankisi)
	*====================================================
	*-- parametre zorunlu
	IF EMPTY(tcTanim) OR EMPTY(tcSayankisi)
	    RETURN "[]"
	ENDIF

	LOCAL bPath, tablo, index1, lcJson, lnCnt, i, cName, cVal, cType, lnFlds, laFld[1]

	THIS.getPath()
	bPath  = THIS._BoyutPath
	tablo  = THIS._SayimDosyasi
	index1 = "sy" + SUBSTR(tablo,4,AT(".d",tablo)-4) + "1.i" + SUBSTR(tablo,AT(".d",tablo)+2)

	*-- index yoksa oluþtur (ayný insert mantýðý)
	IF !FILE(bPath + index1 + ".idx")
	    USE (bPath + tablo) SHARED
	    INDEX ON Reyon + Tanim + Sayankisi TO (bPath + index1)
	    USE
	ENDIF

	*-- indexli aç
	USE (bPath + tablo) INDEX (bPath + index1) SHARED AGAIN ALIAS sym
	SELECT sym

	*-- silinmemiþ + tanim + sayankisi
	SET FILTER TO !DELETED() ;
	        AND Tanim  = tcTanim ;
	        AND Sayankisi = tcSayankisi
	GO TOP

	*-- JSON array oluþtur
	lcJson = "["
	lnCnt  = 0

	SCAN
	    lnCnt = lnCnt + 1
	    lcJson = lcJson + IIF(lnCnt > 1, ",", "") + "{"

	    lnFlds = AFIELDS(laFld, "sym")
	    FOR i = 1 TO lnFlds
	        cName = laFld(i,1)
	        cType = laFld(i,2)
	        cVal  = EVAL(cName)

	        IF ISNULL(cVal) OR EMPTY(cVal)
	            lcJson = lcJson + '"' + cName + '":null'
	        ELSE
	            DO CASE
	                CASE cType $ "N Y F B"   && sayýsal
	                    lcJson = lcJson + '"' + cName + '":' + TRANSFORM(cVal)
	                CASE cType = "L"          && logical
	                    lcJson = lcJson + '"' + cName + '":' + IIF(cVal, "true", "false")
	                CASE cType $ "C M"       && string / memo
	                    cVal = STRTRAN(cVal, "\", "\\")
	                    cVal = STRTRAN(cVal, '"', '\"')
	                    lcJson = lcJson + '"' + cName + '":"' + cVal + '"'
	                OTHERWISE                 && date / datetime
	                    lcJson = lcJson + '"' + cName + '":"' + TTOC(cVal,3) + '"'
	            ENDCASE
	        ENDIF
	        IF i < lnFlds
	            lcJson = lcJson + ","
	        ENDIF
	    ENDFOR
	    lcJson = lcJson + "}"
	ENDSCAN

	lcJson = lcJson + "]"

	CLOSE DATABASES
	RETURN lcJson
	ENDPROC
		
	
ENDDEFINE