module colorTable(input logic [15:0] color,
					   input logic [9:0] DrawX, DrawY,
						output logic [7:0] Red, Green, Blue);
						
						logic [7:0] R, G, B;
						
						always_comb
						begin
						
						unique case(color)
						//Purple for background
								8'd00: begin
								R = 8'h80;
								G = 8'h00;
								B = 8'h80;
								end
								//Light red
								8'd01: begin
								R = 8'haf;
								G = 8'h43;
								B = 8'h39;
								end
						  
						      //Blue
								8'd02: begin
								R = 8'h31;
								G = 8'h63;
								B = 8'he1;
								end

								//Brown
							   8'd03: begin
								R = 8'h5a;
								G = 8'h31;
								B = 8'h31;
								end
							   
							   //Light pink	
								8'd04: begin
								R = 8'hde;
								G = 8'hc6;
								B = 8'hbd;
								end
								
								//Cyan
								8'd05: begin
								R = 8'h73;
								G = 8'hce;
								B = 8'ha5;
								end
						      
								//Light Green
						      8'd06: begin
								R = 8'h7b;
								G = 8'hde;
								B = 8'h39;
								end
								
								//Dark Green
								8'd07: begin
								R = 8'h42;
								G = 8'h63;
								B = 8'h31;
								end
								
								//Light blue
								8'd08: begin
								R = 8'h40;
								G = 8'h9c;
								B = 8'hff;
								end
								
								//White
								8'd09: begin
								R = 8'hff;
								G = 8'hff;
								B = 8'hff;
								end
								
								
								//Green-ish Cyan
								8'd10: begin
								R = 8'h21;
								G = 8'h63;
								B = 8'h73;
								end
								
								//Pinkish Orange
								8'd11: begin
								R = 8'hfc;
								G = 8'h74;
								B = 8'h60;
								end
						   
							   //Light Purple -> This is being used as background for ash sprite
						      8'd12: begin
								R = 8'hde;
								G = 8'hd6;
								B = 8'he7;
								end
								
								//Light brown
								8'd13: begin
								R = 8'haa;
								G = 8'h83;
								B = 8'h6f;
								end
						  
						      //Olive -- kinda?
						      8'd14: begin
								R = 8'hb1;
								G = 8'ha5;
								B = 8'h36;
								end
								
								//Darker green
								8'd15: begin
								R = 8'h00;
								G = 8'h63;
								B = 8'h04;
								end
								
								//Lighter green + lighter blue
								8'd16: begin
								R = 8'h8c;
								G = 8'hde;
								B = 8'hbd;
								end
								
								
								//Pitch Black
								8'd17: begin
								R = 8'h00;
								G = 8'h00;
								B = 8'h00;
								end
								
								//Lighter brown
								8'd18: begin
								R = 8'hd2;
								G = 8'hbc;
								B = 8'h75;
								end
								
								//Pink shade #1
								8'd19: begin
								R = 8'hd6;
								G = 8'h90;
								B = 8'h73;
								end
								
								//Pink shade #2
								8'd20: begin
								R = 8'hf7;
								G = 8'hbf;
								B = 8'h93;
								end
								
								//Green shade #1
								8'd21: begin
								R = 8'h95;
								G = 8'hcc;
								B = 8'h3a;
								end
								
								//Dark Red
								8'd22: begin
								R = 8'hbe;
								G = 8'h3a;
								B = 8'h3c;
								end
								
								//Dark Brown #2
								8'd23: begin
								R = 8'h77;
								G = 8'h41;
								B = 8'h41;
								end
								
								// Bright Yellow
								8'd24: begin
								R = 8'hfe;
								G = 8'hdc;
								B = 8'h32;
								end
								
								//Bright Orange
								8'd25: begin
								R = 8'hde;
								G = 8'h63;
								B = 8'h20;
								end
								
								//Bright Red
								8'd26: begin
								R = 8'hdb;
								G = 8'h09;
								B = 8'h16;
								end
								
								//A shade of greem
								8'd27: begin
								R = 8'h00;
								G = 8'h63;
								B = 8'h09;
								end
								
								//Grey
								8'd28: begin
								R = 8'hbd;
								G = 8'hbd;
								B = 8'hce;
								end
								
								//A shade of green
								8'd29: begin
								R = 8'h52;
								G = 8'hbd;
								B = 8'h9c;
								end
								
								//Blue for wartortle
								8'd30: begin
								R = 8'h8b;
								G = 8'hac;
								B = 8'hf6;
								end
								
								//Dark grey
								8'd31: begin
								R = 8'ha0;
								G = 8'ha0;
								B = 8'haa;
								end
								
								//Wheatish Brown
								8'd32: begin
								R = 8'h51;
								G = 8'h51;
								B = 8'h50;
								end
								
								//Light Yellow
								8'd33: begin
								R = 8'hff;
								G = 8'he5;
								B = 8'h90;
								end
								
								8'd34 : begin
								R = 8'he6;
								G = 8'he5;
								B = 8'ha0;
								end
								
								//Background for PokeSelect
								8'd35: begin
								R = 8'hff - DrawX[9:2];
								G = 8'hff - DrawX[9:2];
								B = 8'hff - DrawX[9:2];
								end
								
								//d3f9b3
								//0a6805
								//Background for Pokemon battle
								8'd36: begin
								R = 8'h0a;
								G = 8'h68;
								B = 8'h05;
								end
								
								8'd37 : begin
								R = 8'h00;
								G = 8'hff;
								B = 8'h00;
								end
								
							endcase
								//
								
						end
						
						assign Red = R;
						assign Blue = B;
						assign Green = G;
						
						endmodule
						
						  
						  
						  
						  
						  
						  
						  
						  
						  
						  
						  
								
								
						  
						  
						  
						  
						
						  
						  
						  
						  
						  
						  