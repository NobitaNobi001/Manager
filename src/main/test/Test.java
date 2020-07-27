import com.bean.Teacher;
import com.dao.TeacherMapper;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Test {

    private ApplicationContext atc = null;

    {
        atc = new ClassPathXmlApplicationContext("spring-dao.xml");
    }

    //测试数据库连接
    @org.junit.Test
    public void ConnectionTest() throws SQLException {
        DataSource dataSource = atc.getBean(DataSource.class);
        System.out.println(dataSource.getConnection());
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
}