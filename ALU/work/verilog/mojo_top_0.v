/*
   This file was generated automatically by the Mojo IDE version B1.3.4.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [8-1:0] M_adder_io_led2;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  add_2 adder (
    .clk(clk),
    .rst(rst),
    .io_dip(io_dip),
    .io_led2(M_adder_io_led2),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  wire [8-1:0] M_compare_io_led2;
  compare_3 compare (
    .clk(clk),
    .rst(rst),
    .io_dip(io_dip),
    .io_led2(M_compare_io_led2)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    
    case (io_dip[16+4+1-:2])
      1'h0: begin
        io_led[16+7-:8] = M_adder_io_led2;
        led[0+0-:1] = M_adder_z;
        led[1+0-:1] = M_adder_v;
        led[2+0-:1] = M_adder_n;
      end
      2'h3: begin
        io_led[16+7-:8] = M_compare_io_led2;
      end
    endcase
  end
endmodule