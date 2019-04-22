
public class k_means {

	public static void main(String[] args) {
		
		int[] x = {1,2,3,4,5,6,7,8,9,10,11,12};  			 //x 좌표
		int[] y = {7,5,1,9,8,2,4,3,7,6,5,8};  				 //y 좌표
		int c = 3;											 //cluster 개수
		int[] cg = new int[12];					 			 //배열의 cluster 번호 저장하는 배열
		
		int[] new_x_r = {x[2], x[7], x[10]};					 	 //최초의 무게중심 위한 임의의 x좌표 
		int[] new_y_r = {y[2], y[7], y[10]};						 //최초의 무게중심 위한 임의의 y좌표 
		
		int[] x_r = new int[c];							 		//새로운 무게중심 x좌표
		int[] y_r = new int[c];							 		//새로운 무게중심 좌표
		
	
		double[] min_x = new double[c];							 //무게중심과 x좌표의 x축 거리
		double[] min_y = new double[c];							 //무게중심과 y좌표의 y축 거리
		double[] sum = new double[c];							 //최소거리 구하기 위한 min_x와 min_y의 합
		int change = 0;											 //무게중심 더이상 바뀌지 않으면 반복 멈추기 위한 변수
		int num = 0;											 //반복 횟수
		
		while(change<3) {
			num ++;
			System.out.println(num+" 번째");
			
			for (int i=0; i<12; i=i+1) {
				
				//최소 거리 구하기//
				for (int j=0; j<c; j=j+1) {
					min_x[j] = Math.pow((x[i]-new_x_r[j]),2);
					min_y[j] = Math.pow((y[i]-new_y_r[j]),2);
					sum[j]= min_x[j]+min_y[j];
					//System.out.println(i+" / "+j+" "+min_x[j]+"/ "+min_y[j]+" / 거리값 "+sum[j]);
				}
				
				//cluster 분류//
				double min_sum = sum[0];						//최소 sum 구하기 위한 변수		 
				int min_sum_i = 0;								//최소 거리를 가진 좌표의 index
				//System.out.println("min_sum : "+min_sum +" / "+min_sum_i);
				
				for (int k=1; k<c; k=k+1) {
					if(min_sum>sum[k]) {
						min_sum =sum[k];
						min_sum_i = k;
						//System.out.println("min_sum "+min_sum+" min_sum_i: "+min_sum_i);
					}
				}
				cg[i] = min_sum_i+1;
				System.out.println("누가 제일 가깝니?  "+min_sum_i+" / cg: "+i+" 번째 : "+cg[i]);  //x_r[min_sum_i]와 제일 가깝다
			}
			
			//center 다시 구하기//
			int[] cx_sum = new int[c];						//무게중심 구하기 위한 같은 cluster의 x값의 합
			int[] cy_sum = new int[c];						//무게중심 구하기 위한 같은 cluster의 y값의 합
			int[] cg_num = new int[c];						//각각의 cluster에 몇 개의 값이 포함되었는지 세기 위한 변수
			
			for (int i=0; i<12; i=i+1) {
				for (int j=0; j<c; j=j+1) {
					if (cg[i]==j+1) {
						cx_sum[j] = cx_sum[j] + x[i];
						cy_sum[j] = cy_sum[j] + y[i];
						cg_num[j] = cg_num[j]+1;
					}
				}
			}
			
			//x_r/y_r 에 원래 무게중심을 대입
			//new_x_r/new_y_r 에 새롭게 구한 무게중심을 대입
			for(int k=0; k<c; k++) {
				//System.out.println("center 다시 구하자 cx_sum : "+cx_sum[k]+" / "+cy_sum[k]+" / "+cg_num[k]);
			
				x_r[k] = new_x_r[k];
				y_r[k] = new_y_r[k];
		
				new_x_r[k] = cx_sum[k]/cg_num[k];
				new_y_r[k] = cy_sum[k]/cg_num[k];
				System.out.println("원래 무게 중심: "+x_r[k]+" / "+y_r[k]+"새로운 무게중심 : "+new_x_r[k]+" / "+new_y_r[k]);
			}
			
			change = 0;
			//원래 무게 중심과 새롭게 구한 무게 중심이 같으면 반복 멈춘다
			for(int k=0; k<c; k=k+1) {
				if (new_x_r[k] == x_r[k] && new_y_r[k] == y_r[k]) {
					change = change+1;
				}
			}
			
		
		}
		    
		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
		
		
		
		
		
		

	}

}
