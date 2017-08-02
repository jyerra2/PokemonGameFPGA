module idMux(input logic [4:0] poke2_wild_id, // comes from poke_battle
input logic [4:0] wild_ID,
output [4:0] wild_ID_final, // connect to poke_battle
input battle_start

);

always_comb
begin
if(battle_start==1'b0)
wild_ID_final= wild_ID;
else 
wild_ID_final = poke2_wild_id;
end

endmodule