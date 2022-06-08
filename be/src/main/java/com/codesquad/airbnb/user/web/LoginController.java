package com.codesquad.airbnb.user.web;

import com.codesquad.airbnb.user.service.LoginService;
import com.codesquad.airbnb.user.web.dto.LoginResponseDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequestMapping("/login")
@RestController
public class LoginController {

    private final LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @GetMapping
    public LoginResponseDto login(@RequestParam String code) {
        log.debug("LoginController: {}", code);

        return loginService.login(code);
    }
}
