`timescale 1ns/1ps

module fmm_core_tb;
    reg clk = 0;
    reg rst = 1;
    reg start = 0;

    reg loader_weA = 0;
    reg [7:0] loader_addrA = 0;
    reg signed [15:0] loader_dinA = 0;

    reg loader_weB = 0;
    reg [7:0] loader_addrB = 0;
    reg signed [15:0] loader_dinB = 0;

    wire [7:0] addrC;
    wire signed [31:0] dataC;
    wire weC;
    wire done;

    reg signed [15:0] matrix_a [0:255];
    reg signed [15:0] matrix_b [0:255];
    reg signed [31:0] expected [0:255];
    reg signed [31:0] observed [0:255];

    integer i;
    integer j;
    integer k;
    integer mismatches;

    fmm_core dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .loader_weA(loader_weA),
        .loader_addrA(loader_addrA),
        .loader_dinA(loader_dinA),
        .loader_weB(loader_weB),
        .loader_addrB(loader_addrB),
        .loader_dinB(loader_dinB),
        .addrC(addrC),
        .dataC(dataC),
        .weC(weC),
        .done(done)
    );

    always #5 clk = ~clk;

    task load_a;
        input [7:0] addr;
        input signed [15:0] value;
        begin
            @(posedge clk);
            loader_addrA <= addr;
            loader_dinA <= value;
            loader_weA <= 1'b1;
            @(posedge clk);
            loader_weA <= 1'b0;
        end
    endtask

    task load_b;
        input [7:0] addr;
        input signed [15:0] value;
        begin
            @(posedge clk);
            loader_addrB <= addr;
            loader_dinB <= value;
            loader_weB <= 1'b1;
            @(posedge clk);
            loader_weB <= 1'b0;
        end
    endtask

    initial begin
        // Matrix A from uart_script.py log
        matrix_a[0]=1; matrix_a[1]=12; matrix_a[2]=10; matrix_a[3]=7; matrix_a[4]=6; matrix_a[5]=13; matrix_a[6]=1; matrix_a[7]=11;
        matrix_a[8]=3; matrix_a[9]=1; matrix_a[10]=8; matrix_a[11]=15; matrix_a[12]=11; matrix_a[13]=12; matrix_a[14]=11; matrix_a[15]=12;
        matrix_a[16]=8; matrix_a[17]=2; matrix_a[18]=13; matrix_a[19]=7; matrix_a[20]=8; matrix_a[21]=5; matrix_a[22]=2; matrix_a[23]=14;
        matrix_a[24]=12; matrix_a[25]=10; matrix_a[26]=6; matrix_a[27]=13; matrix_a[28]=8; matrix_a[29]=7; matrix_a[30]=7; matrix_a[31]=3;
        matrix_a[32]=1; matrix_a[33]=8; matrix_a[34]=14; matrix_a[35]=1; matrix_a[36]=13; matrix_a[37]=13; matrix_a[38]=4; matrix_a[39]=10;
        matrix_a[40]=2; matrix_a[41]=12; matrix_a[42]=11; matrix_a[43]=5; matrix_a[44]=1; matrix_a[45]=15; matrix_a[46]=7; matrix_a[47]=14;
        matrix_a[48]=10; matrix_a[49]=12; matrix_a[50]=12; matrix_a[51]=3; matrix_a[52]=5; matrix_a[53]=7; matrix_a[54]=7; matrix_a[55]=0;
        matrix_a[56]=8; matrix_a[57]=2; matrix_a[58]=11; matrix_a[59]=10; matrix_a[60]=14; matrix_a[61]=11; matrix_a[62]=5; matrix_a[63]=15;
        matrix_a[64]=6; matrix_a[65]=5; matrix_a[66]=14; matrix_a[67]=5; matrix_a[68]=1; matrix_a[69]=7; matrix_a[70]=12; matrix_a[71]=3;
        matrix_a[72]=7; matrix_a[73]=2; matrix_a[74]=10; matrix_a[75]=7; matrix_a[76]=5; matrix_a[77]=3; matrix_a[78]=9; matrix_a[79]=10;
        matrix_a[80]=15; matrix_a[81]=6; matrix_a[82]=2; matrix_a[83]=13; matrix_a[84]=10; matrix_a[85]=11; matrix_a[86]=1; matrix_a[87]=4;
        matrix_a[88]=12; matrix_a[89]=13; matrix_a[90]=6; matrix_a[91]=12; matrix_a[92]=13; matrix_a[93]=6; matrix_a[94]=14; matrix_a[95]=4;
        matrix_a[96]=3; matrix_a[97]=10; matrix_a[98]=10; matrix_a[99]=2; matrix_a[100]=13; matrix_a[101]=3; matrix_a[102]=12; matrix_a[103]=0;
        matrix_a[104]=12; matrix_a[105]=12; matrix_a[106]=12; matrix_a[107]=10; matrix_a[108]=7; matrix_a[109]=11; matrix_a[110]=4; matrix_a[111]=12;
        matrix_a[112]=8; matrix_a[113]=7; matrix_a[114]=8; matrix_a[115]=9; matrix_a[116]=0; matrix_a[117]=2; matrix_a[118]=3; matrix_a[119]=1;
        matrix_a[120]=7; matrix_a[121]=10; matrix_a[122]=10; matrix_a[123]=7; matrix_a[124]=13; matrix_a[125]=9; matrix_a[126]=1; matrix_a[127]=12;
        matrix_a[128]=9; matrix_a[129]=10; matrix_a[130]=9; matrix_a[131]=8; matrix_a[132]=1; matrix_a[133]=8; matrix_a[134]=12; matrix_a[135]=4;
        matrix_a[136]=9; matrix_a[137]=0; matrix_a[138]=5; matrix_a[139]=6; matrix_a[140]=15; matrix_a[141]=3; matrix_a[142]=4; matrix_a[143]=6;
        matrix_a[144]=15; matrix_a[145]=13; matrix_a[146]=0; matrix_a[147]=3; matrix_a[148]=13; matrix_a[149]=0; matrix_a[150]=13; matrix_a[151]=4;
        matrix_a[152]=14; matrix_a[153]=4; matrix_a[154]=6; matrix_a[155]=10; matrix_a[156]=2; matrix_a[157]=8; matrix_a[158]=8; matrix_a[159]=12;
        matrix_a[160]=15; matrix_a[161]=10; matrix_a[162]=6; matrix_a[163]=6; matrix_a[164]=6; matrix_a[165]=13; matrix_a[166]=5; matrix_a[167]=2;
        matrix_a[168]=5; matrix_a[169]=0; matrix_a[170]=1; matrix_a[171]=1; matrix_a[172]=12; matrix_a[173]=11; matrix_a[174]=11; matrix_a[175]=7;
        matrix_a[176]=11; matrix_a[177]=2; matrix_a[178]=14; matrix_a[179]=8; matrix_a[180]=15; matrix_a[181]=2; matrix_a[182]=7; matrix_a[183]=11;
        matrix_a[184]=7; matrix_a[185]=7; matrix_a[186]=2; matrix_a[187]=6; matrix_a[188]=3; matrix_a[189]=4; matrix_a[190]=10; matrix_a[191]=10;
        matrix_a[192]=9; matrix_a[193]=5; matrix_a[194]=15; matrix_a[195]=1; matrix_a[196]=5; matrix_a[197]=1; matrix_a[198]=5; matrix_a[199]=15;
        matrix_a[200]=5; matrix_a[201]=14; matrix_a[202]=7; matrix_a[203]=11; matrix_a[204]=7; matrix_a[205]=4; matrix_a[206]=12; matrix_a[207]=15;
        matrix_a[208]=4; matrix_a[209]=12; matrix_a[210]=4; matrix_a[211]=11; matrix_a[212]=12; matrix_a[213]=7; matrix_a[214]=11; matrix_a[215]=4;
        matrix_a[216]=1; matrix_a[217]=1; matrix_a[218]=7; matrix_a[219]=14; matrix_a[220]=2; matrix_a[221]=7; matrix_a[222]=11; matrix_a[223]=3;
        matrix_a[224]=11; matrix_a[225]=4; matrix_a[226]=12; matrix_a[227]=9; matrix_a[228]=8; matrix_a[229]=2; matrix_a[230]=7; matrix_a[231]=13;
        matrix_a[232]=0; matrix_a[233]=12; matrix_a[234]=7; matrix_a[235]=11; matrix_a[236]=10; matrix_a[237]=6; matrix_a[238]=4; matrix_a[239]=10;
        matrix_a[240]=2; matrix_a[241]=9; matrix_a[242]=1; matrix_a[243]=10; matrix_a[244]=10; matrix_a[245]=1; matrix_a[246]=12; matrix_a[247]=6;
        matrix_a[248]=12; matrix_a[249]=0; matrix_a[250]=2; matrix_a[251]=7; matrix_a[252]=3; matrix_a[253]=5; matrix_a[254]=10; matrix_a[255]=2;

        // Matrix B from uart_script.py log
        matrix_b[0]=10; matrix_b[1]=1; matrix_b[2]=2; matrix_b[3]=9; matrix_b[4]=12; matrix_b[5]=2; matrix_b[6]=4; matrix_b[7]=14;
        matrix_b[8]=15; matrix_b[9]=9; matrix_b[10]=7; matrix_b[11]=5; matrix_b[12]=9; matrix_b[13]=9; matrix_b[14]=4; matrix_b[15]=0;
        matrix_b[16]=2; matrix_b[17]=15; matrix_b[18]=6; matrix_b[19]=7; matrix_b[20]=7; matrix_b[21]=12; matrix_b[22]=1; matrix_b[23]=1;
        matrix_b[24]=4; matrix_b[25]=7; matrix_b[26]=10; matrix_b[27]=7; matrix_b[28]=7; matrix_b[29]=15; matrix_b[30]=2; matrix_b[31]=9;
        matrix_b[32]=8; matrix_b[33]=7; matrix_b[34]=12; matrix_b[35]=4; matrix_b[36]=15; matrix_b[37]=5; matrix_b[38]=8; matrix_b[39]=8;
        matrix_b[40]=13; matrix_b[41]=7; matrix_b[42]=4; matrix_b[43]=0; matrix_b[44]=5; matrix_b[45]=13; matrix_b[46]=0; matrix_b[47]=14;
        matrix_b[48]=8; matrix_b[49]=2; matrix_b[50]=4; matrix_b[51]=8; matrix_b[52]=5; matrix_b[53]=1; matrix_b[54]=10; matrix_b[55]=10;
        matrix_b[56]=1; matrix_b[57]=4; matrix_b[58]=3; matrix_b[59]=10; matrix_b[60]=11; matrix_b[61]=11; matrix_b[62]=15; matrix_b[63]=12;
        matrix_b[64]=5; matrix_b[65]=1; matrix_b[66]=9; matrix_b[67]=14; matrix_b[68]=15; matrix_b[69]=3; matrix_b[70]=3; matrix_b[71]=0;
        matrix_b[72]=2; matrix_b[73]=8; matrix_b[74]=8; matrix_b[75]=5; matrix_b[76]=4; matrix_b[77]=13; matrix_b[78]=7; matrix_b[79]=12;
        matrix_b[80]=15; matrix_b[81]=5; matrix_b[82]=3; matrix_b[83]=15; matrix_b[84]=10; matrix_b[85]=4; matrix_b[86]=9; matrix_b[87]=8;
        matrix_b[88]=14; matrix_b[89]=4; matrix_b[90]=15; matrix_b[91]=14; matrix_b[92]=2; matrix_b[93]=2; matrix_b[94]=8; matrix_b[95]=0;
        matrix_b[96]=4; matrix_b[97]=6; matrix_b[98]=15; matrix_b[99]=15; matrix_b[100]=2; matrix_b[101]=14; matrix_b[102]=1; matrix_b[103]=11;
        matrix_b[104]=13; matrix_b[105]=14; matrix_b[106]=3; matrix_b[107]=14; matrix_b[108]=1; matrix_b[109]=8; matrix_b[110]=7; matrix_b[111]=5;
        matrix_b[112]=0; matrix_b[113]=12; matrix_b[114]=5; matrix_b[115]=10; matrix_b[116]=6; matrix_b[117]=5; matrix_b[118]=14; matrix_b[119]=1;
        matrix_b[120]=11; matrix_b[121]=11; matrix_b[122]=6; matrix_b[123]=4; matrix_b[124]=0; matrix_b[125]=14; matrix_b[126]=15; matrix_b[127]=3;
        matrix_b[128]=0; matrix_b[129]=1; matrix_b[130]=1; matrix_b[131]=13; matrix_b[132]=14; matrix_b[133]=2; matrix_b[134]=11; matrix_b[135]=2;
        matrix_b[136]=5; matrix_b[137]=9; matrix_b[138]=11; matrix_b[139]=13; matrix_b[140]=0; matrix_b[141]=3; matrix_b[142]=4; matrix_b[143]=4;
        matrix_b[144]=15; matrix_b[145]=12; matrix_b[146]=5; matrix_b[147]=15; matrix_b[148]=7; matrix_b[149]=8; matrix_b[150]=6; matrix_b[151]=2;
        matrix_b[152]=14; matrix_b[153]=0; matrix_b[154]=2; matrix_b[155]=3; matrix_b[156]=4; matrix_b[157]=2; matrix_b[158]=0; matrix_b[159]=10;
        matrix_b[160]=15; matrix_b[161]=1; matrix_b[162]=4; matrix_b[163]=8; matrix_b[164]=14; matrix_b[165]=11; matrix_b[166]=12; matrix_b[167]=9;
        matrix_b[168]=6; matrix_b[169]=3; matrix_b[170]=13; matrix_b[171]=12; matrix_b[172]=0; matrix_b[173]=11; matrix_b[174]=1; matrix_b[175]=11;
        matrix_b[176]=13; matrix_b[177]=2; matrix_b[178]=6; matrix_b[179]=1; matrix_b[180]=9; matrix_b[181]=14; matrix_b[182]=1; matrix_b[183]=6;
        matrix_b[184]=15; matrix_b[185]=4; matrix_b[186]=2; matrix_b[187]=7; matrix_b[188]=8; matrix_b[189]=10; matrix_b[190]=5; matrix_b[191]=15;
        matrix_b[192]=8; matrix_b[193]=4; matrix_b[194]=15; matrix_b[195]=14; matrix_b[196]=7; matrix_b[197]=0; matrix_b[198]=9; matrix_b[199]=8;
        matrix_b[200]=2; matrix_b[201]=10; matrix_b[202]=13; matrix_b[203]=1; matrix_b[204]=11; matrix_b[205]=2; matrix_b[206]=11; matrix_b[207]=6;
        matrix_b[208]=0; matrix_b[209]=15; matrix_b[210]=2; matrix_b[211]=9; matrix_b[212]=2; matrix_b[213]=14; matrix_b[214]=11; matrix_b[215]=12;
        matrix_b[216]=6; matrix_b[217]=7; matrix_b[218]=10; matrix_b[219]=12; matrix_b[220]=13; matrix_b[221]=0; matrix_b[222]=10; matrix_b[223]=1;
        matrix_b[224]=4; matrix_b[225]=13; matrix_b[226]=4; matrix_b[227]=12; matrix_b[228]=7; matrix_b[229]=3; matrix_b[230]=5; matrix_b[231]=8;
        matrix_b[232]=12; matrix_b[233]=9; matrix_b[234]=14; matrix_b[235]=13; matrix_b[236]=12; matrix_b[237]=9; matrix_b[238]=4; matrix_b[239]=6;
        matrix_b[240]=1; matrix_b[241]=5; matrix_b[242]=14; matrix_b[243]=6; matrix_b[244]=1; matrix_b[245]=10; matrix_b[246]=15; matrix_b[247]=13;
        matrix_b[248]=4; matrix_b[249]=7; matrix_b[250]=8; matrix_b[251]=3; matrix_b[252]=4; matrix_b[253]=3; matrix_b[254]=15; matrix_b[255]=11;
    end

    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            observed[i] = 32'sd0;
            expected[i] = 32'sd0;
        end

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 16; k = k + 1) begin
                    expected[i*16 + j] = expected[i*16 + j] + matrix_a[i*16 + k] * matrix_b[k*16 + j];
                end
            end
        end

        repeat (5) @(posedge clk);
        rst <= 0;

        for (i = 0; i < 256; i = i + 1) begin
            load_a(i[7:0], matrix_a[i]);
            load_b(i[7:0], matrix_b[i]);
        end

        @(posedge clk);
        start <= 1'b1;

        wait(done);
        @(posedge clk);
        start <= 1'b0;

        mismatches = 0;
        while (mismatches < 257) begin
            @(posedge clk);
            if (weC) begin
                observed[addrC] = dataC;
                if (dataC !== expected[addrC]) begin
                    $display("Mismatch at %0d: expected %0d got %0d", addrC, expected[addrC], dataC);
                    mismatches = mismatches + 1;
                end
            end

            if (addrC == 8'hff && weC) begin
                $display("Finished capture with %0d mismatches", mismatches);
                if (mismatches == 0) begin
                    $display("PASS");
                end
                $finish;
            end
        end
    end
endmodule
