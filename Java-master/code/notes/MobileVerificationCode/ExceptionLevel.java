public enum ExceptionLevel {
	system(0),
	customer(1),
	all(2);
	
    private final int value;
    
    public int getValue() {
        return value;
    }
    //构造器默认也只能是private, 从而保证构造函数只能在内部使用
    ExceptionLevel(int value) {
        this.value = value;
    }
}