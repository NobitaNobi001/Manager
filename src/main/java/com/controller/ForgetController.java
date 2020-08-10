package com.controller;

import com.bean.Msg;
import com.service.AdminService;
import com.service.StudentService;
import com.service.TeacherService;
import com.service.WatcherService;
import com.utils.CheckImageUtil;
import com.utils.UserTypeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

/**
 * 忘记密码的控制器
 */
@Controller
@RequestMapping("/forget")
public class ForgetController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private WatcherService watcherService;
    @Autowired  //在spring中配置的邮件发送的bean
    private JavaMailSender javaMailSender;

    /**
     * 去到忘记密码页面
     *
     * @return
     */
    @RequestMapping("/forgetIndex")
    public String forget() {

        return "common/forget";
    }

    /**
     * 密码验证页面
     *
     * @return
     */
    @RequestMapping("/forgetCheck")
    public String forgetCheck() {

        return "common/forgetCheck";
    }

    /**
     * 重置密码页面
     *
     * @return
     */
    @RequestMapping("/forgetPassword")
    public String forgetPassword() {

        return "common/forgetPassword";
    }

    /**
     * 重置密码完成页面
     *
     * @return
     */
    @RequestMapping("/forgetDone")
    public String forgetDone() {

        return "common/forgetDone";
    }

    /**
     * 生成随机验证码
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/checkCode")
    public void getCheckCode(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int width = 63;
        int height = 37;
        Random random = new Random();

        //设置response的头信息
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        //生成缓冲区image类
        BufferedImage image = new BufferedImage(width, height, 1);
        //产生image类的Graphics用来进行绘制
        Graphics g = image.getGraphics();
        //设置Graphics类的样式
        g.setColor(CheckImageUtil.getRandColor(130, 200));
        g.setFont(new Font("Times New Roman", 0, 28));
        g.fillRect(0, 0, width, height);
        //绘制干扰线
        for (int i = 0; i < 40; i++) {
            g.setColor(CheckImageUtil.getRandColor(130, 200));
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(12);
            int y1 = random.nextInt(12);
            g.drawLine(x, y, x + x1, y + y1);
        }

        String strCode = "";
        for (int i = 0; i < 4; i++) {
            String rand = String.valueOf(random.nextInt(10));
            strCode = strCode + rand;
            g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
            g.drawString(rand, 13 * i + 6, 28);
        }

        //将字符保存到session中用于前端验证
        request.getSession().setAttribute("strCode", strCode);

        //销毁绘图对象
        g.dispose();

        ImageIO.write(image, "JPEG", response.getOutputStream());
        response.getOutputStream().flush();

    }

    /**
     * 根据账号和账户类型来判断用户是否存在
     *
     * @param number
     * @param type
     * @return
     */
    @RequestMapping(value = "/checkUser", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkUser(@RequestParam("number") String number, @RequestParam("type") Integer type, @RequestParam("checkCode") String checkCode, HttpServletRequest request) {


        //输入是否为中文

        //验证码是否正确
        if (!checkCode.equals(request.getSession().getAttribute("strCode"))) {
            return Msg.fail().add("msg", "验证码错误!");
        }

        boolean flag = true;

        String userType = UserTypeUtil.getUserType(type);

        //判断用户类型并进行相应的查询
        if (userType.equals("Student")) {

        } else if (userType.equals("Teacher")) {

            flag = teacherService.checkTeacher(Integer.valueOf(number));

        } else if (userType.equals("Watcher")) {

            flag = watcherService.checkWatcher(Integer.valueOf(number));
        } else {

            flag = adminService.checkAdmin(Integer.valueOf(number));
        }

        //如果存在此用户就将该账号放到session域对象中
        if (!flag) {
            request.getSession().setAttribute("forget_number", Integer.valueOf(number));
            request.getSession().setAttribute("forget_type", userType);
            return Msg.success();
        } else {
            return Msg.fail().add("msg", "用户不存在!");
        }
    }

    @RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkEmail(@RequestParam("email") String email, HttpServletRequest request) {


        Integer number = (Integer) request.getSession().getAttribute("forget_number");
        String userType = (String) request.getSession().getAttribute("forget_type");

        boolean flag = true;

        //判断用户类型并进行相应的查询
        if (userType.equals("Student")) {

        } else if (userType.equals("Teacher")) {


        } else if (userType.equals("Watcher")) {

            flag = watcherService.checkEmailByWatcher(Integer.valueOf(number), email);
        } else {

        }

        if (!flag) {
            return Msg.success();
        } else {
            return Msg.fail().add("msg", "邮箱和账号不对应");
        }
    }

    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
    @ResponseBody
    public Msg sendEmail(@RequestParam("email") String email, HttpServletRequest request) throws MessagingException {

        //一、生成验证码部分
        //1.生成随机验证码
        String checkCode = String.valueOf((int) ((Math.random() * 9 + 1) * 1000));
        //2.获取session对象
        HttpSession session = request.getSession();
        //3.将验证码存入到session域中
        session.setAttribute("checkCode", checkCode);
        //4.设置session的过期时间为10分钟
        session.setMaxInactiveInterval(300);

        //二、邮件设置部分
        //1.创建邮件对象
        MimeMessage mMessage = javaMailSender.createMimeMessage();

        MimeMessageHelper mMessageHelper;
        Properties prop = new Properties();
        String from;

        try {

            //2.从配置文件中拿到发件人邮箱地址
            prop.load(this.getClass().getResourceAsStream("/email.properties"));
            from = prop.get("mail.smtp.username") + "";

            mMessageHelper = new MimeMessageHelper(mMessage, true);

            //发件人邮箱
            mMessageHelper.setFrom(from);

            //收件人邮箱
            mMessageHelper.setTo(email);

            //邮件的主题
            mMessageHelper.setSubject("验证码");

            //邮件的文本内容，true表示文本以html格式打开
            mMessageHelper.setText("您的验证码为：" + checkCode + ",有效期5分钟。");

            //发送邮件
            javaMailSender.send(mMessage);

            return Msg.success();

        } catch (IOException e) {
            e.printStackTrace();
        }

        return Msg.fail();
    }

    @RequestMapping(value = "/checkEmailCode", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkEmailCode(@RequestParam("captcha") String captcha, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        //1.拿到session域中的验证码
        String sessionCaptcha = (String) request.getSession().getAttribute("checkCode");

        //2.如果验证码正确
        if (sessionCaptcha.equals(captcha)) {

            return Msg.success();
        }

        return Msg.fail().add("msg", "验证码错误!");

    }

    @RequestMapping(value = "/password", method = RequestMethod.POST)
    @ResponseBody
    public Msg updatePassword(@RequestParam("password") String password, HttpServletRequest request) {


        Integer number = (Integer) request.getSession().getAttribute("forget_number");
        String userType = (String) request.getSession().getAttribute("forget_type");


        //判断用户类型并进行相应的查询
        if (userType.equals("Student")) {

        } else if (userType.equals("Teacher")) {


        } else if (userType.equals("Watcher")) {

            watcherService.updatePasswordByWatcherNumber(number, password);

        } else {

        }

        return Msg.success();
    }

}
