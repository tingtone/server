package main.com.yourantao.aimeili.bean;



/**
 * OrderGoods entity. @author MyEclipse Persistence Tools
 */

public class OrderGoods  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Integer orderId;
     private Integer goodsRealId;
     private Integer count;
     private Float price;


    // Constructors

    /** default constructor */
    public OrderGoods() {
    }

    
    /** full constructor */
    public OrderGoods(Integer orderId, Integer goodsRealId, Integer count, Float price) {
        this.orderId = orderId;
        this.goodsRealId = goodsRealId;
        this.count = count;
        this.price = price;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getGoodsRealId() {
        return this.goodsRealId;
    }
    
    public void setGoodsRealId(Integer goodsRealId) {
        this.goodsRealId = goodsRealId;
    }

    public Integer getCount() {
        return this.count;
    }
    
    public void setCount(Integer count) {
        this.count = count;
    }

    public Float getPrice() {
        return this.price;
    }
    
    public void setPrice(Float price) {
        this.price = price;
    }
   








}