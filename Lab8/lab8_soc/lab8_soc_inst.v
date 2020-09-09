	lab8_soc u0 (
		.clk_clk                (<connected-to-clk_clk>),                //             clk.clk
		.keycode_export         (<connected-to-keycode_export>),         //         keycode.export
		.otg_hpi_address_export (<connected-to-otg_hpi_address_export>), // otg_hpi_address.export
		.otg_hpi_cs_export      (<connected-to-otg_hpi_cs_export>),      //      otg_hpi_cs.export
		.otg_hpi_data_in_port   (<connected-to-otg_hpi_data_in_port>),   //    otg_hpi_data.in_port
		.otg_hpi_data_out_port  (<connected-to-otg_hpi_data_out_port>),  //                .out_port
		.otg_hpi_r_export       (<connected-to-otg_hpi_r_export>),       //       otg_hpi_r.export
		.otg_hpi_reset_export   (<connected-to-otg_hpi_reset_export>),   //   otg_hpi_reset.export
		.otg_hpi_w_export       (<connected-to-otg_hpi_w_export>),       //       otg_hpi_w.export
		.p1ab_export            (<connected-to-p1ab_export>),            //            p1ab.export
		.p2ab_export            (<connected-to-p2ab_export>),            //            p2ab.export
		.position1x_export      (<connected-to-position1x_export>),      //      position1x.export
		.position1y_export      (<connected-to-position1y_export>),      //      position1y.export
		.position2x_export      (<connected-to-position2x_export>),      //      position2x.export
		.position2y_export      (<connected-to-position2y_export>),      //      position2y.export
		.reset_reset_n          (<connected-to-reset_reset_n>),          //           reset.reset_n
		.scene_export           (<connected-to-scene_export>),           //           scene.export
		.sdram_clk_clk          (<connected-to-sdram_clk_clk>),          //       sdram_clk.clk
		.sdram_wire_addr        (<connected-to-sdram_wire_addr>),        //      sdram_wire.addr
		.sdram_wire_ba          (<connected-to-sdram_wire_ba>),          //                .ba
		.sdram_wire_cas_n       (<connected-to-sdram_wire_cas_n>),       //                .cas_n
		.sdram_wire_cke         (<connected-to-sdram_wire_cke>),         //                .cke
		.sdram_wire_cs_n        (<connected-to-sdram_wire_cs_n>),        //                .cs_n
		.sdram_wire_dq          (<connected-to-sdram_wire_dq>),          //                .dq
		.sdram_wire_dqm         (<connected-to-sdram_wire_dqm>),         //                .dqm
		.sdram_wire_ras_n       (<connected-to-sdram_wire_ras_n>),       //                .ras_n
		.sdram_wire_we_n        (<connected-to-sdram_wire_we_n>),        //                .we_n
		.tick_export            (<connected-to-tick_export>),            //            tick.export
		.f1_export              (<connected-to-f1_export>),              //              f1.export
		.f2_export              (<connected-to-f2_export>)               //              f2.export
	);

