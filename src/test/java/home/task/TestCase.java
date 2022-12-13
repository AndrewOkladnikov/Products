package home.task;

import home.task.controllers.PostController;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.Assertions.assertThat;

//@RunWith(SpringRunner.class)
@SpringBootTest
public class TestCase {
    @Autowired
    private PostController postController;

    @Test
    public void test() throws Exception{
        assertThat(postController).isNotNull();
    }
}