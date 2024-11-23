package uz.pdp.homework_4jspinternetmagazin;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Optional;

public class Servise {
    public static boolean isLoggedUser(HttpServletRequest req){
        Optional<Cookie> optionalCookie = Arrays.stream(req.getCookies()).filter(item -> item.getName().equals("token")).findFirst();
        if ( optionalCookie.isPresent()){
            return optionalCookie.get().getValue().equals("sirlisoz");
        }
        return false;
    }
}
