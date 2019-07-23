	procedure loaduser(var udata:tabuser; var neff_udata:integer; var userfile:string);
	
	procedure loadbuku(var ubuku:tabbuku; var neff_ubuku:integer; var bukufile:string);
	
	procedure loadpinjam(var upinjam:tabpinjam; var neff_upinjam:integer; var pinjamfile:string);

	procedure loadkembali (var ukembali:tabkembali;var neff_ukembali:integer; var kembalifile:string);

	procedure loadhilang (var uhilang:tabhilang;var neff_uhilang:integer; var hilangfile:string);



	procedure saveuser(var udata:tabuser;var neff_udata:integer; var userfile:string);
	
	procedure savebuku(var ubuku:tabbuku;var neff_ubuku:integer; var bukufile:string);

	procedure savepinjam(var upinjam:tabpinjam;var neff_upinjam:integer; var pinjamfile:string);

	procedure savekembali (var ukembali:tabkembali;var neff_ukembali:integer; var kembalifile:string);

	procedure savehilang (var uhilang:tabhilang;var neff_uhilang:integer; var hilangfile:string);


	procedure register(var udata:tabuser;var neff_udata:integer);
	
	procedure login(var udata:tabuser;var neff_udata:integer;var roleuser:string;var logged:string);



	procedure carikategori (var ubuku:tabbuku; var neff_ubuku:integer);

	procedure caritahun (var ubuku:tabbuku; var neff_ubuku:integer);


	
	procedure pinjambuku(var ubuku:tabbuku;var neff_ubuku:integer; var upinjam:tabpinjam;var neff_upinjam:integer; var logged:string);
	
	procedure kembalikanbuku(var ubuku:tabbuku;var neff_ubuku:integer; var upinjam:tabpinjam;var neff_upinjam:integer;var ukembali:tabkembali;var neff_ukembali:integer; var logged:string);
	

	procedure tambahbuku(var ubuku:tabbuku;var neff_ubuku:integer);
	
	procedure tambahjumlahbuku(var ubuku:tabbuku;var neff_ubuku:integer);


	procedure laporhilang (var uhilang:tabhilang; var neff_uhilang:integer);

	procedure lihatlaporan (var uhilang:tabhilang; var neff_uhilang:integer);


	procedure riwayat(var upinjam:tabpinjam;var neff_upinjam:integer;var ubuku:tabbuku;var neff_ubuku:integer);
	procedure statistik(var udata:tabuser;var neff_udata:integer;var ubuku:tabbuku;var neff_ubuku:integer);
	procedure carianggota(var udata:tabuser; var neff_udata:integer);

