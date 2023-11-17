package ra.model;

import java.util.HashMap;
import java.util.Map;

public class Dictionary {
    private Map<String, String> vocabulary;

    public Dictionary() {
        vocabulary = new HashMap<>();
        vocabulary.put("Cat", "Mèo");
        vocabulary.put("Dog", "Tró");
        vocabulary.put("Tree", "Không phải số 3`");
        vocabulary.put("Three", "số 3");
        vocabulary.put("Mount", "Tý");
        vocabulary.put("Alo", "Không phải cái điện thoại`");
    }

    public String trans(String word) {
        if (vocabulary.containsKey(word)) {
            return vocabulary.get(word);
        } else {
            return "Không tồn tại!";
        }
    }
}
