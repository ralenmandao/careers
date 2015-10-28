


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import static org.junit.Assert.*;
import com.boot.BootApplication;
import com.boot.data.repository.UserRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = BootApplication.class)
@WebAppConfiguration
public class HibernateTest {

	@Autowired
	private UserRepository userRepository;
	
	@Before
	public void userRepositoryIsNotNull(){
		assertNotNull(userRepository);
	}
	
	@Test
	public void contextLoads() {
		
	}

}
