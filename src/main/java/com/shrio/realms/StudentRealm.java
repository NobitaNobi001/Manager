package com.shrio.realms;

import com.bean.Student;
import com.service.StudentService;
import com.shrio.token.LoginToken;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;


public class StudentRealm extends AuthorizingRealm {

    @Autowired
    private StudentService studentService;

    //权限管理
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        return null;
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        LoginToken token = (LoginToken) authenticationToken;

        //根据用户名进行查询stuNumber对应的记录
        Student student = studentService.selectUPByStuNumber(Integer.valueOf(token.getUsername()));

        //用户不存在
        if (student == null) {
            throw new UnknownAccountException("用户不存在");
        }

        //密码错误
        if (!(student.getPassword().equals(String.valueOf(token.getPassword())))) {
            throw new IncorrectCredentialsException("密码错误");
        }

        //1.认证的实体信息
        Object principal = token.getUsername();
        //2.从数据表中获取的密码
        Object credentials = student.getPassword();
        //3.realmName 当前realm对象的name调用父类的getName方法即可
        String realmName = getName();
        //4.盐值
        //ByteSource credentialsSalt = ByteSource.Util.bytes(token.getUsername());

        //构建AuthenticationInfo对象并返回
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal, credentials, realmName);

        return info;
    }
}