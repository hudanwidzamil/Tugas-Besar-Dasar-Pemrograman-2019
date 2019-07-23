unit ucari;

interface
	
	uses uload;

	procedure carikategori (var ubuku:tabbuku; var neff_ubuku:integer);

	procedure caritahun (var ubuku:tabbuku; var neff_ubuku:integer);
	
implementation
	
	procedure carikategori (var ubuku:tabbuku; var neff_ubuku:integer);
	{mencari buku berdasarkan masukan kategori}
	var
		i	:integer;
		kategori:string;
		found	:boolean;
		temp	:buku;
	begin

		for i:=1 to neff_ubuku-1 do
		begin
			if ubuku[i].judul>ubuku[i+1].judul then
			begin
				temp:=ubuku[i];
				ubuku[i]:=ubuku[i+1];
				ubuku[i+1]:=temp;
			end;
		end;
		write('Masukkan kategori : ');readln(kategori);
		writeln();
		while (kategori<>'sastra') and (kategori<>'sains') and (kategori<>'manga') and (kategori<>'sejarah') and (kategori<>'programming')  do
		begin
			writeln('Kategori ',kategori,' tidak valid.');
			write('Masukkan kategori : ');readln(kategori);
			writeln();
		end;
		found:=false;
		for i:=1 to neff_ubuku do
		begin
			if (ubuku[i].kategori = kategori) then
			begin
				found:=true;
				writeln(ubuku[i].id,' | ',ubuku[i].judul,' | ',ubuku[i].author);
			end;
		end;
		if found=false then
		begin
			writeln('Tidak ada buku dalam kategori ini');
		end;
	end;

	procedure caritahun (var ubuku:tabbuku; var neff_ubuku:integer);
	{mencari buku sesuai masukan tahun dan syarat}
	var
		i	:integer;
		tahun	:integer;
		kategori:string;
		found	:boolean;
	begin
		write('Masukkan tahun : ');readln(tahun);
		write('Masukkan kategori : ');readln(kategori);
		writeln();

		found:=false;
		
		if kategori='<' then
		begin
			for i:=1 to neff_ubuku do
			begin
				if (ubuku[i].tahun < tahun) then
				begin
					found:=true;
					writeln(ubuku[i].id,' | ',ubuku[i].judul,' | ',ubuku[i].author);
				end;
			end;	
		end else if kategori='<=' then
		begin
			for i:=1 to neff_ubuku do
			begin
				if (ubuku[i].tahun <= tahun) then
				begin
					found:=true;
					writeln(ubuku[i].id,' | ',ubuku[i].judul,' | ',ubuku[i].author);
				end;
			end;	
		end else if kategori='>' then
		begin
			for i:=1 to neff_ubuku do
			begin
				if (ubuku[i].tahun > tahun) then
				begin
					found:=true;
					writeln(ubuku[i].id,' | ',ubuku[i].judul,' | ',ubuku[i].author);
				end;
			end;
		end else if kategori='>=' then
		begin
			for i:=1 to neff_ubuku do
			begin
				if (ubuku[i].tahun >= tahun) then
				begin
					found:=true;
					writeln(ubuku[i].id,' | ',ubuku[i].judul,' | ',ubuku[i].author);
				end;
			end;	
		end else {kategori='='}
		begin
			for i:=1 to neff_ubuku do
			begin
				if (ubuku[i].tahun = tahun) then
				begin
					found:=true;
					writeln(ubuku[i].id,' | ',ubuku[i].judul,' | ',ubuku[i].author);
				end;
			end;
		end;
		if found=false then
		begin
			writeln('Tidak ada buku yang sesuai');
		end;	
	end;
end.
