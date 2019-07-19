package com.sweet.redis;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class SerializableUtil {
    //序列化 
    public static byte [] serialize(Object obj){
        byte[] bs=null;
        try (ByteArrayOutputStream bai=new ByteArrayOutputStream();
             ObjectOutputStream obi=new ObjectOutputStream(bai);){
            obi.writeObject(obj);
            bs=bai.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bs;
    }

    //反序列化
    public static Object unserizlize(byte[] bs){
        Object obj=null;
        try(ByteArrayInputStream bis=new ByteArrayInputStream(bs);ObjectInputStream ois=new ObjectInputStream(bis);) {
            obj=ois.readObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return obj;
    }
}
