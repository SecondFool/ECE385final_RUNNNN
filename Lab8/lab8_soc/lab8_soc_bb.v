
module lab8_soc (
	clk_clk,
	keycode_export,
	otg_hpi_address_export,
	otg_hpi_cs_export,
	otg_hpi_data_in_port,
	otg_hpi_data_out_port,
	otg_hpi_r_export,
	otg_hpi_reset_export,
	otg_hpi_w_export,
	p1ab_export,
	p2ab_export,
	position1x_export,
	position1y_export,
	position2x_export,
	position2y_export,
	reset_reset_n,
	scene_export,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	tick_export,
	f1_export,
	f2_export);	

	input		clk_clk;
	output	[7:0]	keycode_export;
	output	[1:0]	otg_hpi_address_export;
	output		otg_hpi_cs_export;
	input	[15:0]	otg_hpi_data_in_port;
	output	[15:0]	otg_hpi_data_out_port;
	output		otg_hpi_r_export;
	output		otg_hpi_reset_export;
	output		otg_hpi_w_export;
	output	[7:0]	p1ab_export;
	output	[7:0]	p2ab_export;
	output	[31:0]	position1x_export;
	output	[31:0]	position1y_export;
	output	[31:0]	position2x_export;
	output	[31:0]	position2y_export;
	input		reset_reset_n;
	output	[7:0]	scene_export;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[31:0]	sdram_wire_dq;
	output	[3:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	output	[31:0]	tick_export;
	output	[31:0]	f1_export;
	output	[31:0]	f2_export;
endmodule
