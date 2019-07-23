program main;

uses crt,uload, uloginregister,usave,ucari,utambah,upinjamkembali,ulapor,uinfo; 


var
	{variabel data user}
	udata		:tabuser;
	neff_udata	:integer;
	roleuser,logged	:string;
	userfile	:string;
	{variabel data buku}
	ubuku		:tabbuku;
	neff_ubuku	:integer;
	bukufile	:string;
	{variabel data peminjaman}
	upinjam		:tabpinjam;
	neff_upinjam	:integer;
	pinjamfile	:string;
	{variabel data pengembalian}
	ukembali	:tabkembali;
	neff_ukembali	:integer;
	kembalifile	:string;
	{variabel data buku hilang}
	uhilang		:tabhilang;
	neff_uhilang	:integer;
	hilangfile	:string;
	{variabel umum}
	i		:integer;
	pilihan		:char;

procedure menu(var roleuser:string);
var
	pilih:string;
begin
	if roleuser='admin' then {menu yang hanya bisa diakses admin}
	begin
		writeln('1. Registrasi akun');
		writeln('2. Cari buku berdasarkan kategori');
		writeln('3. Cari buku berdasarkan tahun terbit');
		writeln('4. Lihat laporan buku hilang');
		writeln('5. Tambah buku baru');
		writeln('6. Tambah jumlah buku');
		writeln('7. Lihat riwayat pinjam');
		writeln('8. Statistik');
		writeln('9. Cari anggota');
		writeln('(lainnya) Exit');
		write('Masukkan pilihan : ');readln(pilih);
		if pilih='1' then
		begin
			register(udata,neff_udata);
			readln();
			menu(roleuser);
		end else if pilih='2' then
		begin
			carikategori(ubuku,neff_ubuku);
			readln();
			menu(roleuser);
		end else if pilih='3' then
		begin
			caritahun(ubuku,neff_ubuku);
			readln();
			menu(roleuser);
		end else if pilih='4' then
		begin
			lihatlaporan(uhilang,neff_uhilang);
			readln();
			menu(roleuser);
		end else if pilih='5' then
		begin
			tambahbuku(ubuku,neff_ubuku);
			readln();
			menu(roleuser);
		end else if pilih='6' then
		begin
			tambahjumlahbuku(ubuku,neff_ubuku);
			readln();
			menu(roleuser);
		end else if pilih='7' then
		begin
			riwayat(upinjam,neff_upinjam,ubuku,neff_ubuku);
			readln();
			menu(roleuser);
		end else if pilih='8' then
		begin
			statistik(udata,neff_udata,ubuku,neff_ubuku);
			readln();
			menu(roleuser);
		end else if pilih='9' then
		begin
			carianggota(udata,neff_udata);
			readln();
			menu(roleuser);
		end else {exit}
		begin
			write('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ? ');readln(pilihan);
			if (pilihan='y') or (pilihan='Y') then
			begin
				write('Masukkan nama File Buku: ');readln(bukufile);
				write('Masukkan nama File User: ');readln(userfile);
				write('Masukkan nama File Peminjaman: ');readln(pinjamfile);
				write('Masukkan nama File Pengembalian: ');readln(kembalifile);
				write('Masukkan nama File Buku Hilang: ');readln(hilangfile);
				saveuser(udata,neff_udata,userfile);
				savebuku(ubuku,neff_ubuku,bukufile);
				savepinjam(upinjam,neff_upinjam,pinjamfile);
				savekembali(ukembali,neff_ukembali,kembalifile);
				savehilang(uhilang,neff_uhilang,hilangfile);
			end;
		end;		
	end else {roleuser='user'} {menu yang bisa diakses user}
	begin
		writeln('1. Cari buku berdasarkan kategori');
		writeln('2. Cari buku berdasarkan tahun terbit');
		writeln('3. Peminjaman buku ');
		writeln('4. Pengembalian buku');
		writeln('5. Lapor buku hilang');
		writeln('(lainnya) Exit');
		write('Masukkan pilihan : ');readln(pilih);
		if pilih='1' then
		begin
			carikategori(ubuku,neff_ubuku);
			readln();
			menu(roleuser);
		end else if pilih='2' then
		begin
			caritahun(ubuku,neff_ubuku);
			readln();
			menu(roleuser);
		end else if pilih='3' then
		begin
			pinjambuku(ubuku,neff_ubuku,upinjam,neff_upinjam,logged);
			readln();
			menu(roleuser);
		end else if pilih='4' then
		begin
			kembalikanbuku(ubuku,neff_ubuku,upinjam,neff_upinjam,ukembali,neff_ukembali,logged);
			readln();
			menu(roleuser);
		end else if pilih='5' then
		begin
			laporhilang(uhilang,neff_uhilang);
			readln();
			menu(roleuser);
		end else {exit} 
		begin
			write('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ? ');readln(pilihan);
			if (pilihan='y') or (pilihan='Y') then
			begin
				write('Masukkan nama File Buku: ');readln(bukufile);
				write('Masukkan nama File User: ');readln(userfile);
				write('Masukkan nama File Peminjaman: ');readln(pinjamfile);
				write('Masukkan nama File Pengembalian: ');readln(kembalifile);
				write('Masukkan nama File Buku Hilang: ');readln(hilangfile);
				saveuser(udata,neff_udata,userfile);
				savebuku(ubuku,neff_ubuku,bukufile);
				savepinjam(upinjam,neff_upinjam,pinjamfile);
				savekembali(ukembali,neff_ukembali,kembalifile);
				savehilang(uhilang,neff_uhilang,hilangfile);
			end;
		end;
	end;
end;

begin
	clrscr;
	write('Masukkan nama File Buku: ');readln(bukufile);
	write('Masukkan nama File User: ');readln(userfile);
	write('Masukkan nama File Peminjaman: ');readln(pinjamfile);
	write('Masukkan nama File Pengembalian: ');readln(kembalifile);
	write('Masukkan nama File Buku Hilang: ');readln(hilangfile);
	loaduser(udata,neff_udata,userfile);
	loadbuku(ubuku,neff_ubuku,bukufile);
	loadpinjam(upinjam,neff_upinjam,pinjamfile);
	loadkembali(ukembali,neff_ukembali,kembalifile);
	loadhilang(uhilang,neff_uhilang,hilangfile);
	writeln('File perpustakaan berhasil dimuat!');
	
	writeln();
	writeln('Selamat Datang di Sistem Informasi Perpustakaan');
	writeln();
	writeln('1. Login');
	writeln('2. Exit');
	writeln();
	write('Masukkan pilihan : ');readln(pilihan);
	writeln();
	while (pilihan<>'1') and (pilihan<>'2') do
	begin
		writeln('Masukkan pilihan valid, 1/2');
		write('Masukkan pilihan : ');readln(pilihan);
		writeln();
	end;
	if pilihan='2' then
	begin
		write('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ? ');readln(pilihan);
		if (pilihan='y') or (pilihan='Y') then
		begin
			write('Masukkan nama File Buku: ');readln(bukufile);
			write('Masukkan nama File User: ');readln(userfile);
			write('Masukkan nama File Peminjaman: ');readln(pinjamfile);
			write('Masukkan nama File Pengembalian: ');readln(kembalifile);
			write('Masukkan nama File Buku Hilang: ');readln(hilangfile);
			saveuser(udata,neff_udata,userfile);
			savebuku(ubuku,neff_ubuku,bukufile);
			savepinjam(upinjam,neff_upinjam,pinjamfile);
			savekembali(ukembali,neff_ukembali,kembalifile);
			savehilang(uhilang,neff_uhilang,hilangfile);
		end;
	end else {pilihan='1'}
	begin
		login(udata,neff_udata,roleuser,logged);
		readln();
		menu(roleuser);
	end;

end.
