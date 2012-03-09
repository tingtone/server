package main.com.yourantao.aimeili.vo;

/**
 * 商品的图像显示类
 * 
 * @author mac
 * 创建时间： 2012-3-8 上午10:57:14
 * 修改时间：2012-3-8 上午10:57:14
 * 具体描述： TODO
 */
public class GoodsImageView {
	private Integer id;   //商品图片的ID
	private Integer imageId;
	private String imageURL;
	public Integer getImageId() {
		return imageId;
	}
	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
}
