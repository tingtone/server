package bean;

/**
 * AbstractShoppingCartId entity provides the base persistence definition of the
 * ShoppingCartId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractShoppingCartId implements java.io.Serializable {

	// Fields

	private Integer userId;
	private Integer goodsId;
	private Integer count;

	// Constructors

	/** default constructor */
	public AbstractShoppingCartId() {
	}

	/** full constructor */
	public AbstractShoppingCartId(Integer userId, Integer goodsId, Integer count) {
		this.userId = userId;
		this.goodsId = goodsId;
		this.count = count;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractShoppingCartId))
			return false;
		AbstractShoppingCartId castOther = (AbstractShoppingCartId) other;

		return ((this.getUserId() == castOther.getUserId()) || (this
				.getUserId() != null
				&& castOther.getUserId() != null && this.getUserId().equals(
				castOther.getUserId())))
				&& ((this.getGoodsId() == castOther.getGoodsId()) || (this
						.getGoodsId() != null
						&& castOther.getGoodsId() != null && this.getGoodsId()
						.equals(castOther.getGoodsId())))
				&& ((this.getCount() == castOther.getCount()) || (this
						.getCount() != null
						&& castOther.getCount() != null && this.getCount()
						.equals(castOther.getCount())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUserId() == null ? 0 : this.getUserId().hashCode());
		result = 37 * result
				+ (getGoodsId() == null ? 0 : this.getGoodsId().hashCode());
		result = 37 * result
				+ (getCount() == null ? 0 : this.getCount().hashCode());
		return result;
	}

}