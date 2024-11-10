package com.api.automation.configuration;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunner {

	@Test
    Karate testUsers() {
        return Karate.run("getGlobalConfig","queryParameter").relativeTo(getClass());
    }    

}
