package model;

import java.util.List;

public class GetMutterListLogic {
    public List<Mutter> execute() {
        return PostMutterLogic.getMutterList(); // 現在のつぶやきリストを取得
    }
}
