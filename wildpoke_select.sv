module wildpoke_select
(
input frameClk,
input Reset,
//input fight_on,
input [1:0] curr_map,
output logic [4:0] wild_ID
);
logic [4:0] Counter;

always_ff @(posedge frameClk)
begin
Counter<= (Counter+1)%31;
end

always_ff@(posedge frameClk)
begin
if(curr_map==2'b01 || curr_map == 2'b00)
begin
   if (Counter>=5'b00000 && Counter <5'b01000)
   wild_ID<= 5'b01100; //PikachuBack
   else if (Counter>=5'b01000 && Counter<5'b10000)
	wild_ID<= 5'b01101; //DoduoBack
	else if (Counter>=5'b10000 && Counter<5'b11000)
	wild_ID<= 5'b01110; //HoundourBack
	else 
	wild_ID<= 5'b01111; //MurkrowBack
end
else if (curr_map==2'b10)
begin
   if (Counter>=5'b00000 && Counter <5'b01000)
   wild_ID<= 5'b10000; //OnyxBack
   else if (Counter>=5'b01000 && Counter<5'b10000)
	wild_ID<= 5'b10001; //GolduckBack
	else if (Counter>=5'b10000 && Counter<5'b11000)
	wild_ID<= 5'b10010; //PidgeottoBack
	else 
	wild_ID<= 5'b10011; //SceptileBack
end

else if (curr_map==2'b11)
begin
   if (Counter>=5'b00000 && Counter <5'b01000)
   wild_ID<= 5'b10100; //LugiaBack
   else if (Counter>=5'b01000 && Counter<5'b10000)
	wild_ID<= 5'b10101; //ArceusBack
	else if (Counter>=5'b10000 && Counter<5'b11000)
	wild_ID<= 5'b10110; //ArticunoBack
	else 
	wild_ID<= 5'b10111; //EnteiBack
end
else
wild_ID= 5'b00000;
end

endmodule