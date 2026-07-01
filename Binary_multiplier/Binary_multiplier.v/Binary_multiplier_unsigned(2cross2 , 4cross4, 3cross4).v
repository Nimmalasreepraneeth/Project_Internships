`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 18:20:13
// Design Name: 
// Module Name: Binary_multiplier_unsigned_signed
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module HA (sum, carry , a ,b);
 input a ,b;
 wire p01,p10,p11,C;
 output sum , carry ;
 
 xor g1 (sum , a,b);
 and g2 (carry , a,b);
endmodule

module Multiplier_2bit  (Y , A, B);
input [1:0] A,B;
output [3:0] Y;
//Taking the inputs for adders
and g1 (p01 , A[0],B[1]);
and g2 (p10 , A[1],B[0]);
and g3 (p11 , A[1],B[1]);

// Taking the outputs 

and H1 (Y[0] , A[0],B[0]);
HA H2 (Y[1] ,C, p01 , p10);
HA H3 (Y[2],Y[3], C, p11);

endmodule


//module HA(sum,carry,a,b);

//input a,b;
//output sum,carry;

//xor G1(sum,a,b);
//and G2(carry,a,b);

//endmodule



//module FA(sum,carry,a,b,cin);

//input a,b,cin;
//output sum,carry;

//wire s,c1,c2;

//xor G1(s,a,b);
//xor G2(sum,s,cin);

//and G3(c1,a,b);
//and G4(c2,s,cin);

//or G5(carry,c1,c2);

//endmodule



//module Braun4x4(P,A,B);

//input [3:0] A;
//input [3:0] B;

//output [7:0] P;



////-------------------------
//// Partial Products
////-------------------------

//wire p00,p01,p02,p03;
//wire p10,p11,p12,p13;
//wire p20,p21,p22,p23;
//wire p30,p31,p32,p33;

//and G00(p00,A[0],B[0]);
//and G01(p01,A[0],B[1]);
//and G02(p02,A[0],B[2]);
//and G03(p03,A[0],B[3]);

//and G10(p10,A[1],B[0]);
//and G11(p11,A[1],B[1]);
//and G12(p12,A[1],B[2]);
//and G13(p13,A[1],B[3]);

//and G20(p20,A[2],B[0]);
//and G21(p21,A[2],B[1]);
//and G22(p22,A[2],B[2]);
//and G23(p23,A[2],B[3]);

//and G30(p30,A[3],B[0]);
//and G31(p31,A[3],B[1]);
//and G32(p32,A[3],B[2]);
//and G33(p33,A[3],B[3]);



////-------------------------
//// Internal Wires
////-------------------------

//wire s11,s12,s13;
//wire s21,s22,s23;
//wire s31,s32,s33;

//wire c11,c12,c13;
//wire c21,c22,c23;
//wire c31,c32,c33;
//wire c41,c42;



//assign P[0]=p00;

////-----------------------------------------------------
//// First Row (Top HAs)
////-----------------------------------------------------

//HA HA1(
//    .sum(P[1]),
//    .carry(c11),
//    .a(p01),
//    .b(p10)
//);

//HA HA2(
//    .sum(s11),
//    .carry(c12),
//    .a(p02),
//    .b(p11)
//);

//HA HA3(
//    .sum(s12),
//    .carry(c13),
//    .a(p03),
//    .b(p12)
//);



////-----------------------------------------------------
//// Second Row (First FA Layer)
////-----------------------------------------------------

//FA FA1(
//    .sum(P[2]),
//    .carry(c21),
//    .a(s11),
//    .b(p20),
//    .cin(c11)
//);

//FA FA2(
//    .sum(s21),
//    .carry(c22),
//    .a(s12),
//    .b(p21),
//    .cin(c12)
//);

//FA FA3(
//    .sum(s22),
//    .carry(c23),
//    .a(p13),
//    .b(p22),
//    .cin(c13)
//);

////-----------------------------------------------------
//// Third Reduction Row
////-----------------------------------------------------

//FA FA4(
//    .sum(P[3]),
//    .carry(c31),
//    .a(s21),
//    .b(p30),
//    .cin(c21)
//);

//FA FA5(
//    .sum(s31),
//    .carry(c32),
//    .a(s22),
//    .b(p31),
//    .cin(c22)
//);

//FA FA6(
//    .sum(s32),
//    .carry(c33),
//    .a(p23),
//    .b(p32),
//    .cin(c23)
//);





////-----------------------------------------------------
//// Final Carry Propagation
////-----------------------------------------------------

//HA HA4(
//    .sum(P[4]),
//    .carry(c42),
//    .a(s31),
//    .b(c31)
//);

//FA FA7(
//    .sum(P[5]),
//    .carry(c43),
//    .a(s32),
//    .b(c32),
//    .cin(c42)
//);

//FA FA8(
//    .sum(P[6]),
//    .carry(P[7]),
//    .a(p33),
//    .b(c33),
//    .cin(c43)
//);

//endmodule



//module Braun3x4(P,A,B);

//input [2:0] A;
//input [3:0] B;

//output [6:0] P;

////-------------------------
//// Partial Products
////-------------------------

//wire p00,p01,p02,p03;
//wire p10,p11,p12,p13;
//wire p20,p21,p22,p23;

//and G00(p00,A[0],B[0]);
//and G01(p01,A[0],B[1]);
//and G02(p02,A[0],B[2]);
//and G03(p03,A[0],B[3]);

//and G10(p10,A[1],B[0]);
//and G11(p11,A[1],B[1]);
//and G12(p12,A[1],B[2]);
//and G13(p13,A[1],B[3]);

//and G20(p20,A[2],B[0]);
//and G21(p21,A[2],B[1]);
//and G22(p22,A[2],B[2]);
//and G23(p23,A[2],B[3]);

////-------------------------
//// Internal Wires
////-------------------------

//wire s11,s12;
//wire s21,s22;
//wire s31;

//wire c11,c12,c13;
//wire c21,c22,c23;
//wire c31,c32;

//assign P[0] = p00;

////-----------------------------------------------------
//// First Row
////-----------------------------------------------------

//HA HA1(
//    .sum(P[1]),
//    .carry(c11),
//    .a(p01),
//    .b(p10)
//);

//HA HA2(
//    .sum(s11),
//    .carry(c12),
//    .a(p02),
//    .b(p11)
//);

//HA HA3(
//    .sum(s12),
//    .carry(c13),
//    .a(p03),
//    .b(p12)
//);

////-----------------------------------------------------
//// Second Row
////-----------------------------------------------------

//FA FA1(
//    .sum(P[2]),
//    .carry(c21),
//    .a(s11),
//    .b(p20),
//    .cin(c11)
//);

//FA FA2(
//    .sum(s21),
//    .carry(c22),
//    .a(s12),
//    .b(p21),
//    .cin(c12)
//);

//FA FA3(
//    .sum(s22),
//    .carry(c23),
//    .a(p13),
//    .b(p22),
//    .cin(c13)
//);

////-----------------------------------------------------
//// Final Carry Propagation
////-----------------------------------------------------

//HA HA4(
//    .sum(P[3]),
//    .carry(c31),
//    .a(s21),
//    .b(c21)
//);

//FA FA4(
//    .sum(P[4]),
//    .carry(c32),
//    .a(s22),
//    .b(c22),
//    .cin(c31)
//);

//FA FA5(
//    .sum(P[5]),
//    .carry(P[6]),
//    .a(p23),
//    .b(c23),
//    .cin(c32)
//);

//endmodule
    
  

