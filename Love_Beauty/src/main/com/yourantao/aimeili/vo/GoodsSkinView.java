package main.com.yourantao.aimeili.vo;

import java.util.List;

/**
 * 适合，不适合，需要注意的肤质 
 * 商品展示类
 * 
 * @author mac
 * 创建时间： 2012-3-14 上午11:06:17
 * 修改时间：2012-3-14 上午11:06:17
 * 具体描述： TODO
 */
public class GoodsSkinView {
	private List<GoodsView>  skinResult;
	private List<GoodsView>  notSkinResult;
	private List<GoodsView>  noticeSkinResult;
	public List<GoodsView> getSkinResult() {
		return skinResult;
	}
	public void setSkinResult(List<GoodsView> skinResult) {
		this.skinResult = skinResult;
	}
	public List<GoodsView> getNotSkinResult() {
		return notSkinResult;
	}
	public void setNotSkinResult(List<GoodsView> notSkinResult) {
		this.notSkinResult = notSkinResult;
	}
	public List<GoodsView> getNoticeSkinResult() {
		return noticeSkinResult;
	}
	public void setNoticeSkinResult(List<GoodsView> noticeSkinResult) {
		this.noticeSkinResult = noticeSkinResult;
	}
	
}
