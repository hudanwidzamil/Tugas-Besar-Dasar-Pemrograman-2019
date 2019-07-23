unit uload;

interface

	uses uconvert;

	type
	userdata = record
		nama	:string;
		alamat	:string;
		username:string;
		password:string;
		role	:string;
		end;

	tabuser = array [1..100] of userdata;{batas maksimal elemen array 100 buah}
	
	buku = record
		id	:integer;
		judul	:string;
		author	:string;
		jumlah	:integer;
		tahun	:integer;
		kategori:string;
		end;
	
	tabbuku = array [1..100] of buku;{batas maksimal elemen array 100 buah}

	pinjam = record
		username	:string;
		id		:integer;
		tglpinjam	:string;
		tglbatas	:string;
		status		:string;
		end;

	tabpinjam = array [1..100] of pinjam;{batas maksimal elemen array 100 buah}
	
	kembali = record
		username	:string;
		id		:integer;
		tglkembali	:string;
		end;
	
	tabkembali= array [1..100] of kembali;{batas maksimal elemen array 100 buah}

	hilang = record
		judul		:string;
		id		:integer;
		tgllapor	:string;
		end;
	
	tabhilang= array [1..100] of hilang;{batas maksimal elemen array 100 buah}
	
	{referensi untuk setiap prosedur load file ekstrenal
	https://www.tutorialspoint.com/pascal/pascal_files_handling.htm
	dan 'Contoh Program Kecil dalam Bahasa Pascal'oleh Inggriani Liem}

	procedure loaduser(var udata:tabuser; var neff_udata:integer; var userfile:string);
	
	procedure loadbuku(var ubuku:tabbuku; var neff_ubuku:integer; var bukufile:string);
	
	procedure loadpinjam(var upinjam:tabpinjam; var neff_upinjam:integer; var pinjamfile:string);

	procedure loadkembali (var ukembali:tabkembali;var neff_ukembali:integer; var kembalifile:string);

	procedure loadhilang (var uhilang:tabhilang;var neff_uhilang:integer; var hilangfile:string);
	

implementation

	procedure loaduser(var udata:tabuser;var neff_udata:integer;var userfile:string);
	
	var
		f	:text;
		cc	:char;
		tab	:array[1..100]of string;
		i,neff,n:integer;

	begin
		assign(f,userfile);
		reset(f);
		i:=1;
		neff:=0;
		while not eof(f) do
		begin	
			read(f,cc);
			if (tab[i]='user') or (tab[i]='admin') then
			begin
				i:=i+1;
				neff:=neff+1;
			end else if (cc<>',') then
			begin
				tab[i]:=tab[i]+cc;
			end else
			begin
				i:=i+1;
				neff:=neff+1;
			end;
		end;
		
		n:=1;
		i:=1;
		while (i <= neff) do 
		begin
			udata[n].nama:=tab[i];
			i:=i+5;
			n:=n+1;
		end;
		n:=1;
		i:=2;
		while (i <= neff) do 
		begin
			udata[n].alamat:=tab[i];
			i:=i+5;
			n:=n+1;
		end;
		n:=1;
		i:=3;
		while (i <= neff) do 
		begin
			udata[n].username:=tab[i];
			i:=i+5;
			n:=n+1;
		end;
		n:=1;
		i:=4;
		while (i <= neff) do 
		begin
			udata[n].password:=tab[i];
			i:=i+5;
			n:=n+1;
		end;
		n:=1;
		i:=5;
		while (i <= neff) do 
		begin
			udata[n].role:=tab[i];
			i:=i+5;
			n:=n+1;
		end;
		
		for i:=1 to neff do
		begin
			tab[i]:='';
		end;
		
		neff_udata:= n-1;
		
			
		close(f);

	end;
		
	procedure loadbuku(var ubuku:tabbuku; var neff_ubuku:integer; var bukufile:string);
	
	var
		f	:text;
		cc	:char;
		tab	:array[1..100]of string;
		i,neff,n:integer;
			
	begin
		assign(f,bukufile);
		reset(f);
		i:=1;
		neff:=0;
		while not eof(f) do
		begin
			read(f,cc);
			if (tab[i]='sastra') or (tab[i]='sains') or (tab[i]='manga') or (tab[i]='sejarah') or (tab[i]='programming') then 
			begin
				i:=i+1;
				neff:=neff+1;
			end else if (cc<>',') then
			begin
				tab[i]:=tab[i]+cc;
			end else
			begin
				i:=i+1;
				neff:=neff+1;
			end;
		end;
		
		n:=1;
		i:=1;
		while (i <= neff) do 
		begin
			ubuku[n].id:=int(tab[i]);
			i:=i+6;
			n:=n+1;
		end;
		n:=1;
		i:=2;
		while (i <= neff) do 
		begin
			ubuku[n].judul:=tab[i];
			i:=i+6;
			n:=n+1;
		end;
		n:=1;
		i:=3;
		while (i <= neff) do 
		begin
			ubuku[n].author:=tab[i];
			i:=i+6;
			n:=n+1;
		end;
		n:=1;
		i:=4;
		while (i <= neff) do 
		begin
			ubuku[n].jumlah:=int(tab[i]);
			i:=i+6;
			n:=n+1;
		end;
		n:=1;
		i:=5;
		while (i <= neff) do 
		begin
			ubuku[n].tahun:=int(tab[i]);
			i:=i+6;
			n:=n+1;
		end;
		n:=1;
		i:=6;
		while (i <= neff) do 
		begin
			ubuku[n].kategori:=tab[i];
			i:=i+6;
			n:=n+1;
		end;

		for i:=1 to neff do
		begin
			tab[i]:='';
		end;

		neff_ubuku:= n-1;
			
		close(f);

	end;

	procedure loadpinjam(var upinjam:tabpinjam; var neff_upinjam:integer; var pinjamfile:string);

	var
		f	:text;
		cc	:char;
		tab	:array[1..100]of string;
		i,neff,n:integer;

	begin
		assign(f,pinjamfile);
		reset(f);
		i:=1;
		neff:=0;
		while not eof(f) do
		begin	
			read(f,cc);
			if (tab[i]='sudah') or (tab[i]='belum') then 
			begin
				i:=i+1;
				neff:=neff+1;
			end else if (cc<>',') then
			begin
				tab[i]:=tab[i]+cc;
			end else
			begin
				i:=i+1;
				neff:=neff+1;
			end;
		end;
		
		n:=1;
		i:=1;
		while (i <= neff) do 
		begin
			upinjam[n].username:=tab[i];
			i:=i+5;
			n:=n+1;
		end;
		n:=1;
		i:=2;
		while (i <= neff) do 
		begin
			upinjam[n].id:=int(tab[i]);
			i:=i+5;
			n:=n+1;
		end;
		n:=1;
		i:=3;
		while (i <= neff) do 
		begin
			upinjam[n].tglpinjam:=tab[i];
			i:=i+5;
			n:=n+1;
		end;
		n:=1;
		i:=4;
		while (i <= neff) do 
		begin
			upinjam[n].tglbatas:=tab[i];
			i:=i+5;
			n:=n+1;
		end;
		n:=1;
		i:=5;
		while (i <= neff) do 
		begin
			upinjam[n].status:=tab[i];
			i:=i+5;
			n:=n+1;
		end;
		
		for i:=1 to neff do
		begin
			tab[i]:='';
		end;
		
		neff_upinjam:= n-1;
			
		close(f);

	end;

	procedure loadkembali (var ukembali:tabkembali;var neff_ukembali:integer; var kembalifile:string);

	var
		f	:text;
		cc	:char;
		tab	:array[1..100]of string;
		i,neff,n:integer;

	begin
		assign(f,kembalifile);
		reset(f);
		i:=1;
		neff:=0;
		while not eof(f) do
		begin	
			read(f,cc);
			if (tab[i][3]='/') and (tab[i][6]='/') and (length(tab[i])=10) then
			begin
				i:=i+1;
				neff:=neff+1;
			end else if (cc<>',') then
			begin
				tab[i]:=tab[i]+cc;
			end else
			begin
				i:=i+1;
				neff:=neff+1;
			end;
		end;
		
		n:=1;
		i:=1;
		while (i <= neff) do 
		begin
			ukembali[n].username:=tab[i];
			i:=i+3;
			n:=n+1;
		end;
		n:=1;
		i:=2;
		while (i <= neff) do 
		begin
			ukembali[n].id:=int(tab[i]);
			i:=i+3;
			n:=n+1;
		end;
		n:=1;
		i:=3;
		while (i <= neff) do 
		begin
			ukembali[n].tglkembali:=tab[i];
			i:=i+3;
			n:=n+1;
		end;
		
		for i:=1 to neff do
		begin
			tab[i]:='';
		end;
		
		neff_ukembali:= n-1;
		
			
		close(f);

	end;

	procedure loadhilang (var uhilang:tabhilang;var neff_uhilang:integer; var hilangfile:string);

	var
		f	:text;
		cc	:char;
		tab	:array[1..100]of string;
		i,neff,n:integer;

	begin
		assign(f,hilangfile);
		reset(f);
		i:=1;
		neff:=0;
		while not eof(f) do
		begin	
			read(f,cc);
			if (tab[i][3]='/') and (tab[i][6]='/') and (length(tab[i])=10) then
			begin
				i:=i+1;
				neff:=neff+1;
			end else if (cc<>',') then
			begin
				tab[i]:=tab[i]+cc;
			end else
			begin
				i:=i+1;
				neff:=neff+1;
			end;
		end;
		
		n:=1;
		i:=1;
		while (i <= neff) do 
		begin
			uhilang[n].judul:=tab[i];
			i:=i+3;
			n:=n+1;
		end;
		n:=1;
		i:=2;
		while (i <= neff) do 
		begin
			uhilang[n].id:=int(tab[i]);
			i:=i+3;
			n:=n+1;
		end;
		n:=1;
		i:=3;
		while (i <= neff) do 
		begin
			uhilang[n].tgllapor:=tab[i];
			i:=i+3;
			n:=n+1;
		end;
		
		for i:=1 to neff do
		begin
			tab[i]:='';
		end;
		
		neff_uhilang:= n-1;
		
			
		close(f);

	end;
end.
