package main.com.yourantao.aimeili.util;

public class RankGenerator {
	private static int num = 0;

	public long generateRank() {
		int current = (++num) & 0x3ff;
		return (System.currentTimeMillis() << 10) + current;
	}
}
