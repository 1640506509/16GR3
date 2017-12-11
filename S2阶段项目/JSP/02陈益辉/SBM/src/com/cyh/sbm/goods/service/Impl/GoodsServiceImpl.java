package com.cyh.sbm.goods.service.Impl;

import java.util.List;

import com.cyh.sbm.goods.bean.Goods;
import com.cyh.sbm.goods.dao.Impl.GoodsDaoImpl;
import com.cyh.sbm.goods.service.GoodsService;

public class GoodsServiceImpl implements GoodsService {


	@Override
	public Goods getGoods(String goodsName) {
		// TODO Auto-generated method stub
		return new GoodsDaoImpl().getGoods(goodsName);
	}

	@Override
	public int upGoods(int goodsNum, int goodsId) {
		// TODO Auto-generated method stub
		return new GoodsDaoImpl().upGoods(goodsNum, goodsId);
	}

}
