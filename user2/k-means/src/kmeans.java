
public class kmeans {

	public static void main(String[] args) {
		
		int[] x = {1,2,3,4,5,6,7,8,9,10,11,12};  			 //x 좌표
		int[] y = {7,5,1,9,8,2,4,3,7,6,5,8};  				 //y 좌표
		
		int c = 3;											         //cluster 개수
		int[] cg = new int[x.length];					 			 //배열의 새로운 cluster 번호 저장하는 배열
		int[] b_cg = new int[x.length];                              //바뀌기 전의 cluster번호를 저장하는 배열
		
		double[] new_x_r = {x[1], x[7], x[10]};					 	 //최초의 무게중심 위한 임의의 x좌표 
		double[] new_y_r = {y[1], y[7], y[10]};						 //최초의 무게중심 위한 임의의 y좌표 
	
		double[] min_x = new double[c];							 //무게중심과 x좌표의 x축 거리
		double[] min_y = new double[c];							 //무게중심과 y좌표의 y축 거리
		double[] sum = new double[c];							 //최소거리 구하기 위한 min_x와 min_y의 합
		
		int change = 0;											 //무게중심 더이상 바뀌지 않으면 반복 멈추기 위한 변수
		int num = 0;											 //반복 횟수
		
		
		while (true) {
			num ++;
			System.out.println(num+" 번째");
			
			for (int i=0; i<cg.length; i=i+1) {
				
				//b_cg에 cluster값 바뀌기 전의 값 저장
				if (num>1) {
					b_cg[i] = cg[i];
				}
				
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
				
				//cg배열에 최소 거리를 가진 좌표의 index 저장
				cg[i] = min_sum_i+1;
				
				System.out.println("누가 제일 가깝니?  "+min_sum_i+" / cg: "+i+" 번째 : "+cg[i]);  //x_r[min_sum_i]와 제일 가깝다
			}
			
			//center 다시 구하기//
			int[] cx_sum = new int[c];						//무게중심 구하기 위한 같은 cluster의 x값의 합
			int[] cy_sum = new int[c];						//무게중심 구하기 위한 같은 cluster의 y값의 합
			int[] cg_num = new int[c];						//각각의 cluster에 몇 개의 값이 포함되었는지 세기 위한 변수
			
			for (int i=0; i<cg.length; i=i+1) {
				for (int j=0; j<c; j=j+1) {
					if (cg[i]==j+1) {
						cx_sum[j] = cx_sum[j] + x[i];
						cy_sum[j] = cy_sum[j] + y[i];
						cg_num[j] = cg_num[j]+1;
					}
				}
			}
			
			change = 0;
			//두번째 회전부터 cluster값을 서로 비교
			//cg와 b_cg의 값을 비교하여 서로 같으면 cluster 변경 없었으므로 반복 끝냄
			if (num>1){
				for (int k=0; k<cg.length; k=k+1) {
					if (cg[k]==b_cg[k]){
						change = change+1;
						System.out.println("change : "+change);
					}
				}
				if(change>cg.length-1) {
					break;
				}
			}
			
			
			//new_x_r, new_y_r 에 새롭게 구한 무게중심을 대입
			for (int k=0; k<c; k=k+1) {
				//System.out.println("center 다시 구하자 cx_sum : "+cx_sum[k]+" / "+cy_sum[k]+" / "+cg_num[k]);
			
				new_x_r[k] = cx_sum[k]/cg_num[k];
				new_y_r[k] = cy_sum[k]/cg_num[k];
				System.out.println(" < "+new_x_r[k]+"  > "+new_y_r[k]);
			}
			
		
		
		}
		    
		                              

	}

}
