module TLC(clk,rst,north,east,south,west);
input clk,rst;
output reg [2:0] north,east,south,west;
parameter   s0=0,
            s1=1,
            s2=2,
            s3=3,
            s4=4,
            s5=5,
            s6=6,
            s7=7;
parameter tg=12,
          ty=3;
reg [2:0] state;
reg [3:0] count=0;
always @(posedge clk)
begin
if(rst)
begin
    state<=0;
    count<=0;
end
else
begin
    case(state)
        s0:
            begin
                if(count<tg)
                begin
                   state<=s0;
                   count<=count+1; 
                end
                else
                begin
                    state<=s1;
                    count<=1;
                end
            end
        s1:
            begin
                if(count==ty)
                begin
                    state<=s2;
                    count<=1;
                end
                else
                begin
                    state<=s1;
                    count<=count+1;
                end
            end
        s2:
            begin
                if(count==tg)
                begin
                    state<=s3;
                    count<=1;
                end
                else
                begin
                    state<=s2;
                    count<=count+1;
                end
            end
        s3:
            begin
                if(count==ty)
                begin
                    state<=s4;
                    count<=1;
                end
                else
                begin
                    state<=s3;
                    count<=count+1;
                end
            end
        s4:
            begin
                if(count==tg)
                begin
                    state<=s5;
                    count<=1;
                end
                else
                begin
                    state<=s4;
                    count<=count+1;
                end
            end
        s5:
            begin
                if(count==ty)
                begin
                    state<=s6;
                    count<=1;
                end
                else
                begin
                    state<=s5;
                    count<=count+1;
                end
            end
        s6:
            begin
                if(count==tg)
                begin
                    state<=s7;
                    count<=1;
                end
                else
                begin
                    state<=s6;
                    count<=count+1;
                end
            end
        s7:
            begin
                if(count==ty)
                begin
                    state<=s0;
                    count<=1;
                end
                else
                begin
                    state<=s7;
                    count<=count+1;
                end
            end
    endcase
end
end
always @(posedge clk)
begin
    case(state)
        s0:
        begin
            north<=3'b001;
            east<= 3'b100;
            south<=3'b100;
            west<= 3'b100;
        end
        s1:
        begin
            north<=3'b010;
            east<= 3'b010;
            south<=3'b100;
            west<= 3'b100;
        end
        s2:
        begin
            north<=3'b100;
            east<= 3'b001;
            south<=3'b100;
            west<= 3'b100;
        end
        s3:
        begin
            north<=3'b100;
            east<= 3'b010;
            south<=3'b010;
            west<= 3'b100;
        end
        s4:
        begin
            north<=3'b100;
            east<= 3'b100;
            south<=3'b001;
            west<= 3'b100;
        end
        s5:
        begin
            north<=3'b100;
            east<= 3'b100;
            south<=3'b010;
            west<= 3'b010;
        end
        s6:
        begin
            north<=3'b100;
            east<= 3'b100;
            south<=3'b100;
            west<= 3'b001;
        end
        s7:
        begin
            north<=3'b010;
            east<= 3'b100;
            south<=3'b100;
            west<= 3'b010;
        end
        default:
            begin
                north<=0;
                south<=0;
                west<=0;
                east<=0;
            end
    endcase
end
endmodule
