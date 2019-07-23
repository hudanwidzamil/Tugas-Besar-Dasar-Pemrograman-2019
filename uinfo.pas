unit uinfo;

interface
	uses uload;
	procedure riwayat(var upinjam:tabpinjam;var neff_upinjam:integer;var ubuku:tabbuku;var neff_ubuku:integer);
	procedure statistik(var udata:tabuser;var neff_udata:integer;var ubuku:tabbuku;var neff_ubuku:integer);
	procedure carianggota(var udata:tabuser; var neff_udata:integer);
implementation
	procedure riwayat(var upinjam:tabpinjam;var neff_upinjam:integer;var ubuku:tabbuku;var neff_ubuku:integer);
	var 
		username:string;
		i,j	:integer;
	begin
		write('Masukkan username pengunjung: ');readln(username);
		writeln('Riwayat : ');
		for i:=1 to neff_upinjam do
		begin
			if(upinjam[i].username=username) then
			begin
				write(upinjam[i].tglpinjam,' | ',upinjam[i].id,' | ');
				for j:=1 to neff_ubuku do	
				begin
					if(ubuku[j].id=upinjam[i].id) then
					begin
						writeln(ubuku[j].judul);
					end;
				end;
			end;
		end;
	end;
	procedure statistik(var udata:tabuser;var neff_udata:integer;var ubuku:tabbuku;var neff_ubuku:integer);
	var
		admin,pengunjung,sastra,sejarah,sains,programming,manga,total,i : integer;
	begin
		admin:=0;
		pengunjung:=0;
		sastra:=0;
		sejarah:=0;
		sains:=0;
		programming:=0;
		manga:=0;
		total:=0;
		for i:=1 to neff_udata do	
		begin
			if(udata[i].role='admin')then
			begin
				admin:=admin+1;
			end else
			begin {udata[i].role='user'}
				pengunjung:=pengunjung+1;
			end;
		end;
		for i:= 1 to neff_ubuku do
		begin
			total:=total+ubuku[i].jumlah;
			case ubuku[i].kategori of
				'manga': manga:=manga+ubuku[i].jumlah;
				'programming': programming:=programming+ubuku[i].jumlah;
				'sains': sains:=sains+ubuku[i].jumlah;
				'sastra': sastra:=sastra+ubuku[i].jumlah;
				'sejarah': sejarah:=sejarah+ubuku[i].jumlah;
			end;
		end;
		
		writeln('Pengguna:');
		writeln('Admin | ',admin);
		writeln('Pengunjung | ',pengunjung);
		writeln('Total | ',(admin+pengunjung));
		writeln('Buku:');
		writeln('sastra | ',sastra);
		writeln('sains | ',sains);
		writeln('manga | ',manga);
		writeln('sejarah | ',sejarah);
		writeln('programing | ',programming);
		writeln('Total | ',total);
	end;
	procedure carianggota(var udata:tabuser; var neff_udata:integer);
	var
		username:string;
		i	:integer;
		found	:boolean;
	begin
		write('Masukkan username: ');
		readln(username);
		found:=false;
		for i:= 1 to neff_udata do 
		begin
			if(username=udata[i].username)then 
			begin
				found:=true;
				write('Nama Anggota: ');
				writeln(udata[i].nama);
				write('Alamat anggota: ');
				writeln(udata[i].alamat);
			end;
		end;
		if found=false then
		begin
			writeln('Username tidak ditemukan');
		end;
	end;
end.
