package test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.sweet.Action;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Action.class)
public class TestUnit {

	private MockMvc mockMvc;
	  
    @Autowired  
    private WebApplicationContext wac; // 注入WebApplicationContext  
  
//    @Autowired  
//    private MockHttpSession session; 
    
//    @Autowired  
//    private MockHttpServletRequest request;
  
    @Before
    public void setup()  throws Exception{  
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
    }  

	
	@Test
	public void testMenu() throws Exception {
		MvcResult result = mockMvc.perform(post("/SysUserInfo/getMenu"))
    			.andExpect(status().isOk()).andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8))
    			.andReturn();
    	System.out.println(result.getResponse().getContentAsString());  

	}
}
