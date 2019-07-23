unit upinjamkembali;

interface
	uses uload, uconvert;
	
	procedure pinjambuku(var ubuku:tabbuku;var neff_ubuku:integer; var upinjam:tabpinjam;var neff_upinjam:integer; var logged:string);
	
	procedure kembalikanbuku(var ubuku:tabbuku;var neff_ubuku:integer; var upinjam:tabpinjam;var neff_upinjam:integer;var ukembali:tabkembali;var neff_ukembali:integer; var logged:string);
	
	
implementation
	
	procedure pinjambuku(var ubuku:tabbuku;var neff_ubuku:integer; var upinjam:tabpinjam;var neff_upinjam:integer; var logged:string);
	
	var
		id		:integer;
		i		:integer;
		found		:boolean;
		{variabel terkait tanggal}
		tanggal		:string;
		dp,mp,yp	:integer;
		dtemp,mtemp,ytemp:string;
		dk,mk,yk	:integer;
		dktemp,mktemp,yktemp:string;
		tglbatas	:string;	
	begin
		write('Masukkan id buku yang ingin dipinjam: ');readln(id);
    		write('Masukkan tanggal hari ini: ');readln(tanggal);

		{pemrosesan tanggal}
		dtemp:=(tanggal[1]+tanggal[2]);
		mtemp:=(tanggal[4]+tanggal[5]);
		ytemp:=(tanggal[7]+tanggal[8]+tanggal[9]+tanggal[10]);
		dp:=int(dtemp);
		mp:=int(mtemp);
		yp:=int(ytemp);
		dk:=dp+7;	
		mk:=mp;
		yk:=yp;
		if ((mk=1) or (mk=3) or (mk=5) or (mk=7) or (mk=8) or (mk=10)) and (dk>31) then
		begin
			mk:=mk+1;
			dk:=dk-31;
		end else if ((mk=4) or (mk=6) or (mk=9) or (mk=11)) and (dk>30) then
		begin
			mk:=mk+1;
			dk:=dk-30;
		end else if (mk=2) and (dk>28) then
		begin
			mk:=mk+1;
			dk:=dk-28;
		end else if (mk=12) and (dk>31) then
		begin
			mk:=1;
			dk:=dk-31;
			yk:=yk+1;
		end;
		Str(dk,dktemp);Str(mk,mktemp);Str(yk,yktemp);
		if dk<10 then	
		begin
			dktemp:='0'+dktemp;
		end;
		if mk<10 then	
		begin
			mktemp:='0'+mktemp;
		end;
		tglbatas:=dktemp+'/'+mktemp+'/'+yktemp;
		{}

		found:=false;
		i:=1;		
		while (i <= neff_ubuku) and (found=false) do
		begin
			if (id=ubuku[i].id) then
			begin
				found:=true;
			end;
			i:=i+1;
		end;
		i:=i-1;
		if (found=true) then	
		begin
			if ubuku[i].jumlah=0 then
			begin
				writeln('Buku ',ubuku[i].judul,' sedang habis!');
				writeln('Coba lain kali.');
			end else
			begin
				ubuku[i].jumlah:=ubuku[i].jumlah-1;
				writeln('Buku ',ubuku[i].judul,' berhasil dipinjam!');
				writeln('Tersisa ',ubuku[i].jumlah,' buku ',ubuku[i].judul,'.');
				writeln('Terima kasih sudah meminjam.');
				upinjam[neff_upinjam+1].username:=logged;
				upinjam[neff_upinjam+1].id:=id;
				upinjam[neff_upinjam+1].tglpinjam:=tanggal;
				upinjam[neff_upinjam+1].tglbatas:=tglbatas;
				upinjam[neff_upinjam+1].status:='belum';
				neff_upinjam:=neff_upinjam+1;
			end;
		end;
	end;

	procedure kembalikanbuku(var ubuku:tabbuku;var neff_ubuku:integer; var upinjam:tabpinjam;var neff_upinjam:integer;var ukembali:tabkembali;var neff_ukembali:integer; var logged:string);

	var
		id	:integer;
		i,j	:integer;
		found	:boolean;
		{variabel terkait tanggal}
		tanggal	:string;
		dp,mp,yp	:integer;
		dtemp,mtemp,ytemp:string;
		dk,mk,yk	:integer;
		dktemp,mktemp,yktemp:string;
		telat : integer;
		
	begin
		write('Masukkan id buku yang dikembalikan: ');readln(id);
		found:=false;
		i:=1;
		while (i <= neff_upinjam) and (found=false) do
		begin
			if(id=upinjam[i].id)and(logged=upinjam[i].username) then
			begin
				found:=true;
			end;
			i:=i+1;
		end;
		i:=i-1;
		found:=false;
		j:=1;
		while (j <= neff_ubuku) and (found=false) do
		begin
			if(id=ubuku[j].id) then
			begin
				found:=true;
			end;
			j:=j+1;
		end;
		j:=j-1;
		ubuku[j].jumlah:=ubuku[j].jumlah+1;
		upinjam[i].status:='sudah';
		writeln('Data peminjaman :');
		writeln('Username : ',upinjam[i].username);
		writeln('Judul buku: ',ubuku[j].judul);
		writeln('Tanggal peminjaman : ',upinjam[i].tglpinjam);	
		writeln('Tanggal batas pengembalian : ',upinjam[i].tglbatas);
		writeln();
		
		{pemrosesan tanggal}
		write('Masukkan tanggal hari ini: ');readln(tanggal);
		dtemp:=(tanggal[1]+tanggal[2]);
		mtemp:=(tanggal[4]+tanggal[5]);
		ytemp:=(tanggal[7]+tanggal[8]+tanggal[9]+tanggal[10]);
		dp:=int(dtemp);
		mp:=int(mtemp);
		yp:=int(ytemp);
		dktemp:=(upinjam[i].tglbatas[1]+upinjam[i].tglbatas[2]);
		mktemp:=(upinjam[i].tglbatas[4]+upinjam[i].tglbatas[5]);
		yktemp:=(upinjam[i].tglbatas[7]+upinjam[i].tglbatas[8]+upinjam[i].tglbatas[9]+upinjam[i].tglbatas[10]);
		dk:=int(dktemp);
		mk:=int(mktemp);
		yk:=int(yktemp);

		telat := 0;
		while (dp > dk) or (mp > mk) or (yp > yk) do
		begin
			telat := telat + 1;
			dk := dk + 1;
			if ((mk=1) or (mk=3) or (mk=5) or (mk=7) or (mk=8) or (mk=10)) and (dk>31) then
			begin
				mk:=mk+1;
				dk:=dk-31;
			end else if ((mk=4) or (mk=6) or (mk=9) or (mk=11)) and (dk>30) then
			begin
				mk:=mk+1;
				dk:=dk-30;
			end else if (mk=2) and (dk>28) then
			begin
				mk:=mk+1;
				dk:=dk-28;
			end else if (mk=12) and (dk>31) then
			begin
				mk:=1;
				dk:=dk-31;
				yk:=yk+1;
			end;
		end;
		if (telat = 0) then
		begin
			writeln ('Terima kasih sudah meminjam.');
		end else
		begin
			writeln ('Anda terlambat mengembalikan buku.');
			writeln ('Anda terkena denda ', telat*2000,'.');
		end;
		ukembali[neff_ukembali+1].username:=logged;
		ukembali[neff_ukembali+1].id:=id;
		ukembali[neff_ukembali+1].tglkembali:=tanggal;
		neff_ukembali:=neff_ukembali+1;
	end;
end.
