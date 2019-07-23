unit usave;

interface

	uses uload;
	
	procedure saveuser(var udata:tabuser;var neff_udata:integer; var userfile:string);
	
	procedure savebuku(var ubuku:tabbuku;var neff_ubuku:integer; var bukufile:string);

	procedure savepinjam(var upinjam:tabpinjam;var neff_upinjam:integer; var pinjamfile:string);

	procedure savekembali (var ukembali:tabkembali;var neff_ukembali:integer; var kembalifile:string);

	procedure savehilang (var uhilang:tabhilang;var neff_uhilang:integer; var hilangfile:string);

implementation
	
	procedure saveuser(var udata:tabuser;var neff_udata:integer; var userfile:string);
	{save array udata ke file eksternal}
	var 
		f:text;
		i:integer;
	begin
		assign(f,userfile);
		rewrite(f);
		for i:=1 to neff_udata do
		begin
			write(f,udata[i].nama);
			write(f,',');
			write(f,udata[i].alamat);
			write(f,',');
			write(f,udata[i].username);
			write(f,',');
			write(f,udata[i].password);
			write(f,',');
			write(f,udata[i].role);
			writeln(f,'');
		end;
		close(f);
	end;	
		
	procedure savebuku(var ubuku:tabbuku;var neff_ubuku:integer; var bukufile:string);
	
	var
		f:text;
		i:integer;
	begin
		assign(f,bukufile);
		rewrite(f);
		for i:=1 to neff_ubuku do
		begin
			write(f,ubuku[i].id);
			write(f,',');
			write(f,ubuku[i].judul);
			write(f,',');
			write(f,ubuku[i].author);
			write(f,',');
			write(f,ubuku[i].jumlah);
			write(f,',');
			write(f,ubuku[i].tahun);
			write(f,',');
			write(f,ubuku[i].kategori);
			writeln(f,'');
		end;
		close(f);
	end;

	procedure savepinjam(var upinjam:tabpinjam;var neff_upinjam:integer; var pinjamfile:string);
	{save array upinjam ke file eksternal}
	var 
		f:text;
		i:integer;
	begin
		assign(f,pinjamfile);
		rewrite(f);
		for i:=1 to neff_upinjam do
		begin
			write(f,upinjam[i].username);
			write(f,',');
			write(f,upinjam[i].id);
			write(f,',');
			write(f,upinjam[i].tglpinjam);
			write(f,',');
			write(f,upinjam[i].tglbatas);
			write(f,',');
			write(f,upinjam[i].status);
			writeln(f,'');
		end;
		close(f);
	end;
	
	procedure savekembali (var ukembali:tabkembali;var neff_ukembali:integer; var kembalifile:string);
	{save file ukembali ke file eksternal}
	var 
		f:text;
		i:integer;
	begin
		assign(f,kembalifile);
		rewrite(f);
		for i:=1 to neff_ukembali do
		begin
			write(f,ukembali[i].username);
			write(f,',');
			write(f,ukembali[i].id);
			write(f,',');
			write(f,ukembali[i].tglkembali);
			writeln(f,'');
		end;
		close(f);
	end;

	procedure savehilang (var uhilang:tabhilang;var neff_uhilang:integer; var hilangfile:string);	
	{save file uhilang ke file eksternal}
	var 
		f:text;
		i:integer;
	begin
		assign(f,hilangfile);
		rewrite(f);
		for i:=1 to neff_uhilang do
		begin
			write(f,uhilang[i].judul);
			write(f,',');
			write(f,uhilang[i].id);
			write(f,',');
			write(f,uhilang[i].tgllapor);
			writeln(f,'');
		end;
		close(f);
	end;
end.
