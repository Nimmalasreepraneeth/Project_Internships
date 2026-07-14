`timescale 1ns / 1ps

//-----------------------------------------------------
// //Half Adder
//-----------------------------------------------------

module Ha(sum, carry, a, b);

input a, b;
output sum, carry;

xor G1(sum, a, b);
and G2(carry, a, b);

endmodule

//-----------------------------------------------------
// Full Adder
//-----------------------------------------------------

module FA(sum, carry, a, b, cin);

input a, b, cin;
output sum, carry;

wire s;
wire c1, c2;

xor G1(s, a, b);
xor G2(sum, s, cin);

and G3(c1, a, b);
and G4(c2, s, cin);

or G5(carry, c1, c2);

endmodule


module BaughWooley4x4(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] p,
    output [7:0] out
   
);
// Partial Product Wires
wire p1,  p2,  p3,  p4;
wire p5,  p6,  p7,  p8;
wire p9,  p10, p11, p12;
wire p13, p14, p15, p16;
// Carry Wires
wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13,c14;

// Intermediate Sum Wires
wire s2, s3, s4, s5, s6, s7, s8, s9;
wire discard;

assign p1=A[0]&B[0];
assign p2=A[1]&B[0];
assign p3=A[2]&B[0];
assign p4=A[3]&~B[0];

assign p5=A[0]&B[1];
assign p6=A[1]&B[1];
assign p7=A[2]&B[1];
assign p8=A[3]&~B[1];

assign p9=A[0]&B[2];
assign p10=A[1]&B[2];
assign p11=A[2]&B[2];
assign p12=A[3]&~B[2];

assign p13=~A[0]&B[3];
assign p14=~A[1]&B[3];
assign p15=~A[2]&B[3];
assign p16=A[3]&B[3];
assign p17= ~A[3];
assign p18= ~B[3];

 //partial products
 
//-----------------------------------------------------
// First Row - Half Adders
//-----------------------------------------------------
assign p[0]= p1;
Ha HA1(
    .sum(p[1]),
    .carry(c1),
    .a(p2),
    .b(p5)
);

Ha HA2(
    .sum(s2),
    .carry(c2),
    .a(p3),
    .b(p6)
);

Ha HA3(
    .sum(s3),
    .carry(c3),
    .a(p4),
    .b(p7)
);

//-----------------------------------------------------
// Second Row - Full Adders
//-----------------------------------------------------

FA FA1(
    .sum(p[2]),
    .carry(c14),
    .a(s2),
    .b(p9),
    .cin(c1)
);

FA FA2(
    .sum(s4),
    .carry(c4),
    .a(s3),
    .b(p10),
    .cin(c2)
);

FA FA3(
    .sum(s6),
    .carry(c6),
    .a(p8),
    .b(p11),
    .cin(c3)
);

//-----------------------------------------------------
// Third Row - Full Adders
//-----------------------------------------------------

FA FA4(
    .sum(s5),
    .carry(c5),
    .a(s4),
    .b(p13),
    .cin(c14)
);

FA FA5(
    .sum(s7),
    .carry(c7),
    .a(s6),
    .b(p14),
    .cin(c4)
);

FA FA6(
    .sum(s8),
    .carry(c8),
    .a(p12),
    .b(p15),
    .cin(c6)
);

FA FA7(
    .sum(s9),
    .carry(c12),
    .a(p17),
    .b(p18),
    .cin(p16)
);

//-----------------------------------------------------
// Last Row - Full Adders
//-----------------------------------------------------

FA FA8(
    .sum(p[3]),
    .carry(c9),
    .a(A[3]),
    .b(B[3]),
    .cin(s5)
);

FA FA9(
    .sum(p[4]),
    .carry(c10),
    .a(c5),
    .b(c9),
    .cin(s7)
);

FA FA10(
    .sum(p[5]),
    .carry(c11),
    .a(s8),
    .b(c7),
    .cin(c10)
);

FA FA11(
    .sum(p[6]),
    .carry(c13),
    .a(s9),
    .b(c8),
    .cin(c11)
);

FA FA12(
    .sum(p[7]),
    .carry(discard),
    .a(1'b1),
    .b(c12),
    .cin(c13)
);
assign out={p[7],p[6],p[5],p[4],p[3],p[2],p[1],p[0]};

endmodule