unit uconvert;

interface

	function int (var str:string):integer;

implementation

	function int (var str:string):integer;
	{mengubah tipe data string menjadi integer}
	var
		i, num :integer;
	begin
		num:=0;
		for i:=1 to length(str) do
		begin
			num:=(num*10)+ ord(str[i])-48;
		end;
		int:=num;
	end;
end.
