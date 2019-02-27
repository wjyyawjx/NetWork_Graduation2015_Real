package servlet;

import java.util.Scanner;

public class pay {
	public static void main(String[] args) {
	
	Scanner scan = new Scanner(System.in);
	System.out.println("请输入单价（￥）：");
	double unitPrice;
	unitPrice = scan.nextDouble();
	
	System.out.println("请输入个数（个）：");
	int count;
	count = scan.nextInt();
	
	System.out.println("请输入付款金额（￥）");
	double payment;
	payment = scan.nextDouble();
	
	double totalPrice;//总金额
	totalPrice = unitPrice * count;
	
	double change;//找零
	
	if(payment>=totalPrice) {
		if(totalPrice>=500) {
			change = payment - totalPrice * 0.8;
			System.out.println("应收金额（￥）：" + (totalPrice * 0.8) + ", 应找零（￥）：" + change);
		}else {
			change = payment - totalPrice;
			System.out.println("应收金额（￥）：" + totalPrice + ", 应找零（￥）：" + change);
		}
	}else {
		System.out.println("您需要再支付（￥）：" + (totalPrice - payment));
	}
	}
}
	
