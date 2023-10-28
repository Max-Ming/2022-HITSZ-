`timescale 1ns/1ps         // ����ʱ�䵥λ��ʱ�侫��

module decoder_38_sim();    //��������module���趨���������

   // ������Ҫ�õ����źţ����ź����ڿ���������õ�������Ϊreg�ͣ�
   // �ź����������⣬��������ģ��Ĵ�������ͬ�ĺ���
   reg [2:0] data_in;         // 3λ��������������
   reg [2:0] en;              // 3λʹ���ź�����
   wire [7:0] data_out;       // 8λ���

   //������ģ��ʵ����
   decoder_38 u_decoder_38(    //������ģ����decoder_38д��ǰ��
  	     .data_in(data_in),    // ָ��testbenablech�ж�����ź��뱻����ģ���źŵ����ӹ�ϵ
	     .en(en),              // ()����������ź���testbenablech�ж����
	     .data_out(data_out)
   );

   initial    // initial���е����ִֻ��һ�Σ�initialֻ����testbench����Ӧ�����ڹ��ܴ�����
   begin
       en = 3'b000; data_in = 3'b000;               // Ĭ�ϴ�0ns��ʼ����0ns������ʼ����ϵͳ������븳ֵ����̬��x
       #5 begin en = 3'b100;data_in = 3'b000; end   // ��ʱ5��ʱ�䵥λ������ʱ5ns
       #5 begin en = 3'b100;data_in = 3'b001; end   // ����������룺ʹ�ܶ���Ч���������8����� 
       #5 begin en = 3'b100;data_in = 3'b010; end
       #5 begin en = 3'b100;data_in = 3'b011; end  
       #5 begin en = 3'b100;data_in = 3'b100; end
       #5 begin en = 3'b100;data_in = 3'b101; end    
       #5 begin en = 3'b100;data_in = 3'b110; end
       #5 begin en = 3'b100;data_in = 3'b111; end  
       #5 begin en = 3'b101;data_in = 3'b000; end   //����������룺ʹ�ܶ���Ч
       #10 $finish ;                               // �������棬��Ȼϵͳ��һֱ���У�ֱ��ϵͳ���õ�Ĭ�ϵķ���ʱ�䵽��һ����1000ns��     
   end
   
   endmodule

