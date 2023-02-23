para PsadeceBiri, pselect, pkls, palia, pexcl
priv sadeceBiri, acildi
** dbfac("ILACLAR","")
** dbfac("ILACPRT","")
if TYPE("PsadeceBiri")<>"C"
    sadeceBiri = ""
ELSE   
    sadeceBiri = upper(PsadeceBiri)
ENDIF
IF TYPE("pselect")<>"C"
   pselect="0"
ENDIF
  
IF TYPE("palia")<>"C"
   palia=psadecebiri
ENDIF
  
IF TYPE("pexcl")<>"C"
   pexcl=""
ENDIF
  
IF TYPE("pkls")<>"C"
   pkls=IIF(INLIST(sadeceBiri,"C100","C100NOT","C200","C300","CARIBIL","C400","C500","P100","P200","P300","P1A0","CS10","CS20","CS30"),klasor,stkkls)
ENDIF
  
acildi=0
on error acildi=-1
IF .not. EMPTY(pselect)
   SELECT &pselect.
ENDIF

   * fatprnt Sele D
   * C400, HRKRPR
DO case
   case "P100" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.P100 ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	         SET Index TO &pkls.P110, &pkls.P120
	     ENDIF
      else
         Select &palia.
      endif
	  SET ORDER TO 1
   case "C100" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.C100 ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	         SET Index TO &pkls.C110, &pkls.C120, &pkls.C130
	     ENDIF
      else
         Select &palia.
      endif
	  SET ORDER TO 1   
   case "C100NOT" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.C100NOT ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	         SET Index TO &pkls.C100NOT
	     ENDIF
      else
         Select &palia.
      endif
	  SET ORDER TO 1   
   case "CARIBIL" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.CARIBIL ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	         SET Index TO &pkls.CARIBIL
	     ENDIF
      else
         Select &palia.
      endif
	  SET ORDER TO 1   
   case "C200" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.C200 ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	         SET Index TO &pkls.C210, &pkls.C220
	     ENDIF
      else
         Select &palia.
      endif
	  SET ORDER TO 1   
   case "C300" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.C300 ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	         SET Index TO &pkls.C310, &pkls.C320, &pkls.C330
	     ENDIF
      else
         Select &palia.
      endif
	  SET ORDER TO 1   
   case "C400" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.C400 ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	         SET Index TO &pkls.C410
	     ENDIF
      else
         Select &palia.
      endif
	  SET ORDER TO 1   
   case "SIPARIS" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.SIPARIS ALIAS &palia. &pexcl.
         if EMPTY(CDX(1))
            SET INDEX TO &pkls.SIPARIS1, &pkls.SIPARIS2, &pkls.SIPARIS3, &pkls.SIPARIS4
         endif
      else
         Select &palia.
      endif
	  SET ORDER TO 1

   case "SIPHAR" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.SIPHAR ALIAS &palia. &pexcl.
         if EMPTY(CDX(1))
            SET INDEX TO &pkls.SIPHAR1, &pkls.SIPHAR2, &pkls.SIPHAR3, &pkls.SIPHAR4, &pkls.SIPHAR5
         endif
      else
         Select &palia.
      endif
	  SET ORDER TO 1
   
   case "GRSFTR" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.GRSFTR ALIAS &palia. &pexcl.
         if EMPTY(CDX(1))
            IF FILE(pkls+"GRSFTR5.IDX")
               SET INDEX TO &pkls.GRSFTR1, &pkls.GRSFTR2, &pkls.GRSFTR3, &pkls.GRSFTR4, &pkls.GRSFTR5
            ELSE
               SET INDEX TO &pkls.GRSFTR1, &pkls.GRSFTR2, &pkls.GRSFTR3, &pkls.GRSFTR4
            ENDIF
         ENDIF
      else
         Select &palia.
      endif
	  SET ORDER TO 1
   
   case "GIRISHAR" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.GIRISHAR ALIAS &palia. &pexcl.
         SET ORDER TO 1
      else
         Select &palia.
      endif

   case "CIKISHAR" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.CIKISHAR ALIAS &palia. &pexcl.
         SET ORDER TO 1
      else
         Select &palia.
      endif

   case "ACIKHSP" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.ACIKHSP ALIAS &palia. &pexcl.
 	     IF EMPTY(CDX(1))
	        SET Index TO &pkls.ACIKHSP1, &pkls.ACIKHSP2, &pkls.ACIKHSP3, &pkls.ACIKHSP4, &pkls.ACIKHSP5
	     endif
         SET ORDER TO 1
      else
         Select &palia.
      endif

   case "THDTFILE" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.THDTFILE ALIAS &palia. &pexcl.
 	     IF EMPTY(CDX(1))
	        SET Index TO &pkls.ITHDT,&pkls.ITHDTILC
	     endif
	     SET ORDER TO 1
      else
         Select &palia.
      endif

   case "FTRRPR" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.FTRRPR ALIAS &palia. &pexcl.
         if TYPE("faturano")<>"C"
            SET INDEX TO &pkls.IFTRRPR,&pkls.iftrrprk,&pkls.iftrrprt
         endif
      else
         Select &palia.
      endif
	  SET ORDER TO 1

   case "FATIPTAL" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.FATIPTAL ALIAS &palia. &pexcl.
         if TYPE("faturano")<>"C"
            SET INDEX TO &pkls.FATIPT1,&pkls.FATIPT2,&pkls.FATIPT3
         endif
      else
         Select &palia.
      endif
	  SET ORDER TO 1
   
   case "ILACPRT" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.ILACPRT ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
  	         IF FILE(pkls+"ILACPRT3.IDX")
	            SET Index TO &pkls.ILACPRT1, &pkls.ILACPRT2, &pkls.ILACPRT3
	         ELSE
	            SET Index TO &pkls.ILACPRT1, &pkls.ILACPRT2
	         ENDIF   
	     ENDIF
      else
         Select &palia.
      ENDIF
	  SET ORDER TO 1   
   
   case "ILACAKT" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.ILACAKT ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	         SET Index TO &pkls.ILACAKT1, &pkls.ILACAKT2, &pkls.ILACAKT3
	     ENDIF
      else
         Select &palia.
      ENDIF
	  SET ORDER TO 1   

   case "ILACLAR" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.ilaclar ALIAS &palia. &pexcl. 
  	     IF EMPTY(CDX(1))
            If File(pkls+"IEKODU.IDX")
             	Use &pkls.ILACLAR Index &pkls.iikodu, &pkls.iiadi, &pkls.ifiril, &pkls.ibkodu, &pkls.ijkodu, &pkls.iekodu
            Else
             	Use &pkls.ILACLAR Index &pkls.iikodu, &pkls.iiadi, &pkls.ifiril, &pkls.ibkodu, &pkls.ijkodu
            ENDIF
	     ENDIF
      else
         Select &palia.
      endif
	  SET ORDER TO 1   

   case "FIRMALAR" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.FIRMALAR ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
            If File(STKKLS+"ifykodu.idx")
               Set Index To &STKKLS.ifkodu, &STKKLS.ifadi, &STKKLS.ifykodu
            Else
               Set Index To &STKKLS.ifkodu, &STKKLS.ifadi
            ENDIF
	     ENDIF
      else
         Select &palia.
      endif
	  SET ORDER TO 1   

   case "GRSKAMP" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.GRSKAMP ALIAS &palia. &pexcl. 
  	     IF EMPTY(CDX(1))
	        SET Index TO &pkls.grskamp1, &pkls.grskamp2
	     ENDIF
      else
         Select &palia.
      endif
	  SET ORDER TO 1   

   CASE "CEPIRS" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.CEPIRS ALIAS &palia. &pexcl.
      else
         Select &palia.
      endif

   CASE sadeceBiri="IRSRPR*"
      if .not.used("IRSRPR")
         acildi=1
         if pubcepprg
            Use &pkls.CEPIRS alias IRSRPR
         else
            Use &pkls.IRSRPR
         endif
      else
         Select IRSRPR
      endif

   CASE "IRSRPR" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.IRSRPR ALIAS &palia. &pexcl.
      else
         Select &palia.
      endif

   case "SATISPAR" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.SATISPAR ALIAS &palia. &pexcl.
      else
         Select &palia.
      endif
      Set Order To 1 
   
   case "SATISLAR" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.SATISLAR ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	        SET Index TO &pkls.SATISLAR
	     ENDIF
      else
         Select &palia.
      endif
      Set Order To 1 
   
   case "HRKRPR" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.HRKRPR ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	        SET Index TO &pkls.IHRKRPR
	     ENDIF
      else
         Select &palia.
      endif
      Set Order To 1 
   
   case "ILACAY" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.ILACAY ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	        SET Index TO &pkls.ILACAY1, &pkls.ILACAY2
	     ENDIF
      else
         Select &palia.
      endif
      Set Order To 1 

   case "FRMVAAD1" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.FRMVAAD1 ALIAS &palia. &pexcl.
  	     IF EMPTY(CDX(1))
	          SET Index TO &pkls.VAAD11
	       ENDIF
      else
         Select &palia.
      endif
      Set Order To 1 
   
   case "BELGENO" = sadeceBiri
      if .not.used(palia)
         acildi=1
         Use &pkls.BELGENO ALIAS &palia. &pexcl.
      else
         Select &palia.
      endif

   case "SEPETLER" = sadeceBiri
      if .not.used(palia)
         acildi=1
         IF FILE(pkls+"SEPETL"+_cepno+".DBF")
            Use &pkls.sepetl&_cepno ALIAS sepetler
         ELSE
            IF ayr_itriyat .and. .not. ayr_eczane .and. File(pkls+"SEPETITR.DBF") 
                Use &pkls.sepetitr ALIAS sepetler
            else
                Use &pkls.sepetler
            endif
         endif   
      else
         Select &palia.
      ENDIF

   otherwise   
      if .not.used(sadecebiri)
         acildi=1
         Use &pkls.&sadecebiri. ALIAS &palia. &pexcl.
         IF .not. EMPTY(CDX(1))
            SET ORDER TO 1
         ENDIF
      else
         Select &sadecebiri.
      ENDIF
endcase
ON ERROR DO HATA WITH LINENO()
IF acildi<0
   =hatali("ACILAMAYAN DOSYA : "+PsadeceBiri,5)
endif
return acildi
