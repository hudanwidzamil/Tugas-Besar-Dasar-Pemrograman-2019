unit uloginregister;


interface
	
	uses uload;
	
	procedure register(var udata:tabuser;var neff_udata:integer);
	
	procedure login(var udata:tabuser;var neff_udata:integer;var roleuser:string;var logged:string);
	
implementation

	procedure register(var udata:tabuser;var  neff_udata:integer);
	{melakukan registrasi user baru; hanya bisa dilakukan admin yang dibatasi di menu}
		
	var
		reguser:userdata;
	begin
		write('Masukkan nama pengunjung: ');readln(reguser.nama);
		write('Masukkan alamat pengunjung: ');readln(reguser.alamat);
		write('Masukkan username pengunjung: ');readln(reguser.username);
		write('Masukkan password pengunjung: ');readln(reguser.password);
		reguser.role:='user';
		udata[neff_udata+1]:=reguser;
		neff_udata:=neff_udata+1;
		writeln();		
		writeln('Pengunjung ',reguser.nama,' berhasil terdaftar sebagai ', reguser.role,'.');
		writeln();
	end;	
	
	procedure login(var udata:tabuser;var neff_udata:integer; var roleuser:string;var logged:string);
	{login bagi user maupun admin}
	var
		loguser:userdata;
		i,place:integer;
		found:boolean;
	begin
		found:=false;
		write('Masukkan username : ');readln(loguser.username);
		write('Masukkan password : ');readln(loguser.password);
		for i:=1 to neff_udata do 
		begin
			if (udata[i].username=loguser.username) and (udata[i].password=loguser.password)then
			begin
				found:=true;
				place:=i;
		
			end;
		
		end;
		while found=false do
		begin
			writeln('Username/password salah! Silakan coba lagi.');
			write('Masukkan username : ');readln(loguser.username);
			write('Masukkan password : ');readln(loguser.password);
			for i:=1 to neff_udata do 
			begin
				if (udata[i].username=loguser.username) and (udata[i].password=loguser.password) then
				begin
					found:=true;
					place:=i;
		
				end;
			end;
		end;

		if found then
		begin
			roleuser:=udata[place].role;
			logged:=udata[place].username;
			writeln('Selamat datang ',udata[place].nama,' !');
		end; 	

	end;
end.
