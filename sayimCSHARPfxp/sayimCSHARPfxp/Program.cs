using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using serifsayim;

namespace sayimCSHARPfxp
{
    public class Program
    {
        
        
        static void Main(string[] args)
        {
            //System.Diagnostics.Process.Start("net.exe", @"use k: \\192.168.0.12\data\selcep\data");
            Console.WriteLine("ŞifreKontrol:SF \n Kayıt Et: K \n Kayıt Sil: D \n Kullanıcı Bilgilerini Getir: KB \n Barkod Sorgula: B");
            string rs = Console.ReadLine();
            if (rs.Trim() == "K")
            {
                String Reyon, Tanim, SayanKisi, Giren, GKutuTipi, GMiad;
                int GFiyati, GZaman, IlacKodu, GMiktar, KDegisti;
                Console.Write("Reyon Giriniz:");
                Reyon = Console.ReadLine();

                Console.Write("Tanim Giriniz:");
                Tanim = Console.ReadLine();
                Console.Write("SayanKisi Giriniz:");
                SayanKisi = Console.ReadLine();
                Console.Write("GZaman Giriniz:");
                Giren = Console.ReadLine();
                Console.Write("GZaman Giriniz:");
                GZaman = Convert.ToInt32(Console.ReadLine());
                Console.Write("IlacKodu Giriniz:");
                IlacKodu = Convert.ToInt32(Console.ReadLine());
                Console.Write("GFiyati Giriniz:");
                GFiyati = Convert.ToInt32(Console.ReadLine());
                Console.Write("GKutuTipi Giriniz:");
                GKutuTipi = Console.ReadLine();
                Console.Write("GMiad Giriniz:");
                GMiad = Console.ReadLine();
                Console.Write("GMiktar Giriniz:");
                GMiktar = Convert.ToInt32(Console.ReadLine());
                Console.Write("KDegisti Giriniz:");
                KDegisti = Convert.ToInt32(Console.ReadLine());


                sayim s = new sayim();
                if (Reyon != "" && Tanim != "" && SayanKisi != "" && IlacKodu != null)
                {
                    s.Sayimbilgilerigir(Reyon, Tanim, SayanKisi, Giren, GZaman, IlacKodu, GFiyati, GKutuTipi, GMiad, GMiktar, KDegisti);
                    //s.VeriOlustur();
                }
                else
                {
                    Console.WriteLine("hataaaa");
                }
                Console.WriteLine(s.getReyon());
                Console.Read();
            }
            else if (rs.Trim() == "D")
            {

            }
            else if (rs.Trim() == "KB")
            {
                Console.WriteLine("Şifrenizi Giriniz");
                string sifre = Console.ReadLine();

            }
            else if (rs.Trim() == "B")
            {

            }
            else if (rs.Trim()=="SF")
            {
                sayim s = new sayim();
                Console.WriteLine("GelenYanıt : "+s.sifreKontrol("1111"));
                Console.Read();


            }
        }
         void kaydet()
        {
            

        }
    }
}
