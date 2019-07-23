unit utambah;

interface
	uses uload;
	
	procedure tambahbuku(var ubuku:tabbuku;var neff_ubuku:integer);
	
	procedure tambahjumlahbuku(var ubuku:tabbuku;var neff_ubuku:integer);

implementation
	
	procedure tambahbuku(var ubuku:tabbuku;var neff_ubuku:integer);
	{menambahkan buku baru ke list}
	var
		id	:integer;
		judul	:string;
		author	:string;
		jumlah	:integer;
		tahun	:integer;
		kategori:string;
		i	:integer;
	begin
		writeln('Masukkan Informasi buku yang ditambahkan: ');
		write('Masukkan id buku: '); readln(id);
		write('Masukkan judul buku: '); readln(judul);
		write('Masukkan pengarang buku: '); readln(author);
		write('Masukkan jumlah buku: '); readln(jumlah);
		write('Masukkan tahun terbit buku: ');readln(tahun);
		write('Masukkan kategori buku: ');readln(kategori);
		writeln('Buku berhasil ditambahkan ke dalam sistem!');
		
		ubuku[neff_ubuku+1].id:=id;
		ubuku[neff_ubuku+1].judul:=judul;
		ubuku[neff_ubuku+1].author:=author;
		ubuku[neff_ubuku+1].jumlah:=jumlah;
		ubuku[neff_ubuku+1].tahun:=tahun;
		ubuku[neff_ubuku+1].kategori:=kategori;
		neff_ubuku:=neff_ubuku+1;
	end;	

	procedure tambahjumlahbuku(var ubuku:tabbuku;var neff_ubuku:integer);
	{menambahkan jumlah buku dari buku yang sudah ada}
	var
		i	:integer;
		id	:integer;
		jumlah	:integer;
		found	:boolean;
		place	:integer;
	begin
		write('Masukkan ID Buku: ');readln(id);
		write('Masukkan jumlah buku yang ditambahkan : ');readln(jumlah);
		found:=false;
		for i:=1 to neff_ubuku do
		begin
			if (id=ubuku[i].id) then
			begin
				found:=true;
				place:=i;
			end;
		end;
		ubuku[place].jumlah:=ubuku[place].jumlah+jumlah;
		writeln('Pembaharuan jumlah buku berhasil dilakukan, total buku ',ubuku[place].judul,' di perpustakaan menjadi ',ubuku[place].jumlah);
	end;

end.
