package com.api.automation.post;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunner {

	@Test
    Karate testUsers() {
        return Karate.run("PostRequest", "schemaValidation").relativeTo(getClass());
    }    

}
