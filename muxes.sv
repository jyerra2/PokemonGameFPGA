module hp_mux(input logic [5:0] hp_prev, hp_new,
				  input logic sel,
				  output logic [5:0] hp_to_pkmnreg);
				  
				  
				 always_comb
				 begin
				 if(sel)
				 hp_to_pkmnreg = hp_new;
				 else
				 hp_to_pkmnreg = hp_prev;
				 end
				 endmodule
				 
				 
module xp_mux(input logic [7:0] xp_prev, xp_new,
				  input logic sel,
				  output logic [7:0] xp_to_pkmnreg);
	
				  always_comb
				  begin
				  if(sel)
				  xp_to_pkmnreg = xp_new;
				  else
				  xp_to_pkmnreg = xp_prev;
				  
				  end
				  endmodule
				  
module level_mux(input logic [3:0] level_in, level_in_plus1,
					  input logic level_sel,
					  output logic [3:0] level_out);
	
				  always_comb
				  begin
				  if(level_sel)
				  level_out = level_in_plus1;
				  else 
				  level_out = level_in;
				  end
				  
				  endmodule
				  