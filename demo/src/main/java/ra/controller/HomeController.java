package ra.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ra.model.Dictionary;
import ra.model.Exchange;

@Controller
public class HomeController {
    Dictionary dictionary = new Dictionary();
    Exchange exchange = new Exchange();

    @RequestMapping("/home")
    public String show() {
        return "home";
    }

    @RequestMapping("/exchange")
    public String showExchange(@RequestParam double USD, Model model) {
        double VND = showExchange(USD);
        model.addAttribute("vnd", vnd);
        model.addAttribute("usd", usd);
        return "exchange";
    }

    @RequestMapping("/dictionary")
    public String showDictionary() {
        return "dictionary";
    }

    @PostMapping("/trans")
    public String translate(@RequestParam String word, Model model) {
        String rs = dictionary.trans(word);
        model.addAttribute("rs", rs);
        model.addAttribute("word", word);
        return "dictionary";
    }

}
