module ALU #(parameter WIDTH = 32)
(
    input [WIDTH-1:0]SrcA,SrcB,
    input [3:0]ALUOp, // Remember to change this
    output [WIDTH-1:0]ALUResult,
    output Zero;

);

    reg [WIDTH-1:0]temp;

    parameter ADD = 0;
    parameter SUB = 1;
    parameter SLL = 2;
    parameter SLT = 3;
    parameter SLTU = 4;
    parameter XOR = 5;
    parameter SRL = 6;
    parameter SRA = 7;
    parameter OR = 8;
    parameter AND = 9;

    //  For Branch 

    parameter BNE = 10;
    parameter BLT = 11;
    parameter BGE = 12;
    parameter BLTU = 13;
    parameter BGEU = 14;

    assign ALUResult = temp;
    assign Zero = ~|temp;

    always@(*) begin

        case(ALUOp) 

            ADD :temp = SrcA + SrcB ;
            SUB :temp = SrcA - SrcB ;
            SLL :temp = SrcA << SrcB ;
            SLT :temp = $signed(SrcA) < $signed(SrcB) ;
            SLTU :temp = SrcA < SrcB ;
            XOR :temp = SrcA ^ SrcB ;
            SRL :temp = SrcA >> SrcB ;
            SRA :temp = SrcA >>> SrcB ;
            OR :temp = SrcA | SrcB ;
            AND :temp = SrcA & SrcB ;
            BNE :temp = (SrcA == SrcB);
            BLT :temp = $signed(SrcA) < $signed(SrcB);
            BGE :temp = $signed(SrcA) >= $signed(SrcB);
            BLTU :temp = SrcA < SrcB;
            BGEU :temp = SrcA >= SrcB;
            default :temp = 0;


        endcase

        

    end


endmodule