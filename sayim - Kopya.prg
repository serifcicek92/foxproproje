DEFINE CLASS sayim AS Custom OLEPUBLIC
	HIDDEN _KayitNo
	HIDDEN _Reyon
	HIDDEN _Raf
	HIDDEN _Tanim
	HIDDEN _SayanKisi
	HIDDEN _Giren
	HIDDEN _Gzaman
	HIDDEN _IlacKodu
	HIDDEN _GFiyati
	HIDDEN _GKutuTipi
	HIDDEN _GMiad
	HIDDEN _GMiktar
	HIDDEN _KDegisti
	HIDDEN _SayimDosyasi
	HIDDEN _BoyutPath
	HIDDEN _BoyutDrive
	
	FUNCTION init
		this._Reyon =""
		this._Tanim =""
		this._BoyutPath=""
		this.getPath()
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
		a = this.wlogon("um1","\\BSERVER","123456")
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
		

		this._BoyutPath="\\BSERVER\BOYUT\DATA\"
		this._BoyutDrive="\\BSERVER\BOYUT\"
		**this._BoyutPath="\\srv2003\data\selcep\data\"
		**this._BoyutDrive="\\srv2003\data\selcep\"
		**this._BoyutPath="\\192.168.0.217\SanalBoyut\data\"
		**IF .not. FILE(this._BoyutPath+"barkod.dbf") then
		
		**endif
		
		**this._BoyutDrive="\\192.168.0.217\SanalBoyut\"
		IF !DIRECTORY("\\BSERVER\data") then
			this._BoyutDrive="\\BSERVER\SELDATA\"
			return "oldu"
		ENDIF
		**this.wlogout()
		return "olmadý"
		
	endproc
	**HIDDEN PROCEDURE SAYIMBILGILERI(Reyon,Tanim)
	**	this._Reyon = Reyon
		**this._Tanim = Tanim		
	**ENDPROC
**SAYIM GÝR	
	PROCEDURE Sayimbilgilerigir(Reyon,Raf,Tanim,SayanKisi,Giren,GZaman,IlacKodu,GFiyati,GKutuTipi,GMiad,GMiktar,KDegisti,SayimDosyasi)
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
		
		use &BPATH.&tabloAdi index &BPATH.&INDEXADI SHARED
		SELECT KayitNo FROM &BPATH.&tabloAdi INTO CURSOR crs
		SELECT crs
		this._KayitNo = RECCOUNT()+1
		**APPEND BLANK
		**replace Reyon WITH this._Reyon, Tanim WITH this._Tanim
		**int ler gzaman, ilackodu, gfiyati, gmiktar,d fiyati, dmiktar, bmiktar, sfiyati, smiktar, kdegisti
		INSERT INTO &BPATH.&tabloAdi(KayitNo,Reyon,Graf,Tanim,SayanKisi,Giren,GZaman,IlacKodu,GFiyati,GKutuTipi,GMiad,GMiktar,KDegisti) VALUES (this._KayitNo,this._Reyon,this._Raf,this._Tanim,this._SayanKisi,this._Giren,INT(VAL(this._Gzaman)),INT(VAL(this._IlacKodu)),INT(VAL(this._GFiyati)),this._GKutuTipi,this._GMiad,INT(VAL(this._GMiktar)),INT(VAL(this._KDegisti)))
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
			
			RELEASE ALL
			this.wlogout()
			RETURN "1"
		ELSE
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
		SET INDEX TO &BPATH.ibkodu
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

		idx = "ibkodu.idx"
		**BPATH = SUBSTR(this._BoyutPath,1,3)
		BPATH = this._BoyutPath
		**USE &BPATH		
		
		**REGÝON BARKOD.DBF
		ikodutobarkod=""
		ikodukod="0"
		
		
		
		USE &BPATH.ILACLAR INDEX &BPATH.ibkodu SHARED ALIAS ilc
		SET INDEX TO &BPATH.ibkodu
		SEEK barkod
		
		IF NOT FOUND()
			USE &BPATH.BARKOD INDEX &BPATH.BARKOD.CDX SHARED  ALIAS BKOD
			SET ORDER TO BARKODU   && BARKODU
			**USE &BPATH.BARKOD SHARED IN 0 ALIAS BKOD
			**SET ORDER TO BARKODU
		    SEEK barkod
		    IlackoduToBarkod = ALLTRIM(STR(ILACKODU))
			
			
			USE
			
		    USE &BPATH.ILACLAR INDEX &BPATH.IIKODU.IDX SHARED ALIAS ilc
			SET INDEX TO &BPATH.IIKODU.IDX
			SET ORDER TO IIKODU   && ILACKODU
			SEEK IlackoduToBarkod
			
			ikodukod = ALLTRIM(STR(ilc.ILACKODU))
			**RETURN ilc.ilacadi
		   
		endif    
		
		IF FOUND()
		
			ikodukod = ALLTRIM(STR(ilc.ILACKODU))
					
			**RETURN ilc.ilacadi
			
			**END REGÝON
			
			**REGÝON ESKÝSÝ
			**USE &BPATH.ILACLAR INDEX &BPATH.ibkodu SHARED IN 0 ALIAS ilc
			**SET INDEX TO &BPATH.ibkodu
			**SEEK barkod
			**END REGÝON ESKÝSÝ
			
			**REGÝON YENÝSÝ
			**USE &BPATH.ILACLAR INDEX &BPATH.IIKODU.IDX SHARED ALIAS ilc
			**SET INDEX TO &BPATH.IIKODU.IDX
			**SET ORDER TO IIKODU   && ILACKODU
			**SEEK ikodutobarkod
			
					
			**txtilacadi=ilc.ilacadi
			**txtbarkodu=ilc.barkodu
			**txtilackodu=ilc.ilackodu
			
			**RETURN txtilacadi
			**txtkututipi="prt.kututipi"
			**txtfiyati="prt.CFiyati"
			**txtraf="prt.raf"
			**txtreyon="prt.reyon"
			
			**END REGÝON
		
		endif
		
		**USE &BPATH.ILACLAR IN 0 SHARED ALIAS ilc
		**SELECT * FROM ilc WHERE ilc.barkodu = '"'+ALLTRIM(barkod)+'"'
		**SELECT crs
		
		**TEST = "gelen barkod = "+barkod+"---- okunan barkod:"+ilc.barkodu+"ilac koduu--"+ALLTRIM(STR(ilc.ilackodu))
		IF ikodukod=="0" then
			
			CLOSE DATABASES
			this.wlogout()
			RETURN "0"
			
			RELEASE ALL
		ELSE
								
				ikd = ilc.ilackodu
				?ikd
				USE &BPATH.ilacprt INDEX &BPATH.ilacprt1.idx IN 0 SHARED ALIAS prt
				SELECT prt
				SEEK STR(ilc.ilackodu,6)+cno
				LOCATE WHILE ilackodu=ilc.ilackodu .and. cepno=ALLTRIM(cno) FOR miktari>0 .or. cfiyati=ilc.fiyati
				test = ALLTRIM(STR(prt.ilackodu))
			**jsonString = jsonString + "{'ilacadi':'"+ilacadi+"','barkodu':'"+barkodu+"','ilackodu':'"+ilackodu+"','kututipi':'"+kututipi+"','fiyati':'"+fiyati+"','raf':'"+raf+"','reyon':'"+reyon+"'}"
				jsonString = jsonString + "{'ilacadi':'"+STRTRAN(STRTRAN(ALLTRIM(ilc.ilacadi),"'"," "),"\"," ")+"',"
				jsonString = jsonString + "'barkodu':'"+ALLTRIM(ilc.barkodu)+"',"
				jsonString = jsonString + "'ilackodu':'"+ALLTRIM(STR(ilc.ilackodu))+"',"
				jsonString = jsonString + "'kututipi':'"+ALLTRIM(prt.kututipi)+"',"
				jsonString = jsonString + "'fiyati':'"+ALLTRIM(STR(prt.CFiyati))+"',"
				jsonString = jsonString + "'raf':'"+ALLTRIM(prt.raf)+"',"
				jsonString = jsonString + "'reyon':'"+ALLTRIM(prt.reyon)+"'}"
				
				test = test + "-sonrasý"+ALLTRIM(STR(ilc.ilackodu))
				SELECT ilc
				use
			CLOSE DATABASES
			this.wlogout()
			RETURN jsonString			
			**RETURN TEST  + "-GELEN JSON STRÝNG:"+jsonString
			RELEASE ALL
			
		ENDIF
		CLOSE DATABASES	
			
		
		
	ENDPROC
**ÝLAÇ PARTÝDEN SORGULAMA
	PROCEDURE getIlacPrt(Kodu,Cno)
		this.getPath()
		jsonString = ""
		BPATH = this._BoyutPath
		
		
		USE &BPATH.ilaclar SHARED
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
		this.wlogout()
		RETURN SUBENO		 
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
	
	
ENDDEFINE