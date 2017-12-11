package com.cyh.sbm.goods.dao;

import java.util.List;

import com.cyh.sbm.goods.bean.Goods;

public interface GoodsDao {

	public Goods getGoods(String goodsName);
	public int upGoods(int goodsNum,int goodsId);
}
