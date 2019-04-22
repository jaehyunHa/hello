
public class k_means {

	public static void main(String[] args) {
		
		int[] x = {1,2,3,4,5,6,7,8,9,10,11,12};  			 //x ��ǥ
		int[] y = {7,5,1,9,8,2,4,3,7,6,5,8};  				 //y ��ǥ
		int c = 3;											 //cluster ����
		int[] cg = new int[12];					 			 //�迭�� cluster ��ȣ �����ϴ� �迭
		
		int[] new_x_r = {x[2], x[7], x[10]};					 	 //������ �����߽� ���� ������ x��ǥ 
		int[] new_y_r = {y[2], y[7], y[10]};						 //������ �����߽� ���� ������ y��ǥ 
		
		int[] x_r = new int[c];							 		//���ο� �����߽� x��ǥ
		int[] y_r = new int[c];							 		//���ο� �����߽� ��ǥ
		
	
		double[] min_x = new double[c];							 //�����߽ɰ� x��ǥ�� x�� �Ÿ�
		double[] min_y = new double[c];							 //�����߽ɰ� y��ǥ�� y�� �Ÿ�
		double[] sum = new double[c];							 //�ּҰŸ� ���ϱ� ���� min_x�� min_y�� ��
		int change = 0;											 //�����߽� ���̻� �ٲ��� ������ �ݺ� ���߱� ���� ����
		int num = 0;											 //�ݺ� Ƚ��
		
		while(change<3) {
			num ++;
			System.out.println(num+" ��°");
			
			for (int i=0; i<12; i=i+1) {
				
				//�ּ� �Ÿ� ���ϱ�//
				for (int j=0; j<c; j=j+1) {
					min_x[j] = Math.pow((x[i]-new_x_r[j]),2);
					min_y[j] = Math.pow((y[i]-new_y_r[j]),2);
					sum[j]= min_x[j]+min_y[j];
					//System.out.println(i+" / "+j+" "+min_x[j]+"/ "+min_y[j]+" / �Ÿ��� "+sum[j]);
				}
				
				//cluster �з�//
				double min_sum = sum[0];						//�ּ� sum ���ϱ� ���� ����		 
				int min_sum_i = 0;								//�ּ� �Ÿ��� ���� ��ǥ�� index
				//System.out.println("min_sum : "+min_sum +" / "+min_sum_i);
				
				for (int k=1; k<c; k=k+1) {
					if(min_sum>sum[k]) {
						min_sum =sum[k];
						min_sum_i = k;
						//System.out.println("min_sum "+min_sum+" min_sum_i: "+min_sum_i);
					}
				}
				cg[i] = min_sum_i+1;
				System.out.println("���� ���� ������?  "+min_sum_i+" / cg: "+i+" ��° : "+cg[i]);  //x_r[min_sum_i]�� ���� ������
			}
			
			//center �ٽ� ���ϱ�//
			int[] cx_sum = new int[c];						//�����߽� ���ϱ� ���� ���� cluster�� x���� ��
			int[] cy_sum = new int[c];						//�����߽� ���ϱ� ���� ���� cluster�� y���� ��
			int[] cg_num = new int[c];						//������ cluster�� �� ���� ���� ���ԵǾ����� ���� ���� ����
			
			for (int i=0; i<12; i=i+1) {
				for (int j=0; j<c; j=j+1) {
					if (cg[i]==j+1) {
						cx_sum[j] = cx_sum[j] + x[i];
						cy_sum[j] = cy_sum[j] + y[i];
						cg_num[j] = cg_num[j]+1;
					}
				}
			}
			
			//x_r/y_r �� ���� �����߽��� ����
			//new_x_r/new_y_r �� ���Ӱ� ���� �����߽��� ����
			for(int k=0; k<c; k++) {
				//System.out.println("center �ٽ� ������ cx_sum : "+cx_sum[k]+" / "+cy_sum[k]+" / "+cg_num[k]);
			
				x_r[k] = new_x_r[k];
				y_r[k] = new_y_r[k];
		
				new_x_r[k] = cx_sum[k]/cg_num[k];
				new_y_r[k] = cy_sum[k]/cg_num[k];
				System.out.println("���� ���� �߽�: "+x_r[k]+" / "+y_r[k]+"���ο� �����߽� : "+new_x_r[k]+" / "+new_y_r[k]);
			}
			
			change = 0;
			//���� ���� �߽ɰ� ���Ӱ� ���� ���� �߽��� ������ �ݺ� �����
			for(int k=0; k<c; k=k+1) {
				if (new_x_r[k] == x_r[k] && new_y_r[k] == y_r[k]) {
					change = change+1;
				}
			}
			
		
		}
		    
		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
		
		
		
		
		
		

	}

}
