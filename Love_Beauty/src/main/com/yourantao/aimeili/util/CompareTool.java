package main.com.yourantao.aimeili.util;

import java.util.ArrayList;
import java.util.List;

public class CompareTool {
	public static double stringSimilarity(CharSequence str1, CharSequence str2) {
		double length = Math.max(str1.length(), str2.length());
		double similarity1 = (length - levenshteinDistance(str1, str2))
				/ length;
		// double similarity2 = diceCoefficient(str1, str2);
		double similarity3 = jaroWinklerDistance(str1, str2);
		return similarity1 * 0.4 + similarity3 * 0.6;
	}

	public static int levenshteinDistance(CharSequence str1, CharSequence str2) {
		int[][] distance = new int[str1.length() + 1][str2.length() + 1];

		for (int i = 0; i <= str1.length(); i++)
			distance[i][0] = i;
		for (int j = 0; j <= str2.length(); j++)
			distance[0][j] = j;

		for (int i = 1; i <= str1.length(); i++)
			for (int j = 1; j <= str2.length(); j++)
				distance[i][j] = minimum(
						distance[i - 1][j] + 1,
						distance[i][j - 1] + 1,
						distance[i - 1][j - 1]
								+ ((str1.charAt(i - 1) == str2.charAt(j - 1)) ? 0
										: 1));

		return distance[str1.length()][str2.length()];
	}

	public static double diceCoefficient(CharSequence str1, CharSequence str2) {
		return dice(bigram(str1), bigram(str2));
	}

	public static double jaroWinklerDistance(CharSequence s1, CharSequence s2) {
		if (s1.equals(s2))
			return 1.0;
		if (s1.length() > s2.length()) {
			CharSequence tmp = s2;
			s2 = s1;
			s1 = tmp;
		}

		int maxdist = s2.length() / 2;
		int c = 0; // count of common characters
		int t = 0; // count of transpositions
		int prevpos = -1;
		for (int ix = 0; ix < s1.length(); ix++) {
			char ch = s1.charAt(ix);

			// now try to find it in s2
			for (int ix2 = Math.max(0, ix - maxdist); ix2 < Math.min(s2
					.length(), ix + maxdist); ix2++) {
				if (ch == s2.charAt(ix2)) {
					c++; // we found a common character
					if (prevpos != -1 && ix2 < prevpos)
						t++; // moved back before earlier
					prevpos = ix2;
					break;
				}
			}
		}
		if (c == 0)
			return 0.0;

		double score = ((c / (double) s1.length()) + (c / (double) s2.length()) + ((c - t) / (double) c)) / 3.0;

		int p = 0; // length of prefix
		int last = Math.min(4, s1.length());
		for (; p < last && s1.charAt(p) == s2.charAt(p); p++)
			;

		score = score + ((p * (1 - score)) / 10);
		return score;
	}

	private static int minimum(int a, int b, int c) {
		return Math.min(Math.min(a, b), c);
	}

	private static List<char[]> bigram(CharSequence input) {
		ArrayList<char[]> bigram = new ArrayList<char[]>();
		for (int i = 0; i < input.length() - 1; i++) {
			char[] chars = new char[2];
			chars[0] = input.charAt(i);
			chars[1] = input.charAt(i + 1);
			bigram.add(chars);
		}
		return bigram;
	}

	private static double dice(List<char[]> bigram1, List<char[]> bigram2) {
		List<char[]> copy = new ArrayList<char[]>(bigram2);
		int matches = 0;
		for (int i = bigram1.size(); --i >= 0;) {
			char[] bigram = bigram1.get(i);
			for (int j = copy.size(); --j >= 0;) {
				char[] toMatch = copy.get(j);
				if (bigram[0] == toMatch[0] && bigram[1] == toMatch[1]) {
					copy.remove(j);
					matches += 2;
					break;
				}
			}
		}
		return (double) matches / (bigram1.size() + bigram2.size());
	}

	public static void main(String[] args) {
		String[] strs = new String[] { "雅诗兰黛代购ANR即时修护特润精华液",
				"雅诗兰黛ANR即时修护特润精华液", "雅诗兰黛 ANR即时修护特润精华露", "雅诗兰黛即时修护ANR特润精华液",
				"美国雅诗兰黛ANR即时修护精华美白精华液", "雅诗兰黛DNA即时特润修护露", "正雅诗兰黛代购即时修护特润精华露" };
		for (String str1 : strs) {
			str1 = str1.replace(" ", "");
			for (String str2 : strs) {
				str2 = str2.replace(" ", "");
				System.out.println(str1 + " " + str2 + " : "
						+ stringSimilarity(str1, str2));
			}
		}
	}
}
