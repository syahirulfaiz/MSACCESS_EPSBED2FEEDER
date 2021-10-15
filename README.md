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

