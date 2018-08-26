package com.dao;

import com.entity.iPhone;

import java.awt.print.Book;
import java.util.List;

public interface iPhoneInterface<T> {
    //获取全部数据的行为
    List<T> ListAll();
    //根据id删除
    boolean delete(int id);
    //根据id获取对象信息
    T getInfo(int id);
    //根据id修改
    boolean update(T mobu);

    //添加
    boolean add(T mobu);

}
