package com.cyh.sbm.goods.service;

import java.util.List;

import com.cyh.sbm.goods.bean.Goods;

public interface GoodsService {

	public Goods getGoods(String goodsName);
	public int upGoods(int goodsNum,int goodsId);
}
