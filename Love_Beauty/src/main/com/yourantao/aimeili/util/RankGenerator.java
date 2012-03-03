package main.com.yourantao.aimeili.util;

public class RankGenerator {
	private static int num = 0;

	public long generateRank() {
		int current = (++num) % 5000 + 5000;
		return System.currentTimeMillis() * 10000 + current;
	}
}
