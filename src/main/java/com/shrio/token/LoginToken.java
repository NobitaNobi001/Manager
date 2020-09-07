package com.shrio.token;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 自定义shrio-token的重写类，用于多类型用户校验
 */
public class LoginToken extends UsernamePasswordToken {

    private String username;

    private String password;

    private String loginType;

    public LoginToken() {
    }

    public LoginToken(Integer Number, String password, String loginType) {

        this.username = String.valueOf(Number);

        this.password = password;

        this.loginType = loginType;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public char[] getPassword() {
        return password.toCharArray();
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }
}
