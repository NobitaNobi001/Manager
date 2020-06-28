package com.shrio.authenticator;

import com.shrio.token.LoginToken;
import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

public class RolesRealmAuthenticator extends ModularRealmAuthenticator {


    private Map<String, Object> definedRealms;

    @Override
    protected AuthenticationInfo doAuthenticate(AuthenticationToken authenticationToken) throws AuthenticationException {

        //判断getRealms()是否返回为空
        assertRealmsConfigured();

        //将token转换为自定义的LoginToken
        LoginToken token = (LoginToken) authenticationToken;

        //找到当前登陆用户的用户类型
        String loginType = token.getLoginType();

        //所有Realm
        Collection<Realm> realms = getRealms();

        //找到登陆类型对应的指定的Realm
        Collection<Realm> typeRealms = new ArrayList<>();

        for (Realm realm : realms) {

            if (realm.getName().contains(loginType)) {
                typeRealms.add(realm);
            }
        }

        //判断是多Realm还是单Realm
        if (typeRealms.size() == 1) {
            return doSingleRealmAuthentication(typeRealms.iterator().next(), token);
        } else {
            return doMultiRealmAuthentication(typeRealms, token);
        }
    }

    /**
     * 判断realm是否为空
     *
     * @throws IllegalStateException
     */
    @Override
    protected void assertRealmsConfigured() throws IllegalStateException {
        this.definedRealms = this.getDefinedRealms();
        if (CollectionUtils.isEmpty(this.definedRealms)) {
            throw new ShiroException("值传递错误!");
        }
    }

    public Map<String, Object> getDefinedRealms() {
        return definedRealms;
    }

    public void setDefinedRealms(Map<String, Object> definedRealms) {
        this.definedRealms = definedRealms;
    }
}
