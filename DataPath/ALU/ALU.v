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

            ADD : ALUResult = SrcA + SrcB ;
            SUB : ALUResult = SrcA - SrcB ;
            SLL : ALUResult = SrcA << SrcB ;
            SLT : ALUResult = $signed(SrcA) < $signed(SrcB) ;
            SLTU : ALUResult = SrcA < SrcB ;
            XOR : ALUResult = SrcA ^ SrcB ;
            SRL : ALUResult = SrcA >> SrcB ;
            SRA : ALUResult = SrcA >>> SrcB ;
            OR : ALUResult = SrcA | SrcB ;
            AND : ALUResult = SrcA & SrcB ;
            BNE : ALUResult = (SrcA == SrcB);
            BLT : ALUResult = $signed(SrcA) < $signed(SrcB);
            BGE : ALUResult = $signed(SrcA) >= $signed(SrcB);
            BLTU : ALUResult = SrcA < SrcB;
            BGEU : ALUResult = SrcA >= SrcB;
            default : ALUResult = 0;


        endcase

        

    end


endmodule