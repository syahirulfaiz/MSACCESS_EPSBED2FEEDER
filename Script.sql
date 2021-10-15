--toWSMahasiswa
--toWSKuliahMahasiswa
--toWSNilai
--toWSDosenAjar
--toWSKelasKuliah
--toWSMataKuliah
--CountDosen
--Dosen Forlap x Dosen Siakad
------------------------------

--toWSMahasiswa
--------------------

SELECT ( SELECT TOP 1 THSMSTRAK FROM TRAKM)+"_"+A.kodeSiakad, "" AS id_reg_pd, NIMHSMSMH, NMMHSMSMH, IIF(STMHSMSMH IS NULL,"N",STMHSMSMH), Prodi.prodiSiakad, "202006", IIf(STPIDMSMH="B",1,2) AS [Status Masuk (Pindahan:2, Baru:1)], IIF(TGMSKMSMH IS NULL,"00000000",TGMSKMSMH), "" AS [Status Keluar], TGLLSMSMH, "" AS [Ket Keluar], "" AS [Nomor SK Ujian Nasional], IIF(SMAWLMSMH IS NULL,"00000",SMAWLMSMH), IIf(STPIDMSMH="B",0,SKSDIMSMH) AS SKSDiakui, 0 AS [Jalur Skripsi], "" AS [Judul Skripsi], 0 AS [Bulan Awal Bimbingan], 0 AS [Bulan Akhir Bimbingan], "" AS [No SK Yudisium], 0 AS [Tgl SK Yudisium], NLIPKTRAK, NOIJSMSMH, "" AS [Nomor Sertifikat Sertifikasi], 0 AS [Pindah Mhs Asing (0/1)], "" AS [Nama PT Asal], "" AS [Nama Prodi Asal], "" AS id_pd, IIF(KDJEKMSMH IS NULL,"L",KDJEKMSMH) AS [Jenis Kelamin (L/P)], "" AS NISN, "" AS [No KTP/No KK], TPLHRMSMH AS [Tempat Lahir], IIF(E.[tanggal lahir] IS NULL,"19910101",MID(E.[tanggal lahir],7,4)+MID(E.[tanggal lahir],4,2)+MID(E.[tanggal lahir],1,2)), "ISLAM" AS agama, 0 AS [Kebutuhan Khusus], ALMHSMSMH, 0 AS [Alamat Rt], 0 AS [Alamat Rw], "" AS [Nama Dusun], ALMHSMSMH AS [Nama Kelurahan/Desa], IIf(E.kabupaten Is Not Null And E.propinsi Is Not Null,E.kabupaten+","+E.propinsi,0) AS [Kode Wilayah], "" AS [Kode Pos], 0 AS [Kode Jenis Tinggal (angka)], 0 AS [Kode Alat Transport (Angka)], "0000 000000" AS [Telp Rumah], MID(NOHPPMSMH,1,4)+" "+MID(NOHPPMSMH,5,20) AS [Telp HP], EMAILMSMH, 0 AS [Ada KPS (1/0)], "" AS [No KPS], E.[ayah] AS [Nama Ayah], "" AS [Tgl Lahir Ayah], IIF(INSTR(E.[pendidikan ayah],"SMA")<>0,"SMA / sederajat",E.[pendidikan ayah]) AS [Jenjang Pendd Ayah], E.[pekerjaan ayah] AS [Pekerjaan Ayah], 0 AS [Penghasilan Ayah], 0 AS [Kebutuhan Khusus Ayah], IIf(E.ibu Is Null,"-",E.ibu) AS [Nama Ibu], "" AS [Tgl Lahir Ibu], IIF(INSTR(E.[pendidikan ibu],"SMA")<>0,"SMA / sederajat",E.[pendidikan ibu]) AS [Jenjang Pendd Ibu], 0 AS [Penghasilan Ibu], E.[pekerjaan ibu] AS [Pekerjaan Ibu], 0 AS [Kebutuhan Khusus Ibu], "" AS [Nama Wali], 0 AS [Tanggal Lahir Wali], "" AS [Jenjang Pendd Wali], "" AS [Pekerjaan Wali], 0 AS [Penghasilan Wali], "ID" AS Kewarganegaraan
FROM ((SELECT * FROM MSMHS LEFT JOIN Prodi ON MSMHS.KDPSTMSMH=Prodi.kodeDikti)  AS A LEFT JOIN TRAKM AS T ON T.NIMHSTRAK=A.NIMHSMSMH) LEFT JOIN MHSEMIS_2009_2011 AS E ON E.nim=A.NIMHSMSMH;

--toWSKuliahMahasiswa
---------------------
SELECT (SELECT TOP 1 THSMSTRAK FROM TRAKM)+"_"+P.kodeSiakad, THSMSTRAK, "" AS id_reg_pd, NIMHSTRAK, A.NMMHSMSMH, A.SMAWLMSMH, NLIPSTRAK, SKSEMTRAK, NLIPKTRAK, SKSTTTRAK, A.STMHSMSMH
FROM (SELECT * FROM TRAKM AS T LEFT JOIN MSMHS AS M ON T.NIMHSTRAK=M.NIMHSMSMH)  AS A LEFT JOIN Prodi AS P ON P.kodeDikti=A.KDPSTTRAK
ORDER BY NIMHSTRAK;


--toWSNilai
---------------
SELECT (SELECT TOP 1 THSMSTRNL FROM TRNLM)+"_"+P.kodeSiakad, THSMSTRNL, NIMHSTRNL, NMMHSMSMH, KDKMKTRNL, NAKMKTBKM, KELASTRNL, BOBOTTRNL AS [Nilai Angka], NLAKHTRNL, BOBOTTRNL AS [Nilai Indeks]
FROM (SELECT * FROM (SELECT * FROM TRNLM AS T LEFT JOIN MSMHS AS M ON T.NIMHSTRNL=M.NIMHSMSMH)  AS A LEFT JOIN TBKMK AS KMK ON (A.KDPSTTRNL=KMK.KDPSTTBKM) AND (A.KDKMKTRNL=KMK.KDKMKTBKM))  AS B LEFT JOIN Prodi AS P ON B.KDPSTTRNL=P.kodeDikti;

--toWSDosenAjar
---------------
SELECT (SELECT TOP 1 THSMSTRAK FROM TRAKD)+"_"+P.kodeSIakad, id_ajar, THSMSTRAK, P.prodiSiakad, KDKMKTRAK, KMK.NAKMKTBKM, KELASTRAK, [No Dosen], [Nama Dosen], KMK.SKSMKTBKM AS [SKS MK TOTAL], KMK.SKSMKTBKM AS [SKS TTP MUKA], IIF(KMK.SKSPRTBKM IS NULL,0,KMK.SKSPRTBKM) AS [SKS PRAKT], IIF(KMK.SKSLPTBKM IS NULL,0,KMK.SKSLPTBKM) AS [SKS PRAKT LAP], 0 AS [SKS Simulasi], [TTP RENC], [TTP REAL], 1 AS [Ident Unik Jenis Evaluasi]
FROM (SELECT "" AS id_ajar, THSMSTRAK, P.*, KDKMKTRAK, KELASTRAK, IIF(NODOSTRAK NOT IN (SELECT [NIDN] FROM [dosen forlap] ),[Kepala Prodi],NODOSTRAK) AS [No Dosen], KDPSTTRAK, IIF(NODOSTRAK NOT IN (SELECT [NIDN] FROM [dosen forlap]),[Nama Kepala Prodi],NMDOSTRAK) AS [Nama Dosen], TMRENTRAK AS [TTP RENC], TMRELTRAK AS [TTP REAL], 1 AS [Ident Unik Jenis Evaluasi] FROM TRAKD AS T, Prodi AS P WHERE T.KDPSTTRAK=P.kodeDikti)  AS A LEFT JOIN TBKMK AS KMK ON (A.KDKMKTRAK=KMK.KDKMKTBKM) AND (KMK.KDPSTTBKM=A.KDPSTTRAK)
ORDER BY KDKMKTRAK, KELASTRAK;


--toWSMataKuliah
----------------
SELECT (SELECT TOP 1 THSMSTBKM FROM TBKMK )+"_"+P.kodeSiakad, "" AS id_mk, "" AS id_kurikulum_sp, THSMSTBKM, P.prodiSiakad, SEMESTBKM AS Semester, KDKMKTBKM, NAKMKTBKM, KDWPLTBKM AS [Jenis MK], "" AS [Kelompok MK], IIF(SKSMKTBKM IS NULL,0,SKSMKTBKM) AS [SKS MK], IIF(SKSMKTBKM IS NULL,0,SKSMKTBKM) AS [SKS TTP MUKA], IIF(SKSPRTBKM IS NULL,0,SKSPRTBKM) AS [SKS PRAKT], IIF(SKSLPTBKM IS NULL,0,SKSLPTBKM) AS [SKS PRAKT LAP], "" AS [SKS SIMULASI], "" AS [Info Metode Pelaksanaan Kuliah], IIF(SAPPPTBKM="A",1,0) AS [SAP MK], IIF(SLBUSTBKM="A",1,0) AS [SILABUS MK], IIF(BHNAJTBKM="A",1,0) AS [Ada Bahan Ajar (1/0)], "" AS [Info Acara Praktek], IIF(DIKTTTBKM="A",1,0) AS [Ada Diktat], "20020101" AS [Tgl Efektif Mulai], "20990101" AS [Tgl Akhir Efektif]
FROM TBKMK AS KMK, Prodi AS P
WHERE KMK.KDPSTTBKM=P.kodeDIkti;


--CountDosen
------------
SELECT [dosen forlap].[program studi], Count(No) AS Expr1
FROM [dosen forlap]
GROUP BY [dosen forlap].[program studi]
ORDER BY Count(No);

--Dosen Forlap x Dosen Siakad
-----------------------------
SELECT *
FROM [dosen forlap] AS DF LEFT JOIN [dosen siakad] AS DS ON DF.NIDN=DS.NIDNNMSDOS Or DF.NAMA=DS.NMDOSMSDOS;


