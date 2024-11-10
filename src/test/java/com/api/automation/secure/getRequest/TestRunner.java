package com.api.automation.secure.getRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunner {

	@Test
    Karate testUsers() {
        return Karate.run("secureGetRequest").relativeTo(getClass());
    }    

}
