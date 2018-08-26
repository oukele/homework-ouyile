package com.dao;

import com.entity.iPhone;

import java.util.ArrayList;
import java.util.List;

public class iPhoneDao implements iPhoneInterface<iPhone> {

    private  static List<iPhone> data = new ArrayList<>();

    static {
        data.add(new iPhone(1,"苹果",5555.0f,"白色","64G"));
        data.add(new iPhone(2,"华为",3355.0f,"红色","128G"));
        data.add(new iPhone(3,"小米",2545.0f,"酒红色","32G"));
        data.add(new iPhone(4,"OPPO",3525.0f,"金色","64G"));
        data.add(new iPhone(5,"VIVO",3525.0f,"银色","16G"));
    }

    //获取全部数据
    @Override
    public List<iPhone> ListAll() {
        return data;
    }

    //根据id删除对应信息
    @Override
    public boolean delete(int id) {
        for (iPhone i:data) {
            if(i.getId()==id){
                return data.remove(i);
            }
        }
        return false;
    }

    //根据id查询相对信息
    @Override
    public iPhone getInfo(int id) {
        for (iPhone iphone:data){
            if (iphone.getId()==id){
                return  iphone;
            }
        }
        return null;
    }

    //模糊查询

    //根据id查询相对信息
    public  List<iPhone> getSearch(String value) {
        List<iPhone> list = new ArrayList<>();
        for (iPhone iphone:data){
            if(value!=""|| value!=null) {
                if (iphone.getName().contains(value) || iphone.getMemory().contains(value)
                        || String.valueOf(iphone.getPrice()).contains(value)
                        || iphone.getColor().contains(value)
                        || String.valueOf(iphone.getId()).contains(value)) {
                    list.add(iphone);
                }
            }else{
                return data;
            }
        }
        return list;
    }

    @Override
    public boolean update(iPhone mobu) {
        for (iPhone iphone:data){
            if(iphone.getId()==mobu.getId()){
                iphone.setName(mobu.getName());
                iphone.setPrice(mobu.getPrice());
                iphone.setColor(mobu.getColor());
                iphone.setMemory(mobu.getMemory());
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean add(iPhone mobu) {

        for (iPhone datum : data) {
            if(datum.getId()==mobu.getId()){
                return false;
            }else{
                data.add(mobu);
                return true;
            }
        }
        return false;
    }

}

class Test{
    public static void main(String[] args) {
        boolean flag = new iPhoneDao().update(new iPhone(1,"你好",23f,"sd","dd"));
        System.out.println(flag+"："+new iPhoneDao().ListAll());
    }
}