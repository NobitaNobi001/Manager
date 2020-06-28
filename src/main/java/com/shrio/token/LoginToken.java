package com.shrio.token;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 自定义shrio-token的重写类，用于多类型用户校验
 */
public class LoginToken extends UsernamePasswordToken {

    private String loginType;

    public LoginToken() {
    }

    public LoginToken(Integer Number, String password, String loginType) {

        super(String.valueOf(Number), password);

        this.loginType = loginType;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }
}
