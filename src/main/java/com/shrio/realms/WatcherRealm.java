package com.shrio.realms;

import com.bean.Watcher;
import com.constant.StringConstant;
import com.service.WatcherService;
import com.shrio.token.LoginToken;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

public class WatcherRealm extends AuthorizingRealm {

    @Autowired
    private WatcherService watcherService;


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        LoginToken token = (LoginToken) authenticationToken;

        //根据用户名进行查询watcherNumber对应的记录
        Watcher watcher = watcherService.selectWatcherByWatcherNumber(Integer.valueOf(token.getUsername()));

        //用户不存在
        if (watcher == null) {
            throw new UnknownAccountException(StringConstant.ACCOUNT_PASSWORD_ERROR);
        }

        //密码错误
        if (!(watcher.getPassword().equals(String.valueOf(token.getPassword())))) {
            throw new IncorrectCredentialsException(StringConstant.ACCOUNT_PASSWORD_ERROR);
        }

        //1.认证的实体信息
        Object principal = token.getUsername();
        //2.从数据表中获取的密码
        Object credentials = watcher.getPassword();
        //3.realmName 当前realm对象的name调用父类的getName方法即可
        String realmName = getName();
        //4.盐值
        //ByteSource credentialsSalt = ByteSource.Util.bytes(token.getUsername());

        //获取当前用户
        Subject currentUser = SecurityUtils.getSubject();
        //获取当前用户的session对象
        Session session = currentUser.getSession();
        //将用户信息存入session对象中
        session.setAttribute(StringConstant.WATCHER_TYPE, watcher);
        session.setAttribute("url","watcher/index");

        //构建AuthenticationInfo对象并返回
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal, credentials, realmName);

        return info;
    }
}
