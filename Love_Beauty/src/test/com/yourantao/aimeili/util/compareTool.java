package test.com.yourantao.aimeili.util;

import java.util.ArrayList;
import java.util.List;

import main.com.yourantao.aimeili.util.CompareTool;

public class compareTool {

	public static void main(String[] args) {
		String[] goodsNames = new String[] { "代购ANR即时修护特润精华液", "ANR即时修护特润精华液",
				"ANR即时修护特润精华露", "即时修护ANR特润精华液", "美国ANR即时修护精华美白精华液",
				"DNA即时特润修护露", "正代购即时修护特润精华露" };
		int size = goodsNames.length;
		int[] goodsCategory = new int[size];
		int currentCategory = 1;
		for (int i = 0; i < size; ++i) {
			int maxSimilarityLoc = -1;
			double maxSimilarity = 0;
			for (int j = 0; j < i; ++j) {
				double similarity = CompareTool.stringSimilarity(goodsNames[i],
						goodsNames[j]);
				if (similarity > maxSimilarity && similarity > 0.75) {
					maxSimilarity = similarity;
					maxSimilarityLoc = j;
				}
			}
			if (maxSimilarityLoc == -1) {
				goodsCategory[i] = currentCategory;
				++currentCategory;
			} else {
				goodsCategory[i] = goodsCategory[maxSimilarityLoc];
			}
		}
		for (int i = 0; i < size; ++i)
			System.out.println(goodsCategory[i] + ". " + goodsNames[i]);
	}
}
