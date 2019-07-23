unit ulapor;

interface
	
	uses uload;

	procedure laporhilang (var uhilang:tabhilang; var neff_uhilang:integer);

	procedure lihatlaporan (var uhilang:tabhilang; var neff_uhilang:integer);

implementation

	procedure laporhilang (var uhilang:tabhilang; var neff_uhilang:integer);
	{melakukan pelaporan buku hilang}	
	var 
		id	: integer;
		judul	:string;
		tanggal	:string;	
	begin
		write('Masukkan id buku: ');readln(id);
		write('Masukkan judul buku: ');readln(judul);
		write('Masukkan tanggal pelaporan :');readln(tanggal);
		uhilang[neff_uhilang+1].id:=id;
		uhilang[neff_uhilang+1].judul:=judul;
		uhilang[neff_uhilang+1].tgllapor:=tanggal;
		neff_uhilang:=neff_uhilang+1;
	end;

	procedure lihatlaporan (var uhilang:tabhilang; var neff_uhilang:integer);
	{mencetak laporan buku hilang}
	var 
	
		i:integer;
	begin
		for i:=1 to neff_uhilang do
		begin
			writeln(uhilang[i].id,' | ',uhilang[i].judul,' | ',uhilang[i].tgllapor);
		end;
	end;
end.
