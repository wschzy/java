package cn.edu.store.aspect;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

public class Hzy {
	private static Map<String,String> map;
	
	public static void main(String[] args) {
		Random rand = new Random();
		@SuppressWarnings("resource")
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.println("请输入:");
			String line = scanner.nextLine();
			map = new HashMap<String,String>();
			for (int i = 0; i < line.length(); i++) {
				int data = rand.nextInt(line.length());
				while(true) {
					if(isVal(String.valueOf(data))) {
						data = rand.nextInt(line.length());
					}else {
						break;
					}
				}
				System.out.print(line.charAt(data));
				map.put(String.valueOf(i),String.valueOf(data));
			}
			System.out.println();
		}
	}
	
	public static boolean isVal(String value){
		if(null==map||map.size()==0){
			return false;
		}
		for(Map.Entry<String, String> entry : map.entrySet()){
			if(entry.getValue().equals(value)){
				return true;
			}
		}
		return false;
	}

}
