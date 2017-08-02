module poke_reg(input Clk, frameClk,
					 input logic [4:0] poke_id,
					 input logic [2:0] type_id,
					 input logic [3:0] level,
					 input logic [7:0] xp,
					 input logic [5:0] hp,
					 input logic [3:0] attack,
					 input logic [3:0] defense,
					 output logic [4:0] poke_idOut,
					 output logic [2:0] type_out,
					 output logic [3:0] level_out,
					 output logic [7:0] xp_out,
					 output logic [5:0] hp_out,
					 output logic [3:0] attack_out,
					 output logic [3:0] defense_out,
					 input Reset
					 
					 );
					 
					 always_ff @ (posedge frameClk)
					 begin
					 if(Reset)
					 begin
					 poke_idOut <= poke_id;
					 
					 type_out <= type_id;
					  
					 level_out <= level;
					 
					 xp_out <= xp;
					 
					 hp_out <= hp;
					 
					 attack_out <= attack;
					 
					 defense_out <= defense;
					 end
					 
					 else
					 begin
					 
					 poke_idOut <= poke_id;
					 
					 type_out <= type_id;
					  
					 level_out <= level;
					 
					 xp_out <= xp;
					 
					 hp_out <= hp;
					 
					 attack_out <= attack;
					 
					 defense_out <= defense;
					 end
					 
					 end
					 endmodule
					 