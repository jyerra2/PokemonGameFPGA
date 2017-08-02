//module tristate(input logic Clk,
//					             tristate_output_enable,
//				    output logic Data_read,
//					 inout wire [15:0] Data);
//					 
//					 
//					 logic [15:0] Data_read_buffer;
//					 
//					 always_ff@(posedge Clk)
//					 begin
//					 
//					 Data_read_buffer <= Data;
//					 
//					 end
//					 
//					 
//					 
//					 
//					 
//					 
//					 
//					 
//					 assign Data_read = Data_read_buffer;
//					 
//				
//					 
//					 endmodule
//					 