package com.noticias.principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ControllerWeb {

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @PostMapping("/saludar")
    public String saludar(@RequestParam("nombre") String nombre, Model model) {
        model.addAttribute("mensaje", "¡Hola " + nombre + "! Bienvenido a mi página web.");
        return "saludo";
    }
}
