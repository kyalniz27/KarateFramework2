package com.api.automation.post;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class JSTestRunner {

	@Test
    Karate testUsers() {
        return Karate.run("javaScriptExecutor").relativeTo(getClass());
    }    

}
