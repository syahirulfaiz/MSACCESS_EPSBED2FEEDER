
#MSACCESS_EPSBED2FEEDER

-Columns must match the constraints
-Code needs to be adjusted to the EPSBED code
-Compatible with the 2013 year which has been fixed.
-MSMHS – the dates in TGLHRMSMH, TGMSKMSMH, TGLLSMSMH, adjusted to yyyymmdd, the choose 'format cell' --> txt, paste notepad, paste column

-TBKMK - set the NAKMKTBKM string length of char (40)
-TBKMK - set the NODOSTBKM format must be as similar as NIDN, which is char (10)
-TBKMK - NODOSTBKM need to be completed. Otherwise, then use the head of department
-TRAKD - NODOSTRAK need to be completed. Otherwise, then use the head of department. And those in NODOSTRAK must also be listed in MSDOS. From the NODOSTRAK, we copy cell format as txt, paste in notepad, the paste it to the column

(20140123.001 After researching, it turns out that you only need to make sure that the five column primary keys are unique. The key is in NODOSTRAK. It must be complete. When it is imported, the following problems will automatically occur, such as the text field length fulfilling, it will automatically be truncated, and it will adjust)

(20140123.002 When we tested it, we copied and pasted it from MSDOS and then manually dragged it. If it still causes violations constraints. The solution: NODOSTRAK must be entered with the actual one)

-TRAKD - KDPSTTRAK is reversed with KDJENTRAK. Reverse it
-TRAKD - we copy the string from TMRENTRAK, TMRELTRAK, SKSMKTRAK to notepad, then copy them to respective column
-TRAKD - CLASSTRAK only has two chars per item. In fact some are unknown and use stars, are even 5/A or only A (just letters). It can't be empty
-TRAKD - NMDOSTRAK must be 30 char.

20150521
-Enter the head of department first: insert the column in E, column F will automatically forms. Insert the head study formula in F, then Drag the column and copy notepad and paste the text format

-copy all->notepad-> text format

-IF there is a notification "subscript out of range": RESTART ACCESS
-If there is an error, usually the import_error table appears: try to copy everything, paste it into notepad,  then use a new sheet. Click and ctrl+A (all blocked), then right click, select format cell as text
-If there is an error saying "violates / constraints / integrity", then there must be double columns

<hr/>

# MSACCESS_EPSBED2FEEDER

-Kolom harus sesuai constraint
-Kode perlu disesuaikan dengan kode epsbed
-Cocokkan gelodongan dengan Tahun 2013 yg sudah FIX
-MSMHS – tanggal TGLHRMSMH, TGMSKMSMH, TGLLSMSMH,  disesuaikan dengan yyyymmdd, format cell --> txt, paste notepad, paste kolom

-TBKMK - NAKMKTBKM panjang string 40
-TBKMK - NODOSTBKM formate harus seperti NIDN, Jangan NIP seperti sekarang yaitu char 10
-TBKMK - NODOSTBKM  dilengkapi, jika tidak ada maka pake kajur

-TRAKD - NODOSTRAK dilengkapi, jika tidak ada maka pake kajur . Dan yg di NODOSTRAK harus tercantum juga di MSDOS. NODOSTRAK dicopy format cell --> txt, paste notepad, paste kolom
(20140123.001 Setelah diteliti, ternyata hanya perlu dipastikan kelimakelima column primary key ini unik. Kuncinya ada pada NODOSTRAK. Harus lengkap. Ketika nanti diimport, otomatis masalah masalah di bawah ini, seperti panjang text field yg memenuhi, otomatis akan kepotong, dan menyesuaikan)
(20140123.002 Ketika saya tes, saya asal copy paste dari MSDOS lalu drag manual,,ternyata tetap menyebabkan violates constraint. Solusinya: NODOSTRAK harus dimasukkan dengan yang sebenarnya)
-TRAKD - KDPSTTRAK terbalik dengan KDJENTRAK, baliklah
-TRAKD - TMRENTRAK, TMRELTRAK, SKSMKTRAK dicopy ke notepad, lalu copy ke column masing
-TRAKD - KELASTRAK hanya 2 char per item, malah sampek ada yg unknown dan pake bintang, malah ada yg 5/A atau hanya A (huruf aja) kenapa? ga boleh kosong
-TRAKD - NMDOSTRAK harus exact 30 char

20150521
-Masukkan dulu rumus kaprod: setelah dibalik pada poin di atas, insert kolom di E, akan terbentuk kolom F. insert rumus kaprodi di F. Drag.  ,baru copy notepad paste format text
-kopi all->notepad-> text format


-JIKA ada subscript out of range : RESTART ACCESS nya
-Jika trakd error,,biasanya muncul table import_error,,, coba kopi semua , paste ke notepad,,, lalu pakai sheet baru. Klik, ctrl+A (terblok semua), lalu klik kanan, pilih format cell  text
-Jika ada kata error “violates / constraint / integrity”, maka pasti ada kolom-kolom dobel

