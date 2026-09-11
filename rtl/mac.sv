
module pe #(
    localparam W = 8;
)(


    input logic clk,
    input logic rst,

    // from north
    input logic signed  [W-1:0] psum_in,
    input logic signed  [W-1:0] weight_in,
    input logic                 accept_weight, // colummn-wide

    // from west
    input logic signed [W-1:0] activation_in,
    input logic                act_valid_in,
    input logic                weight_swap_in,
    
    // to south
    output logic signed [W-1:0] psum_out,
    output logic signed [W-1:0] weight_out,
    
    // to east
    output logic signed [W-1:0] activation_out,
    output logic                act_valid_out,
    output logic                weight_swap_out
)

    // weight registers

    logic signed [W-1:0] weight_act;
    logic signed [W-1:0] weight_shadow;

    






endmodule