package bean;

import java.sql.Timestamp;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */
public class Goods extends AbstractGoods implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** full constructor */
	public Goods(Integer providerId, Integer brandId, Integer categoryId,
			String goodsName, String goodsThumb, String goodsImages,
			Float goodsPrice, String goodsUrl, Float goodsScore,
			String goodsSkin, String goodsAge, String goodsDescription,
			String goodsSpecification, Integer goodsCount, Short goodsIsNew,
			Short goodsIsHot, Integer goodsBuyCount, Integer goodsViewCount,
			Timestamp goodsAddTime, Timestamp goodsLastUpdate,
			Short goodsStatus, Integer goodsRank) {
		super(providerId, brandId, categoryId, goodsName, goodsThumb,
				goodsImages, goodsPrice, goodsUrl, goodsScore, goodsSkin,
				goodsAge, goodsDescription, goodsSpecification, goodsCount,
				goodsIsNew, goodsIsHot, goodsBuyCount, goodsViewCount,
				goodsAddTime, goodsLastUpdate, goodsStatus, goodsRank);
	}

}
