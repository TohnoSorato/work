package model;

import java.util.ArrayList;
import java.util.List;

public class PostMutterLogic {
    private static List<Mutter> mutterList = new ArrayList<>();

    public void execute(Mutter mutter) {
        mutterList.add(mutter); // リストにMutterを追加
    }

    public static List<Mutter> getMutterList() {
        return new ArrayList<>(mutterList);
    }
}
