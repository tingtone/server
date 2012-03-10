package main.com.yourantao.aimeili.server;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import main.com.yourantao.aimeili.bean.Brand;
import main.com.yourantao.aimeili.bean.BrandDAO;
import main.com.yourantao.aimeili.bean.Goods;
import main.com.yourantao.aimeili.bean.GoodsDAO;
import main.com.yourantao.aimeili.bean.Image;
import main.com.yourantao.aimeili.bean.ImageDAO;
import main.com.yourantao.aimeili.bean.Series;
import main.com.yourantao.aimeili.bean.SeriesDAO;
import main.com.yourantao.aimeili.conf.Config;
import main.com.yourantao.aimeili.conf.Constant;
import main.com.yourantao.aimeili.vo.GoodsView;
import net.sf.json.JSONArray;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

public class ProductServer implements Constant {

	private static final long serialVersionUID = 1L;
	private static Logger log = LoggerFactory.getLogger(ProductServer.class);
	private HttpServletRequest request;

	public ProductServer(HttpServletRequest req) {
		this.request = req;
	}

	public JSONArray getGoodsList() {
		ApplicationContext ac = Config.getInstant();
		GoodsDAO goodsDAO = GoodsDAO.getFromApplicationContext(ac);
		ImageDAO imageDAO= ImageDAO.getFromApplicationContext(ac);
		BrandDAO brandDAO=BrandDAO.getFromApplicationContext(ac);
		SeriesDAO seriesDAO=SeriesDAO.getFromApplicationContext(ac);
			Integer categoryId = getIntegerParameter(CATEGORY_ID);
			if (categoryId == null)
				return null;
			List<Goods> goodsList = goodsDAO.findByCategoryId(categoryId);
			List<GoodsView> result=new ArrayList<GoodsView>();
			for (Goods goods : goodsList) {
				GoodsView goodsView=new GoodsView();
				goodsView.setGoodsId(goods.getGoodsId());
				goodsView.setGoodsAge(goods.getGoodsAge());
				goodsView.setGoodsDescription(goods.getGoodsDescription());
				goodsView.setGoodsForskin(goods.getGoodsForskin());
				goodsView.setGoodsName(goods.getGoodsName());
				goodsView.setGoodsNotforskin(goods.getGoodsNotforskin());
				goodsView.setGoodsNoticeforskin(goods.getGoodsNoticeforskin());
				goodsView.setGoodsScore(goods.getGoodsScore());
				goodsView.setGoodsSpecification(goods.getGoodsSpecification());
				goodsView.setGoodsStatus(goods.getGoodsStatus());
				Image thumb = imageDAO.findById(goods.getGoodsThumbId()); // 缩略图
				if (thumb != null) {
					goodsView.setGoodsThumb(Config.get(Config.BASE_IMAGEURL) + thumb.getImgUrl());
				} else {
					goodsView.setGoodsThumb("");
				}
				if (goods.getBrandId() != null) {
					Brand brand=brandDAO.findById(goods.getBrandId());
					goodsView.setGoodsBrandName(brand.getBrandName());
				} 
				if (goods.getSeriesId() != null) {  
					if(goods.getSeriesId()==0){    //对应系列号为0 代表没有对应系列
						goodsView.setGoodsSeriesName("无");
					}else{
						Series series=seriesDAO.findById(goods.getSeriesId());
						goodsView.setGoodsSeriesName(series.getSeriesName());
					}
				}
				result.add(goodsView);
			}
		JSONArray jsonArray = JSONArray.fromObject(result);
		return jsonArray;

	}
/**
 * 获得request中Integer类型的参数
 * 
 * @param paraName
 *            参数的名字
 * @return 参数的值，未找到参数时返回null
 */
protected Integer getIntegerParameter(String paraName) {
	int ret = 0;
	try {
		ret = Integer.valueOf(request.getParameter(paraName));
	} catch (Exception e) {
		return null;
	}
	return ret;
}
}
