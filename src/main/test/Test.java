import com.bean.Teacher;
import com.dao.TeacherMapper;
import com.listener.ContextListener;
import com.listener.ExportStuListener;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Test {

    private ApplicationContext atc = null;

    {
        atc = new ClassPathXmlApplicationContext("applicationContext.xml");
    }

    //测试数据库连接
    @org.junit.Test
    public void ConnectionTest() throws SQLException {
        //DataSource dataSource = atc.getBean(DataSource.class);
        //System.out.println(dataSource.getConnection());
        ContextListener bean = atc.getBean(ContextListener.class);
        System.out.println(bean);
    }

    //测试逆向工程
    @org.junit.Test
    public void MbgTest() throws IOException, XMLParserException, InvalidConfigurationException, SQLException, InterruptedException {
        List<String> warnings = new ArrayList<>();
        boolean overwrite = true;
        File configFile = new File(new File("").getCanonicalPath() + "\\mbg.xml");
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration configuration = cp.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(configuration, callback, warnings);
        myBatisGenerator.generate(null);
    }

    @Autowired
    private TeacherMapper teacherMapper;

    @org.junit.Test
    public void selectTeacherUp(){
        Teacher teacher = new Teacher();
        teacher.setTeaNumber(2018117111);
        System.out.println(teacherMapper.insertSelective(teacher));
    }

    @org.junit.Test
    public void testIntegerMax(){
        //System.out.println(Integer.MAX_VALUE);//2147483647
        //System.out.println(Integer.MIN_VALUE);//-2147483648
    }
    

}