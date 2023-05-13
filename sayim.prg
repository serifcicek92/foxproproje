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
	
	
	Procedure getPath
		**a = this.wlogon("serif","\\srv2003","123456")
		**a = this.wlogon("serif","\\192.168.0.217","19921992")
		**a = this.wlogon("um1","\\BSERVER","123456")
		
**SELÇUK		
		a = this.wlogon("um1","\\BSERVER","123456")
		this._BoyutPath="\\BSERVER\BOYUT\DATA\"
		this._BoyutDrive="\\BSERVER\BOYUT\"
		
		
**Kaðýthane 8
		**a = this.wlogon("um1","\\10.5.0.9","123456")
		**this._BoyutPath="\\10.5.0.9\BOYUT\DATA\"
		**this._BoyutDrive="\\10.5.0.9\BOYUT\"
		
**
		*this._BoyutPath="\\192.168.3.11\Boyut\seldata\"
		**this._BoyutDrive="\\192.168.3.11\Boyut\"
		**a = this.wlogon("um1","\\192.168.3.11","123456")
		
		IF DIRECTORY("\\BSERVER\BOYUTC\SELDATA") then
			this._BoyutDrive="\\BSERVER\BOYUTC\"
			this._BoyutPath="\\BSERVER\BOYUTC\SELDATA\"
			return "oldu"
		ENDIF
		
**SAMSUN ÇORUM
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
		**return "olmadý"
		
		
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
**SAYIM GÝR	
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
		subesi = SUBSTR(tabloAdi,AT('.d',tabloAdi)+2,LEN(tabloAdi)-AT('.d',tabloAdi)+1)
		sayimD = SUBSTR(tabloAdi,4,AT('.d',tabloAdi)-4)
		
		INDEXADI = "sy"+sayimD+"1.i"+subesi
		
		**RETURN "sayimd-"+sayimD+"+INDEXADI-"+INDEXADI+"+subesi-"+subesi+"+Tablo adý-"+tabloAdi 
		this.getPath()
		vAdi=""
		**BPATH = "K:\data\"
		BPATH = this._BoyutPath
		
		**IF !FILE(&BPATH.&INDEXADI) then
		IF !FILE(BPATH+INDEXADI) then
			USE &BPATH.&tabloAdi SHARED
			INDEX ON REYON+TANIM+SAYANKISI TO &BPATH.&INDEXADI
			CLOSE DATABASES
			this.wlogout()
			this.getPath()
		ENDIF
		
		tarih = DATE()
		zaman = TIME()
		
		zamansayisi = this.ZamanSayi(tarih,zaman)
		zamansayisi = STR(zamansayisi)
		
		use &BPATH.&tabloAdi index &BPATH.&INDEXADI SHARED ALIAS sym
		SELECT KayitNo FROM &BPATH.&tabloAdi INTO CURSOR crs
		SELECT crs
		this._KayitNo = RECCOUNT()+1
		**iiiiii
		**iiiiii
		INDEXADIIKI = "sy"+sayimD+"2.i"+subesi
		SELECT sym
		IF FILE(BPATH+INDEXADIIKI) then
			SET INDEX TO &BPATH.&INDEXADI,&BPATH.&INDEXADIIKI
		ELSE
			SET INDEX TO &BPATH.&INDEXADI
		ENDIF	
		
		SET ORDER TO "sy"+sayimD+"1"
		GO BOTTOM 
		APPEND BLANK
		replace KayitNo WITH this._KayitNo,Reyon WITH this._Reyon,Graf WITH this._Raf,Tanim WITH this._Tanim,SayanKisi WITH this._SayanKisi,Giren WITH this._Giren,GZaman WITH INT(VAL(zamansayisi)),IlacKodu WITH INT(VAL(this._IlacKodu)),GFiyati WITH INT(VAL(this._GFiyati)),GKutuTipi WITH this._GKutuTipi,GMiad WITH this._GMiad,GSeriNo WITH this._GSeriNo,GMiktar WITH INT(VAL(this._GMiktar)),KDegisti WITH INT(VAL(this._KDegisti))
		**int ler gzaman, ilackodu, gfiyati, gmiktar,d fiyati, dmiktar, bmiktar, sfiyati, smiktar, kdegisti
		**INSERT INTO &BPATH.&tabloAdi(KayitNo,Reyon,Graf,Tanim,SayanKisi,Giren,GZaman,IlacKodu,GFiyati,GKutuTipi,GMiad,GSeriNo,GMiktar,KDegisti) VALUES (this._KayitNo,this._Reyon,this._Raf,this._Tanim,this._SayanKisi,this._Giren,INT(VAL(zamansayisi)),INT(VAL(this._IlacKodu)),INT(VAL(this._GFiyati)),this._GKutuTipi,this._GMiad,this._GSeriNo,INT(VAL(this._GMiktar)),INT(VAL(this._KDegisti)))
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
		IF FILE(this._BoyutPath+dosyaAdi) THEN
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
	
	
	PROCEDURE getIlacBilgileri(barkod, cno)
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
		

		idx = "ibkodu.idx"
		**BPATH = SUBSTR(this._BoyutPath,1,3)
		BPATH = this._BoyutPath
		
		**USE &BPATH		
		
		**REGÝON BARKOD.DBF
		IlackoduToBarkod=""
		ikodukod="0"
		
		IF LEN(cno)==0 OR LEN(barkod)<5 then
			CLOSE DATABASES
			this.wlogout()
			RETURN null
		endif
		
		
		
		**USE &BPATH.ILACLAR INDEX &BPATH.ibkodu SHARED ALIAS ilc
		USE &BPATH.ILACLAR SHARED ALIAS ilc
		IF EMPTY(CDX(1))
			**TEST ET ÜST
			SET INDEX TO &BPATH.ibkodu
		ENDIF 
		**SET INDEX TO &BPATH.ibkodu
		SET ORDER TO IBKODU   && BARKODU
		SEEK barkod
		
		txtHatalar = txtHatalar + "ilaçlar ilk found " +IIF(FOUND() = .T. ,"TRUE","FALSE")+"---"
		
		IF NOT FOUND()
			txtHatalar = txtHatalar + "Barkod Ýlaclar Dosyasýnda Bulunamadý"
			
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
			
			
			**ENDDO 
		endif    
		
		IF FOUND() .and. !DELETED()
		
			ikodukod = ALLTRIM(STR(ilc.ILACKODU))
			txtHatalar = txtHatalar + "--Found ikodu.kod : "+ ikodukod + "--"
			**RETURN ilc.ilacadi
		
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
				**?ikd
				
				USE &BPATH.ilaccep INDEX &BPATH.ILACCEP.CDX IN 0 SHARED ALIAS cpdpilclar				
				SELECT cpdpilclar
				SET INDEX TO &BPATH.ILACCEP
				SET ORDER TO ILACCEP1
				SEEK STR(VAL(ikodukod),6)+cno
				**SEEK STR(ilc.ilackodu,6)+cno
				LOCATE WHILE ilackodu=INT(VAL(ikodukod)) .and. cepno=ALLTRIM(cno)
				BESLEMERAF = cpdpilclar.beslemeyer
				
				BESLEMERAF = STRTRAN(BESLEMERAF,"\","\\")
				AMBARRAFF =  STRTRAN(AMBARYERI,"\","\\")
				
				txtHatalar = txtHatalar + "--BESLEMERAF  : "+ BESLEMERAF + "--"
				
				
				**USE &BPATH.ilacprt INDEX &BPATH.ilacprt1.idx IN 0 SHARED ALIAS prt
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
				
				SEEK STR(INT(VAL(ikodukod)),6)+cno
				LOCATE WHILE ilackodu=INT(VAL(ikodukod)) .and. cepno=ALLTRIM(cno) FOR miktari>0 .or. satismik>0 .or. cfiyati>=ilc.fiyati .and. !ISNULL(tarih) .and. (kilitli='H' .or. kilitli='')
				test = ALLTRIM(STR(prt.ilackodu))
				
				txtHatalar = txtHatalar + "use ilacprt de ilaç kodu  : " + test + "--"
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
				
				IF LEN(ALLTRIM(prt.raf))<6 then
					AMBARRAFF = ALLTRIM(prt.raf)+" "+AMBARRAFF
				ELSE LEN(ALLTRIM(prt.raf))>5
					AMBARRAFF = ALLTRIM(prt.raf)
				ENDIF
		
				SELECT prt
				jsonString = jsonString + "{'ilacadi':'"+STRTRAN(STRTRAN(ALLTRIM(ilc.ilacadi),"'"," "),"\"," ")+"',"
				jsonString = jsonString + "'barkodu':'"+ALLTRIM(ilc.barkodu)+"',"
				jsonString = jsonString + "'ilackodu':'"+ALLTRIM(STR(ilc.ilackodu))+"',"
				jsonString = jsonString + "'kututipi':'"+ALLTRIM(prt.kututipi)+"',"
				jsonString = jsonString + "'fiyati':'"+ALLTRIM(STR(prt.CFiyati,15))+"',"
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
				
				test = test + "-sonrasý"+ALLTRIM(STR(ilc.ilackodu))
				SELECT ilc
				USE
				** ctod(tarih)
			CLOSE DATABASES
			this.wlogout()
			
			RETURN jsonString	
					
			**RETURN TEST  + "-GELEN JSON STRÝNG:"+jsonString
			RELEASE ALL
			
		ENDIF
		CLOSE DATABASES	
		this.wlogout()
		
		
	ENDPROC
**ÝLAÇ PARTÝDEN SORGULAMA
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
		**eklendi üst taraf
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
	
**ÞUBE NO SORGULAMA
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
		**INDEX ON fieldAdý TAG oluþacakindexadi ** index oluþtur
		**SET ORDER TO ÝNDEXADI **ÝNDDEX SEÇ
		**FIND aranacakindex
		**SKIP **sonraki kayýda geçer bulunanlardan
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
	
	
**RAF DEÐÝÞTÝR--------------------------------------------------------------------------------------------
	PROCEDURE rafDegistir(ikkodu,cno,iffiyat,draf,byer,miktr,dreyon)
		this.getPath()
		gilackodu = INT(VAL(ikkodu))	
			
		BPATH = this._BoyutPath
		
		
		
		**USE &BPATH.ilacprt INDEX &BPATH.ilacprt1.idx IN 0 SHARED ALIAS prt
		**SET ORDER TO ILACPRT1
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
			RETURN "deðer eþleþmedi"
		ENDIF 
		
		metin = 'Kodu=' + str(prt.ilackodu) + 'CEP = ' + prt.cepno + 'Fiyat = ' + str(prt.cfiyati)
		
		
		REPLACE prt.raf WITH draf
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
			replace cpdpilclar.beslemeyer WITH byer
		ENDIF 
		
		
		CLOSE DATABASES
		this.wlogout()	
		
		RETURN degisenraf 
		RELEASE ALL 				
	ENDPROC
	
**END RAF DEÐÝÞTÝR--------------------------------------------------------------------------------------------	

**SEPET GÝRÝÞ --------------------------------------------------------------------------------------------
	PROCEDURE sepetGiris(sptNo,cno)
		CLOSE DATABASES

		sbno = this.getSubeNo()
 		this.getPath()	
	
		BPATH = this._BoyutPath
		**STKPATH = this.STKPATH
		
		**sepetler için hangi tablo varsa onu al
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
		sepetkodu=sepet.sepetkodu
     	takipno=sepet.takipno 		 
     	sepettarih=sepet.tarih
     	sepetirsrecno = sepet.irsrecno
     	sepeteczanekodu = sepet.eczanekodu
     	sepettakipno = sepet.takipno
     	sepetidosya = sepet.idosya
     	KAPAK = sepet.kapak
        SEPETDURUM = sepet.sepetdurum	
        
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
				JSONdon = JSONdon + ",'tarih':'" + TRANSFORM(ftrrpr.tarih)+"'"
				JSONdon = JSONdon + ",'cepno':'" + ftrrpr.cepno+"'"
				JSONdon = JSONdon + "}"
				
            ENDIF 
            SELECT sepet
			REPLACE KAPAK WITH "D", SEPETDURUM WITH "" FOR SEPETNO=ALLTRIM(sptNo)
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
               **sepet.tarih=date .and. sorguda vardý
                  tkpno=irsrpr.takipno
                  JSONdon = "{'subeno':'" + this.subeKod + "','sepetno':'" + sepetkodu+ "','kapak':'" + KAPAK + "','sepetdurum':'" + SEPETDURUM + "','eczanekodu':'" + sepeteczanekodu+"','takipno':'"+sepettakipno+"'"
         		  **JSONdon = JSONdon+",'faturano':"+this.Fatnocoz(irsrpr.fatseri)+",'tarih':"+irsrpr.tarih+",'cepno':"+irsrpr.cepno+"}"
         		  	JSONdon = JSONdon + ",'faturano':'" + this.Fatnocoz(irsrpr.fatseri)+"'"
					JSONdon = JSONdon + ",'faturano2':''"
					JSONdon = JSONdon + ",'tarih':'" + TRANSFORM(irsrpr.tarih)+"'"
					JSONdon = JSONdon + ",'cepno':'" + irsrpr.cepno+"'"
					JSONdon = JSONdon + "}"
               	  SET DELETED on
               	  SELECT sepet
				  REPLACE KAPAK WITH "D", SEPETDURUM WITH "" FOR SEPETNO=ALLTRIM(sptNo)
               	  CLOSE DATABASES
               	  this.wlogout()
               	  RETURN JSONdon
               ELSE
                  trhbak=irsrpr.tarih
               endif  
        	SET DELETED on	
        	SELECT sepet
			REPLACE KAPAK WITH "D", SEPETDURUM WITH "" FOR SEPETNO=ALLTRIM(sptNo)
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
	
**END SEPET GÝRÝÞ --------------------------------------------------------------------------------------------

**ZAMANSAL ÝÞLEM -------------------------------------------------------------------------------------------
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
**END ZAMANSAL ÝÞLEM -------------------------------------------------------------------------------------------

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
	
ENDDEFINE