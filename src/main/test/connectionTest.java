import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;
import java.sql.SQLException;

public class connectionTest {

    private ApplicationContext atc = null;
    {
        atc = new ClassPathXmlApplicationContext("applicationContext.xml");
    }

    @Test
    public void testConnection() throws SQLException {
        DataSource dataSource = atc.getBean(DataSource.class);
        System.out.println(dataSource.getConnection());
        System.out.println("helloWorld!");
        System.out.println("helloWorld2!");
        System.out.println("dev");
        System.out.println("master");
    }
}
