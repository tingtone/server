package main.com.yourantao.aimeili.util;

public interface Serializable {

	byte[] serialize();

	void unserialize(byte[] ss);

}