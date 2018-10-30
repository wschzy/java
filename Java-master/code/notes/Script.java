package com.ecidi.form.service;

import javax.script.*;


public class Script {

	public static void main(String[] args) {
		try {
			String script = "function add(op1,op2){return op1+op2} add(a, b)";//定义函数并调用
			ScriptEngine engine = new ScriptEngineManager().getEngineByName("javascript");
			Compilable compilable = (Compilable) engine;
			CompiledScript JSFunction = compilable.compile(script); //解析编译脚本函数
			Bindings bindings = engine.createBindings(); //Local级别的Binding
			bindings.put("a", 1);
			bindings.put("b", 2); //通过Bindings加入参数
			Object result = JSFunction.eval(bindings);
			System.out.println(result); //调用缓存着的脚本函数对象，Bindings作为参数容器传入
			cul();
		}
		catch (ScriptException e) {
		}
	}
	public static void cul() throws ScriptException{
		ScriptEngine engine = new ScriptEngineManager().getEngineByName("javascript");
		System.out.println(engine.eval("0.1 + 0.2").toString());
	}

}
