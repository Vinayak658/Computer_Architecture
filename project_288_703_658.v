`timescale 1ns/10ps

/*
Team Details:

Abhishek Goel : 2013A3TS288P
Vinayak Awasthi : 2013B3A3658P
Shubham Sharma : 2013B4A8703P

*/

module ADDER(out1,o,z,s,c,inA,inB);
input [15:0]inA;
input [15:0]inB;
input [2:0]sel;
output [15:0]out1;
output reg o,z,s,c;
wire [15:0]g,h,i;


assign out1 = inA+inB;
assign g = inA+inB;
assign h = inA;
assign i = inB;

always@(*)
begin
if (g == 16'b0)
 z <= 1'b1;
 else
 z <= 1'b0;
if (g[15] == 0)  s <= 1'b0;
if (g[15] == 1)  s <= 1'b1;   
if (h[15] == 0 & i[15] == 0 & g[15] == 1 | h[15] == 1 & i[15] == 1 & g[15] == 0)  o <= 1'b1;
else o <= 1'b0;
if (h[15] == 1 & i[15] == 1  | h[15] == 1 & i[15] == 0 & g[15] == 0 | h[15] == 0 & i[15] == 1 & g[15] == 0)  c <= 1'b1;
else c <= 1'b0;

end
endmodule

module SUBTRACTOR(out2,o,z,s,c,inA,inB);

input [15:0]inA;
input [15:0]inB;
output [15:0]out2;
output reg o,z,s,c;
wire [15:0]g,h,i;

assign out2 = inA-inB;
assign g = inA-inB;
assign h = inB;
assign i = inA;
always@(*)
begin
if (g == 16'b0)
 z <= 1'b1;
else 
 z <= 1'b0;
if (g[15] == 0)  s <= 1'b0;
if (g[15] == 1)  s <= 1'b1; 
    
if (h[15] == 1 & i[15] == 0 & g[15] == 1 | h[15] == 0 & i[15] == 1 & g[15] == 0) o <= 1'b1;
else o <= 1'b0;
if (h[15] == 1 & i[15] == 1 & g[15] == 0 | h[15] == 0 & i[15] == 1 | h[15] == 0 & i[15] == 0 & g[15] == 0)  c <= 1'b1;
else c <= 1'b0;
end
endmodule

module nnd(out3,o,z,s,c,inA,inB);
input [15:0]inA;
input [15:0]inB;
output [15:0]out3;
output reg z,s;
output o,c;
wire a;
wire [15:0]g;

assign a = 1'b1;
nand n1(g[0],inA[0],inB[0]);
nand n2(g[1],inA[1],inB[1]);
nand n3(g[2],inA[2],inB[2]);
nand n4(g[3],inA[3],inB[3]);
nand n5(g[4],inA[4],inB[4]);
nand n6(g[5],inA[5],inB[5]);
nand n7(g[6],inA[6],inB[6]);
nand n8(g[7],inA[7],inB[7]);
nand n9(g[8],inA[8],inB[8]);
nand n10(g[9],inA[9],inB[9]);
nand n11(g[10],inA[10],inB[10]);
nand n12(g[11],inA[11],inB[11]);
nand n13(g[12],inA[12],inB[12]);
nand n14(g[13],inA[13],inB[13]);
nand n15(g[14],inA[14],inB[14]);
nand n16(g[15],inA[15],inB[15]);
assign out3 = g;
not no1(o,a);
not no2(c,a);
always@(*)
begin
if (g == 16'b0)
  z <= 1'b1;
  else z <= 1'b0;
if (g[15] == 0)  s <= 1'b0;
if (g[15] == 1)  s <= 1'b1; 
end
endmodule

module neg(out4,o,z,s,c,inB);

input [15:0]inB;
output [15:0]out4;
output o,z,s,c;
wire [15:0]comp1;
wire q,w,e,r;

assign o = q;
assign z = w;
assign s = e;
assign c = r;
/*
not n1(comp1[0],inB[0]);
not n2(comp1[1],inB[1]);
not n3(comp1[2],inB[2]);
not n4(comp1[3],inB[3]);
not n5(comp1[4],inB[4]);
not n6(comp1[5],inB[5]);
not n7(comp1[6],inB[6]);
not n8(comp1[7],inB[7]);
not n9(comp1[8],inB[8]);
not n10(comp1[9],inB[9]);
not n11(comp1[10],inB[10]);
not n12(comp1[11],inB[11]);
not n13(comp1[12],inB[12]);
not n14(comp1[13],inB[13]);
not n15(comp1[14],inB[14]);
not n16(comp1[15],inB[15]);
*/

assign comp1 = ~inB;
assign out4 = comp1 + 16'b1;
//ADDER add1(out4,q,w,e,r,16'b1,comp1);


endmodule

module SAR(out5,o,z,s,c,inA,inB);

input [15:0]inA;
input [15:0]inB;
output reg [15:0]out5;
output reg o,z,s,c;


always @(*)
begin 
case(inB)
16'd0 : out5 = inA;
16'd1 : out5 = {inA[15],inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3],inA[2],inA[1]};
16'd2 : out5 = {inA[15],inA[15],inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3],inA[2]};
16'd3 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3]};
16'd4 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4]};
16'd5 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5]};
16'd6 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6]};
16'd7 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7]};
16'd8 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8]};
16'd9 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9]};
16'd10 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[14],inA[13],inA[12],inA[11],inA[10]};
16'd11 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[14],inA[13],inA[12],inA[11]};
16'd12 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[14],inA[13],inA[12]};
16'd13 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[14],inA[13]};
16'd14 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[14]};
16'd15 : out5 = {inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15],inA[15]};
endcase
o <= 1'b0;
if (out5 == 16'b0) z <= 1'b1;
else z <= 1'b0;
if (out5[15] == 0)  s <= 1'b0;
if (out5[15] == 1)  s <= 1'b1;
c <= 1'b0;
end
endmodule

module SHR(out6,o,z,s,c,inA,inB);

input [15:0]inA;
input [15:0]inB;
output reg [15:0]out6;
output reg o,z,s,c;


always @(*)
begin 
case(inB)
16'd0 : out6 = inA;
16'd1 : out6 = {1'b0,inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3],inA[2],inA[1]};
16'd2 : out6 = {1'b0,1'b0,inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3],inA[2]};
16'd3 : out6 = {1'b0,1'b0,1'b0,inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3]};
16'd4 : out6 = {1'b0,1'b0,1'b0,1'b0,inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4]};
16'd5 : out6 = {1'b0,1'b0,1'b0,1'b0,1'b0,inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5]};
16'd6 : out6 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6]};
16'd7 : out6 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7]};
16'd8 : out6 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8]};
16'd9 : out6 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inA[15],inA[14],inA[13],inA[12],inA[11],inA[10],inA[9]};
16'd10 : out6 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inA[15],inA[14],inA[13],inA[12],inA[11],inA[10]};
16'd11 : out6 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inA[15],inA[14],inA[13],inA[12],inA[11]};
16'd12 : out6 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inA[15],inA[14],inA[13],inA[12]};
16'd13 : out6 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inA[15],inA[14],inA[13]};
16'd14 : out6 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inA[15],inA[14]};
16'd15 : out6 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inA[15]};
endcase
o <= 1'b0;
if (out6 == 16'b0) z <= 1'b1;
else z <= 1'b0;
if (out6[15] == 0)  s <= 1'b0;
if (out6[15] == 1)  s <= 1'b1;
c <= 1'b0;
end
endmodule

module SHL(out7,o,z,s,c,inA,inB);

input [15:0]inA;
input [15:0]inB;
output reg [15:0]out7;
output reg o,z,s,c;


always @(*)
begin 
case(inB)
16'd0 : out7 = inA;
16'd1 : out7 = {inA[14],inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3],inA[2],inA[1],inA[0],1'b0};
16'd2 : out7 = {inA[13],inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3],inA[2],inA[1],inA[0],1'b0,1'b0};
16'd3 : out7 = {inA[12],inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3],inA[2],inA[1],inA[0],1'b0,1'b0,1'b0};
16'd4 : out7 = {inA[11],inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3],inA[2],inA[1],inA[0],1'b0,1'b0,1'b0,1'b0};
16'd5 : out7 = {inA[10],inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3],inA[2],inA[1],inA[0],1'b0,1'b0,1'b0,1'b0,1'b0};
16'd6 : out7 = {inA[9],inA[8],inA[7],inA[6],inA[5],inA[4],inA[3],inA[2],inA[1],inA[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
16'd7 : out7 = {inA[8],inA[7],inA[6],inA[5],inA[4],inA[3],inA[2],inA[1],inA[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
16'd8 : out7 = {inA[7],inA[6],inA[5],inA[4],inA[3],inA[2],inA[1],inA[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
16'd9 : out7 = {inA[6],inA[5],inA[4],inA[3],inA[2],inA[1],inA[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
16'd10 : out7 = {inA[5],inA[4],inA[3],inA[2],inA[1],inA[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
16'd11 : out7 = {inA[4],inA[3],inA[2],inA[1],inA[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
16'd12 : out7 = {inA[3],inA[2],inA[1],inA[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
16'd13 : out7 = {inA[2],inA[1],inA[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
16'd14 : out7 = {inA[1],inA[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
16'd15 : out7 = {inA[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
endcase
o <= 1'b0;
if (out7 == 16'b0) z <= 1'b1;
else z <= 1'b0;
if (out7[15] == 0)  s <= 1'b0;
if (out7[15] == 1)  s <= 1'b1;
c <= 1'b0;
end
endmodule



module ALU(out,overflow,zero,sign,carry,inputA,inputB,select);

input [15:0]inputA;
input [15:0]inputB;
input [3:0]select;
input [1:0]func;
output reg [15:0]out = 16'b0;
output reg overflow,zero,sign,carry;
wire [15:0]opt0;
wire [15:0]opt1;
wire [15:0]opt2;
wire [15:0]opt3;
wire [15:0]opt4;
wire [15:0]opt5;
wire [15:0]opt6;
wire o0,o1,o2,o3,o4,o5,o6;
wire z0,z1,z2,z3,z4,z5,z6;
wire s0,s1,s2,s3,s4,s5,s6;
wire c0,c1,c2,c3,c4,c5,c6;

ADDER add(opt0,o0,z0,s0,c0,inputA,inputB);
SUBTRACTOR sub(opt1,o1,z1,s1,c1,inputA,inputB);
nnd n1(opt2,o2,z2,s2,c2,inputA,inputB);
neg n2(opt3,o3,z3,s3,c3,inputB);
SAR shift1(opt4,o4,z4,s4,c4,inputA,inputB);
SHR shift2(opt5,o5,z5,s5,c5,inputA,inputB);
SHL shift3(opt6,o6,z6,s6,c6,inputA,inputB);

always@(*)
begin
case(select)

4'd0 : begin
       out <= opt0;
       overflow <= o0;
       zero <= z0;
       sign <= s0;
       carry <= c0;
       end
4'd1 : begin
       out <= opt1;
       overflow <= o1;
       zero <= z1;
       sign <= s1;
       carry <= c1;
       end
4'd2 : begin
       out <= opt2;
       overflow <= o2;
       zero <= z2;
       sign <= s2;
       carry <= c2;
       end
4'd3 : begin
       out <= opt3;
       overflow <= o3;
       zero <= z3;
       sign <= s3;
       carry <= c3;
       end
4'd4 : begin
       out <= opt4;
       overflow <= o4;
       zero <= z4;
       sign <= s4;
       carry <= c4;
       end
4'd5 : begin
       out <= opt5;
       overflow <= o5;
       zero <= z5;
       sign <= s5;
       carry <= c5;
       end
4'd6 : begin
       out <= opt6;
       overflow <= o6;
       zero <= z6;
       sign <= s6;
       carry <= c6;
       end
4'd7 : begin
       out <= inputA||inputB;
       overflow <= 1'b0;
       if(out==0)
       zero <= 1'b1;
       else zero <= 1'b0;
       sign <= 1'b0;
       carry <= 1'b0;
       end	   
4'd8 : begin
       out <= inputA&&inputB;
       overflow <= 1'b0;
       if(out==0)
       zero <= 1'b1;
       else zero <= 1'b0;
       sign <= 1'b0;
       carry <= 1'b0;            
       end 	
endcase
end
endmodule


module alu_control(AluControl,opcode,func);
output reg [3:0]AluControl = 4'b0;
input [3:0]opcode;
input [3:0]func;
wire [7:0]AluControlInput;

assign AluControlInput = {opcode,func};

always@(*)
begin
case(AluControlInput)
8'b00110000 : AluControl = 4'b0011;  //NEG
8'b00110001 : AluControl = 4'b0100;  //SAR
8'b00110010 : AluControl = 4'b0101;  //SHR
8'b00110011 : AluControl = 4'b0110;  //SHL
8'b11000000 : AluControl = 4'b0000;  //For EX stage of JMP
endcase
case(AluControlInput[7:4])
4'b0000 : AluControl = 4'b0000;  //ADD
4'b0001 : AluControl = 4'b0001;  //SUB
4'b0010 : AluControl = 4'b0010;  //NAND
4'b1101 : AluControl = 4'b0001;  //For subtraction in BEQ
4'b1110 : AluControl = 4'b0001;  //For subtraction from SP_pointer
4'b1111 : AluControl = 4'b0000;  //For addition to SP_pointer
4'b1010 : AluControl = 4'b0111;  //For OR
4'b1011 : AluControl = 4'b1000;  //For AND
endcase
end

endmodule


module memory(MemData,InstData,MemWrite,MemRead,Addr,WD,clk);
output reg [15:0]MemData ;
output reg [15:0]InstData;
input [9:0]Addr;
input [15:0]WD;
input clk,MemRead,MemWrite,IRWrite;
reg [15:0]memory[0:1023];

initial $readmemh("mem_data.txt",memory);

always@(*)
begin
MemData <= memory[Addr];
InstData <= memory[Addr];
end


always@(negedge clk)
begin
	if (MemWrite==1)
		begin
			memory[Addr] <= WD;
		end

end
 
endmodule


module RegisterFile(RD1,RD2,RN1,RN2,WN,WD,RegWrite,clk);
output reg [15:0]RD1;
output reg [15:0]RD2;
input [3:0]RN1;
input [3:0]RN2;
input [3:0]WN;
input [15:0]WD; 
input RegWrite;
input clk;
reg [15:0]Registers[0:15];

initial $readmemh("RF_data.txt",Registers);

always@(*)
begin
	RD1 <= Registers[RN1];
	RD2 <= Registers[RN2];
end

always@(negedge clk) 
begin
if(RegWrite == 1)
begin
Registers[WN] <= WD;
end
end


endmodule

module main_control(ControlSignals, opcode, func, clk, rst);

output reg [18:0]ControlSignals;
input [3:0]opcode;
input [3:0]func;
input clk,rst;

reg[4:0] CS;
reg[4:0] NS;

wire [7:0]DecideState; 
 
assign DecideState = {opcode,func};
 
localparam S0 = 5'b00000,S1 = 5'b00001,S2 = 5'b00010,S3 = 5'b00011,S4 = 5'b00100,S5 = 5'b00101,S6 = 5'b00110,S7 = 5'b00111,S8 = 5'b01000,S9 = 5'b01001,S10 = 5'b01010,S11 = 5'b01011,S12 = 5'b01100,S13 = 5'b01101,S14 = 5'b01110,S15 = 5'b01111, S16 = 5'b10000, S17 = 5'b10001, S18 = 5'b10010, S19 = 5'b10011,S20 = 5'b10100;

always@(posedge clk or negedge rst)
begin
if(rst==0) CS <= S0;
else CS <= NS;
end

always@(*)
begin
case(CS)
	S0 : 	begin
		case(DecideState)
		8'b00110000 : NS<=S5;  //NEG
		8'b00110001 : NS<=S1;  //SAR
		8'b00110010 : NS<=S1;  //SHR
		8'b00110011 : NS<=S1;  //SHL
		8'b11000000 : NS<=S5;  //JMP
		endcase
		
		case(DecideState[7:4])
		4'b0000 : NS<=S5;  //ADD
		4'b0001 : NS<=S5;  //SUB
		4'b0010 : NS<=S5;  //NAND
		4'b1000 : NS<=S5;  //LW
		4'b1001 : NS<=S5;  //SW
		4'b1101 : NS<=S5;  //BEQ
		4'b1110 : NS<=S5;  //PUSH
		4'b1111 : NS<=S5;  //POP
		endcase
		end	
	S1 : NS <= S2;
	S2 : NS <= S3;
	S3 : NS <= S4;
	S4 : NS <= S0;
	S5 : 	begin
		case(DecideState)
		8'b00110000 : NS<=S11;  //NEG
		8'b11000000 : NS<=S15;  //JMP
		endcase
		
		case(DecideState[7:4])
		4'b0000 : NS<=S9;  //ADD
		4'b0001 : NS<=S9;  //SUB
		4'b0010 : NS<=S9;  //NAND
		4'b1000 : NS<=S6;  //LW
		4'b1001 : NS<=S8;  //SW
		4'b1101 : NS<=S13;  //BEQ
		4'b1110 : NS<=S16; //EX of PUSH
		4'b1111 : NS<=S18; //EX of POP
		endcase
		end
	S6 : NS <= S7;
	S7 : NS <= S0;
	S8 : NS <= S0;	
	S9 : NS <= S10;
	S10 : NS <= S0;
	S11 : NS <= S12;
	S12 : NS <= S0;	
	S13 : NS <= S14;
	S14 : NS <= S0;
	S15 : NS <= S0;
	S16 : NS <= S17;
	S17 : NS <= S0;
	S18 : NS <= S19;
	S19 : NS <= S20;
	S20 : NS <= S0;
endcase
end

always@(*)
begin
case(CS)
S0 : ControlSignals = 19'b0001000011000000000;
S1 : ControlSignals = 19'b0010000000000000100;
S2 : ControlSignals = 19'b0010000000000010100;
S3 : ControlSignals = 19'b0100000000000110100;
S4 : ControlSignals = 19'b0100000000000000010;
S5 : ControlSignals = 19'b0010000000000000000;
S6 : ControlSignals = 19'b0100000010010000000;
S7 : ControlSignals = 19'b0100000000000000011;
S8 : ControlSignals = 19'b0100000100100000000;
S9 : ControlSignals = 19'b0100000000000101000;
S10 : ControlSignals = 19'b0100000000000101010;
S11 : ControlSignals = 19'b0100000000000101000;
S12 : ControlSignals = 19'b0100000000000101010;
S13 : ControlSignals = 19'b0100000000000101000;
S14 : ControlSignals = 19'b0100101000000101100;
S15 : ControlSignals = 19'b0101000000001011000;
S16 : ControlSignals = 19'b0100000100110000000;
S17 : ControlSignals = 19'b1100000000111100000;
S18 : ControlSignals = 19'b1100000000001100000;
S19 : ControlSignals = 19'b0100000010110000000;
S20 : ControlSignals = 19'b0100000000000000011;
endcase
end

endmodule


module main_datapath(clk,rst);
integer i;
input clk,rst;
reg [9:0]PC;
reg [15:0]IR;
reg [15:0]MDR;
reg [15:0]A;
reg [15:0]B;
reg [15:0]AluOut;
reg [3:0]flag;
reg [7:0]SP;

reg [3:0]ReadReg1; //This is the register from which the data needs to be read
wire [3:0]ReadReg2; //This is the register from which the data needs to be read
reg [15:0]RF_WriteData; //This is the data which needs to go in
wire [3:0]WriteReg; 
wire [15:0]RD1;
wire [15:0]RD2;

reg [15:0]inA;
reg [15:0]inB;

reg [9:0]Address;
wire [15:0]Mem_WriteData;
wire [15:0]MemData;
wire [15:0]InstData;

wire [18:0]ControlSignals;
wire [3:0]opcode;
wire [3:0]func;
wire [15:0]out;

wire SP_Write;
assign SP_Write = ControlSignals[18];
wire [1:0]sel_control;
assign sel_control = {ControlSignals[17],ControlSignals[16]};
wire PCWrite;
assign PCWrite = ControlSignals[15];
wire PCWriteCond;
assign PCWriteCond = ControlSignals[14];
wire [1:0]PCSrc;
assign PCSrc = {ControlSignals[13],ControlSignals[12]};
wire MemWrite;
assign MemWrite =  ControlSignals[11];
wire MemRead;
assign MemRead = ControlSignals[10];	
wire IRWrite;
assign IRWrite = ControlSignals[9];
wire [1:0]IorD;
assign IorD = {ControlSignals[8],ControlSignals[7]};
wire [1:0]ALUSrcA;
assign ALUSrcA = {ControlSignals[6],ControlSignals[5]};
wire [1:0]ALUSrcB;
assign ALUSrcB = {ControlSignals[4],ControlSignals[3]};
wire Reg1Src;
assign Reg1Src = ControlSignals[2];
wire RegWrite;
assign RegWrite = ControlSignals[1];
wire RegWriteControl;
assign RegWriteControl = ControlSignals[0];
wire o,z,s,c;

reg[3:0] select = 4'b000;

wire [3:0]AluControl;



RegisterFile RF(RD1,RD2,ReadReg1,ReadReg2,WriteReg,RF_WriteData,RegWrite,clk);
memory data_inst(MemData,InstData,MemWrite,MemRead,Address,Mem_WriteData,clk);
alu_control AluCtrl(AluControl,opcode,func);
main_control MainCtrl(ControlSignals,opcode,func,clk,rst);
ALU Alu(out,o,z,s,c,inA,inB,select);

assign opcode = IR[15:12];
assign func = IR[3:0];

always@(*)
	begin
	case(sel_control)
	2'b00 : select <= 4'b0000; 
	2'b01 : select <= 4'b0001;
	2'b10 : select <= AluControl;
	endcase
	end

//Writing into ALUOut at the falling edge of every clk cycle
always@(negedge clk or negedge rst) 
	begin
	if(rst==0)
	AluOut <= 15'b0;
	else
	begin
	AluOut <= out;
	flag[0] <= o;
	flag[1] <= z;
	flag[2] <= s;
	flag[3] <= c;	
	end
	end

//Writing into PC at the falling edge of every clk cycle
always@(negedge clk or negedge rst)
	begin
	if(rst==0)
	PC<=9'b0;
	else 
	begin
	if (PCWrite==1'b1 || (PCWriteCond == 1'b1 && flag[1] == 1'b1))
		begin
			 case(PCSrc)
			 2'b00 : PC <= out[9:0];
	 		 2'b01 : PC <= RD1[9:0];
	 		 endcase	
	 	end
	end
	end

always@(negedge clk)
	begin
	A <= RD1;
	B <= RD2;
	end

always@(negedge clk or negedge rst)
	begin
	if(rst==0)
	IR<=16'b0;
	else 
	begin
	if(IRWrite == 1'b1 && MemRead == 1'b1)
		begin
		IR <= InstData;
		end
	MDR <= MemData;
	end
	end
	
always@(negedge clk or negedge rst)
	begin
	if(rst==0)
	SP <= 8'b11111111;
	else 
	begin
	if(SP_Write==1'b1) SP <= out[7:0];
	end
	end	
	
	
always@(*)
	begin
	case(IorD)
	2'b00 : Address <= PC;
	2'b01 : Address <= {2'b10,IR[7:0]};
	2'b10 : Address <= {2'b10,IR[11:4]};
	2'b11 : Address <= {2'b11,SP};
	endcase
	end

always@(*)
	begin
	case(ALUSrcA)
	2'b00 : inA = {6'b0,PC}; 
	2'b01 : inA = A;
	2'b10 : inA = AluOut;
	2'b11 : inA = {8'b0,SP};
	endcase
	end
	
always@(*)
	begin
	case(ALUSrcB)
	2'b00 : inB = 16'd1; 
	2'b01 : inB = B;
	2'b10 : inB = {12'b0,IR[7:4]};
	2'b11 : begin
		for (i=0;i<8;i=i+1)
			begin
			inB[15-i] <= IR[11];
			end
		for (i=0;i<8;i=i+1)
			begin
			inB[i] <= IR[i+4];
			end
		end
	endcase
	end
	
always@(*)
	begin
	case(Reg1Src)
	1'b0 : ReadReg1 <= IR[3:0]; 
	1'b1 : ReadReg1 <= IR[11:8];
	endcase
	end		
	
assign ReadReg2 = IR[7:4];
assign WriteReg = IR[11:8];

always@(*)
	begin
	case(RegWriteControl)
	1'b0 : RF_WriteData <= AluOut;	
	1'b1 : RF_WriteData <= MDR; 
	endcase
	end
//note that RegWrite already goes as control signal into the RF module	
assign Mem_WriteData = A; 	
//note that MemWrite already goes as control signal into the memory module to control when this value actually gets written.
endmodule	















