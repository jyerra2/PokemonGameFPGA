
//-------------------------------------------------------------------------
//      lab7_usb.sv                                                      --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Fall 2014 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 7                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module lab8( input               CLOCK_50,
											
             input        [3:0]  KEY,          //bit 0 is set up as Reset
             output logic [6:0]  HEX0, HEX1,
             // VGA Interface 
             output logic [7:0]  VGA_R,        //VGA Red
             VGA_G,        //VGA Green
             VGA_B,        //VGA Blue
             output logic        VGA_CLK,      //VGA Clock
             VGA_SYNC_N,   //VGA Sync signal
             VGA_BLANK_N,  //VGA Blank signal
             VGA_VS,       //VGA vertical sync signal
             VGA_HS,       //VGA horizontal sync signal
				 input [17:0] SW,
				 output [7:0] LEDG,
				 output [17:0] LEDR,
             // CY7C67200 Interface
             inout  wire  [15:0] OTG_DATA,     //CY7C67200 Data bus 16 Bits
             output logic [1:0]  OTG_ADDR,     //CY7C67200 Address 2 Bits
             output logic        OTG_CS_N,     //CY7C67200 Chip Select
             OTG_RD_N,     //CY7C67200 Write
             OTG_WR_N,     //CY7C67200 Read
             OTG_RST_N,    //CY7C67200 Reset
             input               OTG_INT,      //CY7C67200 Interrupt
             // SDRAM Interface for Nios II Software
             output logic [12:0] DRAM_ADDR,    //SDRAM Address 13 Bits
             inout  wire  [31:0] DRAM_DQ,      //SDRAM Data 32 Bits
             output logic [1:0]  DRAM_BA,      //SDRAM Bank Address 2 Bits
             output logic [3:0]  DRAM_DQM,     //SDRAM Data Mast 4 Bits
             output logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
             DRAM_CAS_N,   //SDRAM Column Address Strobe
             DRAM_CKE,     //SDRAM Clock Enable
             DRAM_WE_N,    //SDRAM Write Enable
             DRAM_CS_N,    //SDRAM Chip Select
             DRAM_CLK,     //SDRAM Clock
				 
				 	 output logic SRAM_CE_N, SRAM_UB_N, SRAM_LB_N, SRAM_OE_N, SRAM_WE_N,
				 
				    output logic [19:0] SRAM_ADDR,
			 
			       input logic [15:0] SRAM_DQ
			
           );
//			  

//add these to the top level 
//			  	 output logic CE, UB, LB OE, WE,
//				 
//				 output logic [19:0] ADDR,
//				 
//				 inout wire [15:0] Data

//
//
		  
//			  
			  
			  
//assign ADDR = 20{1'b0};
			  
logic Reset_h, Clk;
logic [15:0] keycode;
logic Reset_ball;

assign Reset_ball = ~(KEY[2]);
assign Clk = CLOCK_50;
assign {Reset_h} = ~(KEY[0]);  // The push buttons are active low



logic [1:0] hpi_addr;
logic [15:0] hpi_data_in, hpi_data_out;
logic hpi_r, hpi_w, hpi_cs;

// Interface between NIOS II and EZ-OTG chip
hpi_io_intf hpi_io_inst(
    .Clk(Clk),
    .Reset(Reset_h),
    // signals connected to NIOS II
    .from_sw_address(hpi_addr),
    .from_sw_data_in(hpi_data_in),
    .from_sw_data_out(hpi_data_out),
    .from_sw_r(hpi_r),
    .from_sw_w(hpi_w),
    .from_sw_cs(hpi_cs),
    // signals connected to EZ-OTG chip
    .OTG_DATA(OTG_DATA),
    .OTG_ADDR(OTG_ADDR),
    .OTG_RD_N(OTG_RD_N),
    .OTG_WR_N(OTG_WR_N),
    .OTG_CS_N(OTG_CS_N),
    .OTG_RST_N(OTG_RST_N)
);

//The connections for nios_system might be named different depending on how you set up Qsys
lab8_soc nios_system(
    .clk_clk(Clk),
    .reset_reset_n(KEY[0]),
    .sdram_wire_addr(DRAM_ADDR),
    .sdram_wire_ba(DRAM_BA),
    .sdram_wire_cas_n(DRAM_CAS_N),
    .sdram_wire_cke(DRAM_CKE),
    .sdram_wire_cs_n(DRAM_CS_N),
    .sdram_wire_dq(DRAM_DQ),
    .sdram_wire_dqm(DRAM_DQM),
    .sdram_wire_ras_n(DRAM_RAS_N),
    .sdram_wire_we_n(DRAM_WE_N),
    .sdram_out_clk_clk(DRAM_CLK),
    .keycode_export(keycode),
    .otg_hpi_address_export(hpi_addr),
    .otg_hpi_data_in_port(hpi_data_in),
    .otg_hpi_data_out_port(hpi_data_out),
    .otg_hpi_cs_export(hpi_cs),
    .otg_hpi_r_export(hpi_r),
    .otg_hpi_w_export(hpi_w)
);
logic [9:0] DrawX, DrawY;
logic [9:0] BallX, BallY, BallS;

//Fill in the connections for the rest of the modules
assign SRAM_CE_N = 1'b0;
assign SRAM_WE_N = 1'b1;
assign SRAM_LB_N = 1'b0;
assign SRAM_UB_N = 1'b0;
assign SRAM_OE_N = 1'b0;	

//logic [15:0] curr_map_pixel;
//assign curr_map_pixel = 



logic [15:0] Data_from_SRAM;//variable as input to MEM2IO and output from tristate

assign Data_from_SRAM = SRAM_DQ;

logic [1:0] spriteControlBits;
logic [3:0] counter;

logic [5:0] hp_poke1, hp_poke2;

logic [1:0] display_control;
logic [3:0] battle_control;

logic hp1mux, hp2mux;

logic [3:0] level;

logic init_reg;

logic [3:0] level_poke2;

logic battle_done; //from poke_battle to gameState

logic [1:0] curr_map;

logic [7:0] u[0:9];
logic [7:0] w[0:9];

//assign LEDR [17:12] = hp_poke1;
//assign LEDR [5:0] = hp_poke2;
assign LEDG[3:0] = battle_control;

logic during_battle;

logic [4:0] wild_final_ID;

logic [4:0] wild_ID_in;

logic [4:0] wild_ID_gen;

logic wild_poke_reg;

logic battle_start;

logic rand5_start;

logic [4:0] userID;

logic [4:0] prevID;

logic [4:0] currID;

logic [1:0] starterSelect;

assign LEDR[4:0] = userID;

logic starterMux;

logic heal_on;

always_comb
begin
if(display_control == 2'b00)
SRAM_ADDR = (DrawY/2) * 320 + (DrawX/2);
else
begin
if(SW[5:4] == 2'b00) 
SRAM_ADDR = 76800 + (DrawY/2)*320 + (DrawX/2);
else
SRAM_ADDR =  (SW[5:4] * 76800) + (DrawY/2) * 320 + (DrawX/2);
end

end

//
//
//logic [15:0] bitAddress;//to select the map --> address of map	
//
//logic [15:0] selectMap; // NOTE: DEFINE GAME_STATE, OUTPUT == MAP --> select which map --> equivalent to switches		  
//			  
//assign ADDR = {4'b00, bitAddress}; // ZEXT

//type_def test(.pokemon_id(SW[4:0]), .type_pokemon(LEDR[17:15]));

gameState g0(.Clk(Clk), .Reset(Reset_ball), .starterSelect(starterSelect), .starterMux(starterMux), .frameClk(VGA_VS),.battle_done(battle_done), .battle_start(battle_start), .display_control(display_control), .battle_control(battle_control), .keycode(keycode[7:0]), .hp1selbit(hp1mux), .hp2selbit(hp2mux), .init_reg_select(init_reg), .during_battle(during_battle), .wild_poke_reg(wild_poke_reg));

//battleSpriteName bs0(.userPkmnID(SW[17:13]), .wildPkmnID(wild_final_ID), .u(u), .w(w));
//userPkmnSelect u0();// Not needed

battleSpriteName bs0(.userPkmnID(userID), .wildPkmnID(wild_final_ID), .u(u), .w(w));

starterSelect ss0(.starterSelect(starterSelect), .prev_ID(prevID), .enable(starterMux), .new_ID(currID));

user_pokeID up0(.curr_level(SW[3:0]), .curr_ID(currID), .new_ID(userID));//Gave level to the switches

poke_battle p0(.Reset(Reset_ball), .heal_on(heal_on), .hp1_mux(hp1mux), .hp2_mux(hp2mux), .poke1_id(userID), .poke2_id(wild_final_ID), .battle_done(battle_done), .hp_out1(hp_poke1), .hp_out2(hp_poke2), .init_reg(init_reg), .Clk(Clk), .frameClk(VGA_VS), .curr_map(SW[1:0]),


					.curr_level(level), .poke2_idOut(wild_ID_in), .wild_poke_reg(wild_poke_reg), .userPkmnlevel(LEDR[17:14]), .wildPkmnlevel(LEDR[13:10]), .prev_poke_ID(prevID));
					
idMux i0(.wild_ID(wild_ID_gen), .poke2_wild_id(wild_ID_in), .wild_ID_final(wild_final_ID), .battle_start(during_battle));

rand_counter r0(.frameClk(VGA_VS), .Reset(Reset_ball), .rand5_start(rand5_start), .keycode(keycode[7:0]), .fight_on(battle_start));

wildpoke_select wp0(.frameClk(VGA_VS), .Reset(Reset_ball), .curr_map(SW[5:4]), .wild_ID(wild_ID_gen));					

VGA_controller vga_controller_instance(.*, .Reset(Reset_h));

ball ball_instance(.Reset(Reset_ball), .*, .frame_clk(VGA_VS), .keycode(keycode[7:0]), .rand5_start(rand5_start), .curr_map(SW[5:4])

, .heal_on(heal_on)) ;

color_mapper color_instance(.VGA_CLK(VGA_CLK), .Clk(Clk), .frameClk(VGA_VS), .BallX(BallX), .BallY(BallY), .BallS(BallS), .DrawX(DrawX), .DrawY(DrawY), .counter(counter), .keycode(keycode[7:0]), .hp_poke1(hp_poke1), .hp_poke2(hp_poke2), 
                   .battle_control(battle_control), .display_control(display_control), .Data(Data_from_SRAM),.spriteDirControl(spriteControlBits), .wildPokemonSprite(wild_final_ID),
						 .curr_level(level), .curr_map(), .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B), .userPokemonSprite(SW[17:13]), .u(u), .w(w));//Gave user Pokemon Sprite through switches. Change to userID in top level


//color_mapper color_instance(.BallX(BallX), .BallY(BallY), .curr_map(curr_map), .BallS(BallS), .DrawX(DrawX), .DrawY(DrawY),.VGA_R(VGA_R), VGA_G(VGA_R), VGA_B(VGA_B) );

HexDriver hex_inst_0 (keycode[3:0], HEX0);
HexDriver hex_inst_1 (keycode[7:4], HEX1);

/**************************************************************************************
    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
    Hidden Question #1/2:
    What are the advantages and/or disadvantages of using a USB interface over PS/2 interface to
         connect to the keyboard? List any two.  Give an answer in your Post-Lab.
**************************************************************************************/
endmodule
